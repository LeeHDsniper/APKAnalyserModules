package com.localytics.android;

import android.content.Context;
import android.content.Intent;
import android.os.HandlerThread;
import android.text.TextUtils;
import android.util.Log;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

public class LocalyticsSession
{
  private static final Map<String, SessionHandler> sLocalyticsSessionHandlerMap = new HashMap();
  private static final Object[] sLocalyticsSessionIntrinsicLock = new Object[0];
  protected static final HandlerThread sSessionHandlerThread = getHandlerThread(SessionHandler.class.getSimpleName());
  protected final Context mContext;
  private final SessionHandler mSessionHandler;
  
  public LocalyticsSession(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public LocalyticsSession(Context paramContext, String paramString)
  {
    this(paramContext, paramString, null);
  }
  
  LocalyticsSession(Context paramContext, String paramString1, String paramString2)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context cannot be null");
    }
    Object localObject = paramString1;
    paramString1 = (String)localObject;
    if (TextUtils.isEmpty((CharSequence)localObject)) {
      paramString1 = DatapointHelper.getLocalyticsAppKeyOrNull(paramContext);
    }
    if (TextUtils.isEmpty(paramString1)) {
      throw new IllegalArgumentException("key cannot be null or empty");
    }
    if (("com.localytics.android".equals(paramContext.getPackageName())) && (!paramContext.getClass().getName().equals("android.test.IsolatedContext")) && (!paramContext.getClass().getName().equals("android.test.RenamingDelegatingContext"))) {
      throw new IllegalArgumentException(String.format("context.getPackageName() returned %s", new Object[] { paramContext.getPackageName() }));
    }
    localObject = paramContext;
    if (!paramContext.getClass().getName().equals("android.test.RenamingDelegatingContext"))
    {
      localObject = paramContext;
      if (Constants.CURRENT_API_LEVEL >= 8) {
        localObject = paramContext.getApplicationContext();
      }
    }
    mContext = ((Context)localObject);
    synchronized (sLocalyticsSessionIntrinsicLock)
    {
      localObject = (SessionHandler)sLocalyticsSessionHandlerMap.get(paramString1);
      paramContext = (Context)localObject;
      if (localObject == null)
      {
        paramContext = createSessionHandler(mContext, paramString1, sSessionHandlerThread.getLooper());
        sLocalyticsSessionHandlerMap.put(paramString1, paramContext);
      }
      paramContext.sendMessage(paramContext.obtainMessage(0, paramString2));
      mSessionHandler = paramContext;
      return;
    }
  }
  
  private static Map<String, String> convertDimensionsToAttributes(List<String> paramList)
  {
    TreeMap localTreeMap = new TreeMap();
    if (paramList != null)
    {
      int i = 0;
      paramList = paramList.iterator();
      if (paramList.hasNext())
      {
        String str = (String)paramList.next();
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
  
  private static HandlerThread getHandlerThread(String paramString)
  {
    paramString = new HandlerThread(paramString, 10);
    paramString.start();
    return paramString;
  }
  
  public void close()
  {
    close(null);
  }
  
  public void close(List<String> paramList)
  {
    if (paramList != null)
    {
      if ((paramList.isEmpty()) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", "customDimensions is empty.  Did the caller make an error?");
      }
      if ((paramList.size() > 10) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", String.format("customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?", new Object[] { Integer.valueOf(paramList.size()), Integer.valueOf(10) }));
      }
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        if (str == null) {
          throw new IllegalArgumentException("customDimensions cannot contain null elements");
        }
        if (str.length() == 0) {
          throw new IllegalArgumentException("customDimensions cannot contain empty elements");
        }
      }
    }
    if ((paramList == null) || (paramList.isEmpty()))
    {
      mSessionHandler.sendEmptyMessage(2);
      return;
    }
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(2, new TreeMap(convertDimensionsToAttributes(paramList))));
  }
  
  /* Error */
  protected SessionHandler createSessionHandler(Context paramContext, String paramString, android.os.Looper paramLooper)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: aconst_null
    //   4: astore 4
    //   6: ldc_w 261
    //   9: iconst_3
    //   10: anewarray 24	java/lang/Class
    //   13: dup
    //   14: iconst_0
    //   15: ldc 77
    //   17: aastore
    //   18: dup
    //   19: iconst_1
    //   20: ldc 82
    //   22: aastore
    //   23: dup
    //   24: iconst_2
    //   25: ldc_w 263
    //   28: aastore
    //   29: iconst_3
    //   30: anewarray 4	java/lang/Object
    //   33: dup
    //   34: iconst_0
    //   35: aload_1
    //   36: aastore
    //   37: dup
    //   38: iconst_1
    //   39: aload_2
    //   40: aastore
    //   41: dup
    //   42: iconst_2
    //   43: aload_3
    //   44: aastore
    //   45: invokestatic 269	com/localytics/android/ReflectionUtils:tryInvokeConstructor	(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    //   48: checkcast 22	com/localytics/android/SessionHandler
    //   51: astore 6
    //   53: aload 6
    //   55: ifnonnull +34 -> 89
    //   58: aload 6
    //   60: astore 4
    //   62: aload 6
    //   64: astore 5
    //   66: new 259	java/lang/Exception
    //   69: dup
    //   70: invokespecial 270	java/lang/Exception:<init>	()V
    //   73: athrow
    //   74: astore 5
    //   76: new 22	com/localytics/android/SessionHandler
    //   79: dup
    //   80: aload_1
    //   81: aload_2
    //   82: aload_3
    //   83: invokespecial 273	com/localytics/android/SessionHandler:<init>	(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V
    //   86: astore_1
    //   87: aload_1
    //   88: areturn
    //   89: aload 6
    //   91: areturn
    //   92: astore_1
    //   93: aload 5
    //   95: areturn
    //   96: astore_1
    //   97: aload 4
    //   99: astore 5
    //   101: goto -8 -> 93
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	104	0	this	LocalyticsSession
    //   0	104	1	paramContext	Context
    //   0	104	2	paramString	String
    //   0	104	3	paramLooper	android.os.Looper
    //   4	94	4	localObject1	Object
    //   1	64	5	localObject2	Object
    //   74	20	5	localException	Exception
    //   99	1	5	localObject3	Object
    //   51	39	6	localSessionHandler	SessionHandler
    // Exception table:
    //   from	to	target	type
    //   6	53	74	java/lang/Exception
    //   66	74	74	java/lang/Exception
    //   6	53	92	finally
    //   66	74	92	finally
    //   76	87	96	finally
  }
  
  SessionHandler getSessionHandler()
  {
    return mSessionHandler;
  }
  
  public void handleNotificationReceived(Intent paramIntent)
  {
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(21, paramIntent));
  }
  
  public void handleRegistration(Intent paramIntent)
  {
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(20, paramIntent));
  }
  
  public void open()
  {
    open(null);
  }
  
  public void open(List<String> paramList)
  {
    if (paramList != null)
    {
      if ((paramList.isEmpty()) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", "customDimensions is empty.  Did the caller make an error?");
      }
      if ((paramList.size() > 10) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", String.format("customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?", new Object[] { Integer.valueOf(paramList.size()), Integer.valueOf(10) }));
      }
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        if (str == null) {
          throw new IllegalArgumentException("customDimensions cannot contain null elements");
        }
        if (str.length() == 0) {
          throw new IllegalArgumentException("customDimensions cannot contain empty elements");
        }
      }
    }
    if ((paramList == null) || (paramList.isEmpty()))
    {
      mSessionHandler.sendEmptyMessage(1);
      return;
    }
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(1, new TreeMap(convertDimensionsToAttributes(paramList))));
  }
  
  public void tagEvent(String paramString, Map<String, String> paramMap, List<String> paramList)
  {
    tagEvent(paramString, paramMap, paramList, 0L);
  }
  
  public void tagEvent(String paramString, Map<String, String> paramMap, List<String> paramList, long paramLong)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("event cannot be null");
    }
    if (paramString.length() == 0) {
      throw new IllegalArgumentException("event cannot be empty");
    }
    Object localObject2;
    String str;
    if (paramMap != null)
    {
      if ((paramMap.isEmpty()) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", "attributes is empty.  Did the caller make an error?");
      }
      if ((paramMap.size() > 50) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", String.format("attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?", new Object[] { Integer.valueOf(paramMap.size()), Integer.valueOf(50) }));
      }
      localObject1 = paramMap.entrySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Map.Entry)((Iterator)localObject1).next();
        str = (String)((Map.Entry)localObject2).getKey();
        localObject2 = (String)((Map.Entry)localObject2).getValue();
        if (str == null) {
          throw new IllegalArgumentException("attributes cannot contain null keys");
        }
        if (localObject2 == null) {
          throw new IllegalArgumentException("attributes cannot contain null values");
        }
        if (str.length() == 0) {
          throw new IllegalArgumentException("attributes cannot contain empty keys");
        }
        if (((String)localObject2).length() == 0) {
          throw new IllegalArgumentException("attributes cannot contain empty values");
        }
      }
    }
    if (paramList != null)
    {
      if ((paramList.isEmpty()) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", "customDimensions is empty.  Did the caller make an error?");
      }
      if ((paramList.size() > 10) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", String.format("customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?", new Object[] { Integer.valueOf(paramList.size()), Integer.valueOf(10) }));
      }
      localObject1 = paramList.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        str = (String)((Iterator)localObject1).next();
        if (str == null) {
          throw new IllegalArgumentException("customDimensions cannot contain null elements");
        }
        if (str.length() == 0) {
          throw new IllegalArgumentException("customDimensions cannot contain empty elements");
        }
      }
    }
    paramString = String.format("%s:%s", new Object[] { mContext.getPackageName(), paramString });
    if ((paramMap == null) && (paramList == null))
    {
      mSessionHandler.sendMessage(mSessionHandler.obtainMessage(3, new Object[] { paramString, null, Long.valueOf(paramLong) }));
      return;
    }
    Object localObject1 = new TreeMap();
    if (paramMap != null)
    {
      str = mContext.getPackageName();
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext())
      {
        localObject2 = (Map.Entry)paramMap.next();
        ((TreeMap)localObject1).put(String.format("%s:%s", new Object[] { str, ((Map.Entry)localObject2).getKey() }), ((Map.Entry)localObject2).getValue());
      }
    }
    if (paramList != null) {
      ((TreeMap)localObject1).putAll(convertDimensionsToAttributes(paramList));
    }
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(3, new Object[] { paramString, new TreeMap((SortedMap)localObject1), Long.valueOf(paramLong) }));
  }
  
  public void upload()
  {
    uploadAnalytics();
    uploadProfile();
  }
  
  protected void uploadAnalytics()
  {
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(4, null));
  }
  
  protected void uploadProfile()
  {
    mSessionHandler.sendMessage(mSessionHandler.obtainMessage(17, null));
  }
  
  static enum ProfileDbAction
  {
    SET_ATTRIBUTE;
    
    private ProfileDbAction() {}
  }
}
