package com.localytics.android;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.database.CursorJoiner;
import android.database.CursorJoiner.Result;
import android.location.Location;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;

class SessionHandler
  extends Handler
{
  private static final String[] CUSTOM_DIMENSION_KEYS;
  private static final String EVENTS_SORT_ORDER;
  private static final String[] JOINER_ARG_UPLOAD_EVENTS_COLUMNS = { "_id" };
  private static final String[] PROJECTION_FLOW_BLOBS;
  private static final String[] PROJECTION_FLOW_EVENTS;
  private static final String[] PROJECTION_GET_INSTALLATION_ID;
  private static final String[] PROJECTION_GET_NUMBER_OF_SESSIONS;
  private static final String[] PROJECTION_GET_OPEN_SESSION_ID_EVENT_COUNT;
  private static final String[] PROJECTION_GET_OPEN_SESSION_ID_SESSION_ID;
  private static final String[] PROJECTION_INIT_API_KEY;
  private static final String[] PROJECTION_IS_OPTED_OUT = { "opt_out" };
  private static final String[] PROJECTION_OPEN_BLOB_EVENTS;
  private static final String[] PROJECTION_OPEN_CLOSED_SESSION;
  private static final String[] PROJECTION_OPEN_DELETE_EMPTIES_EVENT_ID;
  private static final String[] PROJECTION_OPEN_DELETE_EMPTIES_PROCESSED_IN_BLOB;
  private static final String[] PROJECTION_OPEN_EVENT_ID;
  private static final String[] PROJECTION_OPEN_SESSIONS;
  private static final String[] PROJECTION_SET_CUSTOM_DIMENSION;
  private static final String[] PROJECTION_SET_IDENTIFIER;
  private static final String[] PROJECTION_TAG_EVENT;
  private static final String[] PROJECTION_TAG_SCREEN;
  private static final String[] PROJECTION_UPLOAD_BLOBS;
  private static final String[] PROJECTION_UPLOAD_EVENTS;
  private static final String[] SELECTION_ARGS_FLOW_EVENTS;
  private static final String SELECTION_FLOW_EVENTS;
  private static final String SELECTION_GET_INSTALLATION_ID;
  private static final String SELECTION_GET_OPEN_SESSION_ID_EVENT_COUNT;
  private static final String SELECTION_INIT_API_KEY;
  private static final String SELECTION_IS_OPTED_OUT = String.format("%s = ?", new Object[] { "api_key" });
  private static final String SELECTION_OPEN;
  private static final String SELECTION_OPEN_CLOSED_SESSION;
  private static final String SELECTION_OPEN_CLOSED_SESSION_ATTRIBUTES;
  private static final String SELECTION_OPEN_DELETE_EMPTIES_EVENTS_SESSION_KEY_REF;
  private static final String SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF;
  private static final String SELECTION_OPEN_DELETE_EMPTIES_SESSIONS_ID;
  private static final String SELECTION_OPEN_DELETE_EMPTIES_UPLOAD_BLOBS_ID;
  private static final String SELECTION_OPEN_NEW_SESSION;
  private static final String SELECTION_OPT_IN_OUT;
  private static final String SELECTION_SET_CUSTOM_DIMENSION;
  private static final String SELECTION_SET_IDENTIFIER;
  private static final String SELECTION_TAG_EVENT;
  private static final String SELECTION_TAG_SCREEN;
  private static final String SELECTION_UPLOAD_NULL_BLOBS;
  private static final String SORT_ORDER_TAG_SCREEN;
  private static final String UPLOAD_BLOBS_EVENTS_SORT_ORDER = String.format("CAST(%s AS TEXT)", new Object[] { "events_key_ref" });
  protected static final Map<String, Boolean> sIsUploadingMap;
  protected static final Map<String, Boolean> sIsUploadingProfileMap;
  private static Location sLastLocation;
  protected static final HandlerThread sProfileUploadHandlerThread;
  protected static final HandlerThread sUploadHandlerThread;
  protected final String mApiKey;
  private long mApiKeyId;
  protected final Context mContext;
  private UploadHandler mProfileUploadHandler;
  protected LocalyticsProvider mProvider;
  private UploadHandler mUploadHandler;
  
  static
  {
    EVENTS_SORT_ORDER = String.format("CAST(%s as TEXT)", new Object[] { "_id" });
    sIsUploadingMap = new HashMap();
    sIsUploadingProfileMap = new HashMap();
    sUploadHandlerThread = getHandlerThread(UploadHandler.class.getSimpleName());
    sProfileUploadHandlerThread = getHandlerThread(UploadHandler.class.getSimpleName() + "_profiles");
    sLastLocation = null;
    PROJECTION_INIT_API_KEY = new String[] { "_id", "opt_out", "created_time", "uuid" };
    SELECTION_INIT_API_KEY = String.format("%s = ?", new Object[] { "api_key" });
    SELECTION_OPT_IN_OUT = String.format("%s = ?", new Object[] { "_id" });
    PROJECTION_GET_OPEN_SESSION_ID_SESSION_ID = new String[] { "_id" };
    PROJECTION_GET_OPEN_SESSION_ID_EVENT_COUNT = new String[] { "_count" };
    SELECTION_GET_OPEN_SESSION_ID_EVENT_COUNT = String.format("%s = ? AND %s = ?", new Object[] { "session_key_ref", "event_name" });
    PROJECTION_OPEN_EVENT_ID = new String[] { "_id" };
    SELECTION_OPEN = String.format("%s = ? AND %s >= ?", new Object[] { "event_name", "wall_time" });
    PROJECTION_OPEN_BLOB_EVENTS = new String[] { "events_key_ref" };
    PROJECTION_OPEN_SESSIONS = new String[] { "_id", "session_start_wall_time" };
    SELECTION_OPEN_NEW_SESSION = String.format("%s = ?", new Object[] { "api_key" });
    SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF = String.format("%s = ?", new Object[] { "session_key_ref" });
    SELECTION_OPEN_DELETE_EMPTIES_EVENTS_SESSION_KEY_REF = String.format("%s = ?", new Object[] { "session_key_ref" });
    PROJECTION_OPEN_DELETE_EMPTIES_EVENT_ID = new String[] { "_id" };
    PROJECTION_OPEN_DELETE_EMPTIES_PROCESSED_IN_BLOB = new String[] { "processed_in_blob" };
    SELECTION_OPEN_DELETE_EMPTIES_UPLOAD_BLOBS_ID = String.format("%s = ?", new Object[] { "_id" });
    SELECTION_OPEN_DELETE_EMPTIES_SESSIONS_ID = String.format("%s = ?", new Object[] { "_id" });
    PROJECTION_GET_INSTALLATION_ID = new String[] { "uuid" };
    SELECTION_GET_INSTALLATION_ID = String.format("%s = ?", new Object[] { "api_key" });
    PROJECTION_OPEN_CLOSED_SESSION = new String[] { "session_key_ref" };
    SELECTION_OPEN_CLOSED_SESSION = String.format("%s = ?", new Object[] { "_id" });
    SELECTION_OPEN_CLOSED_SESSION_ATTRIBUTES = String.format("%s = ?", new Object[] { "events_key_ref" });
    PROJECTION_GET_NUMBER_OF_SESSIONS = new String[] { "_id" };
    PROJECTION_TAG_EVENT = new String[] { "session_start_wall_time" };
    SELECTION_TAG_EVENT = String.format("%s = ?", new Object[] { "_id" });
    PROJECTION_TAG_SCREEN = new String[] { "name" };
    SELECTION_TAG_SCREEN = String.format("%s = ? AND %s = ?", new Object[] { "type", "session_key_ref" });
    SORT_ORDER_TAG_SCREEN = String.format("%s DESC", new Object[] { "_id" });
    PROJECTION_SET_IDENTIFIER = new String[] { "key", "value" };
    SELECTION_SET_IDENTIFIER = String.format("%s = ?", new Object[] { "key" });
    PROJECTION_SET_CUSTOM_DIMENSION = new String[] { "custom_dimension_value" };
    SELECTION_SET_CUSTOM_DIMENSION = String.format("%s = ?", new Object[] { "custom_dimension_key" });
    CUSTOM_DIMENSION_KEYS = new String[] { LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_1, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_2, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_3, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_4, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_5, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_6, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_7, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_8, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_9, LocalyticsProvider.CustomDimensionsDbColumns.CUSTOM_DIMENSION_10 };
    PROJECTION_FLOW_EVENTS = new String[] { "_id" };
    SELECTION_FLOW_EVENTS = String.format("%s = ?", new Object[] { "event_name" });
    SELECTION_ARGS_FLOW_EVENTS = new String[] { Constants.FLOW_EVENT };
    PROJECTION_FLOW_BLOBS = new String[] { "events_key_ref" };
    PROJECTION_UPLOAD_EVENTS = new String[] { "_id", "event_name", "wall_time" };
    PROJECTION_UPLOAD_BLOBS = new String[] { "events_key_ref" };
    SELECTION_UPLOAD_NULL_BLOBS = String.format("%s IS NULL", new Object[] { "processed_in_blob" });
  }
  
  public SessionHandler(Context paramContext, String paramString, Looper paramLooper)
  {
    super(paramLooper);
    if (paramContext == null) {
      throw new IllegalArgumentException("context cannot be null");
    }
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("key cannot be null or empty");
    }
    mContext = paramContext;
    mApiKey = paramString;
  }
  
  private void conditionallyAddFlowEvent()
  {
    int i = 0;
    Object localObject1 = null;
    Cursor localCursor3 = null;
    Cursor localCursor1 = localCursor3;
    try
    {
      Cursor localCursor2 = mProvider.query("events", PROJECTION_FLOW_EVENTS, SELECTION_FLOW_EVENTS, SELECTION_ARGS_FLOW_EVENTS, EVENTS_SORT_ORDER);
      localCursor1 = localCursor3;
      localObject1 = localCursor2;
      localCursor3 = mProvider.query("upload_blob_events", PROJECTION_FLOW_BLOBS, null, null, UPLOAD_BLOBS_EVENTS_SORT_ORDER);
      localCursor1 = localCursor3;
      localObject1 = localCursor2;
      Iterator localIterator = new CursorJoiner(localCursor2, PROJECTION_FLOW_EVENTS, localCursor3, PROJECTION_FLOW_BLOBS).iterator();
      for (;;)
      {
        localCursor1 = localCursor3;
        localObject1 = localCursor2;
        if (!localIterator.hasNext()) {
          break;
        }
        localCursor1 = localCursor3;
        localObject1 = localCursor2;
        CursorJoiner.Result localResult = (CursorJoiner.Result)localIterator.next();
        localCursor1 = localCursor3;
        localObject1 = localCursor2;
        int j = 17.$SwitchMap$android$database$CursorJoiner$Result[localResult.ordinal()];
        switch (j)
        {
        case 2: 
        default: 
          break;
        case 1: 
          i = 1;
        }
      }
      if (localCursor2 != null) {
        localCursor2.close();
      }
      if (localCursor3 != null) {
        localCursor3.close();
      }
      if (i == 0) {
        tagEvent(Constants.FLOW_EVENT, null);
      }
      return;
    }
    finally
    {
      if (localObject1 != null) {
        localObject1.close();
      }
      if (localCursor1 != null) {
        localCursor1.close();
      }
    }
  }
  
  private static HandlerThread getHandlerThread(String paramString)
  {
    paramString = new HandlerThread(paramString, 10);
    paramString.start();
    return paramString;
  }
  
  static String getInstallationId(LocalyticsProvider paramLocalyticsProvider, String paramString)
  {
    LocalyticsProvider localLocalyticsProvider = null;
    try
    {
      paramLocalyticsProvider = paramLocalyticsProvider.query("api_keys", PROJECTION_GET_INSTALLATION_ID, SELECTION_GET_INSTALLATION_ID, new String[] { paramString }, null);
      localLocalyticsProvider = paramLocalyticsProvider;
      if (paramLocalyticsProvider.moveToFirst())
      {
        localLocalyticsProvider = paramLocalyticsProvider;
        paramString = paramLocalyticsProvider.getString(paramLocalyticsProvider.getColumnIndexOrThrow("uuid"));
        return paramString;
      }
      if (paramLocalyticsProvider != null) {
        paramLocalyticsProvider.close();
      }
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "Installation ID couldn't be found");
      }
      return null;
    }
    finally
    {
      if (localLocalyticsProvider != null) {
        localLocalyticsProvider.close();
      }
    }
  }
  
  static long getNumberOfSessions(LocalyticsProvider paramLocalyticsProvider)
  {
    LocalyticsProvider localLocalyticsProvider = null;
    try
    {
      paramLocalyticsProvider = paramLocalyticsProvider.query("sessions", PROJECTION_GET_NUMBER_OF_SESSIONS, null, null, null);
      localLocalyticsProvider = paramLocalyticsProvider;
      int i = paramLocalyticsProvider.getCount();
      long l = i;
      return l;
    }
    finally
    {
      if (localLocalyticsProvider != null) {
        localLocalyticsProvider.close();
      }
    }
  }
  
  /* Error */
  static Long getOpenSessionId(LocalyticsProvider paramLocalyticsProvider)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_0
    //   3: ldc_w 454
    //   6: getstatic 183	com/localytics/android/SessionHandler:PROJECTION_GET_OPEN_SESSION_ID_SESSION_ID	[Ljava/lang/String;
    //   9: aconst_null
    //   10: aconst_null
    //   11: ldc 124
    //   13: invokevirtual 374	com/localytics/android/LocalyticsProvider:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   16: astore_3
    //   17: aload_3
    //   18: astore_2
    //   19: aload_3
    //   20: invokeinterface 462 1 0
    //   25: ifeq +107 -> 132
    //   28: aload_3
    //   29: astore_2
    //   30: aload_3
    //   31: aload_3
    //   32: ldc 124
    //   34: invokeinterface 432 2 0
    //   39: invokeinterface 466 2 0
    //   44: invokestatic 472	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   47: astore 4
    //   49: aload_3
    //   50: ifnull +9 -> 59
    //   53: aload_3
    //   54: invokeinterface 409 1 0
    //   59: aconst_null
    //   60: astore_2
    //   61: aload_0
    //   62: ldc_w 368
    //   65: getstatic 187	com/localytics/android/SessionHandler:PROJECTION_GET_OPEN_SESSION_ID_EVENT_COUNT	[Ljava/lang/String;
    //   68: getstatic 195	com/localytics/android/SessionHandler:SELECTION_GET_OPEN_SESSION_ID_EVENT_COUNT	Ljava/lang/String;
    //   71: iconst_2
    //   72: anewarray 114	java/lang/String
    //   75: dup
    //   76: iconst_0
    //   77: aload 4
    //   79: invokevirtual 473	java/lang/Long:toString	()Ljava/lang/String;
    //   82: aastore
    //   83: dup
    //   84: iconst_1
    //   85: getstatic 476	com/localytics/android/Constants:CLOSE_EVENT	Ljava/lang/String;
    //   88: aastore
    //   89: aconst_null
    //   90: invokevirtual 374	com/localytics/android/LocalyticsProvider:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   93: astore_0
    //   94: aload_0
    //   95: astore_2
    //   96: aload_0
    //   97: invokeinterface 428 1 0
    //   102: ifeq +55 -> 157
    //   105: aload_0
    //   106: astore_2
    //   107: aload_0
    //   108: iconst_0
    //   109: invokeinterface 480 2 0
    //   114: istore_1
    //   115: iload_1
    //   116: ifne +41 -> 157
    //   119: aload_0
    //   120: ifnull +9 -> 129
    //   123: aload_0
    //   124: invokeinterface 409 1 0
    //   129: aload 4
    //   131: areturn
    //   132: aload_3
    //   133: ifnull +9 -> 142
    //   136: aload_3
    //   137: invokeinterface 409 1 0
    //   142: aconst_null
    //   143: areturn
    //   144: astore_0
    //   145: aload_2
    //   146: ifnull +9 -> 155
    //   149: aload_2
    //   150: invokeinterface 409 1 0
    //   155: aload_0
    //   156: athrow
    //   157: aload_0
    //   158: ifnull +9 -> 167
    //   161: aload_0
    //   162: invokeinterface 409 1 0
    //   167: aconst_null
    //   168: areturn
    //   169: astore_0
    //   170: aload_2
    //   171: ifnull +9 -> 180
    //   174: aload_2
    //   175: invokeinterface 409 1 0
    //   180: aload_0
    //   181: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	182	0	paramLocalyticsProvider	LocalyticsProvider
    //   114	2	1	i	int
    //   1	174	2	localObject	Object
    //   16	121	3	localCursor	Cursor
    //   47	83	4	localLong	Long
    // Exception table:
    //   from	to	target	type
    //   2	17	144	finally
    //   19	28	144	finally
    //   30	49	144	finally
    //   61	94	169	finally
    //   96	105	169	finally
    //   107	115	169	finally
  }
  
  static boolean isOptedOut(LocalyticsProvider paramLocalyticsProvider, String paramString)
  {
    if (paramLocalyticsProvider == null) {
      throw new IllegalArgumentException("provider cannot be null");
    }
    if (paramString == null) {
      throw new IllegalArgumentException("apiKey cannot be null");
    }
    LocalyticsProvider localLocalyticsProvider = null;
    try
    {
      paramLocalyticsProvider = paramLocalyticsProvider.query("api_keys", PROJECTION_IS_OPTED_OUT, SELECTION_IS_OPTED_OUT, new String[] { paramString }, null);
      localLocalyticsProvider = paramLocalyticsProvider;
      if (paramLocalyticsProvider.moveToFirst())
      {
        localLocalyticsProvider = paramLocalyticsProvider;
        int i = paramLocalyticsProvider.getInt(paramLocalyticsProvider.getColumnIndexOrThrow("opt_out"));
        if (i != 0) {}
        for (boolean bool = true;; bool = false) {
          return bool;
        }
      }
      return false;
    }
    finally
    {
      if (localLocalyticsProvider != null) {
        localLocalyticsProvider.close();
      }
    }
  }
  
  private boolean isPushDisabled()
  {
    boolean bool2 = false;
    boolean bool1 = false;
    Object localObject1 = null;
    try
    {
      Cursor localCursor = mProvider.query("info", new String[] { "push_disabled" }, null, null, null);
      localObject1 = localCursor;
      bool2 = bool1;
      if (localCursor.moveToNext())
      {
        localObject1 = localCursor;
        bool2 = bool1;
        int i = localCursor.getInt(localCursor.getColumnIndexOrThrow("push_disabled"));
        if (i == 1) {}
        for (bool1 = true;; bool1 = false) {
          break;
        }
      }
      return bool1;
    }
    finally
    {
      if (localObject1 != null) {
        localObject1.close();
      }
    }
    return bool2;
  }
  
  /* Error */
  private void openClosedSession(long paramLong)
  {
    // Byte code:
    //   0: iconst_1
    //   1: anewarray 114	java/lang/String
    //   4: astore 5
    //   6: aload 5
    //   8: iconst_0
    //   9: lload_1
    //   10: invokestatic 498	java/lang/Long:toString	(J)Ljava/lang/String;
    //   13: aastore
    //   14: aconst_null
    //   15: astore_3
    //   16: aload_0
    //   17: getfield 366	com/localytics/android/SessionHandler:mProvider	Lcom/localytics/android/LocalyticsProvider;
    //   20: ldc_w 368
    //   23: getstatic 231	com/localytics/android/SessionHandler:PROJECTION_OPEN_CLOSED_SESSION	[Ljava/lang/String;
    //   26: getstatic 233	com/localytics/android/SessionHandler:SELECTION_OPEN_CLOSED_SESSION	Ljava/lang/String;
    //   29: aload 5
    //   31: aconst_null
    //   32: invokevirtual 374	com/localytics/android/LocalyticsProvider:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   35: astore 4
    //   37: aload 4
    //   39: astore_3
    //   40: aload 4
    //   42: invokeinterface 428 1 0
    //   47: ifeq +54 -> 101
    //   50: aload 4
    //   52: astore_3
    //   53: aload_0
    //   54: getfield 366	com/localytics/android/SessionHandler:mProvider	Lcom/localytics/android/LocalyticsProvider;
    //   57: ldc_w 500
    //   60: getstatic 235	com/localytics/android/SessionHandler:SELECTION_OPEN_CLOSED_SESSION_ATTRIBUTES	Ljava/lang/String;
    //   63: aload 5
    //   65: invokevirtual 504	com/localytics/android/LocalyticsProvider:remove	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   68: pop
    //   69: aload 4
    //   71: astore_3
    //   72: aload_0
    //   73: getfield 366	com/localytics/android/SessionHandler:mProvider	Lcom/localytics/android/LocalyticsProvider;
    //   76: ldc_w 368
    //   79: getstatic 233	com/localytics/android/SessionHandler:SELECTION_OPEN_CLOSED_SESSION	Ljava/lang/String;
    //   82: aload 5
    //   84: invokevirtual 504	com/localytics/android/LocalyticsProvider:remove	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   87: pop
    //   88: aload 4
    //   90: ifnull +10 -> 100
    //   93: aload 4
    //   95: invokeinterface 409 1 0
    //   100: return
    //   101: aload 4
    //   103: astore_3
    //   104: getstatic 440	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   107: ifeq +16 -> 123
    //   110: aload 4
    //   112: astore_3
    //   113: ldc_w 442
    //   116: ldc_w 506
    //   119: invokestatic 509	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   122: pop
    //   123: aload 4
    //   125: astore_3
    //   126: aload_0
    //   127: aconst_null
    //   128: invokespecial 513	com/localytics/android/SessionHandler:openNewSession	(Ljava/util/Map;)V
    //   131: goto -43 -> 88
    //   134: astore 4
    //   136: aload_3
    //   137: ifnull +9 -> 146
    //   140: aload_3
    //   141: invokeinterface 409 1 0
    //   146: aload 4
    //   148: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	149	0	this	SessionHandler
    //   0	149	1	paramLong	long
    //   15	126	3	localObject1	Object
    //   35	89	4	localCursor	Cursor
    //   134	13	4	localObject2	Object
    //   4	79	5	arrayOfString	String[]
    // Exception table:
    //   from	to	target	type
    //   16	37	134	finally
    //   40	50	134	finally
    //   53	69	134	finally
    //   72	88	134	finally
    //   104	110	134	finally
    //   113	123	134	finally
    //   126	131	134	finally
  }
  
  private void openNewSession(Map<String, String> paramMap)
  {
    TelephonyManager localTelephonyManager = (TelephonyManager)mContext.getSystemService("phone");
    Object localObject1 = null;
    long l3 = System.currentTimeMillis();
    long l1 = 0L;
    ContentValues localContentValues;
    try
    {
      Object localObject2 = mProvider.query("info", null, null, null, null);
      localObject1 = localObject2;
      if (((Cursor)localObject2).moveToFirst())
      {
        localObject1 = localObject2;
        l1 = ((Cursor)localObject2).getLong(((Cursor)localObject2).getColumnIndexOrThrow("last_session_open_time"));
      }
      long l2 = l1;
      if (l1 == 0L) {
        l2 = l3;
      }
      if (localObject2 != null) {
        ((Cursor)localObject2).close();
      }
      localContentValues = new ContentValues();
      localContentValues.put("api_key_ref", Long.valueOf(mApiKeyId));
      localContentValues.put("session_start_wall_time", Long.valueOf(l3));
      localContentValues.put("uuid", UUID.randomUUID().toString());
      localContentValues.put("app_version", DatapointHelper.getAppVersion(mContext));
      localContentValues.put("android_sdk", Integer.valueOf(Constants.CURRENT_API_LEVEL));
      localContentValues.put("android_version", Build.VERSION.RELEASE);
      localObject2 = DatapointHelper.getAndroidIdHashOrNull(mContext);
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = "";
      }
      localContentValues.put("device_android_id_hash", (String)localObject1);
      localContentValues.put("device_android_id", DatapointHelper.getAndroidIdOrNull(mContext));
      localContentValues.put("device_advertising_id", DatapointHelper.getAdvertisingIdOrNull(mContext));
      localContentValues.put("device_country", localTelephonyManager.getSimCountryIso());
      localContentValues.put("device_manufacturer", DatapointHelper.getManufacturer());
      localContentValues.put("device_model", Build.MODEL);
      localContentValues.put("device_serial_number_hash", DatapointHelper.getSerialNumberHashOrNull());
      localContentValues.put("device_telephony_id", DatapointHelper.getTelephonyDeviceIdOrNull(mContext));
      localContentValues.putNull("device_telephony_id_hash");
      localContentValues.putNull("device_wifi_mac_hash");
      localContentValues.put("locale_country", Locale.getDefault().getCountry());
      localContentValues.put("locale_language", Locale.getDefault().getLanguage());
      localContentValues.put("localytics_library_version", "androida_2.70");
      localContentValues.put("iu", getInstallationId(mProvider, mApiKey));
      localContentValues.putNull("latitude");
      localContentValues.putNull("longitude");
      localContentValues.put("network_carrier", localTelephonyManager.getNetworkOperatorName());
      localContentValues.put("network_country", localTelephonyManager.getNetworkCountryIso());
      localContentValues.put("network_type", DatapointHelper.getNetworkType(mContext, localTelephonyManager));
      localContentValues.put("elapsed", Long.valueOf(l3 - l2));
      if (mProvider.insert("sessions", localContentValues) == -1L) {
        throw new AssertionError("session insert failed");
      }
    }
    finally
    {
      if ((0L != 0L) || (localObject1 != null)) {
        ((Cursor)localObject1).close();
      }
    }
    localContentValues.clear();
    localContentValues.put("last_session_open_time", Long.valueOf(l3));
    mProvider.update("info", localContentValues, null, null);
    setFirstAdvertisingId(DatapointHelper.getAdvertisingIdOrNull(mContext));
    tagEvent(Constants.OPEN_EVENT, paramMap);
    LocalyticsProvider.deleteOldFiles(mContext);
  }
  
  static void preUploadBuildBlobs(LocalyticsProvider paramLocalyticsProvider)
  {
    HashSet localHashSet = new HashSet();
    Object localObject2 = null;
    Object localObject4 = null;
    Object localObject1 = localObject4;
    for (;;)
    {
      Object localObject3;
      try
      {
        localObject3 = paramLocalyticsProvider.query("events", PROJECTION_UPLOAD_EVENTS, null, null, EVENTS_SORT_ORDER);
        localObject1 = localObject4;
        localObject2 = localObject3;
        localObject4 = paramLocalyticsProvider.query("upload_blob_events", PROJECTION_UPLOAD_BLOBS, null, null, UPLOAD_BLOBS_EVENTS_SORT_ORDER);
        localObject1 = localObject4;
        localObject2 = localObject3;
        int i = ((Cursor)localObject3).getColumnIndexOrThrow("_id");
        localObject1 = localObject4;
        localObject2 = localObject3;
        Iterator localIterator = new CursorJoiner((Cursor)localObject3, JOINER_ARG_UPLOAD_EVENTS_COLUMNS, (Cursor)localObject4, PROJECTION_UPLOAD_BLOBS).iterator();
        localObject1 = localObject4;
        localObject2 = localObject3;
        CursorJoiner.Result localResult;
        if (localIterator.hasNext())
        {
          localObject1 = localObject4;
          localObject2 = localObject3;
          localResult = (CursorJoiner.Result)localIterator.next();
          localObject1 = localObject4;
          localObject2 = localObject3;
        }
        switch (17.$SwitchMap$android$database$CursorJoiner$Result[localResult.ordinal()])
        {
        case 2: 
        case 1: 
          localObject1 = localObject4;
          localObject2 = localObject3;
          if (Constants.CLOSE_EVENT.equals(((Cursor)localObject3).getString(((Cursor)localObject3).getColumnIndexOrThrow("event_name"))))
          {
            localObject1 = localObject4;
            localObject2 = localObject3;
            if (System.currentTimeMillis() - ((Cursor)localObject3).getLong(((Cursor)localObject3).getColumnIndexOrThrow("wall_time")) < Constants.SESSION_EXPIRATION) {
              continue;
            }
          }
          localObject1 = localObject4;
          localObject2 = localObject3;
          localHashSet.add(Long.valueOf(((Cursor)localObject3).getLong(i)));
          continue;
          if (localObject3 == null) {
            break label299;
          }
        }
      }
      finally
      {
        if (localObject2 != null) {
          ((Cursor)localObject2).close();
        }
        if (localObject1 != null) {
          ((Cursor)localObject1).close();
        }
      }
      ((Cursor)localObject3).close();
      label299:
      if (localObject4 != null) {
        ((Cursor)localObject4).close();
      }
      if (localHashSet.size() > 0)
      {
        localObject1 = new ContentValues();
        ((ContentValues)localObject1).put("uuid", UUID.randomUUID().toString());
        localObject2 = Long.valueOf(paramLocalyticsProvider.insert("upload_blobs", (ContentValues)localObject1));
        ((ContentValues)localObject1).clear();
        localObject3 = localHashSet.iterator();
        while (((Iterator)localObject3).hasNext())
        {
          localObject4 = (Long)((Iterator)localObject3).next();
          ((ContentValues)localObject1).put("upload_blobs_key_ref", (Long)localObject2);
          ((ContentValues)localObject1).put("events_key_ref", (Long)localObject4);
          paramLocalyticsProvider.insert("upload_blob_events", (ContentValues)localObject1);
          ((ContentValues)localObject1).clear();
        }
        ((ContentValues)localObject1).put("processed_in_blob", (Long)localObject2);
        paramLocalyticsProvider.update("event_history", (ContentValues)localObject1, SELECTION_UPLOAD_NULL_BLOBS, null);
        ((ContentValues)localObject1).clear();
      }
      return;
    }
  }
  
  private void setFirstAdvertisingId(String paramString)
  {
    String str = null;
    Object localObject = null;
    try
    {
      Cursor localCursor = mProvider.query("info", null, null, null, null);
      localObject = localCursor;
      if (localCursor.moveToFirst())
      {
        localObject = localCursor;
        str = localCursor.getString(localCursor.getColumnIndexOrThrow("first_advertising_id"));
      }
      if (localCursor != null) {
        localCursor.close();
      }
      if (!TextUtils.isEmpty(str))
      {
        if (Constants.IS_LOGGABLE) {
          Log.v("Localytics", "First advertising id has already been set before.");
        }
        return;
      }
    }
    finally
    {
      if (localObject != null) {
        ((Cursor)localObject).close();
      }
    }
    localObject = new ContentValues();
    ((ContentValues)localObject).put("first_advertising_id", paramString);
    mProvider.update("info", (ContentValues)localObject, null, null);
  }
  
  void close(Map<String, String> paramMap)
  {
    if (getOpenSessionId(mProvider) == null)
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "Session was not open, so close is not possible.");
      }
      return;
    }
    tagEvent(Constants.CLOSE_EVENT, paramMap);
  }
  
  protected UploadHandler createUploadHandler(Context paramContext, Handler paramHandler, String paramString1, String paramString2, Looper paramLooper)
  {
    return new UploadHandler(paramContext, this, paramString1, paramString2, paramLooper);
  }
  
  String getCustomDimension(int paramInt)
  {
    String str = null;
    Object localObject2 = str;
    if (paramInt >= 0)
    {
      if (paramInt <= 9) {
        break label18;
      }
      localObject2 = str;
    }
    for (;;)
    {
      return localObject2;
      label18:
      str = null;
      Object localObject3 = CUSTOM_DIMENSION_KEYS[paramInt];
      localObject2 = null;
      try
      {
        localObject3 = mProvider.query("custom_dimensions", PROJECTION_SET_CUSTOM_DIMENSION, SELECTION_SET_CUSTOM_DIMENSION, new String[] { localObject3 }, null);
        localObject2 = localObject3;
        if (((Cursor)localObject3).moveToFirst())
        {
          localObject2 = localObject3;
          str = ((Cursor)localObject3).getString(((Cursor)localObject3).getColumnIndexOrThrow("custom_dimension_value"));
        }
        localObject2 = str;
        return str;
      }
      finally
      {
        if (localObject2 != null) {
          ((Cursor)localObject2).close();
        }
      }
    }
  }
  
  public void handleMessage(final Message paramMessage)
  {
    try
    {
      super.handleMessage(paramMessage);
      if (Constants.IS_LOGGABLE) {
        Log.v("Localytics", String.format("Handler received %s", new Object[] { paramMessage }));
      }
      switch (what)
      {
      case 13: 
      case 15: 
      case 19: 
        throw new RuntimeException("Fell through switch statement");
      }
    }
    catch (Exception paramMessage)
    {
      if (Constants.IS_LOGGABLE) {
        Log.e("Localytics", "Localytics library threw an uncaught exception", paramMessage);
      }
      return;
    }
    if (Constants.IS_LOGGABLE) {
      Log.d("Localytics", "Handler received MESSAGE_INIT");
    }
    init((String)obj);
    return;
    if (Constants.IS_LOGGABLE) {
      Log.d("Localytics", "Handler received MESSAGE_OPT_OUT");
    }
    if (arg1 == 0) {}
    for (final boolean bool = false;; bool = true)
    {
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          optOut(bool);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_OPEN");
      }
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          open(false, (Map)paramMessageobj);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_CLOSE");
      }
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          close((Map)paramMessageobj);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_TAG_EVENT");
      }
      Object localObject2 = (Object[])obj;
      paramMessage = (String)localObject2[0];
      Object localObject1 = (Map)localObject2[1];
      localObject2 = (Long)localObject2[2];
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          if (SessionHandler.getOpenSessionId(mProvider) != null)
          {
            tagEvent(paramMessage, val$attributes, val$clv);
            return;
          }
          Object localObject;
          if (val$attributes == null) {
            localObject = null;
          }
          for (;;)
          {
            open(false, (Map)localObject);
            tagEvent(paramMessage, val$attributes, val$clv);
            close((Map)localObject);
            return;
            if ((val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9)) || (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10)))
            {
              TreeMap localTreeMap = new TreeMap();
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8));
              }
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9)) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9));
              }
              localObject = localTreeMap;
              if (val$attributes.containsKey(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10))
              {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10, val$attributes.get(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10));
                localObject = localTreeMap;
              }
            }
            else
            {
              localObject = null;
            }
          }
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_TAG_SCREEN");
      }
      paramMessage = (String)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          tagScreen(paramMessage);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_SET_IDENTIFIER");
      }
      localObject1 = (Object[])obj;
      paramMessage = (String)localObject1[0];
      localObject1 = (String)localObject1[1];
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          setIdentifier(paramMessage, val$value);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_REGISTER_PUSH");
      }
      paramMessage = (String)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          if (SessionHandler.this.isPushDisabled()) {
            if (Constants.IS_LOGGABLE) {
              Log.d("Localytics", "Push has been disabled");
            }
          }
          for (;;)
          {
            return;
            Object localObject3 = null;
            String str2 = null;
            Object localObject1 = null;
            String str1 = null;
            try
            {
              Cursor localCursor = mProvider.query("info", null, null, null, null);
              localObject3 = localCursor;
              if (localCursor.moveToFirst())
              {
                localObject3 = localCursor;
                str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("sender_id"));
                localObject3 = localCursor;
                str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("registration_version"));
                localObject3 = localCursor;
                localObject1 = localCursor.getString(localCursor.getColumnIndexOrThrow("registration_id"));
              }
              if (localCursor != null) {
                localCursor.close();
              }
              if (!paramMessage.equals(str2))
              {
                localObject1 = null;
                localObject3 = new ContentValues();
                ((ContentValues)localObject3).put("sender_id", paramMessage);
                ((ContentValues)localObject3).put("registration_id", null);
                mProvider.update("info", (ContentValues)localObject3, null, null);
              }
              localObject3 = DatapointHelper.getAppVersion(mContext);
              if ((!TextUtils.isEmpty((CharSequence)localObject1)) && (((String)localObject3).equals(str1))) {
                continue;
              }
              localObject1 = new Intent("com.google.android.c2dm.intent.REGISTER");
              ((Intent)localObject1).putExtra("app", PendingIntent.getBroadcast(mContext, 0, new Intent(), 0));
              ((Intent)localObject1).putExtra("sender", paramMessage);
              mContext.startService((Intent)localObject1);
              return;
            }
            finally
            {
              if (localObject3 != null) {
                ((Cursor)localObject3).close();
              }
            }
          }
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_DISABLE_PUSH");
      }
      final int i = arg1;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          setPushDisabled(i);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_SET_PUSH_REGID");
      }
      paramMessage = (String)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          setPushRegistrationId(paramMessage);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_SET_LOCATION");
      }
      sLastLocation = (Location)obj;
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_SET_CUSTOM_DIMENSION");
      }
      paramMessage = (Object[])obj;
      i = ((Integer)paramMessage[0]).intValue();
      paramMessage = (String)paramMessage[1];
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          setCustomDimension(i, paramMessage);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "SessionHandler received MESSAGE_UPLOAD");
      }
      paramMessage = (Runnable)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          upload(paramMessage);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_UPLOAD_CALLBACK");
      }
      sIsUploadingMap.put(mApiKey, Boolean.FALSE);
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_SET_PROFILE_ATTRIBUTE");
      }
      localObject1 = (Object[])obj;
      paramMessage = (JSONObject)localObject1[0];
      i = ((Integer)localObject1[1]).intValue();
      localObject1 = (String)mProvider.getUserIdAndType().get("id");
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          ContentValues localContentValues = new ContentValues();
          localContentValues.put("attribute", paramMessage.toString());
          localContentValues.put("action", Integer.valueOf(i));
          localContentValues.put("customer_id", val$customerID);
          mProvider.insert("profile", localContentValues);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "SessionHandler received MESSAGE_UPLOAD_PROFILE");
      }
      paramMessage = (Runnable)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          uploadProfile(paramMessage);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_UPLOAD_PROFILE_CALLBACK");
      }
      sIsUploadingProfileMap.put(mApiKey, Boolean.FALSE);
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_HANDLE_PUSH_REGISTRATION");
      }
      paramMessage = (Intent)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          String str = paramMessage.getStringExtra("registration_id");
          if (SessionHandler.this.isPushDisabled())
          {
            if (Constants.IS_LOGGABLE) {
              Log.v("Localytics", "GCM registered but push disabled: removing id");
            }
            setPushRegistrationId(null);
          }
          do
          {
            do
            {
              return;
              if (paramMessage.getStringExtra("error") == null) {
                break;
              }
            } while (!Constants.IS_LOGGABLE);
            Log.v("Localytics", "GCM registration failed");
            return;
            if (paramMessage.getStringExtra("unregistered") != null)
            {
              if (Constants.IS_LOGGABLE) {
                Log.v("Localytics", "GCM unregistered: removing id");
              }
              setPushRegistrationId(null);
              return;
            }
          } while (str == null);
          if (Constants.IS_LOGGABLE) {
            Log.v("Localytics", String.format("GCM registered, new id: %s", new Object[] { str }));
          }
          setPushRegistrationId(str);
        }
      });
      return;
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Handler received MESSAGE_HANDLE_PUSH_RECEIVED");
      }
      paramMessage = (Intent)obj;
      mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          if (SessionHandler.this.isPushDisabled()) {
            if (Constants.IS_LOGGABLE) {
              Log.w("Localytics", "Got push notification while push is disabled.");
            }
          }
          label196:
          do
          {
            do
            {
              return;
              localObject1 = paramMessage.getExtras().getString("ll");
              if (localObject1 != null) {
                break;
              }
            } while (!Constants.IS_LOGGABLE);
            Log.w("Localytics", "Ignoring message that aren't from Localytics.");
            return;
            int k;
            String str;
            Object localObject2;
            try
            {
              k = new JSONObject((String)localObject1).getInt("ca");
              str = paramMessage.getExtras().getString("message");
              localObject2 = "";
              j = 17301651;
              localObject4 = null;
              i = j;
              localObject1 = localObject2;
            }
            catch (JSONException localJSONException1) {}
            try
            {
              localObject3 = mContext.getPackageManager().getApplicationInfo(mContext.getPackageName(), 0);
              i = j;
              localObject1 = localObject2;
              j = icon;
              i = j;
              localObject1 = localObject2;
              localObject2 = mContext.getPackageManager().getApplicationLabel((ApplicationInfo)localObject3);
              i = j;
              localObject1 = localObject2;
              localObject3 = mContext.getPackageManager().getLaunchIntentForPackage(mContext.getPackageName());
            }
            catch (PackageManager.NameNotFoundException localNameNotFoundException)
            {
              j = i;
              JSONException localJSONException2 = localJSONException1;
              localObject3 = localObject4;
              if (!Constants.IS_LOGGABLE) {
                break label196;
              }
              Log.w("Localytics", "Failed to get application name, icon, or launch intent");
              j = i;
              localJSONException2 = localJSONException1;
              localObject3 = localObject4;
              break label196;
            }
            Object localObject1 = new Notification(j, str, System.currentTimeMillis());
            if (localObject3 != null)
            {
              ((Intent)localObject3).putExtras(paramMessage);
              localObject3 = PendingIntent.getActivity(mContext, 0, (Intent)localObject3, 134217728);
              ((Notification)localObject1).setLatestEventInfo(mContext, (CharSequence)localObject2, str, (PendingIntent)localObject3);
            }
            flags |= 0x10;
            ((NotificationManager)mContext.getSystemService("notification")).notify(k, (Notification)localObject1);
            return;
          } while (!Constants.IS_LOGGABLE);
          Log.w("Localytics", "Failed to get campaign id from payload, ignoring message");
        }
      });
      return;
      break;
    }
  }
  
  void init(String paramString)
  {
    mProvider = LocalyticsProvider.getInstance(mContext, mApiKey);
    localObject = null;
    for (;;)
    {
      long l;
      try
      {
        localCursor = mProvider.query("api_keys", PROJECTION_INIT_API_KEY, SELECTION_INIT_API_KEY, new String[] { mApiKey }, null);
        localObject = localCursor;
        if (localCursor.moveToFirst())
        {
          localObject = localCursor;
          if (Constants.IS_LOGGABLE)
          {
            localObject = localCursor;
            Log.v("Localytics", String.format("Loading details for API key %s", new Object[] { mApiKey }));
          }
          localObject = localCursor;
          mApiKeyId = localCursor.getLong(localCursor.getColumnIndexOrThrow("_id"));
          localObject = localCursor;
          if (localCursor.getLong(localCursor.getColumnIndexOrThrow("created_time")) == 0L)
          {
            localObject = localCursor;
            localContentValues = new ContentValues();
            localObject = localCursor;
            localContentValues.put("created_time", Long.valueOf(System.currentTimeMillis()));
            localObject = localCursor;
            mProvider.update("api_keys", localContentValues, SELECTION_INIT_API_KEY, new String[] { mApiKey });
          }
          localObject = localCursor;
          if (localCursor != null)
          {
            localCursor.close();
            localObject = null;
          }
        }
      }
      finally
      {
        Cursor localCursor;
        ContentValues localContentValues;
        if (localObject != null) {
          localObject.close();
        }
      }
      try
      {
        localCursor = mProvider.query("info", new String[] { "play_attribution" }, null, null, null);
        localObject = localCursor;
        if (localCursor.moveToFirst())
        {
          localObject = localCursor;
          if ((localCursor.getString(localCursor.getColumnIndexOrThrow("play_attribution")) == null) && (paramString != null))
          {
            localObject = localCursor;
            if (!TextUtils.isEmpty(paramString))
            {
              localObject = localCursor;
              localContentValues = new ContentValues();
              localObject = localCursor;
              localContentValues.put("play_attribution", paramString);
              localObject = localCursor;
              mProvider.update("info", localContentValues, null, null);
            }
          }
        }
        if (localCursor != null) {
          localCursor.close();
        }
        if (!sIsUploadingMap.containsKey(mApiKey)) {
          sIsUploadingMap.put(mApiKey, Boolean.FALSE);
        }
        if (!sIsUploadingProfileMap.containsKey(mApiKey)) {
          sIsUploadingProfileMap.put(mApiKey, Boolean.FALSE);
        }
        paramString = getInstallationId(mProvider, mApiKey);
        mUploadHandler = createUploadHandler(mContext, this, mApiKey, paramString, sUploadHandlerThread.getLooper());
        mProfileUploadHandler = createUploadHandler(mContext, this, mApiKey, paramString, sProfileUploadHandlerThread.getLooper());
        return;
      }
      finally
      {
        if (localObject == null) {
          break label667;
        }
        localObject.close();
      }
    }
    localObject = localCursor;
    if (Constants.IS_LOGGABLE)
    {
      localObject = localCursor;
      Log.v("Localytics", String.format("Performing first-time initialization for new API key %s", new Object[] { mApiKey }));
    }
    localObject = localCursor;
    localContentValues = new ContentValues();
    localObject = localCursor;
    localContentValues.put("api_key", mApiKey);
    localObject = localCursor;
    localContentValues.put("uuid", UUID.randomUUID().toString());
    localObject = localCursor;
    localContentValues.put("opt_out", Boolean.FALSE);
    if (paramString == null) {
      localObject = localCursor;
    }
    for (l = System.currentTimeMillis();; l = 0L)
    {
      localObject = localCursor;
      localContentValues.put("created_time", Long.valueOf(l));
      localObject = localCursor;
      mApiKeyId = mProvider.insert("api_keys", localContentValues);
      break;
    }
  }
  
  void open(boolean paramBoolean, Map<String, String> paramMap)
  {
    if (getOpenSessionId(mProvider) != null) {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "Session was already open");
      }
    }
    do
    {
      return;
      if (!isOptedOut(mProvider, mApiKey)) {
        break;
      }
    } while (!Constants.IS_LOGGABLE);
    Log.d("Localytics", "Data collection is opted out");
    return;
    long l1 = -1L;
    Object localObject3 = null;
    Cursor localCursor = null;
    Object localObject1 = localCursor;
    Object localObject2 = localObject3;
    for (;;)
    {
      Object localObject4;
      Object localObject5;
      Object localObject6;
      try
      {
        localObject4 = mProvider;
        localObject1 = localCursor;
        localObject2 = localObject3;
        localObject5 = PROJECTION_OPEN_EVENT_ID;
        localObject1 = localCursor;
        localObject2 = localObject3;
        localObject6 = SELECTION_OPEN;
        localObject1 = localCursor;
        localObject2 = localObject3;
        String str1 = Constants.CLOSE_EVENT;
        localObject1 = localCursor;
        localObject2 = localObject3;
        String str2 = Long.toString(System.currentTimeMillis() - Constants.SESSION_EXPIRATION);
        localObject1 = localCursor;
        localObject2 = localObject3;
        String str3 = EVENTS_SORT_ORDER;
        localObject1 = localCursor;
        localObject2 = localObject3;
        localObject3 = ((LocalyticsProvider)localObject4).query("events", (String[])localObject5, (String)localObject6, new String[] { str1, str2 }, str3);
        localObject1 = localCursor;
        localObject2 = localObject3;
        localCursor = mProvider.query("upload_blob_events", PROJECTION_OPEN_BLOB_EVENTS, null, null, UPLOAD_BLOBS_EVENTS_SORT_ORDER);
        localObject1 = localCursor;
        localObject2 = localObject3;
        int i = ((Cursor)localObject3).getColumnIndexOrThrow("_id");
        localObject1 = localCursor;
        localObject2 = localObject3;
        localObject4 = new CursorJoiner((Cursor)localObject3, PROJECTION_OPEN_EVENT_ID, localCursor, PROJECTION_OPEN_BLOB_EVENTS).iterator();
        localObject1 = localCursor;
        localObject2 = localObject3;
        if (((Iterator)localObject4).hasNext())
        {
          localObject1 = localCursor;
          localObject2 = localObject3;
          localObject5 = (CursorJoiner.Result)((Iterator)localObject4).next();
          localObject1 = localCursor;
          localObject2 = localObject3;
        }
        switch (17.$SwitchMap$android$database$CursorJoiner$Result[localObject5.ordinal()])
        {
        case 2: 
        case 1: 
          long l2 = l1;
          if (-1L != l1)
          {
            localObject1 = localCursor;
            localObject2 = localObject3;
            if (Constants.IS_LOGGABLE)
            {
              localObject1 = localCursor;
              localObject2 = localObject3;
              Log.w("Localytics", "There were multiple close events within SESSION_EXPIRATION");
            }
            localObject1 = localCursor;
            localObject2 = localObject3;
            long l3 = ((Cursor)localObject3).getLong(((Cursor)localObject3).getColumnIndexOrThrow("_id"));
            l2 = l1;
            if (l3 > l1) {
              l2 = l3;
            }
          }
          l1 = l2;
          if (-1L != l2) {
            continue;
          }
          localObject1 = localCursor;
          localObject2 = localObject3;
          l1 = ((Cursor)localObject3).getLong(i);
          continue;
          if (localObject3 != null) {
            ((Cursor)localObject3).close();
          }
          if (localCursor != null) {
            localCursor.close();
          }
          if (-1L != l1)
          {
            if (Constants.IS_LOGGABLE) {
              Log.v("Localytics", "Opening old closed session and reconnecting");
            }
            openClosedSession(l1);
            return;
          }
          break;
        }
      }
      finally
      {
        if (localObject2 != null) {
          ((Cursor)localObject2).close();
        }
        if (localObject1 != null) {
          ((Cursor)localObject1).close();
        }
      }
      localObject2 = null;
      try
      {
        localCursor = mProvider.query("sessions", PROJECTION_OPEN_SESSIONS, null, null, "_id");
        localObject2 = localCursor;
        if (!localCursor.moveToLast()) {
          break label1036;
        }
        localObject2 = localCursor;
        if (localCursor.getLong(localCursor.getColumnIndexOrThrow("session_start_wall_time")) >= System.currentTimeMillis() - Constants.SESSION_EXPIRATION)
        {
          localObject2 = localCursor;
          if (Constants.IS_LOGGABLE)
          {
            localObject2 = localCursor;
            Log.v("Localytics", "Opening old unclosed session and reconnecting");
          }
          if (localCursor == null) {
            break;
          }
          localCursor.close();
          return;
        }
        localObject2 = null;
        localObject1 = localObject2;
        try
        {
          localObject3 = Long.toString(localCursor.getLong(localCursor.getColumnIndexOrThrow("_id")));
          localObject1 = localObject2;
          localObject5 = new String[1];
          localObject5[0] = localObject3;
          localObject1 = localObject2;
          localObject3 = mProvider.query("events", PROJECTION_OPEN_DELETE_EMPTIES_EVENT_ID, SELECTION_OPEN_DELETE_EMPTIES_EVENTS_SESSION_KEY_REF, (String[])localObject5, null);
          localObject1 = localObject3;
          if (((Cursor)localObject3).getCount() != 0) {
            break label1020;
          }
          localObject1 = localObject3;
          localObject6 = new LinkedList();
          localObject2 = null;
          try
          {
            localObject4 = mProvider.query("event_history", PROJECTION_OPEN_DELETE_EMPTIES_PROCESSED_IN_BLOB, SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF, (String[])localObject5, null);
            for (;;)
            {
              localObject2 = localObject4;
              if (!((Cursor)localObject4).moveToNext()) {
                break;
              }
              localObject2 = localObject4;
              ((List)localObject6).add(Long.valueOf(((Cursor)localObject4).getLong(((Cursor)localObject4).getColumnIndexOrThrow("processed_in_blob"))));
            }
            paramMap = finally;
          }
          finally {}
          paramMap = finally;
        }
        finally
        {
          if (localObject1 != null)
          {
            localObject2 = localCursor;
            ((Cursor)localObject1).close();
          }
          localObject2 = localCursor;
        }
        if (localObject4 == null) {
          break label901;
        }
      }
      finally
      {
        if (localObject2 != null) {
          ((Cursor)localObject2).close();
        }
      }
      localObject1 = localObject3;
      ((Cursor)localObject4).close();
      label901:
      localObject1 = localObject3;
      mProvider.remove("event_history", SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF, (String[])localObject5);
      localObject1 = localObject3;
      localObject2 = ((List)localObject6).iterator();
      for (;;)
      {
        localObject1 = localObject3;
        if (!((Iterator)localObject2).hasNext()) {
          break;
        }
        localObject1 = localObject3;
        l1 = ((Long)((Iterator)localObject2).next()).longValue();
        localObject1 = localObject3;
        mProvider.remove("upload_blobs", SELECTION_OPEN_DELETE_EMPTIES_UPLOAD_BLOBS_ID, new String[] { Long.toString(l1) });
      }
      localObject1 = localObject3;
      mProvider.remove("sessions", SELECTION_OPEN_DELETE_EMPTIES_SESSIONS_ID, (String[])localObject5);
      label1020:
      if (localObject3 != null)
      {
        localObject2 = localCursor;
        ((Cursor)localObject3).close();
      }
      label1036:
      if (localCursor != null) {
        localCursor.close();
      }
      if ((!paramBoolean) && (getNumberOfSessions(mProvider) >= 10L))
      {
        if (!Constants.IS_LOGGABLE) {
          break;
        }
        Log.w("Localytics", "Maximum number of sessions are already on disk--not writing any new sessions until old sessions are cleared out.  Try calling upload() to store more sessions.");
        return;
      }
      if (Constants.IS_LOGGABLE) {
        Log.v("Localytics", "Opening new session");
      }
      openNewSession(paramMap);
      return;
    }
  }
  
  void optOut(boolean paramBoolean)
  {
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", String.format("Requested opt-out state is %b", new Object[] { Boolean.valueOf(paramBoolean) }));
    }
    if (isOptedOut(mProvider, mApiKey) == paramBoolean) {
      return;
    }
    if (getOpenSessionId(mProvider) == null)
    {
      open(true, null);
      if (paramBoolean) {}
      for (localObject = Constants.OPT_OUT_EVENT;; localObject = Constants.OPT_IN_EVENT)
      {
        tagEvent((String)localObject, null);
        close(null);
        localObject = new ContentValues();
        ((ContentValues)localObject).put("opt_out", Boolean.valueOf(paramBoolean));
        mProvider.update("api_keys", (ContentValues)localObject, SELECTION_OPT_IN_OUT, new String[] { Long.toString(mApiKeyId) });
        return;
      }
    }
    if (paramBoolean) {}
    for (Object localObject = Constants.OPT_OUT_EVENT;; localObject = Constants.OPT_IN_EVENT)
    {
      tagEvent((String)localObject, null);
      break;
    }
  }
  
  void setCustomDimension(int paramInt, final String paramString)
  {
    if ((paramInt < 0) || (paramInt > 9))
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "Only valid dimensions are 0 - 9");
      }
      return;
    }
    final String str = CUSTOM_DIMENSION_KEYS[paramInt];
    mProvider.runBatchTransaction(new Runnable()
    {
      public void run()
      {
        Object localObject1 = null;
        for (;;)
        {
          ContentValues localContentValues;
          try
          {
            Cursor localCursor = mProvider.query("custom_dimensions", SessionHandler.PROJECTION_SET_CUSTOM_DIMENSION, SessionHandler.SELECTION_SET_CUSTOM_DIMENSION, new String[] { str }, null);
            localObject1 = localCursor;
            if (localCursor.moveToFirst())
            {
              localObject1 = localCursor;
              if (paramString == null)
              {
                localObject1 = localCursor;
                mProvider.remove("custom_dimensions", String.format("%s = ?", new Object[] { "custom_dimension_key" }), new String[] { str });
                return;
              }
              localObject1 = localCursor;
              localContentValues = new ContentValues();
              localObject1 = localCursor;
              localContentValues.put("custom_dimension_key", str);
              localObject1 = localCursor;
              localContentValues.put("custom_dimension_value", paramString);
              localObject1 = localCursor;
              mProvider.update("custom_dimensions", localContentValues, SessionHandler.SELECTION_SET_CUSTOM_DIMENSION, new String[] { str });
              continue;
            }
            localObject1 = localObject2;
          }
          finally
          {
            if (localObject1 != null) {
              localObject1.close();
            }
          }
          if (paramString != null)
          {
            localObject1 = localObject2;
            localContentValues = new ContentValues();
            localObject1 = localObject2;
            localContentValues.put("custom_dimension_key", str);
            localObject1 = localObject2;
            localContentValues.put("custom_dimension_value", paramString);
            localObject1 = localObject2;
            mProvider.insert("custom_dimensions", localContentValues);
          }
        }
      }
    });
  }
  
  void setIdentifier(String paramString1, String paramString2)
  {
    Object localObject = null;
    for (;;)
    {
      Cursor localCursor;
      try
      {
        localCursor = mProvider.query("identifiers", PROJECTION_SET_IDENTIFIER, SELECTION_SET_IDENTIFIER, new String[] { paramString1 }, null);
        localObject = localCursor;
        if (localCursor.moveToFirst())
        {
          if (paramString2 == null)
          {
            localObject = localCursor;
            mProvider.remove("identifiers", String.format("%s = ?", new Object[] { "key" }), new String[] { localCursor.getString(localCursor.getColumnIndexOrThrow("key")) });
            return;
          }
          localObject = localCursor;
          if (paramString2.equals(localCursor.getString(localCursor.getColumnIndexOrThrow("value")))) {
            continue;
          }
          localObject = localCursor;
          localContentValues = new ContentValues();
          localObject = localCursor;
          localContentValues.put("key", paramString1);
          localObject = localCursor;
          localContentValues.put("value", paramString2);
          localObject = localCursor;
          mProvider.update("identifiers", localContentValues, SELECTION_SET_IDENTIFIER, new String[] { paramString1 });
          continue;
        }
        if (paramString2 == null) {
          continue;
        }
      }
      finally
      {
        if (localObject != null) {
          localObject.close();
        }
      }
      localObject = localCursor;
      ContentValues localContentValues = new ContentValues();
      localObject = localCursor;
      localContentValues.put("key", paramString1);
      localObject = localCursor;
      localContentValues.put("value", paramString2);
      localObject = localCursor;
      mProvider.insert("identifiers", localContentValues);
    }
  }
  
  void setPushDisabled(int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("push_disabled", Integer.valueOf(paramInt));
    mProvider.update("info", localContentValues, null, null);
  }
  
  void setPushRegistrationId(String paramString)
  {
    ContentValues localContentValues = new ContentValues();
    String str = paramString;
    if (paramString == null) {
      str = "";
    }
    localContentValues.put("registration_id", str);
    localContentValues.put("registration_version", DatapointHelper.getAppVersion(mContext));
    mProvider.update("info", localContentValues, null, null);
  }
  
  void tagEvent(String paramString, Map<String, String> paramMap)
  {
    tagEvent(paramString, paramMap, null);
  }
  
  void tagEvent(String paramString, Map<String, String> paramMap, Long paramLong)
  {
    Long localLong = getOpenSessionId(mProvider);
    if (localLong == null) {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "Event not written because a session is not open");
      }
    }
    Object localObject2;
    label424:
    label711:
    do
    {
      return;
      localObject2 = new ContentValues();
      ((ContentValues)localObject2).put("session_key_ref", localLong);
      ((ContentValues)localObject2).put("uuid", UUID.randomUUID().toString());
      ((ContentValues)localObject2).put("event_name", paramString);
      ((ContentValues)localObject2).put("real_time", Long.valueOf(SystemClock.elapsedRealtime()));
      ((ContentValues)localObject2).put("wall_time", Long.valueOf(System.currentTimeMillis()));
      if (paramLong != null) {
        ((ContentValues)localObject2).put("clv_increase", paramLong);
      }
      for (;;)
      {
        if (sLastLocation != null)
        {
          ((ContentValues)localObject2).put("event_lat", Double.valueOf(sLastLocation.getLatitude()));
          ((ContentValues)localObject2).put("event_lng", Double.valueOf(sLastLocation.getLongitude()));
        }
        if (Constants.OPEN_EVENT.equals(paramString)) {
          paramLong = null;
        }
        for (;;)
        {
          Object localObject1;
          long l;
          try
          {
            localObject1 = mProvider.query("sessions", PROJECTION_TAG_EVENT, SELECTION_TAG_EVENT, new String[] { localLong.toString() }, null);
            paramLong = (Long)localObject1;
            if (((Cursor)localObject1).moveToFirst())
            {
              paramLong = (Long)localObject1;
              ((ContentValues)localObject2).put("wall_time", Long.valueOf(((Cursor)localObject1).getLong(((Cursor)localObject1).getColumnIndexOrThrow("session_start_wall_time"))));
              if (localObject1 != null) {
                ((Cursor)localObject1).close();
              }
              localObject1 = mProvider.getUserIdAndType();
              paramLong = (String)((Map)localObject1).get("id");
              localObject1 = (String)((Map)localObject1).get("type");
              ((ContentValues)localObject2).put("customer_id", paramLong);
              ((ContentValues)localObject2).put("user_type", (String)localObject1);
            }
          }
          finally
          {
            if (paramLong != null) {
              paramLong.close();
            }
          }
          try
          {
            paramLong = UploadHandler.getIdentifiers(mProvider);
            if (paramLong != null) {
              ((ContentValues)localObject2).put("ids", paramLong.toString());
            }
          }
          catch (JSONException paramLong)
          {
            if (!Constants.IS_LOGGABLE) {
              continue;
            }
            Log.w("Localytics", "Caught exception", paramLong);
            continue;
            int i = 0;
            while (i < 10)
            {
              localObject2 = CUSTOM_DIMENSION_KEYS[i];
              String str = getCustomDimension(i);
              localObject1 = paramMap;
              if (str != null)
              {
                paramLong = paramMap;
                if (paramMap == null) {
                  paramLong = new TreeMap();
                }
                localObject1 = paramLong;
                if (paramLong.get(localObject2) == null)
                {
                  paramLong.put(localObject2, str);
                  localObject1 = paramLong;
                }
              }
              i += 1;
              paramMap = (Map<String, String>)localObject1;
            }
            if (paramMap == null) {
              break label711;
            }
            paramLong = new ContentValues();
            localObject1 = String.format("%s:%s", new Object[] { mContext.getPackageName(), "" });
            i = 0;
            paramMap = paramMap.entrySet().iterator();
            while (paramMap.hasNext())
            {
              localObject2 = (Map.Entry)paramMap.next();
              int j = i;
              if (((String)((Map.Entry)localObject2).getKey()).startsWith((String)localObject1))
              {
                j = i + 1;
                i = j;
                if (j > 50) {}
              }
              else
              {
                paramLong.put("events_key_ref", Long.valueOf(l));
                paramLong.put("attribute_key", (String)((Map.Entry)localObject2).getKey());
                paramLong.put("attribute_value", (String)((Map.Entry)localObject2).getValue());
                if (-1L == mProvider.insert("attributes", paramLong)) {
                  throw new AssertionError("Inserting attribute failed");
                }
                paramLong.clear();
                i = j;
              }
            }
          }
        }
        l = mProvider.insert("events", (ContentValues)localObject2);
        if (-1L != l) {
          break label424;
        }
        throw new RuntimeException("Inserting event failed");
        ((ContentValues)localObject2).put("clv_increase", Integer.valueOf(0));
      }
      paramLong = (Long)localObject1;
      throw new AssertionError("During tag of open event, session didn't exist");
    } while ((Constants.OPEN_EVENT.equals(paramString)) || (Constants.CLOSE_EVENT.equals(paramString)) || (Constants.OPT_IN_EVENT.equals(paramString)) || (Constants.OPT_OUT_EVENT.equals(paramString)) || (Constants.FLOW_EVENT.equals(paramString)));
    paramMap = new ContentValues();
    paramMap.put("name", paramString.substring(mContext.getPackageName().length() + 1, paramString.length()));
    paramMap.put("type", Integer.valueOf(0));
    paramMap.put("session_key_ref", localLong);
    paramMap.putNull("processed_in_blob");
    mProvider.insert("event_history", paramMap);
    conditionallyAddFlowEvent();
  }
  
  void tagScreen(String paramString)
  {
    Long localLong = getOpenSessionId(mProvider);
    if (localLong == null) {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "Tag not written because the session was not open");
      }
    }
    for (;;)
    {
      return;
      Cursor localCursor = null;
      Object localObject = localCursor;
      try
      {
        LocalyticsProvider localLocalyticsProvider = mProvider;
        localObject = localCursor;
        String[] arrayOfString = PROJECTION_TAG_SCREEN;
        localObject = localCursor;
        String str1 = SELECTION_TAG_SCREEN;
        localObject = localCursor;
        String str2 = Integer.toString(1);
        localObject = localCursor;
        String str3 = localLong.toString();
        localObject = localCursor;
        String str4 = SORT_ORDER_TAG_SCREEN;
        localObject = localCursor;
        localCursor = localLocalyticsProvider.query("event_history", arrayOfString, str1, new String[] { str2, str3 }, str4);
        localObject = localCursor;
        if (localCursor.moveToFirst())
        {
          localObject = localCursor;
          if (paramString.equals(localCursor.getString(localCursor.getColumnIndexOrThrow("name"))))
          {
            localObject = localCursor;
            if (Constants.IS_LOGGABLE)
            {
              localObject = localCursor;
              Log.v("Localytics", String.format("Suppressed duplicate screen %s", new Object[] { paramString }));
            }
            if (localCursor == null) {
              continue;
            }
            localCursor.close();
            return;
          }
        }
        if (localCursor != null) {
          localCursor.close();
        }
        localObject = new ContentValues();
        ((ContentValues)localObject).put("name", paramString);
        ((ContentValues)localObject).put("type", Integer.valueOf(1));
        ((ContentValues)localObject).put("session_key_ref", localLong);
        ((ContentValues)localObject).putNull("processed_in_blob");
        mProvider.insert("event_history", (ContentValues)localObject);
        conditionallyAddFlowEvent();
        return;
      }
      finally
      {
        if (localObject != null) {
          ((Cursor)localObject).close();
        }
      }
    }
  }
  
  void upload(Runnable paramRunnable)
  {
    if (((Boolean)sIsUploadingMap.get(mApiKey)).booleanValue())
    {
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Already uploading");
      }
      mUploadHandler.sendMessage(mUploadHandler.obtainMessage(2, paramRunnable));
    }
    do
    {
      return;
      try
      {
        preUploadBuildBlobs(mProvider);
        sIsUploadingMap.put(mApiKey, Boolean.TRUE);
        mUploadHandler.sendMessage(mUploadHandler.obtainMessage(1, paramRunnable));
        return;
      }
      catch (Exception localException)
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", "Error occurred during upload", localException);
        }
        sIsUploadingMap.put(mApiKey, Boolean.FALSE);
      }
    } while (paramRunnable == null);
    new Thread(paramRunnable, "upload_callback").start();
  }
  
  void uploadProfile(Runnable paramRunnable)
  {
    if (((Boolean)sIsUploadingProfileMap.get(mApiKey)).booleanValue())
    {
      if (Constants.IS_LOGGABLE) {
        Log.d("Localytics", "Already uploading profile");
      }
      mProfileUploadHandler.sendMessage(mProfileUploadHandler.obtainMessage(4, paramRunnable));
    }
    do
    {
      return;
      try
      {
        sIsUploadingProfileMap.put(mApiKey, Boolean.TRUE);
        mProfileUploadHandler.sendMessage(mProfileUploadHandler.obtainMessage(3, paramRunnable));
        return;
      }
      catch (Exception localException)
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", "Error occurred during profile upload", localException);
        }
        sIsUploadingProfileMap.put(mApiKey, Boolean.FALSE);
      }
    } while (paramRunnable == null);
    new Thread(paramRunnable, "upload_profile_callback").start();
  }
}
