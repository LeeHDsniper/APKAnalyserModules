package com.localytics.android;

import android.content.ClipboardManager;
import android.content.Context;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.v4.app.FragmentManager;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class AmpSessionHandler
  extends SessionHandler
{
  private static final String AMP_RULEEVENTS_SORT_ORDER = String.format("CAST(%s as TEXT)", new Object[] { "rule_id_ref" });
  private static final String AMP_RULES_SORT_ORDER;
  private static final String[] JOINER_ARG_AMP_RULES_COLUMNS = { "_id" };
  private static final String[] PROJECTION_AMP_RULEEVENTS = { "rule_id_ref" };
  private static final String SELECTION_AMP_RULEEVENTS;
  private static final String SELECTION_AMP_RULES = String.format("%s > ?", new Object[] { "expiration" });
  private FragmentManager mFragmentManager;
  
  static
  {
    SELECTION_AMP_RULEEVENTS = String.format("%s = ?", new Object[] { "event_name" });
    AMP_RULES_SORT_ORDER = String.format("CAST(%s AS TEXT)", new Object[] { "_id" });
  }
  
  public AmpSessionHandler(Context paramContext, String paramString, Looper paramLooper)
  {
    super(paramContext, paramString, paramLooper);
    sUploadHandlerThread.setName(AmpUploadHandler.class.getSimpleName());
  }
  
  /* Error */
  private boolean decompressZipFile(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: aconst_null
    //   4: astore 6
    //   6: new 139	java/util/zip/ZipInputStream
    //   9: dup
    //   10: new 141	java/io/FileInputStream
    //   13: dup
    //   14: new 143	java/lang/StringBuilder
    //   17: dup
    //   18: invokespecial 145	java/lang/StringBuilder:<init>	()V
    //   21: aload_1
    //   22: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   25: getstatic 154	java/io/File:separator	Ljava/lang/String;
    //   28: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   31: aload_3
    //   32: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: invokevirtual 157	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   38: invokespecial 159	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   41: invokespecial 162	java/util/zip/ZipInputStream:<init>	(Ljava/io/InputStream;)V
    //   44: astore_1
    //   45: sipush 8192
    //   48: newarray byte
    //   50: astore_3
    //   51: aload_1
    //   52: invokevirtual 166	java/util/zip/ZipInputStream:getNextEntry	()Ljava/util/zip/ZipEntry;
    //   55: astore 5
    //   57: aload 5
    //   59: ifnull +178 -> 237
    //   62: new 143	java/lang/StringBuilder
    //   65: dup
    //   66: invokespecial 145	java/lang/StringBuilder:<init>	()V
    //   69: aload_2
    //   70: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   73: getstatic 154	java/io/File:separator	Ljava/lang/String;
    //   76: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   79: aload 5
    //   81: invokevirtual 171	java/util/zip/ZipEntry:getName	()Ljava/lang/String;
    //   84: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: invokevirtual 157	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   90: astore 6
    //   92: aload 5
    //   94: invokevirtual 175	java/util/zip/ZipEntry:isDirectory	()Z
    //   97: ifeq +79 -> 176
    //   100: new 151	java/io/File
    //   103: dup
    //   104: aload 6
    //   106: invokespecial 176	java/io/File:<init>	(Ljava/lang/String;)V
    //   109: invokevirtual 179	java/io/File:mkdir	()Z
    //   112: ifne -61 -> 51
    //   115: getstatic 185	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   118: ifeq -67 -> 51
    //   121: ldc -69
    //   123: ldc -67
    //   125: iconst_1
    //   126: anewarray 56	java/lang/Object
    //   129: dup
    //   130: iconst_0
    //   131: aload 6
    //   133: aastore
    //   134: invokestatic 64	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   137: invokestatic 195	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   140: pop
    //   141: goto -90 -> 51
    //   144: astore_2
    //   145: aload_1
    //   146: astore 5
    //   148: getstatic 185	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   151: ifeq +15 -> 166
    //   154: aload_1
    //   155: astore 5
    //   157: ldc -69
    //   159: ldc -59
    //   161: aload_2
    //   162: invokestatic 200	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   165: pop
    //   166: aload_1
    //   167: ifnull +7 -> 174
    //   170: aload_1
    //   171: invokevirtual 203	java/util/zip/ZipInputStream:close	()V
    //   174: iconst_0
    //   175: ireturn
    //   176: new 205	java/io/FileOutputStream
    //   179: dup
    //   180: aload 6
    //   182: invokespecial 206	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   185: astore 5
    //   187: aload_1
    //   188: aload_3
    //   189: iconst_0
    //   190: aload_3
    //   191: arraylength
    //   192: invokevirtual 210	java/util/zip/ZipInputStream:read	([BII)I
    //   195: istore 4
    //   197: iload 4
    //   199: ifle +26 -> 225
    //   202: aload 5
    //   204: aload_3
    //   205: iconst_0
    //   206: iload 4
    //   208: invokevirtual 214	java/io/FileOutputStream:write	([BII)V
    //   211: goto -24 -> 187
    //   214: astore_2
    //   215: aload_1
    //   216: ifnull +7 -> 223
    //   219: aload_1
    //   220: invokevirtual 203	java/util/zip/ZipInputStream:close	()V
    //   223: aload_2
    //   224: athrow
    //   225: aload 5
    //   227: invokevirtual 215	java/io/FileOutputStream:close	()V
    //   230: aload_1
    //   231: invokevirtual 218	java/util/zip/ZipInputStream:closeEntry	()V
    //   234: goto -183 -> 51
    //   237: aload_1
    //   238: ifnull +77 -> 315
    //   241: aload_1
    //   242: invokevirtual 203	java/util/zip/ZipInputStream:close	()V
    //   245: iconst_1
    //   246: ireturn
    //   247: astore_1
    //   248: getstatic 185	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   251: ifeq +12 -> 263
    //   254: ldc -69
    //   256: ldc -59
    //   258: aload_1
    //   259: invokestatic 200	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   262: pop
    //   263: iconst_0
    //   264: ireturn
    //   265: astore_1
    //   266: getstatic 185	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   269: ifeq +12 -> 281
    //   272: ldc -69
    //   274: ldc -59
    //   276: aload_1
    //   277: invokestatic 200	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   280: pop
    //   281: iconst_0
    //   282: ireturn
    //   283: astore_1
    //   284: getstatic 185	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   287: ifeq +12 -> 299
    //   290: ldc -69
    //   292: ldc -59
    //   294: aload_1
    //   295: invokestatic 200	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   298: pop
    //   299: iconst_0
    //   300: ireturn
    //   301: astore_2
    //   302: aload 5
    //   304: astore_1
    //   305: goto -90 -> 215
    //   308: astore_2
    //   309: aload 6
    //   311: astore_1
    //   312: goto -167 -> 145
    //   315: goto -70 -> 245
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	318	0	this	AmpSessionHandler
    //   0	318	1	paramString1	String
    //   0	318	2	paramString2	String
    //   0	318	3	paramString3	String
    //   195	12	4	i	int
    //   1	302	5	localObject	Object
    //   4	306	6	str	String
    // Exception table:
    //   from	to	target	type
    //   45	51	144	java/io/IOException
    //   51	57	144	java/io/IOException
    //   62	141	144	java/io/IOException
    //   176	187	144	java/io/IOException
    //   187	197	144	java/io/IOException
    //   202	211	144	java/io/IOException
    //   225	234	144	java/io/IOException
    //   45	51	214	finally
    //   51	57	214	finally
    //   62	141	214	finally
    //   176	187	214	finally
    //   187	197	214	finally
    //   202	211	214	finally
    //   225	234	214	finally
    //   241	245	247	java/io/IOException
    //   170	174	265	java/io/IOException
    //   219	223	283	java/io/IOException
    //   6	45	301	finally
    //   148	154	301	finally
    //   157	166	301	finally
    //   6	45	308	java/io/IOException
  }
  
  private boolean doesCreativeExist(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (File localFile = new File(getZipFileDirPath() + File.separator + String.format("amp_rule_%d.zip", new Object[] { Integer.valueOf(paramInt) }));; localFile = new File(getUnzipFileDirPath(paramInt) + File.separator + "index.html")) {
      return localFile.exists();
    }
  }
  
  private final Vector<String> getAmpConditionValues(int paramInt)
  {
    for (localObject2 = null;; localObject2 = localVector)
    {
      for (;;)
      {
        try
        {
          localObject1 = mProvider.query("amp_condition_values", null, String.format("%s = ?", new Object[] { "condition_id_ref" }), new String[] { Integer.toString(paramInt) }, null);
          localObject2 = null;
        }
        finally
        {
          String str;
          Vector localVector;
          Object localObject1 = localObject2;
          localObject2 = localObject4;
          if (localObject1 != null) {
            ((Cursor)localObject1).close();
          }
        }
        try
        {
          if (!((Cursor)localObject1).moveToNext()) {
            continue;
          }
          str = ((Cursor)localObject1).getString(((Cursor)localObject1).getColumnIndexOrThrow("value"));
          if (localObject2 != null) {
            break label131;
          }
          localVector = new Vector();
        }
        finally
        {
          continue;
          Object localObject5 = localObject3;
        }
      }
      localObject2 = localObject1;
      localVector.add(str);
    }
    if (localObject1 != null) {
      ((Cursor)localObject1).close();
    }
    return localObject2;
  }
  
  private Vector<AmpCondition> getAmpConditions(int paramInt)
  {
    for (localObject2 = null;; localObject2 = localVector1)
    {
      for (;;)
      {
        try
        {
          localObject1 = mProvider.query("amp_conditions", null, String.format("%s = ?", new Object[] { "rule_id_ref" }), new String[] { Integer.toString(paramInt) }, null);
          localObject2 = null;
        }
        finally
        {
          Object localObject6;
          String str;
          Vector localVector2;
          Vector localVector1;
          Object localObject1 = localObject2;
          localObject2 = localObject4;
          if (localObject1 != null) {
            ((Cursor)localObject1).close();
          }
        }
        try
        {
          if (!((Cursor)localObject1).moveToNext()) {
            continue;
          }
          paramInt = ((Cursor)localObject1).getInt(((Cursor)localObject1).getColumnIndexOrThrow("_id"));
          localObject6 = ((Cursor)localObject1).getString(((Cursor)localObject1).getColumnIndexOrThrow("attribute_name"));
          str = ((Cursor)localObject1).getString(((Cursor)localObject1).getColumnIndexOrThrow("operator"));
          localVector2 = getAmpConditionValues(paramInt);
          if (localObject2 != null) {
            break label202;
          }
          localVector1 = new Vector();
        }
        finally
        {
          continue;
          Object localObject5 = localObject3;
        }
      }
      localObject2 = localObject1;
      localObject6 = new AmpCondition((String)localObject6, str, localVector2);
      localObject2 = localObject1;
      ((AmpCondition)localObject6).setPackageName(mContext.getPackageName());
      localObject2 = localObject1;
      localVector1.add(localObject6);
    }
    if (localObject1 != null) {
      ((Cursor)localObject1).close();
    }
    return localObject2;
  }
  
  private Vector<Map<String, Object>> getAmpMessageMaps(String paramString)
  {
    Vector localVector = new Vector();
    Cursor localCursor2 = null;
    HashMap localHashMap = null;
    Object localObject1 = localHashMap;
    Cursor localCursor1 = localCursor2;
    for (;;)
    {
      int j;
      try
      {
        Object localObject2 = Long.toString(System.currentTimeMillis() / 1000L);
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        Object localObject3 = mProvider;
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        String str1 = SELECTION_AMP_RULES;
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        String str2 = AMP_RULES_SORT_ORDER;
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        localCursor2 = ((LocalyticsProvider)localObject3).query("amp_rules", null, str1, new String[] { localObject2 }, str2);
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        localObject2 = mProvider;
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        localObject3 = SELECTION_AMP_RULEEVENTS;
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        str1 = AMP_RULEEVENTS_SORT_ORDER;
        localObject1 = localHashMap;
        localCursor1 = localCursor2;
        paramString = ((LocalyticsProvider)localObject2).query("amp_ruleevent", null, (String)localObject3, new String[] { paramString }, str1);
        int i = 0;
        localObject1 = paramString;
        localCursor1 = localCursor2;
        if (i < paramString.getCount())
        {
          localObject1 = paramString;
          localCursor1 = localCursor2;
          paramString.moveToPosition(i);
          localObject1 = paramString;
          localCursor1 = localCursor2;
          int k = paramString.getInt(paramString.getColumnIndexOrThrow("rule_id_ref"));
          j = 0;
          localObject1 = paramString;
          localCursor1 = localCursor2;
          if (j < localCursor2.getCount())
          {
            localObject1 = paramString;
            localCursor1 = localCursor2;
            localCursor2.moveToPosition(j);
            localObject1 = paramString;
            localCursor1 = localCursor2;
            if (localCursor2.getInt(localCursor2.getColumnIndexOrThrow("_id")) == k)
            {
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap = new HashMap();
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("_id", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("_id"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("campaign_id", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("campaign_id"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("expiration", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("expiration"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("display_seconds", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("display_seconds"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("display_session", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("display_session"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("version", localCursor2.getString(localCursor2.getColumnIndexOrThrow("version")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("phone_location", localCursor2.getString(localCursor2.getColumnIndexOrThrow("phone_location")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("phone_size_width", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("phone_size_width"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("phone_size_height", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("phone_size_height"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("tablet_location", localCursor2.getString(localCursor2.getColumnIndexOrThrow("tablet_location")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("tablet_size_width", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("tablet_size_width"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("tablet_size_height", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("tablet_size_height"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("time_to_display", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("time_to_display"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("internet_required", Integer.valueOf(localCursor2.getInt(localCursor2.getColumnIndexOrThrow("internet_required"))));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("ab_test", localCursor2.getString(localCursor2.getColumnIndexOrThrow("ab_test")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("rule_name", localCursor2.getString(localCursor2.getColumnIndexOrThrow("rule_name")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("location", localCursor2.getString(localCursor2.getColumnIndexOrThrow("location")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localHashMap.put("devices", localCursor2.getString(localCursor2.getColumnIndexOrThrow("devices")));
              localObject1 = paramString;
              localCursor1 = localCursor2;
              localVector.add(localHashMap);
            }
          }
          else
          {
            localObject1 = paramString;
            localCursor1 = localCursor2;
            localCursor2.moveToFirst();
            i += 1;
          }
        }
        else
        {
          if (localCursor2 != null) {
            localCursor2.close();
          }
          if (paramString != null) {
            paramString.close();
          }
          return localVector;
        }
      }
      finally
      {
        if (localCursor1 != null) {
          localCursor1.close();
        }
        if (localObject1 != null) {
          ((Cursor)localObject1).close();
        }
      }
      j += 1;
    }
  }
  
  private String getRemoteFileURL(Map<String, Object> paramMap)
  {
    String str = (String)paramMap.get("devices");
    if (str.compareTo("tablet") == 0) {
      return (String)paramMap.get("tablet_location");
    }
    if (str.compareTo("both") == 0) {
      return (String)paramMap.get("phone_location");
    }
    return (String)paramMap.get("phone_location");
  }
  
  private String getUnzipFileDirPath(int paramInt)
  {
    Object localObject = new StringBuilder();
    ((StringBuilder)localObject).append(mContext.getFilesDir().getAbsolutePath());
    ((StringBuilder)localObject).append(File.separator);
    ((StringBuilder)localObject).append(".localytics");
    ((StringBuilder)localObject).append(File.separator);
    ((StringBuilder)localObject).append(mApiKey);
    ((StringBuilder)localObject).append(File.separator);
    ((StringBuilder)localObject).append(String.format("amp_rule_%d", new Object[] { Integer.valueOf(paramInt) }));
    String str = ((StringBuilder)localObject).toString();
    File localFile = new File(str);
    if (localFile.exists())
    {
      localObject = str;
      if (localFile.isDirectory()) {}
    }
    else
    {
      localObject = str;
      if (!localFile.mkdirs())
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", String.format("Could not create the directory %s for saving the decompressed file.", new Object[] { localFile.getAbsolutePath() }));
        }
        localObject = null;
      }
    }
    return localObject;
  }
  
  private String getZipFileDirPath()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(mContext.getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    localStringBuilder.append(File.separator);
    localStringBuilder.append(mApiKey);
    return localStringBuilder.toString();
  }
  
  private boolean isAmpMessageSatisfiedConditions(Map<String, Object> paramMap, Map<String, String> paramMap1)
  {
    boolean bool2 = true;
    int i = ((Integer)paramMap.get("campaign_id")).intValue();
    paramMap = getAmpConditions(AmpHelper.getRuleIdFromCampaignId(mProvider, i));
    boolean bool1 = bool2;
    if (paramMap != null)
    {
      paramMap = paramMap.iterator();
      do
      {
        bool1 = bool2;
        if (!paramMap.hasNext()) {
          break;
        }
      } while (((AmpCondition)paramMap.next()).isSatisfiedByAttributes(paramMap1));
      bool1 = false;
    }
    return bool1;
  }
  
  private boolean isConnectingToInternet()
  {
    Object localObject = (ConnectivityManager)mContext.getSystemService("connectivity");
    if (localObject != null)
    {
      localObject = ((ConnectivityManager)localObject).getAllNetworkInfo();
      if (localObject != null)
      {
        int i = 0;
        while (i < localObject.length)
        {
          if (localObject[i].getState() == NetworkInfo.State.CONNECTED) {
            return true;
          }
          i += 1;
        }
      }
    }
    return false;
  }
  
  private Map<String, Object> retrieveDisplayingCandidate(Vector<Map<String, Object>> paramVector, Map<String, String> paramMap)
  {
    Map localMap = null;
    Iterator localIterator = paramVector.iterator();
    paramVector = localMap;
    label90:
    while (localIterator.hasNext())
    {
      localMap = (Map)localIterator.next();
      if (((Integer)localMap.get("internet_required")).intValue() == 1) {}
      for (int i = 1;; i = 0)
      {
        if (((i != 0) && (!isConnectingToInternet())) || ((paramMap != null) && (!isAmpMessageSatisfiedConditions(localMap, paramMap)))) {
          break label90;
        }
        paramVector = localMap;
        break;
      }
    }
    if (paramVector != null)
    {
      paramMap = paramVector;
      if (updateDisplayingCandidate(paramVector)) {}
    }
    else
    {
      paramMap = null;
    }
    return paramMap;
  }
  
  private boolean updateDisplayingCandidate(Map<String, Object> paramMap)
  {
    String str1 = null;
    int i = ((Integer)paramMap.get("_id")).intValue();
    String str3 = getZipFileDirPath();
    String str2 = getUnzipFileDirPath(i);
    boolean bool = getRemoteFileURL(paramMap).endsWith(".zip");
    if (!doesCreativeExist(i, bool))
    {
      String str4 = AmpDownloader.getRemoteFileURL(paramMap);
      String str5 = AmpDownloader.getLocalFileURL(mContext, mApiKey, i, bool);
      if ((!TextUtils.isEmpty(str4)) && (!TextUtils.isEmpty(str5))) {
        AmpDownloader.downloadFile(str4, str5, true);
      }
    }
    if (bool) {
      if (!decompressZipFile(str3, str2, String.format("amp_rule_%d.zip", new Object[] { Integer.valueOf(i) }))) {}
    }
    for (str1 = "file://" + str2 + File.separator + "index.html"; TextUtils.isEmpty(str1); str1 = "file://" + str2 + File.separator + "index.html") {
      return false;
    }
    str3 = (String)paramMap.get("devices");
    int j;
    if (str3.equals("tablet"))
    {
      j = ((Integer)paramMap.get("tablet_size_width")).intValue();
      i = ((Integer)paramMap.get("tablet_size_height")).intValue();
    }
    for (;;)
    {
      paramMap.put("html_url", str1);
      paramMap.put("base_path", str2);
      paramMap.put("display_width", Float.valueOf(j));
      paramMap.put("display_height", Float.valueOf(i));
      return true;
      if (str3.equals("both"))
      {
        j = ((Integer)paramMap.get("phone_size_width")).intValue();
        i = ((Integer)paramMap.get("phone_size_height")).intValue();
      }
      else
      {
        j = ((Integer)paramMap.get("phone_size_width")).intValue();
        i = ((Integer)paramMap.get("phone_size_height")).intValue();
      }
    }
  }
  
  void ampTrigger(final String paramString, final Map<String, String> paramMap)
  {
    Vector localVector2 = getAmpMessageMaps(paramString);
    Vector localVector1 = localVector2;
    if (localVector2.size() == 0)
    {
      localVector1 = localVector2;
      if (paramString.startsWith(mContext.getPackageName())) {
        localVector1 = getAmpMessageMaps(paramString.substring(mContext.getPackageName().length() + 1, paramString.length()));
      }
    }
    paramString = retrieveDisplayingCandidate(localVector1, paramMap);
    if (paramString == null) {
      return;
    }
    new Handler(Looper.getMainLooper()).post(new Runnable()
    {
      public void run()
      {
        if (mFragmentManager == null) {}
        do
        {
          for (;;)
          {
            return;
            try
            {
              if (mFragmentManager.findFragmentByTag("amp_dialog") == null)
              {
                AmpDialogFragment.newInstance().setData(paramString).setCallbacks(getDialogCallbacks()).setJavaScriptClient(new JavaScriptClient(getJavaScriptClientCallbacks(paramMap))).show(mFragmentManager, "amp_dialog");
                mFragmentManager.executePendingTransactions();
                return;
              }
            }
            catch (Exception localException) {}
          }
        } while (!Constants.IS_LOGGABLE);
        Log.e("Localytics", "Localytics library threw an uncaught exception", localException);
      }
    });
  }
  
  protected UploadHandler createUploadHandler(Context paramContext, Handler paramHandler, String paramString1, String paramString2, Looper paramLooper)
  {
    return new AmpUploadHandler(paramContext, this, paramString1, paramString2, paramLooper);
  }
  
  public Map<Integer, AmpCallable> getDialogCallbacks()
  {
    TreeMap localTreeMap = new TreeMap();
    localTreeMap.put(Integer.valueOf(1), new AmpCallable()
    {
      public Object call(Object[] paramAnonymousArrayOfObject)
      {
        sendMessage(obtainMessage(19, paramAnonymousArrayOfObject));
        return null;
      }
    });
    localTreeMap.put(Integer.valueOf(2), new AmpCallable()
    {
      public Object call(Object[] paramAnonymousArrayOfObject)
      {
        Object localObject1 = (String)paramAnonymousArrayOfObject[0];
        Object localObject2 = (Map)paramAnonymousArrayOfObject[1];
        paramAnonymousArrayOfObject = String.format("%s:%s", new Object[] { mContext.getPackageName(), localObject1 });
        localObject1 = new TreeMap();
        if (localObject2 != null)
        {
          String str = mContext.getPackageName();
          localObject2 = ((Map)localObject2).entrySet().iterator();
          while (((Iterator)localObject2).hasNext())
          {
            Map.Entry localEntry = (Map.Entry)((Iterator)localObject2).next();
            ((TreeMap)localObject1).put(String.format("%s:%s", new Object[] { str, localEntry.getKey() }), localEntry.getValue());
          }
        }
        sendMessage(obtainMessage(3, new Object[] { paramAnonymousArrayOfObject, localObject1, null }));
        return null;
      }
    });
    return localTreeMap;
  }
  
  public Map<Integer, AmpCallable> getJavaScriptClientCallbacks(final Map<String, String> paramMap)
  {
    TreeMap localTreeMap = new TreeMap();
    localTreeMap.put(Integer.valueOf(3), new AmpCallable()
    {
      private Map<String, String> convertDimensionsToAttributes(List<String> paramAnonymousList)
      {
        TreeMap localTreeMap = new TreeMap();
        if (paramAnonymousList != null)
        {
          int i = 0;
          paramAnonymousList = paramAnonymousList.iterator();
          if (paramAnonymousList.hasNext())
          {
            String str = (String)paramAnonymousList.next();
            if (i == 0) {
              localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1, str);
            }
            for (;;)
            {
              i += 1;
              break;
              if (1 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2, str);
              } else if (2 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3, str);
              } else if (3 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4, str);
              } else if (4 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5, str);
              } else if (5 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6, str);
              } else if (6 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7, str);
              } else if (7 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8, str);
              } else if (8 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9, str);
              } else if (9 == i) {
                localTreeMap.put(LocalyticsProvider.AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10, str);
              }
            }
          }
        }
        return localTreeMap;
      }
      
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        String str3 = (String)paramAnonymousArrayOfObject[0];
        String str2 = (String)paramAnonymousArrayOfObject[1];
        String str1 = (String)paramAnonymousArrayOfObject[2];
        long l = ((Long)paramAnonymousArrayOfObject[3]).longValue();
        paramAnonymousArrayOfObject = null;
        List localList;
        try
        {
          if (!TextUtils.isEmpty(str2)) {
            paramAnonymousArrayOfObject = JsonHelper.toMap(new JSONObject(str2));
          }
          localList = null;
          if (str3.length() != 0) {
            break label149;
          }
        }
        catch (JSONException paramAnonymousArrayOfObject)
        {
          try
          {
            if (!TextUtils.isEmpty(str1)) {
              localList = JsonHelper.toList(new JSONArray(str1));
            }
            if (str3 != null) {
              break label131;
            }
            throw new IllegalArgumentException("event cannot be null");
          }
          catch (JSONException paramAnonymousArrayOfObject)
          {
            if (!Constants.IS_LOGGABLE) {
              break label129;
            }
            Log.w("Localytics", "[JavaScriptClient]: Failed to parse the json object in tagEventNative");
            return null;
          }
          paramAnonymousArrayOfObject = paramAnonymousArrayOfObject;
          if (Constants.IS_LOGGABLE) {
            Log.w("Localytics", "[JavaScriptClient]: Failed to parse the json object in tagEventNative");
          }
          return null;
        }
        label129:
        label131:
        throw new IllegalArgumentException("event cannot be empty");
        label149:
        Object localObject1;
        Object localObject2;
        if (str2 != null)
        {
          if ((paramAnonymousArrayOfObject.isEmpty()) && (Constants.IS_LOGGABLE)) {
            Log.w("Localytics", "attributes is empty.  Did the caller make an error?");
          }
          if ((paramAnonymousArrayOfObject.size() > 50) && (Constants.IS_LOGGABLE)) {
            Log.w("Localytics", String.format("attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?", new Object[] { Integer.valueOf(paramAnonymousArrayOfObject.size()), Integer.valueOf(50) }));
          }
          localObject1 = paramAnonymousArrayOfObject.entrySet().iterator();
          while (((Iterator)localObject1).hasNext())
          {
            Object localObject3 = (Map.Entry)((Iterator)localObject1).next();
            localObject2 = (String)((Map.Entry)localObject3).getKey();
            localObject3 = (String)((Map.Entry)localObject3).getValue();
            if (localObject2 == null) {
              throw new IllegalArgumentException("attributes cannot contain null keys");
            }
            if (localObject3 == null) {
              throw new IllegalArgumentException("attributes cannot contain null values");
            }
            if (((String)localObject2).length() == 0) {
              throw new IllegalArgumentException("attributes cannot contain empty keys");
            }
            if (((String)localObject3).length() == 0) {
              throw new IllegalArgumentException("attributes cannot contain empty values");
            }
          }
        }
        if (localList != null)
        {
          if ((localList.isEmpty()) && (Constants.IS_LOGGABLE)) {
            Log.w("Localytics", "customDimensions is empty.  Did the caller make an error?");
          }
          if ((localList.size() > 10) && (Constants.IS_LOGGABLE)) {
            Log.w("Localytics", String.format("customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?", new Object[] { Integer.valueOf(localList.size()), Integer.valueOf(10) }));
          }
          localObject1 = localList.iterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject2 = (String)((Iterator)localObject1).next();
            if (localObject2 == null) {
              throw new IllegalArgumentException("customDimensions cannot contain null elements");
            }
            if (((String)localObject2).length() == 0) {
              throw new IllegalArgumentException("customDimensions cannot contain empty elements");
            }
          }
        }
        str3 = String.format("%s:%s", new Object[] { mContext.getPackageName(), str3 });
        if ((paramAnonymousArrayOfObject == null) && (localList == null)) {
          sendMessage(obtainMessage(3, new Object[] { str3, null, Long.valueOf(l) }));
        }
        for (;;)
        {
          return null;
          localObject1 = new TreeMap();
          if (str2 != null)
          {
            str2 = mContext.getPackageName();
            paramAnonymousArrayOfObject = paramAnonymousArrayOfObject.entrySet().iterator();
            while (paramAnonymousArrayOfObject.hasNext())
            {
              localObject2 = (Map.Entry)paramAnonymousArrayOfObject.next();
              ((TreeMap)localObject1).put(String.format("%s:%s", new Object[] { str2, ((Map.Entry)localObject2).getKey() }), (String)((Map.Entry)localObject2).getValue());
            }
          }
          if (str1 != null) {
            ((TreeMap)localObject1).putAll(convertDimensionsToAttributes(localList));
          }
          sendMessage(obtainMessage(3, new Object[] { str3, localObject1, Long.valueOf(l) }));
        }
      }
    });
    localTreeMap.put(Integer.valueOf(5), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        Object localObject1 = null;
        paramAnonymousArrayOfObject = null;
        try
        {
          localCursor = mProvider.query("identifiers", null, null, null, null);
          paramAnonymousArrayOfObject = localCursor;
          localObject1 = localCursor;
          i = localCursor.getCount();
          if (i != 0) {
            break label58;
          }
          if (localCursor != null) {
            localCursor.close();
          }
          paramAnonymousArrayOfObject = null;
        }
        catch (JSONException localJSONException)
        {
          Cursor localCursor;
          label58:
          do
          {
            int i;
            int j;
            localObject2 = paramAnonymousArrayOfObject;
            if (Constants.IS_LOGGABLE)
            {
              localObject2 = paramAnonymousArrayOfObject;
              Log.w("Localytics", "[JavaScriptClient]: Failed to get identifiers");
            }
            if (paramAnonymousArrayOfObject != null) {
              paramAnonymousArrayOfObject.close();
            }
            return null;
            paramAnonymousArrayOfObject = localCursor;
            localObject2 = localCursor;
            Object localObject3 = ((JSONObject)localObject3).toString();
            localObject2 = localObject3;
            paramAnonymousArrayOfObject = (Object[])localObject2;
          } while (localCursor == null);
          localCursor.close();
          return localObject2;
        }
        finally
        {
          Object localObject2;
          if (localObject2 == null) {
            break label240;
          }
          ((Cursor)localObject2).close();
        }
        return paramAnonymousArrayOfObject;
        paramAnonymousArrayOfObject = localCursor;
        localObject1 = localCursor;
        localObject3 = new JSONObject();
        paramAnonymousArrayOfObject = localCursor;
        localObject1 = localCursor;
        i = localCursor.getColumnIndexOrThrow("key");
        paramAnonymousArrayOfObject = localCursor;
        localObject1 = localCursor;
        j = localCursor.getColumnIndexOrThrow("value");
        for (;;)
        {
          paramAnonymousArrayOfObject = localCursor;
          localObject1 = localCursor;
          if (!localCursor.moveToNext()) {
            break;
          }
          paramAnonymousArrayOfObject = localCursor;
          localObject1 = localCursor;
          ((JSONObject)localObject3).put(localCursor.getString(i), localCursor.getString(j));
        }
      }
    });
    localTreeMap.put(Integer.valueOf(6), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        paramAnonymousArrayOfObject = new JSONObject();
        int i = 0;
        for (;;)
        {
          if (i < 10) {
            try
            {
              paramAnonymousArrayOfObject.put("c" + i, getCustomDimension(i));
              i += 1;
            }
            catch (JSONException localJSONException)
            {
              for (;;)
              {
                if (Constants.IS_LOGGABLE) {
                  Log.w("Localytics", "[JavaScriptClient]: Failed to get custom dimension");
                }
              }
            }
          }
        }
        return paramAnonymousArrayOfObject.toString();
      }
    });
    localTreeMap.put(Integer.valueOf(7), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramMap == null) {
          return null;
        }
        if (paramMap.size() == 0) {
          return null;
        }
        try
        {
          paramAnonymousArrayOfObject = String.format("%s:%s", new Object[] { mContext.getPackageName(), "" });
          JSONObject localJSONObject = new JSONObject();
          Iterator localIterator = paramMap.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Object localObject = (Map.Entry)localIterator.next();
            if (((String)((Map.Entry)localObject).getKey()).startsWith(paramAnonymousArrayOfObject))
            {
              String str = (String)((Map.Entry)localObject).getKey();
              localObject = (String)((Map.Entry)localObject).getValue();
              localJSONObject.put(str.substring(paramAnonymousArrayOfObject.length()), localObject);
            }
          }
          paramAnonymousArrayOfObject = localJSONObject.toString();
        }
        catch (JSONException paramAnonymousArrayOfObject)
        {
          if (Constants.IS_LOGGABLE) {
            Log.w("Localytics", "[JavaScriptClient]: Failed to get attributes");
          }
          return null;
        }
        return paramAnonymousArrayOfObject;
      }
    });
    localTreeMap.put(Integer.valueOf(8), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        int i = ((Integer)paramAnonymousArrayOfObject[0]).intValue();
        paramAnonymousArrayOfObject = (String)paramAnonymousArrayOfObject[1];
        setCustomDimension(i, paramAnonymousArrayOfObject);
        return null;
      }
    });
    return localTreeMap;
  }
  
  public void handleMessage(Message paramMessage)
  {
    try
    {
      if (!Arrays.asList(new Integer[] { Integer.valueOf(13), Integer.valueOf(15), Integer.valueOf(19) }).contains(Integer.valueOf(what))) {
        super.handleMessage(paramMessage);
      }
      if (Constants.IS_LOGGABLE) {
        Log.v("Localytics", String.format("Handler received %s", new Object[] { paramMessage }));
      }
      switch (what)
      {
      case 13: 
        if (Constants.IS_LOGGABLE) {
          Log.d("Localytics", "Handler received MESSAGE_TRIGGER_AMP");
        }
        paramMessage = (Object[])obj;
        ampTrigger((String)paramMessage[0], (Map)paramMessage[1]);
        return;
      }
    }
    catch (Exception paramMessage)
    {
      if (Constants.IS_LOGGABLE)
      {
        Log.e("Localytics", "Localytics library threw an uncaught exception", paramMessage);
        return;
        if (Constants.IS_LOGGABLE) {
          Log.d("Localytics", "Amp Session Handler received MESSAGE_TAG_EVENT");
        }
        paramMessage = (Object[])obj;
        ampTrigger((String)paramMessage[0], (Map)paramMessage[1]);
        return;
        if (Constants.IS_LOGGABLE) {
          Log.d("Localytics", "Amp Session Handler received MESSAGE_SHOW_AMP_TEST");
        }
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable()
        {
          public void run()
          {
            showAmpTest();
          }
        }, 1000L);
        return;
        if (Constants.IS_LOGGABLE) {
          Log.d("Localytics", "Amp Session Handler received MESSAGE_DELETE_AMP_RESOURCES");
        }
        paramMessage = (Map)((Object[])(Object[])obj)[0];
        AmpHelper.destroyLocalAmp(mProvider, paramMessage, true);
        return;
      }
    }
  }
  
  public void setFragmentManager(FragmentManager paramFragmentManager)
  {
    mFragmentManager = paramFragmentManager;
  }
  
  void showAmpTest()
  {
    if (mFragmentManager == null) {}
    while ((mFragmentManager.findFragmentByTag("amp_test_mode_button") != null) || (mFragmentManager.findFragmentByTag("amp_test_mode_list") != null)) {
      return;
    }
    final TestModeButton localTestModeButton = TestModeButton.newInstance();
    final TestModeListView localTestModeListView = TestModeListView.newInstance();
    final AmpRulesAdapter localAmpRulesAdapter = new AmpRulesAdapter(mContext);
    localTestModeListView.setAdapter(localAmpRulesAdapter);
    TreeMap localTreeMap = new TreeMap();
    localTreeMap.put(Integer.valueOf(9), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        localAmpRulesAdapter.updateDataSet(mProvider);
        localTestModeListView.show(mFragmentManager, "amp_test_mode_list");
        mFragmentManager.executePendingTransactions();
        return null;
      }
    });
    localTestModeButton.setCallbacks(localTreeMap);
    localTestModeButton.show(mFragmentManager, "amp_test_mode_button");
    mFragmentManager.executePendingTransactions();
    localTreeMap = new TreeMap();
    localTreeMap.put(Integer.valueOf(10), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        localTestModeButton.show(mFragmentManager, "amp_test_mode_button");
        mFragmentManager.executePendingTransactions();
        return null;
      }
    });
    localTreeMap.put(Integer.valueOf(12), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        sendMessage(obtainMessage(3, new Object[] { String.format("%s:%s", new Object[] { mContext.getPackageName(), "Test Mode Update Data" }), null, null }));
        sendMessage(obtainMessage(4, new Runnable()
        {
          public void run()
          {
            new Handler(Looper.getMainLooper()).post(new Runnable()
            {
              public void run()
              {
                val$adapter.updateDataSet(mProvider);
                val$adapter.notifyDataSetChanged();
              }
            });
          }
        }));
        return null;
      }
    });
    localTreeMap.put(Integer.valueOf(13), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        String str = null;
        paramAnonymousArrayOfObject = null;
        try
        {
          Object localObject2 = mProvider.query("info", null, null, null, null);
          paramAnonymousArrayOfObject = (Object[])localObject2;
          if (((Cursor)localObject2).moveToFirst())
          {
            paramAnonymousArrayOfObject = (Object[])localObject2;
            str = ((Cursor)localObject2).getString(((Cursor)localObject2).getColumnIndexOrThrow("registration_id"));
          }
          if (localObject2 != null) {
            ((Cursor)localObject2).close();
          }
          if (!TextUtils.isEmpty(str))
          {
            paramAnonymousArrayOfObject = mContext;
            localObject2 = mContext;
            ((ClipboardManager)paramAnonymousArrayOfObject.getSystemService("clipboard")).setText(str);
            Toast.makeText(mContext, str + " has been copied to the clipboard.", 1).show();
            return null;
          }
        }
        finally
        {
          if (paramAnonymousArrayOfObject != null) {
            paramAnonymousArrayOfObject.close();
          }
        }
        Toast.makeText(mContext, "No push token found. Please check your integration.", 1).show();
        return null;
      }
    });
    localTreeMap.put(Integer.valueOf(14), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        paramAnonymousArrayOfObject = SessionHandler.getInstallationId(mProvider, mApiKey);
        if (!TextUtils.isEmpty(paramAnonymousArrayOfObject))
        {
          Context localContext1 = mContext;
          Context localContext2 = mContext;
          ((ClipboardManager)localContext1.getSystemService("clipboard")).setText(paramAnonymousArrayOfObject);
          Toast.makeText(mContext, paramAnonymousArrayOfObject + " has been copied to the clipboard.", 1).show();
        }
        for (;;)
        {
          return null;
          Toast.makeText(mContext, "No install id found. Please check your integration.", 1).show();
        }
      }
    });
    localTreeMap.put(Integer.valueOf(11), new AmpCallable()
    {
      Object call(final Object[] paramAnonymousArrayOfObject)
      {
        paramAnonymousArrayOfObject = (Map)paramAnonymousArrayOfObject[0];
        new AsyncTask()
        {
          protected Map<String, Object> doInBackground(Map<String, Object>... paramAnonymous2VarArgs)
          {
            if (AmpSessionHandler.this.updateDisplayingCandidate(paramAnonymous2VarArgs[0])) {
              return paramAnonymous2VarArgs[0];
            }
            return null;
          }
          
          protected void onPostExecute(Map<String, Object> paramAnonymous2Map)
          {
            if (paramAnonymous2Map == null) {}
            try
            {
              Toast.makeText(mContext, "The downloaded campaign file is broken.", 0).show();
              return;
            }
            catch (Exception paramAnonymous2Map)
            {
              AmpDialogFragment localAmpDialogFragment;
              if (!Constants.IS_LOGGABLE) {
                return;
              }
              Log.e("Localytics", "Localytics library threw an uncaught exception", paramAnonymous2Map);
            }
            if ((mFragmentManager != null) && (mFragmentManager.findFragmentByTag("amp_dialog" + paramAnonymous2Map.get("campaign_id")) == null))
            {
              localAmpDialogFragment = AmpDialogFragment.newInstance();
              localAmpDialogFragment.setRetainInstance(false);
              localAmpDialogFragment.setData(paramAnonymous2Map).setCallbacks(getDialogCallbacks()).setJavaScriptClient(new JavaScriptClient(getJavaScriptClientCallbacks(null))).show(mFragmentManager, "amp_dialog" + paramAnonymous2Map.get("campaign_id"));
              mFragmentManager.executePendingTransactions();
              return;
            }
          }
          
          protected void onPreExecute()
          {
            int i = ((Integer)paramAnonymousArrayOfObject.get("_id")).intValue();
            boolean bool = AmpSessionHandler.this.getRemoteFileURL(paramAnonymousArrayOfObject).endsWith(".zip");
            if (!AmpSessionHandler.this.doesCreativeExist(i, bool)) {
              Toast.makeText(mContext, "Downloading the campaign...\nIt'll be shown in few seconds.", 0).show();
            }
          }
        }.execute(new Map[] { paramAnonymousArrayOfObject });
        return null;
      }
    });
    localTestModeListView.setCallbacks(localTreeMap);
  }
}
