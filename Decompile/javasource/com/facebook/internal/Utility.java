package com.facebook.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import com.facebook.FacebookException;
import com.facebook.Request;
import com.facebook.Response;
import com.facebook.Settings;
import com.facebook.model.GraphObject;
import java.io.Closeable;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public final class Utility
{
  private static final String[] APP_SETTING_FIELDS = { "supports_attribution", "supports_implicit_sdk_logging", "gdpv4_nux_content", "gdpv4_nux_enabled" };
  private static Map<String, FetchedAppSettings> fetchedAppSettings = new ConcurrentHashMap();
  
  public static <T> boolean areObjectsEqual(T paramT1, T paramT2)
  {
    if (paramT1 == null) {
      return paramT2 == null;
    }
    return paramT1.equals(paramT2);
  }
  
  public static <T> List<T> asListNoNulls(T... paramVarArgs)
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return localArrayList;
      }
      T ? = paramVarArgs[i];
      if (? != null) {
        localArrayList.add(?);
      }
      i += 1;
    }
  }
  
  public static Uri buildUri(String paramString1, String paramString2, Bundle paramBundle)
  {
    Uri.Builder localBuilder = new Uri.Builder();
    localBuilder.scheme("https");
    localBuilder.authority(paramString1);
    localBuilder.path(paramString2);
    paramString1 = paramBundle.keySet().iterator();
    for (;;)
    {
      if (!paramString1.hasNext()) {
        return localBuilder.build();
      }
      paramString2 = (String)paramString1.next();
      Object localObject = paramBundle.get(paramString2);
      if ((localObject instanceof String)) {
        localBuilder.appendQueryParameter(paramString2, (String)localObject);
      }
    }
  }
  
  public static void clearCaches(Context paramContext)
  {
    ImageDownloader.clearCache(paramContext);
  }
  
  private static void clearCookiesForDomain(Context paramContext, String paramString)
  {
    CookieSyncManager.createInstance(paramContext).sync();
    paramContext = CookieManager.getInstance();
    Object localObject = paramContext.getCookie(paramString);
    if (localObject == null) {
      return;
    }
    localObject = ((String)localObject).split(";");
    int j = localObject.length;
    int i = 0;
    for (;;)
    {
      if (i >= j)
      {
        paramContext.removeExpiredCookie();
        return;
      }
      String[] arrayOfString = localObject[i].split("=");
      if (arrayOfString.length > 0) {
        paramContext.setCookie(paramString, arrayOfString[0].trim() + "=;expires=Sat, 1 Jan 2000 00:00:01 UTC;");
      }
      i += 1;
    }
  }
  
  public static void clearFacebookCookies(Context paramContext)
  {
    clearCookiesForDomain(paramContext, "facebook.com");
    clearCookiesForDomain(paramContext, ".facebook.com");
    clearCookiesForDomain(paramContext, "https://facebook.com");
    clearCookiesForDomain(paramContext, "https://.facebook.com");
  }
  
  public static void closeQuietly(Closeable paramCloseable)
  {
    if (paramCloseable != null) {}
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException paramCloseable) {}
  }
  
  public static void disconnectQuietly(URLConnection paramURLConnection)
  {
    if ((paramURLConnection instanceof HttpURLConnection)) {
      ((HttpURLConnection)paramURLConnection).disconnect();
    }
  }
  
  public static String getActivityName(Context paramContext)
  {
    if (paramContext == null) {
      return "null";
    }
    if (paramContext == paramContext.getApplicationContext()) {
      return "unknown";
    }
    return paramContext.getClass().getSimpleName();
  }
  
  public static String getHashedDeviceAndAppID(Context paramContext, String paramString)
  {
    paramContext = Settings.Secure.getString(paramContext.getContentResolver(), "android_id");
    if (paramContext == null) {
      return null;
    }
    return sha1hash(paramContext + paramString);
  }
  
  public static String getMetadataApplicationId(Context paramContext)
  {
    Validate.notNull(paramContext, "context");
    Settings.loadDefaultsFromMetadata(paramContext);
    return Settings.getApplicationId();
  }
  
  public static Method getMethodQuietly(Class<?> paramClass, String paramString, Class<?>... paramVarArgs)
  {
    try
    {
      paramClass = paramClass.getMethod(paramString, paramVarArgs);
      return paramClass;
    }
    catch (NoSuchMethodException paramClass) {}
    return null;
  }
  
  public static Method getMethodQuietly(String paramString1, String paramString2, Class<?>... paramVarArgs)
  {
    try
    {
      paramString1 = getMethodQuietly(Class.forName(paramString1), paramString2, paramVarArgs);
      return paramString1;
    }
    catch (ClassNotFoundException paramString1) {}
    return null;
  }
  
  public static Object getStringPropertyAsJSON(JSONObject paramJSONObject, String paramString1, String paramString2)
    throws JSONException
  {
    paramString1 = paramJSONObject.opt(paramString1);
    paramJSONObject = paramString1;
    if (paramString1 != null)
    {
      paramJSONObject = paramString1;
      if ((paramString1 instanceof String)) {
        paramJSONObject = new JSONTokener((String)paramString1).nextValue();
      }
    }
    if ((paramJSONObject != null) && (!(paramJSONObject instanceof JSONObject)) && (!(paramJSONObject instanceof JSONArray)))
    {
      if (paramString2 != null)
      {
        paramString1 = new JSONObject();
        paramString1.putOpt(paramString2, paramJSONObject);
        return paramString1;
      }
      throw new FacebookException("Got an unexpected non-JSON object.");
    }
    return paramJSONObject;
  }
  
  private static String hashBytes(MessageDigest paramMessageDigest, byte[] paramArrayOfByte)
  {
    paramMessageDigest.update(paramArrayOfByte);
    paramMessageDigest = paramMessageDigest.digest();
    paramArrayOfByte = new StringBuilder();
    int j = paramMessageDigest.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return paramArrayOfByte.toString();
      }
      int k = paramMessageDigest[i];
      paramArrayOfByte.append(Integer.toHexString(k >> 4 & 0xF));
      paramArrayOfByte.append(Integer.toHexString(k >> 0 & 0xF));
      i += 1;
    }
  }
  
  private static String hashWithAlgorithm(String paramString1, String paramString2)
  {
    return hashWithAlgorithm(paramString1, paramString2.getBytes());
  }
  
  private static String hashWithAlgorithm(String paramString, byte[] paramArrayOfByte)
  {
    try
    {
      paramString = MessageDigest.getInstance(paramString);
      return hashBytes(paramString, paramArrayOfByte);
    }
    catch (NoSuchAlgorithmException paramString) {}
    return null;
  }
  
  public static Object invokeMethodQuietly(Object paramObject, Method paramMethod, Object... paramVarArgs)
  {
    try
    {
      paramObject = paramMethod.invoke(paramObject, paramVarArgs);
      return paramObject;
    }
    catch (IllegalAccessException paramObject)
    {
      return null;
    }
    catch (InvocationTargetException paramObject) {}
    return null;
  }
  
  public static boolean isNullOrEmpty(String paramString)
  {
    return (paramString == null) || (paramString.length() == 0);
  }
  
  public static <T> boolean isNullOrEmpty(Collection<T> paramCollection)
  {
    return (paramCollection == null) || (paramCollection.size() == 0);
  }
  
  public static <T> boolean isSubset(Collection<T> paramCollection1, Collection<T> paramCollection2)
  {
    if ((paramCollection2 == null) || (paramCollection2.size() == 0)) {
      return (paramCollection1 == null) || (paramCollection1.size() == 0);
    }
    paramCollection2 = new HashSet(paramCollection2);
    paramCollection1 = paramCollection1.iterator();
    do
    {
      if (!paramCollection1.hasNext()) {
        return true;
      }
    } while (paramCollection2.contains((Object)paramCollection1.next()));
    return false;
  }
  
  public static void logd(String paramString, Exception paramException)
  {
    if ((Settings.isLoggingEnabled()) && (paramString != null) && (paramException != null)) {
      Log.d(paramString, paramException.getClass().getSimpleName() + ": " + paramException.getMessage());
    }
  }
  
  public static void logd(String paramString1, String paramString2)
  {
    if ((Settings.isLoggingEnabled()) && (paramString1 != null) && (paramString2 != null)) {
      Log.d(paramString1, paramString2);
    }
  }
  
  static String md5hash(String paramString)
  {
    return hashWithAlgorithm("MD5", paramString);
  }
  
  public static FetchedAppSettings queryAppSettings(String paramString, boolean paramBoolean)
  {
    if ((!paramBoolean) && (fetchedAppSettings.containsKey(paramString))) {
      return (FetchedAppSettings)fetchedAppSettings.get(paramString);
    }
    Object localObject = new Bundle();
    ((Bundle)localObject).putString("fields", TextUtils.join(",", APP_SETTING_FIELDS));
    Request localRequest = Request.newGraphPathRequest(null, paramString, null);
    localRequest.setParameters((Bundle)localObject);
    localObject = localRequest.executeAndWait().getGraphObject();
    localObject = new FetchedAppSettings(safeGetBooleanFromResponse((GraphObject)localObject, "supports_attribution"), safeGetBooleanFromResponse((GraphObject)localObject, "supports_implicit_sdk_logging"), safeGetStringFromResponse((GraphObject)localObject, "gdpv4_nux_content"), safeGetBooleanFromResponse((GraphObject)localObject, "gdpv4_nux_enabled"), null);
    fetchedAppSettings.put(paramString, localObject);
    return localObject;
  }
  
  /* Error */
  public static String readStreamToString(java.io.InputStream paramInputStream)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_3
    //   4: new 453	java/io/BufferedInputStream
    //   7: dup
    //   8: aload_0
    //   9: invokespecial 456	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   12: astore_0
    //   13: new 458	java/io/InputStreamReader
    //   16: dup
    //   17: aload_0
    //   18: invokespecial 459	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   21: astore_2
    //   22: new 143	java/lang/StringBuilder
    //   25: dup
    //   26: invokespecial 309	java/lang/StringBuilder:<init>	()V
    //   29: astore_3
    //   30: sipush 2048
    //   33: newarray char
    //   35: astore 4
    //   37: aload_2
    //   38: aload 4
    //   40: invokevirtual 463	java/io/InputStreamReader:read	([C)I
    //   43: istore_1
    //   44: iload_1
    //   45: iconst_m1
    //   46: if_icmpne +18 -> 64
    //   49: aload_3
    //   50: invokevirtual 163	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   53: astore_3
    //   54: aload_0
    //   55: invokestatic 465	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   58: aload_2
    //   59: invokestatic 465	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   62: aload_3
    //   63: areturn
    //   64: aload_3
    //   65: aload 4
    //   67: iconst_0
    //   68: iload_1
    //   69: invokevirtual 468	java/lang/StringBuilder:append	([CII)Ljava/lang/StringBuilder;
    //   72: pop
    //   73: goto -36 -> 37
    //   76: astore 4
    //   78: aload_2
    //   79: astore_3
    //   80: aload 4
    //   82: astore_2
    //   83: aload_0
    //   84: invokestatic 465	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   87: aload_3
    //   88: invokestatic 465	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   91: aload_2
    //   92: athrow
    //   93: astore 4
    //   95: aload_2
    //   96: astore_0
    //   97: aload 4
    //   99: astore_2
    //   100: goto -17 -> 83
    //   103: astore_2
    //   104: goto -21 -> 83
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	107	0	paramInputStream	java.io.InputStream
    //   43	26	1	i	int
    //   1	99	2	localObject1	Object
    //   103	1	2	localObject2	Object
    //   3	85	3	localObject3	Object
    //   35	31	4	arrayOfChar	char[]
    //   76	5	4	localObject4	Object
    //   93	5	4	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   22	37	76	finally
    //   37	44	76	finally
    //   49	54	76	finally
    //   64	73	76	finally
    //   4	13	93	finally
    //   13	22	103	finally
  }
  
  private static boolean safeGetBooleanFromResponse(GraphObject paramGraphObject, String paramString)
  {
    Object localObject = Boolean.valueOf(false);
    if (paramGraphObject != null) {
      localObject = paramGraphObject.getProperty(paramString);
    }
    if (!(localObject instanceof Boolean)) {}
    for (paramGraphObject = Boolean.valueOf(false);; paramGraphObject = (GraphObject)localObject) {
      return ((Boolean)paramGraphObject).booleanValue();
    }
  }
  
  private static String safeGetStringFromResponse(GraphObject paramGraphObject, String paramString)
  {
    Object localObject = "";
    if (paramGraphObject != null) {
      localObject = paramGraphObject.getProperty(paramString);
    }
    if (!(localObject instanceof String)) {}
    for (paramGraphObject = "";; paramGraphObject = (GraphObject)localObject) {
      return (String)paramGraphObject;
    }
  }
  
  public static void setAppEventAttributionParameters(GraphObject paramGraphObject, AttributionIdentifiers paramAttributionIdentifiers, String paramString, boolean paramBoolean)
  {
    boolean bool2 = false;
    if ((paramAttributionIdentifiers != null) && (paramAttributionIdentifiers.getAttributionId() != null)) {
      paramGraphObject.setProperty("attribution", paramAttributionIdentifiers.getAttributionId());
    }
    boolean bool1;
    if ((paramAttributionIdentifiers != null) && (paramAttributionIdentifiers.getAndroidAdvertiserId() != null))
    {
      paramGraphObject.setProperty("advertiser_id", paramAttributionIdentifiers.getAndroidAdvertiserId());
      if (paramAttributionIdentifiers.isTrackingLimited())
      {
        bool1 = false;
        paramGraphObject.setProperty("advertiser_tracking_enabled", Boolean.valueOf(bool1));
        label75:
        if (!paramBoolean) {
          break label119;
        }
      }
    }
    label119:
    for (paramBoolean = bool2;; paramBoolean = true)
    {
      paramGraphObject.setProperty("application_tracking_enabled", Boolean.valueOf(paramBoolean));
      return;
      bool1 = true;
      break;
      if (paramString == null) {
        break label75;
      }
      paramGraphObject.setProperty("advertiser_id", paramString);
      break label75;
    }
  }
  
  public static void setAppEventExtendedDeviceInfoParameters(GraphObject paramGraphObject, Context paramContext)
  {
    JSONArray localJSONArray = new JSONArray();
    localJSONArray.put("a1");
    String str2 = paramContext.getPackageName();
    int j = -1;
    str1 = "";
    int i = j;
    try
    {
      paramContext = paramContext.getPackageManager().getPackageInfo(str2, 0);
      i = j;
      j = versionCode;
      i = j;
      paramContext = versionName;
      i = j;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      for (;;)
      {
        paramContext = str1;
      }
    }
    localJSONArray.put(str2);
    localJSONArray.put(i);
    localJSONArray.put(paramContext);
    paramGraphObject.setProperty("extinfo", localJSONArray.toString());
  }
  
  static String sha1hash(String paramString)
  {
    return hashWithAlgorithm("SHA-1", paramString);
  }
  
  static String sha1hash(byte[] paramArrayOfByte)
  {
    return hashWithAlgorithm("SHA-1", paramArrayOfByte);
  }
  
  public static <T> Collection<T> unmodifiableCollection(T... paramVarArgs)
  {
    return Collections.unmodifiableCollection(Arrays.asList(paramVarArgs));
  }
  
  public static class FetchedAppSettings
  {
    private String nuxContent;
    private boolean nuxEnabled;
    private boolean supportsAttribution;
    private boolean supportsImplicitLogging;
    
    private FetchedAppSettings(boolean paramBoolean1, boolean paramBoolean2, String paramString, boolean paramBoolean3)
    {
      supportsAttribution = paramBoolean1;
      supportsImplicitLogging = paramBoolean2;
      nuxContent = paramString;
      nuxEnabled = paramBoolean3;
    }
    
    public boolean supportsAttribution()
    {
      return supportsAttribution;
    }
    
    public boolean supportsImplicitLogging()
    {
      return supportsImplicitLogging;
    }
  }
}
