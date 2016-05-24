package com.facebook;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import com.facebook.internal.AttributionIdentifiers;
import com.facebook.internal.Utility;
import com.facebook.internal.Utility.FetchedAppSettings;
import com.facebook.model.GraphObject;
import com.facebook.model.GraphObject.Factory;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONException;
import org.json.JSONObject;

public final class Settings
{
  private static final Uri ATTRIBUTION_ID_CONTENT_URI;
  private static final ThreadFactory DEFAULT_THREAD_FACTORY = new ThreadFactory()
  {
    private final AtomicInteger counter = new AtomicInteger(0);
    
    public Thread newThread(Runnable paramAnonymousRunnable)
    {
      return new Thread(paramAnonymousRunnable, "FacebookSdk #" + counter.incrementAndGet());
    }
  };
  private static final BlockingQueue<Runnable> DEFAULT_WORK_QUEUE;
  private static final Object LOCK;
  private static final String TAG = Settings.class.getCanonicalName();
  private static volatile String appClientToken;
  private static volatile String appVersion;
  private static volatile String applicationId;
  private static volatile boolean defaultsLoaded;
  private static volatile Executor executor;
  private static volatile String facebookDomain;
  private static volatile boolean isLoggingEnabled;
  private static final HashSet<LoggingBehavior> loggingBehaviors = new HashSet(Arrays.asList(new LoggingBehavior[] { LoggingBehavior.DEVELOPER_ERRORS }));
  private static AtomicLong onProgressThreshold;
  private static volatile boolean platformCompatibilityEnabled;
  private static Boolean sdkInitialized = Boolean.valueOf(false);
  private static volatile boolean shouldAutoPublishInstall;
  
  static
  {
    defaultsLoaded = false;
    facebookDomain = "facebook.com";
    onProgressThreshold = new AtomicLong(65536L);
    isLoggingEnabled = true;
    LOCK = new Object();
    ATTRIBUTION_ID_CONTENT_URI = Uri.parse("content://com.facebook.katana.provider.AttributionIdProvider");
    DEFAULT_WORK_QUEUE = new LinkedBlockingQueue(10);
  }
  
  public Settings() {}
  
  public static String getAppVersion()
  {
    return appVersion;
  }
  
  public static String getApplicationId()
  {
    return applicationId;
  }
  
  private static Executor getAsyncTaskExecutor()
  {
    try
    {
      Object localObject = AsyncTask.class.getField("THREAD_POOL_EXECUTOR");
      if ((localIllegalAccessException instanceof Executor)) {
        break label35;
      }
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      try
      {
        localObject = ((Field)localObject).get(null);
        if (localObject != null) {
          break label26;
        }
        return null;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        return null;
      }
      localNoSuchFieldException = localNoSuchFieldException;
      return null;
    }
    label26:
    return null;
    label35:
    return (Executor)localIllegalAccessException;
  }
  
  public static String getClientToken()
  {
    return appClientToken;
  }
  
  public static Executor getExecutor()
  {
    synchronized (LOCK)
    {
      if (executor == null)
      {
        Executor localExecutor = getAsyncTaskExecutor();
        Object localObject1 = localExecutor;
        if (localExecutor == null) {
          localObject1 = new ThreadPoolExecutor(5, 128, 1L, TimeUnit.SECONDS, DEFAULT_WORK_QUEUE, DEFAULT_THREAD_FACTORY);
        }
        executor = (Executor)localObject1;
      }
      return executor;
    }
  }
  
  public static String getFacebookDomain()
  {
    return facebookDomain;
  }
  
