package com.tencent.mobileqq.utils;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Debug;
import android.os.Debug.MemoryInfo;
import android.os.Environment;
import android.os.StatFs;
import android.provider.Settings.System;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.AppNetConnInfo;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Method;
import slj;

public class DeviceInfoUtil
{
  public static float a = 0.0F;
  public static final int a = 1024;
  private static long jdField_a_of_type_Long = 0L;
  public static final String a = "DeviceInfoUtil";
  private static String[] jdField_a_of_type_ArrayOfJavaLangString;
  public static int b = 0;
  private static long jdField_b_of_type_Long = 0L;
  private static final String jdField_b_of_type_JavaLangString = "top -n 1 -m 10";
  private static int jdField_c_of_type_Int = 0;
  private static long jdField_c_of_type_Long = 0L;
  private static final String jdField_c_of_type_JavaLangString = "top -n 1 -m 10 -t";
  private static int jdField_d_of_type_Int = 0;
  private static long jdField_d_of_type_Long = 0L;
  private static String jdField_d_of_type_JavaLangString;
  private static String e;
  private static String f;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "HTC Sensation XL with Beats Audio X315e", "Dell V04B", "HTC Sensation Z710e", "HTC Sensation XL with Beats", "HTC Sensation(XE)" };
    jdField_d_of_type_JavaLangString = "";
    e = "";
    jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Int = 0;
    jdField_a_of_type_Float = 1.0F;
    jdField_b_of_type_Int = 0;
  }
  
  public DeviceInfoUtil() {}
  
  public static float a()
  {
    a();
    return jdField_a_of_type_Float;
  }
  
  public static int a()
  {
    return Integer.parseInt(Build.VERSION.SDK);
  }
  
  public static int a(Activity paramActivity)
  {
    int i = 0;
    if (paramActivity != null)
    {
      paramActivity = paramActivity.getWindowManager().getDefaultDisplay();
      if (paramActivity.getWidth() == paramActivity.getHeight()) {
        i = 3;
      }
    }
    else
    {
      return i;
    }
    if (paramActivity.getWidth() < paramActivity.getHeight()) {
      return 1;
    }
    return 2;
  }
  
  public static long a()
  {
    if (jdField_c_of_type_Long > 0L) {
      return jdField_c_of_type_Long;
    }
    try
    {
      BufferedReader localBufferedReader = new BufferedReader(new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"), 1024);
      String str = localBufferedReader.readLine();
      if (str != null)
      {
        jdField_c_of_type_Long = Long.parseLong(str);
        jdField_c_of_type_Long /= 1024L;
      }
      localBufferedReader.close();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    return jdField_c_of_type_Long;
  }
  
  public static long a(int paramInt)
  {
    if (Build.VERSION.SDK_INT >= 14) {
      return Debug.getPss() * 1024L;
    }
    try
    {
      BaseApplication localBaseApplication = BaseApplicationImpl.getContext();
      if (localBaseApplication != null)
      {
        paramInt = ((ActivityManager)localBaseApplication.getSystemService("activity")).getProcessMemoryInfo(new int[] { paramInt })[0].getTotalPss();
        return paramInt * 1024L;
      }
      return -1L;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return -1L;
  }
  
  public static DeviceInfoUtil.NetInfo a(Context paramContext)
  {
    paramContext = (TelephonyManager)paramContext.getSystemService("phone");
    NetworkInfo localNetworkInfo = AppNetConnInfo.getRecentNetworkInfo();
    DeviceInfoUtil.NetInfo localNetInfo = new DeviceInfoUtil.NetInfo();
    c = paramContext.getNetworkOperatorName();
    if ((localNetworkInfo != null) && (localNetworkInfo.isAvailable())) {}
    switch (localNetworkInfo.getType())
    {
    case 7: 
    case 8: 
    default: 
      a = "unknown";
      b = "unknown";
      return localNetInfo;
    case 9: 
      a = "cable";
      return localNetInfo;
    case 1: 
    case 6: 
      a = "WIFI";
      return localNetInfo;
    }
    switch (paramContext.getNetworkType())
    {
    default: 
      a = "2G";
      b = "unknown";
      return localNetInfo;
    case 13: 
      a = "4G";
      b = "LTE";
      return localNetInfo;
    case 3: 
      a = "3G";
      b = "UMTS";
      return localNetInfo;
    case 5: 
      a = "3G";
      b = "EVDO_0";
      return localNetInfo;
    case 6: 
      a = "3G";
      b = "EVDO_A";
      return localNetInfo;
    case 8: 
      a = "3G";
      b = "SDPA";
      return localNetInfo;
    case 9: 
      a = "3G";
      b = "HSUPA";
      return localNetInfo;
    case 10: 
      a = "3G";
      b = "HSPA";
      return localNetInfo;
    case 12: 
      a = "3G";
      b = "EVDO_B";
      return localNetInfo;
    case 14: 
      a = "3G";
      b = "EHRPD";
      return localNetInfo;
    case 15: 
      a = "3G";
      b = "HSPAP";
      return localNetInfo;
    case 1: 
      a = "2G";
      b = "GPRS";
      return localNetInfo;
    case 2: 
      a = "2G";
      b = "EDGE";
      return localNetInfo;
    case 4: 
      a = "2G";
      b = "CDMA";
      return localNetInfo;
    case 7: 
      a = "2G";
      b = "1xRTT";
      return localNetInfo;
    case 11: 
      a = "2G";
      b = "IDEN";
      return localNetInfo;
    }
    a = "2G";
    b = "unknown";
    return localNetInfo;
  }
  
  public static String a()
  {
    if ((jdField_d_of_type_JavaLangString != null) && (jdField_d_of_type_JavaLangString.length() > 0)) {
      return jdField_d_of_type_JavaLangString;
    }
    try
    {
      jdField_d_of_type_JavaLangString = ((TelephonyManager)BaseApplicationImpl.getContext().getSystemService("phone")).getDeviceId();
      return jdField_d_of_type_JavaLangString;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public static String a(Context paramContext)
  {
    if (!TextUtils.isEmpty(f)) {
      return f;
    }
    if (paramContext != null) {
      try
      {
        PackageManager localPackageManager = paramContext.getPackageManager();
        if (localPackageManager != null)
        {
          paramContext = localPackageManager.getPackageInfo(paramContext.getPackageName(), 0);
          if (paramContext != null)
          {
            f = versionName + "." + versionCode;
            paramContext = f;
            return paramContext;
          }
        }
      }
      catch (Exception paramContext)
      {
        paramContext.printStackTrace();
      }
    }
    f = "6.3.3.0";
    return f;
  }
  
  private static String a(String[] paramArrayOfString, int paramInt1, int paramInt2)
  {
    Object localObject;
    if (paramArrayOfString == null)
    {
      localObject = "";
      return localObject;
    }
    if ((paramInt1 < 0) || (paramArrayOfString.length < paramInt2)) {
      return "";
    }
    String str = "";
    paramInt1 = 2;
    for (;;)
    {
      localObject = str;
      if (paramInt1 >= paramArrayOfString.length) {
        break;
      }
      str = str + paramArrayOfString[paramInt1] + " ";
      paramInt1 += 1;
    }
  }
  
  private static void a()
  {
    if ((jdField_a_of_type_Long == 0L) || (jdField_b_of_type_Long == 0L))
    {
      Object localObject = BaseApplicationImpl.getContext();
      DisplayMetrics localDisplayMetrics = ((Context)localObject).getResources().getDisplayMetrics();
      jdField_a_of_type_Long = widthPixels;
      jdField_b_of_type_Long = heightPixels;
      jdField_a_of_type_Float = density;
      jdField_b_of_type_Int = densityDpi;
      localObject = ((Context)localObject).getResources().getConfiguration();
      if (localObject != null)
      {
        jdField_c_of_type_Int = orientation;
        if (QLog.isColorLevel()) {
          QLog.i("DeviceInfoUtil", 2, "initDispalyParams, [" + jdField_c_of_type_Int + "," + jdField_a_of_type_Long + "," + jdField_b_of_type_Long + "]");
        }
      }
    }
  }
  
  public static boolean a()
  {
    boolean bool2 = false;
    String str = d();
    boolean bool1 = bool2;
    int i;
    if (str != null) {
      i = 0;
    }
    for (;;)
    {
      bool1 = bool2;
      if (i < jdField_a_of_type_ArrayOfJavaLangString.length)
      {
        if (jdField_a_of_type_ArrayOfJavaLangString[i].equals(str)) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i += 1;
    }
  }
  
  public static long[] a()
  {
    try
    {
      long l1 = b() / 1048576L;
      StatFs localStatFs = new StatFs(Environment.getDataDirectory().getPath());
      long l2 = localStatFs.getBlockSize();
      l2 = localStatFs.getAvailableBlocks() * l2 / 1048576L;
      return new long[] { l1, l2 };
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return tmp71_65;
  }
  
  public static int b()
  {
    if (jdField_d_of_type_Int > 0) {
      return jdField_d_of_type_Int;
    }
    try
    {
      jdField_d_of_type_Int = new File("/sys/devices/system/cpu/").listFiles(new slj()).length;
      int i = jdField_d_of_type_Int;
      return i;
    }
    catch (Exception localException)
    {
      jdField_d_of_type_Int = 1;
    }
    return jdField_d_of_type_Int;
  }
  
  public static long b()
  {
    StatFs localStatFs = new StatFs(Environment.getDataDirectory().getPath());
    long l = localStatFs.getBlockSize();
    return localStatFs.getBlockCount() * l;
  }
  
  /* Error */
  public static long b(int paramInt)
  {
    // Byte code:
    //   0: lconst_0
    //   1: lstore 5
    //   3: aconst_null
    //   4: astore 8
    //   6: aconst_null
    //   7: astore 9
    //   9: iconst_0
    //   10: istore_1
    //   11: invokestatic 409	com/tencent/mobileqq/utils/DeviceInfoUtil:a	()I
    //   14: bipush 9
    //   16: if_icmpge +116 -> 132
    //   19: iload_0
    //   20: ifne +105 -> 125
    //   23: invokestatic 415	android/hardware/Camera:open	()Landroid/hardware/Camera;
    //   26: astore 7
    //   28: aload 7
    //   30: invokevirtual 419	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   33: invokevirtual 425	android/hardware/Camera$Parameters:getSupportedPictureSizes	()Ljava/util/List;
    //   36: iconst_0
    //   37: invokeinterface 431 2 0
    //   42: checkcast 433	android/hardware/Camera$Size
    //   45: astore 8
    //   47: aload 8
    //   49: getfield 436	android/hardware/Camera$Size:height	I
    //   52: istore_0
    //   53: aload 8
    //   55: getfield 439	android/hardware/Camera$Size:width	I
    //   58: istore_1
    //   59: iload_1
    //   60: iload_0
    //   61: imul
    //   62: i2l
    //   63: lstore 5
    //   65: lload 5
    //   67: lstore_3
    //   68: aload 7
    //   70: ifnull +11 -> 81
    //   73: aload 7
    //   75: invokevirtual 442	android/hardware/Camera:release	()V
    //   78: lload 5
    //   80: lstore_3
    //   81: lload_3
    //   82: lstore 5
    //   84: lload 5
    //   86: lreturn
    //   87: astore 7
    //   89: aconst_null
    //   90: astore 7
    //   92: aload 7
    //   94: ifnull +423 -> 517
    //   97: aload 7
    //   99: invokevirtual 442	android/hardware/Camera:release	()V
    //   102: lconst_0
    //   103: lstore_3
    //   104: goto -23 -> 81
    //   107: astore 8
    //   109: aconst_null
    //   110: astore 7
    //   112: aload 7
    //   114: ifnull +8 -> 122
    //   117: aload 7
    //   119: invokevirtual 442	android/hardware/Camera:release	()V
    //   122: aload 8
    //   124: athrow
    //   125: iload_0
    //   126: iconst_1
    //   127: if_icmpne -43 -> 84
    //   130: lconst_0
    //   131: lreturn
    //   132: invokestatic 444	com/tencent/mobileqq/utils/DeviceInfoUtil:c	()I
    //   135: istore_2
    //   136: aload 8
    //   138: astore 7
    //   140: ldc_w 446
    //   143: invokestatic 452	java/lang/Class:forName	(Ljava/lang/String;)Ljava/lang/Class;
    //   146: astore 13
    //   148: aload 8
    //   150: astore 7
    //   152: aload 13
    //   154: invokevirtual 456	java/lang/Class:newInstance	()Ljava/lang/Object;
    //   157: astore 10
    //   159: aload 8
    //   161: astore 7
    //   163: aload 13
    //   165: ldc_w 458
    //   168: invokevirtual 462	java/lang/Class:getField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   171: astore 11
    //   173: aload 8
    //   175: astore 7
    //   177: aload 11
    //   179: iconst_1
    //   180: invokevirtual 468	java/lang/reflect/Field:setAccessible	(Z)V
    //   183: aload 8
    //   185: astore 7
    //   187: ldc_w 470
    //   190: invokestatic 452	java/lang/Class:forName	(Ljava/lang/String;)Ljava/lang/Class;
    //   193: astore 12
    //   195: aload 8
    //   197: astore 7
    //   199: aload 12
    //   201: ldc_w 472
    //   204: iconst_2
    //   205: anewarray 448	java/lang/Class
    //   208: dup
    //   209: iconst_0
    //   210: getstatic 476	java/lang/Integer:TYPE	Ljava/lang/Class;
    //   213: aastore
    //   214: dup
    //   215: iconst_1
    //   216: aload 13
    //   218: aastore
    //   219: invokevirtual 480	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   222: astore 13
    //   224: aload 8
    //   226: astore 7
    //   228: aload 13
    //   230: iconst_1
    //   231: invokevirtual 483	java/lang/reflect/Method:setAccessible	(Z)V
    //   234: aload 8
    //   236: astore 7
    //   238: aload 12
    //   240: ldc_w 484
    //   243: iconst_1
    //   244: anewarray 448	java/lang/Class
    //   247: dup
    //   248: iconst_0
    //   249: getstatic 476	java/lang/Integer:TYPE	Ljava/lang/Class;
    //   252: aastore
    //   253: invokevirtual 480	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   256: astore 12
    //   258: aload 8
    //   260: astore 7
    //   262: aload 12
    //   264: iconst_1
    //   265: invokevirtual 483	java/lang/reflect/Method:setAccessible	(Z)V
    //   268: iload_1
    //   269: iload_2
    //   270: if_icmpge +242 -> 512
    //   273: aload 8
    //   275: astore 7
    //   277: aload 13
    //   279: aconst_null
    //   280: iconst_2
    //   281: anewarray 4	java/lang/Object
    //   284: dup
    //   285: iconst_0
    //   286: iload_1
    //   287: invokestatic 488	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   290: aastore
    //   291: dup
    //   292: iconst_1
    //   293: aload 10
    //   295: aastore
    //   296: invokevirtual 492	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   299: pop
    //   300: aload 8
    //   302: astore 7
    //   304: aload 11
    //   306: aload 10
    //   308: invokevirtual 495	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   311: checkcast 83	java/lang/Integer
    //   314: invokevirtual 498	java/lang/Integer:intValue	()I
    //   317: iload_0
    //   318: if_icmpne +113 -> 431
    //   321: aload 8
    //   323: astore 7
    //   325: aload 12
    //   327: aconst_null
    //   328: iconst_1
    //   329: anewarray 4	java/lang/Object
    //   332: dup
    //   333: iconst_0
    //   334: iload_1
    //   335: invokestatic 488	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   338: aastore
    //   339: invokevirtual 492	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   342: checkcast 411	android/hardware/Camera
    //   345: astore 8
    //   347: lload 5
    //   349: lstore_3
    //   350: aload 8
    //   352: ifnull +64 -> 416
    //   355: aload 8
    //   357: invokevirtual 419	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   360: invokevirtual 425	android/hardware/Camera$Parameters:getSupportedPictureSizes	()Ljava/util/List;
    //   363: astore 7
    //   365: lload 5
    //   367: lstore_3
    //   368: aload 7
    //   370: ifnull +46 -> 416
    //   373: lload 5
    //   375: lstore_3
    //   376: aload 7
    //   378: invokeinterface 500 1 0
    //   383: ifne +33 -> 416
    //   386: aload 7
    //   388: iconst_0
    //   389: invokeinterface 431 2 0
    //   394: checkcast 433	android/hardware/Camera$Size
    //   397: astore 7
    //   399: aload 7
    //   401: getfield 436	android/hardware/Camera$Size:height	I
    //   404: istore_0
    //   405: aload 7
    //   407: getfield 439	android/hardware/Camera$Size:width	I
    //   410: istore_1
    //   411: iload_1
    //   412: iload_0
    //   413: imul
    //   414: i2l
    //   415: lstore_3
    //   416: lload_3
    //   417: lstore 5
    //   419: aload 8
    //   421: ifnull -337 -> 84
    //   424: aload 8
    //   426: invokevirtual 442	android/hardware/Camera:release	()V
    //   429: lload_3
    //   430: lreturn
    //   431: iload_1
    //   432: iconst_1
    //   433: iadd
    //   434: istore_1
    //   435: goto -167 -> 268
    //   438: astore 7
    //   440: aload 9
    //   442: astore 8
    //   444: aload 7
    //   446: astore 9
    //   448: aload 8
    //   450: astore 7
    //   452: aload 9
    //   454: invokevirtual 143	java/lang/Exception:printStackTrace	()V
    //   457: aload 8
    //   459: ifnull -375 -> 84
    //   462: aload 8
    //   464: invokevirtual 442	android/hardware/Camera:release	()V
    //   467: lconst_0
    //   468: lreturn
    //   469: astore 9
    //   471: aload 7
    //   473: astore 8
    //   475: aload 9
    //   477: astore 7
    //   479: aload 8
    //   481: ifnull +8 -> 489
    //   484: aload 8
    //   486: invokevirtual 442	android/hardware/Camera:release	()V
    //   489: aload 7
    //   491: athrow
    //   492: astore 7
    //   494: goto -15 -> 479
    //   497: astore 9
    //   499: goto -51 -> 448
    //   502: astore 8
    //   504: goto -392 -> 112
    //   507: astore 8
    //   509: goto -417 -> 92
    //   512: iconst_m1
    //   513: istore_1
    //   514: goto -193 -> 321
    //   517: lconst_0
    //   518: lstore_3
    //   519: goto -438 -> 81
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	522	0	paramInt	int
    //   10	504	1	i	int
    //   135	136	2	j	int
    //   67	452	3	l1	long
    //   1	417	5	l2	long
    //   26	48	7	localCamera	android.hardware.Camera
    //   87	1	7	localException1	Exception
    //   90	316	7	localObject1	Object
    //   438	7	7	localException2	Exception
    //   450	40	7	localObject2	Object
    //   492	1	7	localObject3	Object
    //   4	50	8	localSize	android.hardware.Camera.Size
    //   107	215	8	localObject4	Object
    //   345	140	8	localObject5	Object
    //   502	1	8	localObject6	Object
    //   507	1	8	localException3	Exception
    //   7	446	9	localObject7	Object
    //   469	7	9	localObject8	Object
    //   497	1	9	localException4	Exception
    //   157	150	10	localObject9	Object
    //   171	134	11	localField	java.lang.reflect.Field
    //   193	133	12	localObject10	Object
    //   146	132	13	localObject11	Object
    // Exception table:
    //   from	to	target	type
    //   23	28	87	java/lang/Exception
    //   23	28	107	finally
    //   140	148	438	java/lang/Exception
    //   152	159	438	java/lang/Exception
    //   163	173	438	java/lang/Exception
    //   177	183	438	java/lang/Exception
    //   187	195	438	java/lang/Exception
    //   199	224	438	java/lang/Exception
    //   228	234	438	java/lang/Exception
    //   238	258	438	java/lang/Exception
    //   262	268	438	java/lang/Exception
    //   277	300	438	java/lang/Exception
    //   304	321	438	java/lang/Exception
    //   325	347	438	java/lang/Exception
    //   140	148	469	finally
    //   152	159	469	finally
    //   163	173	469	finally
    //   177	183	469	finally
    //   187	195	469	finally
    //   199	224	469	finally
    //   228	234	469	finally
    //   238	258	469	finally
    //   262	268	469	finally
    //   277	300	469	finally
    //   304	321	469	finally
    //   325	347	469	finally
    //   452	457	469	finally
    //   355	365	492	finally
    //   376	411	492	finally
    //   355	365	497	java/lang/Exception
    //   376	411	497	java/lang/Exception
    //   28	59	502	finally
    //   28	59	507	java/lang/Exception
  }
  
  public static String b()
  {
    if ((e != null) && (e.length() > 0)) {
      return e;
    }
    try
    {
      e = ((TelephonyManager)BaseApplicationImpl.getContext().getSystemService("phone")).getSubscriberId();
      return e;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public static String b(Context paramContext)
  {
    paramContext = (WifiManager)paramContext.getSystemService("wifi");
    if (paramContext == null) {
      paramContext = null;
    }
    for (;;)
    {
      return paramContext;
      try
      {
        paramContext = paramContext.getConnectionInfo();
        if (paramContext == null) {
          return null;
        }
      }
      catch (Exception paramContext)
      {
        for (;;)
        {
          paramContext = null;
        }
        String str = paramContext.getBSSID();
        if ((!"N/A".equals(str)) && (!"00:00:00:00:00:00".equals(str)))
        {
          paramContext = str;
          if (!"FF:FF:FF:FF:FF:FF".equalsIgnoreCase(str)) {
            continue;
          }
        }
      }
    }
    return null;
  }
  
  public static boolean b()
  {
    String str = i();
    return (!TextUtils.isEmpty(str)) && (str.equals("Lenovo A366t")) && (Build.VERSION.SDK_INT == 10);
  }
  
  public static long[] b()
  {
    try
    {
      long[] arrayOfLong = new long[2];
      if ("mounted".equals(Environment.getExternalStorageState()))
      {
        StatFs localStatFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        long l1 = localStatFs.getBlockSize();
        long l2 = localStatFs.getBlockCount();
        long l3 = localStatFs.getAvailableBlocks();
        arrayOfLong[0] = (l2 * l1 / 1048576L);
        arrayOfLong[1] = (l3 * l1 / 1048576L);
      }
      return arrayOfLong;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return tmp96_90;
  }
  
  public static int c()
  {
    try
    {
      Method localMethod = Class.forName("android.hardware.Camera").getMethod("getNumberOfCameras", new Class[0]);
      if (localMethod != null)
      {
        int i = ((Integer)localMethod.invoke(null, (Object[])null)).intValue();
        return i;
      }
    }
    catch (Exception localException)
    {
      return 0;
    }
    return 0;
  }
  
  /* Error */
  public static long c()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_0
    //   4: getstatic 68	com/tencent/mobileqq/utils/DeviceInfoUtil:jdField_d_of_type_Long	J
    //   7: lconst_0
    //   8: lcmp
    //   9: ifne +140 -> 149
    //   12: new 117	java/io/FileReader
    //   15: dup
    //   16: ldc_w 547
    //   19: invokespecial 122	java/io/FileReader:<init>	(Ljava/lang/String;)V
    //   22: astore_1
    //   23: new 115	java/io/BufferedReader
    //   26: dup
    //   27: aload_1
    //   28: sipush 1024
    //   31: invokespecial 125	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   34: astore_0
    //   35: aload_0
    //   36: invokevirtual 129	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   39: astore_2
    //   40: aload_2
    //   41: ifnull +25 -> 66
    //   44: aload_2
    //   45: ldc_w 549
    //   48: invokevirtual 553	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   51: iconst_1
    //   52: aaload
    //   53: invokestatic 556	java/lang/Long:valueOf	(Ljava/lang/String;)Ljava/lang/Long;
    //   56: invokevirtual 559	java/lang/Long:longValue	()J
    //   59: ldc2_w 136
    //   62: lmul
    //   63: putstatic 68	com/tencent/mobileqq/utils/DeviceInfoUtil:jdField_d_of_type_Long	J
    //   66: aload_0
    //   67: ifnull +7 -> 74
    //   70: aload_0
    //   71: invokevirtual 140	java/io/BufferedReader:close	()V
    //   74: aload_1
    //   75: ifnull +7 -> 82
    //   78: aload_1
    //   79: invokevirtual 560	java/io/FileReader:close	()V
    //   82: getstatic 68	com/tencent/mobileqq/utils/DeviceInfoUtil:jdField_d_of_type_Long	J
    //   85: lconst_0
    //   86: lcmp
    //   87: ifne +62 -> 149
    //   90: ldc2_w 561
    //   93: lreturn
    //   94: astore_1
    //   95: aconst_null
    //   96: astore_2
    //   97: aload_0
    //   98: astore_1
    //   99: aload_2
    //   100: astore_0
    //   101: lconst_0
    //   102: putstatic 68	com/tencent/mobileqq/utils/DeviceInfoUtil:jdField_d_of_type_Long	J
    //   105: aload_0
    //   106: ifnull +7 -> 113
    //   109: aload_0
    //   110: invokevirtual 140	java/io/BufferedReader:close	()V
    //   113: aload_1
    //   114: ifnull -32 -> 82
    //   117: aload_1
    //   118: invokevirtual 560	java/io/FileReader:close	()V
    //   121: goto -39 -> 82
    //   124: astore_0
    //   125: goto -43 -> 82
    //   128: astore_0
    //   129: aconst_null
    //   130: astore_1
    //   131: aload_2
    //   132: ifnull +7 -> 139
    //   135: aload_2
    //   136: invokevirtual 140	java/io/BufferedReader:close	()V
    //   139: aload_1
    //   140: ifnull +7 -> 147
    //   143: aload_1
    //   144: invokevirtual 560	java/io/FileReader:close	()V
    //   147: aload_0
    //   148: athrow
    //   149: getstatic 68	com/tencent/mobileqq/utils/DeviceInfoUtil:jdField_d_of_type_Long	J
    //   152: lreturn
    //   153: astore_1
    //   154: goto -7 -> 147
    //   157: astore_0
    //   158: goto -27 -> 131
    //   161: astore_3
    //   162: aload_0
    //   163: astore_2
    //   164: aload_3
    //   165: astore_0
    //   166: goto -35 -> 131
    //   169: astore_3
    //   170: aload_0
    //   171: astore_2
    //   172: aload_3
    //   173: astore_0
    //   174: goto -43 -> 131
    //   177: astore_0
    //   178: aconst_null
    //   179: astore_0
    //   180: goto -79 -> 101
    //   183: astore_2
    //   184: goto -83 -> 101
    //   187: astore_0
    //   188: goto -106 -> 82
    // Local variable table:
    //   start	length	slot	name	signature
    //   3	107	0	localObject1	Object
    //   124	1	0	localException1	Exception
    //   128	20	0	localObject2	Object
    //   157	6	0	localObject3	Object
    //   165	9	0	localObject4	Object
    //   177	1	0	localException2	Exception
    //   179	1	0	localObject5	Object
    //   187	1	0	localException3	Exception
    //   22	57	1	localFileReader	FileReader
    //   94	1	1	localException4	Exception
    //   98	46	1	localObject6	Object
    //   153	1	1	localException5	Exception
    //   1	171	2	localObject7	Object
    //   183	1	2	localException6	Exception
    //   161	4	3	localObject8	Object
    //   169	4	3	localObject9	Object
    // Exception table:
    //   from	to	target	type
    //   12	23	94	java/lang/Exception
    //   109	113	124	java/lang/Exception
    //   117	121	124	java/lang/Exception
    //   12	23	128	finally
    //   135	139	153	java/lang/Exception
    //   143	147	153	java/lang/Exception
    //   23	35	157	finally
    //   35	40	161	finally
    //   44	66	161	finally
    //   101	105	169	finally
    //   23	35	177	java/lang/Exception
    //   35	40	183	java/lang/Exception
    //   44	66	183	java/lang/Exception
    //   70	74	187	java/lang/Exception
    //   78	82	187	java/lang/Exception
  }
  
  public static String c()
  {
    try
    {
      Object localObject = BaseApplicationImpl.getContext();
      localObject = getPackageManagergetPackageInfogetPackageName0versionName;
      return localObject;
    }
    catch (Exception localException) {}
    return "getVersionException";
  }
  
  public static String c(Context paramContext)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramContext != null)
    {
      paramContext = (WifiManager)paramContext.getSystemService("wifi");
      localObject1 = localObject2;
      if (paramContext == null) {}
    }
    for (;;)
    {
      try
      {
        paramContext = paramContext.getConnectionInfo();
        if (paramContext != null)
        {
          paramContext = paramContext.getMacAddress();
          localObject1 = paramContext;
          return localObject1;
        }
      }
      catch (Exception paramContext)
      {
        paramContext.printStackTrace();
        return null;
      }
      paramContext = null;
    }
  }
  
  public static boolean c()
  {
    return BaseApplicationImpl.getContext().getPackageManager().hasSystemFeature("android.hardware.touchscreen.multitouch");
  }
  
  public static int d()
  {
    a();
    return jdField_b_of_type_Int;
  }
  
  public static long d()
  {
    Object localObject = BaseApplicationImpl.getContext();
    if (localObject != null)
    {
      localObject = (ActivityManager)((Context)localObject).getSystemService("activity");
      ActivityManager.MemoryInfo localMemoryInfo = new ActivityManager.MemoryInfo();
      ((ActivityManager)localObject).getMemoryInfo(localMemoryInfo);
      return availMem;
    }
    return -1L;
  }
  
  public static String d()
  {
    return Build.MODEL;
  }
  
  public static boolean d()
  {
    return Build.VERSION.SDK_INT >= 8;
  }
  
  public static final int e()
  {
    String str = ((TelephonyManager)BaseApplicationImpl.a().getSystemService("phone")).getSubscriberId();
    if (!TextUtils.isEmpty(str))
    {
      if ((str.startsWith("46000")) || (str.startsWith("46002"))) {
        return 1;
      }
      if (str.startsWith("46001")) {
        return 2;
      }
      if (str.startsWith("46003")) {
        return 3;
      }
    }
    return 0;
  }
  
  public static long e()
  {
    BaseApplication localBaseApplication = BaseApplicationImpl.getContext();
    if (localBaseApplication != null) {
      return ((ActivityManager)localBaseApplication.getSystemService("activity")).getMemoryClass() * 1024L * 1024L;
    }
    return -1L;
  }
  
  public static String e()
  {
    return Build.VERSION.RELEASE;
  }
  
  public static long f()
  {
    a();
    return jdField_a_of_type_Long;
  }
  
  public static String f()
  {
    String str = Settings.System.getString(BaseApplicationImpl.getContext().getContentResolver(), "android_id");
    if (!TextUtils.isEmpty(str)) {
      return str;
    }
    return "";
  }
  
  public static long g()
  {
    a();
    return jdField_b_of_type_Long;
  }
  
  /* Error */
  public static String g()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: new 117	java/io/FileReader
    //   6: dup
    //   7: ldc_w 625
    //   10: invokespecial 122	java/io/FileReader:<init>	(Ljava/lang/String;)V
    //   13: astore_0
    //   14: new 115	java/io/BufferedReader
    //   17: dup
    //   18: aload_0
    //   19: sipush 8192
    //   22: invokespecial 125	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   25: astore_2
    //   26: ldc_w 312
    //   29: astore_1
    //   30: ldc_w 312
    //   33: astore 6
    //   35: ldc_w 312
    //   38: astore_3
    //   39: ldc_w 312
    //   42: astore 7
    //   44: ldc 50
    //   46: astore 4
    //   48: aload 4
    //   50: ifnull +14 -> 64
    //   53: aload_2
    //   54: invokevirtual 129	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   57: astore 10
    //   59: aload 10
    //   61: ifnonnull +86 -> 147
    //   64: new 286	java/lang/StringBuilder
    //   67: dup
    //   68: invokespecial 287	java/lang/StringBuilder:<init>	()V
    //   71: aload 7
    //   73: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   76: ldc_w 627
    //   79: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   82: aload_3
    //   83: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   86: ldc_w 627
    //   89: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: aload 6
    //   94: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: ldc_w 627
    //   100: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   103: aload_1
    //   104: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: invokevirtual 307	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   110: astore_1
    //   111: aload_2
    //   112: invokevirtual 140	java/io/BufferedReader:close	()V
    //   115: aload_0
    //   116: invokevirtual 560	java/io/FileReader:close	()V
    //   119: iconst_0
    //   120: ifeq +11 -> 131
    //   123: new 629	java/lang/NullPointerException
    //   126: dup
    //   127: invokespecial 630	java/lang/NullPointerException:<init>	()V
    //   130: athrow
    //   131: aload_1
    //   132: astore_0
    //   133: iconst_0
    //   134: ifeq +11 -> 145
    //   137: new 629	java/lang/NullPointerException
    //   140: dup
    //   141: invokespecial 630	java/lang/NullPointerException:<init>	()V
    //   144: athrow
    //   145: aload_0
    //   146: areturn
    //   147: aload 10
    //   149: ldc_w 549
    //   152: invokevirtual 553	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   155: astore 11
    //   157: aload 10
    //   159: astore 4
    //   161: aload 11
    //   163: ifnull -115 -> 48
    //   166: aload 10
    //   168: astore 4
    //   170: aload 11
    //   172: arraylength
    //   173: iconst_3
    //   174: if_icmplt -126 -> 48
    //   177: aload 11
    //   179: iconst_0
    //   180: aaload
    //   181: invokevirtual 633	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   184: astore 4
    //   186: aload 7
    //   188: astore 5
    //   190: aload 4
    //   192: ldc_w 635
    //   195: invokevirtual 638	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   198: ifeq +41 -> 239
    //   201: new 286	java/lang/StringBuilder
    //   204: dup
    //   205: invokespecial 287	java/lang/StringBuilder:<init>	()V
    //   208: aload 7
    //   210: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   213: aload 11
    //   215: iconst_2
    //   216: aload 11
    //   218: arraylength
    //   219: invokestatic 640	com/tencent/mobileqq/utils/DeviceInfoUtil:a	([Ljava/lang/String;II)Ljava/lang/String;
    //   222: ldc_w 642
    //   225: ldc_w 644
    //   228: invokevirtual 648	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   231: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   234: invokevirtual 307	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   237: astore 5
    //   239: aload_3
    //   240: astore 8
    //   242: aload 4
    //   244: ldc_w 650
    //   247: invokevirtual 638	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   250: ifeq +23 -> 273
    //   253: aload 11
    //   255: iconst_2
    //   256: aload 11
    //   258: arraylength
    //   259: invokestatic 640	com/tencent/mobileqq/utils/DeviceInfoUtil:a	([Ljava/lang/String;II)Ljava/lang/String;
    //   262: ldc_w 642
    //   265: ldc_w 644
    //   268: invokevirtual 648	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   271: astore 8
    //   273: aload 6
    //   275: astore 9
    //   277: aload 4
    //   279: ldc_w 652
    //   282: invokevirtual 638	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   285: ifeq +23 -> 308
    //   288: aload 11
    //   290: iconst_2
    //   291: aload 11
    //   293: arraylength
    //   294: invokestatic 640	com/tencent/mobileqq/utils/DeviceInfoUtil:a	([Ljava/lang/String;II)Ljava/lang/String;
    //   297: ldc_w 642
    //   300: ldc_w 644
    //   303: invokevirtual 648	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   306: astore 9
    //   308: aload 9
    //   310: astore 6
    //   312: aload 8
    //   314: astore_3
    //   315: aload 5
    //   317: astore 7
    //   319: aload 10
    //   321: astore 4
    //   323: aload 11
    //   325: iconst_1
    //   326: aaload
    //   327: invokevirtual 633	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   330: ldc_w 654
    //   333: invokevirtual 638	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   336: ifeq -288 -> 48
    //   339: aload 11
    //   341: aload 11
    //   343: arraylength
    //   344: iconst_1
    //   345: isub
    //   346: aaload
    //   347: astore_1
    //   348: aload 9
    //   350: astore 6
    //   352: aload 8
    //   354: astore_3
    //   355: aload 5
    //   357: astore 7
    //   359: aload 10
    //   361: astore 4
    //   363: goto -315 -> 48
    //   366: astore_3
    //   367: aconst_null
    //   368: astore_2
    //   369: ldc 50
    //   371: astore_1
    //   372: aload 4
    //   374: astore_0
    //   375: aload_3
    //   376: invokevirtual 143	java/lang/Exception:printStackTrace	()V
    //   379: aload_0
    //   380: ifnull +7 -> 387
    //   383: aload_0
    //   384: invokevirtual 560	java/io/FileReader:close	()V
    //   387: aload_1
    //   388: astore_0
    //   389: aload_2
    //   390: ifnull -245 -> 145
    //   393: aload_2
    //   394: invokevirtual 140	java/io/BufferedReader:close	()V
    //   397: aload_1
    //   398: areturn
    //   399: astore_0
    //   400: aload_1
    //   401: areturn
    //   402: astore_1
    //   403: aconst_null
    //   404: astore_2
    //   405: aconst_null
    //   406: astore_0
    //   407: aload_0
    //   408: ifnull +7 -> 415
    //   411: aload_0
    //   412: invokevirtual 560	java/io/FileReader:close	()V
    //   415: aload_2
    //   416: ifnull +7 -> 423
    //   419: aload_2
    //   420: invokevirtual 140	java/io/BufferedReader:close	()V
    //   423: aload_1
    //   424: athrow
    //   425: astore_0
    //   426: goto -295 -> 131
    //   429: astore_0
    //   430: aload_1
    //   431: areturn
    //   432: astore_0
    //   433: goto -46 -> 387
    //   436: astore_0
    //   437: goto -22 -> 415
    //   440: astore_0
    //   441: goto -18 -> 423
    //   444: astore_1
    //   445: aconst_null
    //   446: astore_2
    //   447: goto -40 -> 407
    //   450: astore_1
    //   451: goto -44 -> 407
    //   454: astore_1
    //   455: goto -48 -> 407
    //   458: astore_3
    //   459: aconst_null
    //   460: astore_2
    //   461: ldc 50
    //   463: astore_1
    //   464: goto -89 -> 375
    //   467: astore_3
    //   468: ldc 50
    //   470: astore_1
    //   471: goto -96 -> 375
    //   474: astore_3
    //   475: goto -100 -> 375
    //   478: astore_3
    //   479: aconst_null
    //   480: astore_2
    //   481: goto -106 -> 375
    // Local variable table:
    //   start	length	slot	name	signature
    //   13	376	0	localObject1	Object
    //   399	1	0	localException1	Exception
    //   406	6	0	localObject2	Object
    //   425	1	0	localException2	Exception
    //   429	1	0	localException3	Exception
    //   432	1	0	localException4	Exception
    //   436	1	0	localException5	Exception
    //   440	1	0	localException6	Exception
    //   29	372	1	str1	String
    //   402	29	1	str2	String
    //   444	1	1	localObject3	Object
    //   450	1	1	localObject4	Object
    //   454	1	1	localObject5	Object
    //   463	8	1	str3	String
    //   25	456	2	localBufferedReader	BufferedReader
    //   38	317	3	localObject6	Object
    //   366	10	3	localException7	Exception
    //   458	1	3	localException8	Exception
    //   467	1	3	localException9	Exception
    //   474	1	3	localException10	Exception
    //   478	1	3	localException11	Exception
    //   1	372	4	localObject7	Object
    //   188	168	5	localObject8	Object
    //   33	318	6	localObject9	Object
    //   42	316	7	localObject10	Object
    //   240	113	8	localObject11	Object
    //   275	74	9	localObject12	Object
    //   57	303	10	str4	String
    //   155	187	11	arrayOfString	String[]
    // Exception table:
    //   from	to	target	type
    //   3	14	366	java/lang/Exception
    //   393	397	399	java/lang/Exception
    //   3	14	402	finally
    //   123	131	425	java/lang/Exception
    //   137	145	429	java/lang/Exception
    //   383	387	432	java/lang/Exception
    //   411	415	436	java/lang/Exception
    //   419	423	440	java/lang/Exception
    //   14	26	444	finally
    //   115	119	444	finally
    //   53	59	450	finally
    //   64	111	450	finally
    //   111	115	450	finally
    //   147	157	450	finally
    //   170	186	450	finally
    //   190	239	450	finally
    //   242	273	450	finally
    //   277	308	450	finally
    //   323	348	450	finally
    //   375	379	454	finally
    //   14	26	458	java/lang/Exception
    //   53	59	467	java/lang/Exception
    //   64	111	467	java/lang/Exception
    //   147	157	467	java/lang/Exception
    //   170	186	467	java/lang/Exception
    //   190	239	467	java/lang/Exception
    //   242	273	467	java/lang/Exception
    //   277	308	467	java/lang/Exception
    //   323	348	467	java/lang/Exception
    //   111	115	474	java/lang/Exception
    //   115	119	478	java/lang/Exception
  }
  
  public static long h()
  {
    
    if (jdField_c_of_type_Int == 2) {
      return jdField_b_of_type_Long;
    }
    return jdField_a_of_type_Long;
  }
  
  public static String h()
  {
    return Build.MANUFACTURER;
  }
  
  public static long i()
  {
    
    if (jdField_c_of_type_Int == 2) {
      return jdField_a_of_type_Long;
    }
    return jdField_b_of_type_Long;
  }
  
  public static String i()
  {
    return Build.MODEL;
  }
  
  public static long j()
  {
    int i = 0;
    a();
    if (jdField_c_of_type_Int == 1) {
      i = (int)Math.min(jdField_a_of_type_Long, jdField_b_of_type_Long);
    }
    for (;;)
    {
      return i;
      if (jdField_c_of_type_Int == 2) {
        i = (int)Math.max(jdField_a_of_type_Long, jdField_b_of_type_Long);
      }
    }
  }
  
  public static String j()
  {
    return Build.DISPLAY;
  }
  
  public static long k()
  {
    int i = 0;
    a();
    if (jdField_c_of_type_Int == 1) {
      i = (int)Math.max(jdField_a_of_type_Long, jdField_b_of_type_Long);
    }
    for (;;)
    {
      return i;
      if (jdField_c_of_type_Int == 2) {
        i = (int)Math.min(jdField_a_of_type_Long, jdField_b_of_type_Long);
      }
    }
  }
  
  public static String k()
  {
    try
    {
      Object localObject = Build.class.getDeclaredMethod("getString", new Class[] { String.class });
      ((Method)localObject).setAccessible(true);
      localObject = (String)((Method)localObject).invoke(null, new Object[] { "ro.product.manufacturer" });
      return localObject;
    }
    catch (Exception localException1)
    {
      try
      {
        String str = Build.MANUFACTURER;
        return str;
      }
      catch (Exception localException2) {}
    }
    return "";
  }
  
  public static String l()
  {
    BaseApplication localBaseApplication = BaseApplicationImpl.getContext();
    int i = getResourcesgetDisplayMetricswidthPixels;
    int j = getResourcesgetDisplayMetricsheightPixels;
    int k;
    if (getResourcesgetConfigurationorientation == 2)
    {
      k = j;
      j = i;
    }
    for (;;)
    {
      return k + "X" + j;
      k = i;
    }
  }
  
  /* Error */
  public static String m()
  {
    // Byte code:
    //   0: new 687	java/io/FileInputStream
    //   3: dup
    //   4: ldc_w 689
    //   7: invokespecial 690	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   10: astore_2
    //   11: new 115	java/io/BufferedReader
    //   14: dup
    //   15: new 692	java/io/InputStreamReader
    //   18: dup
    //   19: aload_2
    //   20: invokespecial 695	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   23: sipush 8192
    //   26: invokespecial 125	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   29: astore_3
    //   30: ldc 50
    //   32: astore_0
    //   33: aload_3
    //   34: invokevirtual 129	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   37: astore_1
    //   38: aload_1
    //   39: ifnull +35 -> 74
    //   42: new 286	java/lang/StringBuilder
    //   45: dup
    //   46: invokespecial 287	java/lang/StringBuilder:<init>	()V
    //   49: aload_0
    //   50: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: aload_1
    //   54: invokevirtual 296	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: invokevirtual 307	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   60: astore_1
    //   61: aload_1
    //   62: astore_0
    //   63: goto -30 -> 33
    //   66: astore_0
    //   67: aload_0
    //   68: invokevirtual 696	java/io/FileNotFoundException:printStackTrace	()V
    //   71: ldc 50
    //   73: areturn
    //   74: aload_3
    //   75: invokevirtual 140	java/io/BufferedReader:close	()V
    //   78: aload_2
    //   79: invokevirtual 699	java/io/InputStream:close	()V
    //   82: aload_0
    //   83: ldc 50
    //   85: if_acmpeq -14 -> 71
    //   88: aload_0
    //   89: aload_0
    //   90: ldc_w 701
    //   93: invokevirtual 704	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   96: ldc_w 701
    //   99: invokevirtual 259	java/lang/String:length	()I
    //   102: iadd
    //   103: invokevirtual 708	java/lang/String:substring	(I)Ljava/lang/String;
    //   106: astore_0
    //   107: aload_0
    //   108: iconst_0
    //   109: aload_0
    //   110: ldc_w 312
    //   113: invokevirtual 704	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   116: invokevirtual 711	java/lang/String:substring	(II)Ljava/lang/String;
    //   119: astore_0
    //   120: aload_0
    //   121: areturn
    //   122: astore_1
    //   123: aload_1
    //   124: invokevirtual 712	java/io/IOException:printStackTrace	()V
    //   127: goto -45 -> 82
    //   130: astore_1
    //   131: aload_1
    //   132: invokevirtual 712	java/io/IOException:printStackTrace	()V
    //   135: aload_3
    //   136: invokevirtual 140	java/io/BufferedReader:close	()V
    //   139: aload_2
    //   140: invokevirtual 699	java/io/InputStream:close	()V
    //   143: goto -61 -> 82
    //   146: astore_1
    //   147: aload_1
    //   148: invokevirtual 712	java/io/IOException:printStackTrace	()V
    //   151: goto -69 -> 82
    //   154: astore_0
    //   155: aload_3
    //   156: invokevirtual 140	java/io/BufferedReader:close	()V
    //   159: aload_2
    //   160: invokevirtual 699	java/io/InputStream:close	()V
    //   163: aload_0
    //   164: athrow
    //   165: astore_1
    //   166: aload_1
    //   167: invokevirtual 712	java/io/IOException:printStackTrace	()V
    //   170: goto -7 -> 163
    //   173: astore_0
    //   174: aload_0
    //   175: invokevirtual 713	java/lang/IndexOutOfBoundsException:printStackTrace	()V
    //   178: ldc 50
    //   180: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   32	31	0	localObject1	Object
    //   66	24	0	localFileNotFoundException	java.io.FileNotFoundException
    //   106	15	0	str1	String
    //   154	10	0	localObject2	Object
    //   173	2	0	localIndexOutOfBoundsException	IndexOutOfBoundsException
    //   37	25	1	str2	String
    //   122	2	1	localIOException1	java.io.IOException
    //   130	2	1	localIOException2	java.io.IOException
    //   146	2	1	localIOException3	java.io.IOException
    //   165	2	1	localIOException4	java.io.IOException
    //   10	150	2	localFileInputStream	java.io.FileInputStream
    //   29	127	3	localBufferedReader	BufferedReader
    // Exception table:
    //   from	to	target	type
    //   0	11	66	java/io/FileNotFoundException
    //   74	82	122	java/io/IOException
    //   33	38	130	java/io/IOException
    //   42	61	130	java/io/IOException
    //   135	143	146	java/io/IOException
    //   33	38	154	finally
    //   42	61	154	finally
    //   131	135	154	finally
    //   155	163	165	java/io/IOException
    //   88	120	173	java/lang/IndexOutOfBoundsException
  }
}
