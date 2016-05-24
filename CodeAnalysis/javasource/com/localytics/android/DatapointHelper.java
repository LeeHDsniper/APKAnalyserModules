package com.localytics.android;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

final class DatapointHelper
{
  private static final Object[] HARDWARE_TELEPHONY = { "android.hardware.telephony" };
  private static final Object[] HARDWARE_WIFI;
  private static final Class<?>[] STRING_CLASS_ARRAY = { String.class };
  
  static
  {
    HARDWARE_WIFI = new Object[] { "android.hardware.wifi" };
  }
  
  public static String getAdvertisingIdOrNull(Context paramContext)
  {
    Object localObject1 = null;
    try
    {
      Object localObject2 = ReflectionUtils.tryInvokeStatic("com.google.android.gms.ads.identifier.AdvertisingIdClient", "getAdvertisingIdInfo", new Class[] { Context.class }, new Object[] { paramContext });
      paramContext = localObject1;
      if (localObject2 != null) {
        paramContext = (String)ReflectionUtils.tryInvokeInstance(localObject2, "getId", null, null);
      }
    }
    catch (Exception localException)
    {
      do
      {
        paramContext = localObject1;
      } while (!Constants.IS_LOGGABLE);
      Log.w("Localytics", "Localytics library can't get the advertising id", localException);
    }
    return paramContext;
    return null;
  }
  
  public static String getAndroidIdHashOrNull(Context paramContext)
  {
    paramContext = getAndroidIdOrNull(paramContext);
    if (paramContext == null) {
      return null;
    }
    return getSha256_buggy(paramContext);
  }
  
  /* Error */
  public static String getAndroidIdOrNull(Context paramContext)
  {
    // Byte code:
    //   0: new 79	java/io/File
    //   3: dup
    //   4: new 81	java/lang/StringBuilder
    //   7: dup
    //   8: invokespecial 84	java/lang/StringBuilder:<init>	()V
    //   11: aload_0
    //   12: invokevirtual 88	android/content/Context:getFilesDir	()Ljava/io/File;
    //   15: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   18: ldc 94
    //   20: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   23: invokevirtual 101	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   26: invokespecial 104	java/io/File:<init>	(Ljava/lang/String;)V
    //   29: astore 5
    //   31: aload 5
    //   33: invokevirtual 108	java/io/File:exists	()Z
    //   36: ifeq +106 -> 142
    //   39: aload 5
    //   41: invokevirtual 112	java/io/File:length	()J
    //   44: lconst_0
    //   45: lcmp
    //   46: ifle +96 -> 142
    //   49: aconst_null
    //   50: astore_2
    //   51: aconst_null
    //   52: astore_3
    //   53: aload_2
    //   54: astore_1
    //   55: bipush 100
    //   57: newarray char
    //   59: astore 4
    //   61: aload_2
    //   62: astore_1
    //   63: new 114	java/io/BufferedReader
    //   66: dup
    //   67: new 116	java/io/FileReader
    //   70: dup
    //   71: aload 5
    //   73: invokespecial 119	java/io/FileReader:<init>	(Ljava/io/File;)V
    //   76: sipush 128
    //   79: invokespecial 122	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   82: astore_2
    //   83: aload 4
    //   85: iconst_0
    //   86: aload_2
    //   87: aload 4
    //   89: invokevirtual 126	java/io/BufferedReader:read	([C)I
    //   92: invokestatic 130	java/lang/String:copyValueOf	([CII)Ljava/lang/String;
    //   95: astore_1
    //   96: aload_2
    //   97: invokevirtual 133	java/io/BufferedReader:close	()V
    //   100: aload_2
    //   101: ifnull +7 -> 108
    //   104: aload_2
    //   105: invokevirtual 133	java/io/BufferedReader:close	()V
    //   108: aload_1
    //   109: areturn
    //   110: astore_1
    //   111: aload_3
    //   112: astore_2
    //   113: aload_1
    //   114: astore_3
    //   115: aload_2
    //   116: astore_1
    //   117: getstatic 55	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   120: ifeq +14 -> 134
    //   123: aload_2
    //   124: astore_1
    //   125: ldc 57
    //   127: ldc -121
    //   129: aload_3
    //   130: invokestatic 65	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   133: pop
    //   134: aload_2
    //   135: ifnull +7 -> 142
    //   138: aload_2
    //   139: invokevirtual 133	java/io/BufferedReader:close	()V
    //   142: aload_0
    //   143: invokevirtual 139	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   146: ldc -115
    //   148: invokestatic 147	android/provider/Settings$Secure:getString	(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    //   151: astore_0
    //   152: aload_0
    //   153: ifnull +15 -> 168
    //   156: aload_0
    //   157: invokevirtual 150	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   160: ldc -104
    //   162: invokevirtual 156	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   165: ifeq +35 -> 200
    //   168: aconst_null
    //   169: areturn
    //   170: astore_2
    //   171: aload_1
    //   172: ifnull +7 -> 179
    //   175: aload_1
    //   176: invokevirtual 133	java/io/BufferedReader:close	()V
    //   179: aload_2
    //   180: athrow
    //   181: astore_1
    //   182: getstatic 55	com/localytics/android/Constants:IS_LOGGABLE	Z
    //   185: ifeq -43 -> 142
    //   188: ldc 57
    //   190: ldc -121
    //   192: aload_1
    //   193: invokestatic 65	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   196: pop
    //   197: goto -55 -> 142
    //   200: aload_0
    //   201: areturn
    //   202: astore_1
    //   203: goto -21 -> 182
    //   206: astore_3
    //   207: aload_2
    //   208: astore_1
    //   209: aload_3
    //   210: astore_2
    //   211: goto -40 -> 171
    //   214: astore_3
    //   215: goto -100 -> 115
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	218	0	paramContext	Context
    //   54	55	1	localObject1	Object
    //   110	4	1	localFileNotFoundException1	java.io.FileNotFoundException
    //   116	60	1	localObject2	Object
    //   181	12	1	localIOException1	java.io.IOException
    //   202	1	1	localIOException2	java.io.IOException
    //   208	1	1	localObject3	Object
    //   50	89	2	localObject4	Object
    //   170	38	2	localObject5	Object
    //   210	1	2	localObject6	Object
    //   52	78	3	localObject7	Object
    //   206	4	3	localObject8	Object
    //   214	1	3	localFileNotFoundException2	java.io.FileNotFoundException
    //   59	29	4	arrayOfChar	char[]
    //   29	43	5	localFile	java.io.File
    // Exception table:
    //   from	to	target	type
    //   55	61	110	java/io/FileNotFoundException
    //   63	83	110	java/io/FileNotFoundException
    //   55	61	170	finally
    //   63	83	170	finally
    //   117	123	170	finally
    //   125	134	170	finally
    //   138	142	181	java/io/IOException
    //   175	179	181	java/io/IOException
    //   179	181	181	java/io/IOException
    //   104	108	202	java/io/IOException
    //   83	100	206	finally
    //   83	100	214	java/io/FileNotFoundException
  }
  