  public static boolean getLimitEventAndDataUsage(Context paramContext)
  {
    return paramContext.getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).getBoolean("limitEventUsage", false);
  }
  
  public static long getOnProgressThreshold()
  {
    return onProgressThreshold.get();
  }
  
  public static boolean getPlatformCompatibilityEnabled()
  {
    return platformCompatibilityEnabled;
  }
  
  @Deprecated
  public static boolean getShouldAutoPublishInstall()
  {
    return shouldAutoPublishInstall;
  }
  
  public static final boolean isLoggingBehaviorEnabled(LoggingBehavior paramLoggingBehavior)
  {
    for (;;)
    {
      synchronized (loggingBehaviors)
      {
        if ((isLoggingEnabled()) && (loggingBehaviors.contains(paramLoggingBehavior)))
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public static final boolean isLoggingEnabled()
  {
    return isLoggingEnabled;
  }
  
  public static void loadDefaultsFromMetadata(Context paramContext)
  {
    defaultsLoaded = true;
    if (paramContext == null) {}
    for (;;)
    {
      return;
      try
      {
        paramContext = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128);
        if ((paramContext != null) && (metaData != null))
        {
          if (applicationId == null) {
            applicationId = metaData.getString("com.facebook.sdk.ApplicationId");
          }
          if (appClientToken == null)
          {
            appClientToken = metaData.getString("com.facebook.sdk.ClientToken");
            return;
          }
        }
      }
      catch (PackageManager.NameNotFoundException paramContext) {}
    }
  }
  
  static Response publishInstallAndWaitForResponse(Context paramContext, String paramString, boolean paramBoolean)
  {
    if ((paramContext == null) || (paramString == null)) {
      try
      {
        throw new IllegalArgumentException("Both context and applicationId must be non-null");
      }
      catch (Exception paramContext)
      {
        Utility.logd("Facebook-publish", paramContext);
        return new Response(null, null, new FacebookRequestError(null, paramContext));
      }
    }
    AttributionIdentifiers localAttributionIdentifiers = AttributionIdentifiers.getAttributionIdentifiers(paramContext);
    SharedPreferences localSharedPreferences = paramContext.getSharedPreferences("com.facebook.sdk.attributionTracking", 0);
    String str1 = paramString + "ping";
    String str2 = paramString + "json";
    long l = localSharedPreferences.getLong(str1, 0L);
    String str3 = localSharedPreferences.getString(str2, null);
    if (!paramBoolean) {
      setShouldAutoPublishInstall(false);
    }
    Object localObject = GraphObject.Factory.create();
    ((GraphObject)localObject).setProperty("event", "MOBILE_APP_INSTALL");
    Utility.setAppEventAttributionParameters((GraphObject)localObject, localAttributionIdentifiers, Utility.getHashedDeviceAndAppID(paramContext, paramString), getLimitEventAndDataUsage(paramContext));
    ((GraphObject)localObject).setProperty("auto_publish", Boolean.valueOf(paramBoolean));
    ((GraphObject)localObject).setProperty("application_package_name", paramContext.getPackageName());
    localObject = Request.newPostRequest(null, String.format("%s/activities", new Object[] { paramString }), (GraphObject)localObject, null);
    if (l != 0L)
    {
      paramString = null;
      paramContext = paramString;
      if (str3 == null) {}
    }
    try
    {
      paramContext = GraphObject.Factory.create(new JSONObject(str3));
      if (paramContext == null) {
        return (Response)Response.createResponsesFromString("true", null, new RequestBatch(new Request[] { localObject }), true).get(0);
      }
      return new Response(null, null, null, paramContext, true);
      if ((localAttributionIdentifiers == null) || ((localAttributionIdentifiers.getAndroidAdvertiserId() == null) && (localAttributionIdentifiers.getAttributionId() == null))) {
        throw new FacebookException("No attribution id available to send to server.");
      }
      if (!Utility.queryAppSettings(paramString, false).supportsAttribution()) {
        throw new FacebookException("Install attribution has been disabled on the server.");
      }
      paramContext = ((Request)localObject).executeAndWait();
      paramString = localSharedPreferences.edit();
      paramString.putLong(str1, System.currentTimeMillis());
      if ((paramContext.getGraphObject() != null) && (paramContext.getGraphObject().getInnerJSONObject() != null)) {
        paramString.putString(str2, paramContext.getGraphObject().getInnerJSONObject().toString());
      }
      paramString.commit();
      return paramContext;
    }
    catch (JSONException paramContext)
    {
      for (;;)
      {
        paramContext = paramString;
      }
    }
  }
  
  @Deprecated
  public static void setShouldAutoPublishInstall(boolean paramBoolean)
  {
    shouldAutoPublishInstall = paramBoolean;
  }
}