  static int getApiLevel()
  {
    try
    {
      i = Integer.parseInt((String)Build.VERSION.class.getField("SDK").get(null));
      return i;
    }
    catch (Exception localException1)
    {
      int i;
      Log.w("Localytics", "Caught exception", localException1);
      try
      {
        i = Build.VERSION.class.getField("SDK_INT").getInt(null);
        return i;
      }
      catch (Exception localException2)
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", "Caught exception", localException2);
        }
      }
    }
    return 3;
  }
  
  public static String getAppVersion(Context paramContext)
  {
    Object localObject = paramContext.getPackageManager();
    try
    {
      localObject = getPackageInfogetPackageName0versionName;
      paramContext = (Context)localObject;
      if (localObject == null)
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", "versionName was null--is a versionName attribute set in the Android Manifest?");
        }
        paramContext = "unknown";
      }
      return paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      throw new RuntimeException(paramContext);
    }
  }
  
  public static String getFBAttribution(Context paramContext)
  {
    localObject4 = null;
    Object localObject5 = null;
    Object localObject2 = paramContext.getContentResolver();
    Object localObject3 = Uri.parse("content://com.facebook.katana.provider.AttributionIdProvider");
    localObject1 = null;
    paramContext = null;
    try
    {
      localObject3 = ((ContentResolver)localObject2).query((Uri)localObject3, new String[] { "aid" }, null, null, null);
      localObject2 = localObject5;
      if (localObject3 != null)
      {
        localObject2 = localObject5;
        paramContext = (Context)localObject3;
        localObject1 = localObject3;
        if (((Cursor)localObject3).moveToFirst())
        {
          paramContext = (Context)localObject3;
          localObject1 = localObject3;
          localObject2 = ((Cursor)localObject3).getString(((Cursor)localObject3).getColumnIndex("aid"));
        }
      }
      localObject1 = localObject2;
      if (localObject3 != null)
      {
        ((Cursor)localObject3).close();
        localObject1 = localObject2;
      }
    }
    catch (Exception localException)
    {
      do
      {
        localObject1 = paramContext;
        if (Constants.IS_LOGGABLE)
        {
          localObject1 = paramContext;
          Log.w("Localytics", "Error reading FB attribution", localException);
        }
        localObject1 = localObject4;
      } while (paramContext == null);
      paramContext.close();
      return null;
    }
    finally
    {
      if (localObject1 == null) {
        break label143;
      }
      ((Cursor)localObject1).close();
    }
    return localObject1;
  }
  
  public static String getLocalyticsAppKeyOrNull(Context paramContext)
  {
    Object localObject1 = null;
    try
    {
      Object localObject2 = getPackageManagergetApplicationInfogetPackageName128metaData.get("LOCALYTICS_APP_KEY");
      paramContext = localObject1;
      if ((localObject2 instanceof String)) {
        paramContext = (String)localObject2;
      }
      return paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      throw new RuntimeException(paramContext);
    }
  }
  
  public static String getLocalyticsRollupKeyOrNull(Context paramContext)
  {
    Object localObject1 = null;
    try
    {
      Object localObject2 = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128);
      paramContext = localObject1;
      if (metaData != null)
      {
        localObject2 = (String)metaData.get("LOCALYTICS_ROLLUP_KEY");
        paramContext = localObject1;
        if ((localObject2 instanceof String)) {
          paramContext = (String)localObject2;
        }
      }
      return paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      throw new RuntimeException(paramContext);
    }
  }
  
  public static String getManufacturer()
  {
    String str2 = "unknown";
    String str1 = str2;
    if (Constants.CURRENT_API_LEVEL > 3) {}
    try
    {
      str1 = (String)Build.class.getField("MANUFACTURER").get(null);
      return str1;
    }
    catch (Exception localException)
    {
      do
      {
        str1 = str2;
      } while (!Constants.IS_LOGGABLE);
      Log.w("Localytics", "Caught exception", localException);
    }
    return "unknown";
  }
  
  public static String getNetworkType(Context paramContext, TelephonyManager paramTelephonyManager)
  {
    try
    {
      if (paramContext.getPackageManager().checkPermission("android.permission.ACCESS_WIFI_STATE", paramContext.getPackageName()) == 0)
      {
        paramContext = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getNetworkInfo(1);
        if ((paramContext != null) && (paramContext.isConnectedOrConnecting())) {
          return "wifi";
        }
      }
      else if (Constants.IS_LOGGABLE)
      {
        Log.w("Localytics", "Application does not have one more more of the following permissions: ACCESS_WIFI_STATE. Determining Wi-Fi connectivity is unavailable");
      }
    }
    catch (SecurityException paramContext)
    {
      for (;;)
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", "Application does not have the permission ACCESS_NETWORK_STATE. Determining Wi-Fi connectivity is unavailable", paramContext);
        }
      }
    }
    return "android_network_type_" + paramTelephonyManager.getNetworkType();
  }
  
  public static String getSerialNumberHashOrNull()
  {
    String str = null;
    if (Constants.CURRENT_API_LEVEL >= 9) {}
    try
    {
      str = (String)Build.class.getField("SERIAL").get(null);
      if (str == null) {
        return null;
      }
    }
    catch (Exception localException)
    {
      throw new RuntimeException(localException);
    }
    return getSha256_buggy(localException);
  }
  
  static String getSha256_buggy(String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("string cannot be null");
    }
    try
    {
      paramString = new BigInteger(1, MessageDigest.getInstance("SHA-256").digest(paramString.getBytes("UTF-8"))).toString(16);
      return paramString;
    }
    catch (NoSuchAlgorithmException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (UnsupportedEncodingException paramString)
    {
      throw new RuntimeException(paramString);
    }
  }
  
  public static String getTelephonyDeviceIdOrNull(Context paramContext)
  {
    if ((Constants.CURRENT_API_LEVEL >= 7) && (!((Boolean)ReflectionUtils.tryInvokeInstance(paramContext.getPackageManager(), "hasSystemFeature", STRING_CLASS_ARRAY, HARDWARE_TELEPHONY)).booleanValue())) {
      if (Constants.IS_LOGGABLE) {
        Log.i("Localytics", "Device does not have telephony; cannot read telephony id");
      }
    }
    do
    {
      return null;
      if (paramContext.getPackageManager().checkPermission("android.permission.READ_PHONE_STATE", paramContext.getPackageName()) == 0) {
        return ((TelephonyManager)paramContext.getSystemService("phone")).getDeviceId();
      }
    } while (!Constants.IS_LOGGABLE);
    Log.w("Localytics", "Application does not have permission READ_PHONE_STATE; determining device id is not possible.  Please consider requesting READ_PHONE_STATE in the AndroidManifest");
    return null;
  }
}
