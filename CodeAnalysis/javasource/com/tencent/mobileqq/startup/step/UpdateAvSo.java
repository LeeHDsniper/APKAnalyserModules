package com.tencent.mobileqq.startup.step;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.os.Build.VERSION;
import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.HashMap;

public class UpdateAvSo
  extends Step
{
  private static final String a = "AVModuleExtract";
  private static final String c = "so_sp";
  private static final String d = "key_so_version_";
  private static final String e = "first_qq_lauch_";
  private static final String f = "first_av_lauch_";
  
  public UpdateAvSo() {}
  
  public static long a()
  {
    long l = SystemClock.uptimeMillis();
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a.getSharedPreferences("so_sp", 0);
    if (localSharedPreferences.getLong("first_av_lauch_201932", 0L) != 0L) {
      return 0L;
    }
    localSharedPreferences.edit().putLong("first_av_lauch_201932", l).commit();
    return l - b();
  }
  
  public static String a()
  {
    File localFile = BaseApplicationImpl.a.getFilesDir();
    if (localFile == null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("AVModuleExtract", 2, "getFilesDir is null");
      }
      return "";
    }
    return localFile.getParent() + "/txlib/";
  }
  
  private static String a(String paramString)
  {
    return "lib" + paramString + ".so";
  }
  
  public static void a()
  {
    BaseApplicationImpl localBaseApplicationImpl = BaseApplicationImpl.a;
    b(localBaseApplicationImpl, "VideoCtrl", true);
    b(localBaseApplicationImpl, "traeimp-armeabi-v7a", true);
    b(localBaseApplicationImpl, "qav_graphics", true);
    b(localBaseApplicationImpl, "qav_gaudio_engine", true);
    b(localBaseApplicationImpl, "qav_utils", true);
    b(localBaseApplicationImpl, "qav_media_engine", true);
  }
  
  public static boolean a(Context paramContext)
  {
    return (a(paramContext, "TcHevcDec")) && (a(paramContext, "TcHevcEnc")) && (a(paramContext, "traeimp-armeabi")) && (a(paramContext, "traeopus-armeabi-v7a")) && (a(paramContext, "TcVpxDec-armeabi")) && (a(paramContext, "TcVpxEnc-armeabi"));
  }
  
  public static boolean a(Context paramContext, String paramString)
  {
    if (Build.VERSION.SDK_INT >= 9) {}
    for (paramContext = getApplicationInfonativeLibraryDir + "/";; paramContext = getApplicationInfodataDir + "/lib/")
    {
      paramContext = new File(paramContext + a(paramString));
      File localFile = new File(a() + a(paramString));
      if ((!paramContext.exists()) && (!localFile.exists())) {
        break;
      }
      return true;
    }
    if (QLog.isColorLevel()) {
      QLog.e("AVModuleExtract", 2, "fail to find so:" + paramString);
    }
    return false;
  }
  
  public static boolean a(Context paramContext, String paramString, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.i("AVModuleExtract", 2, "start LoadExtractedSo: " + paramString);
    }
    try
    {
      System.load(paramContext.getFilesDir().getParent() + "/txlib/" + a(paramString));
      paramBoolean = true;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError1)
    {
      for (;;)
      {
        localFile = new File(paramContext.getFilesDir().getParent() + "/txlib/" + a(paramString));
        if (localFile.exists()) {
          localFile.delete();
        }
        b(paramContext, paramString, paramBoolean);
        try
        {
          System.load(paramContext.getFilesDir().getParent() + "/txlib/" + a(paramString));
          paramBoolean = true;
        }
        catch (UnsatisfiedLinkError localUnsatisfiedLinkError2)
        {
          paramBoolean = false;
        }
      }
    }
    if (!paramBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("AVModuleExtract", 2, "finally try to use system way to load so: " + paramString);
      }
      try
      {
        System.loadLibrary(paramString);
        paramBoolean = true;
      }
      catch (UnsatisfiedLinkError localUnsatisfiedLinkError3)
      {
        HashMap localHashMap;
        File localFile;
        for (;;) {}
      }
      if (!paramBoolean)
      {
        QLog.e("AVModuleExtract", 1, "LoadExtractedSo failed: " + paramString);
        localHashMap = new HashMap();
        localHashMap.put("soname", paramString);
        StatisticCollector.a(paramContext).a("", "AV_LOAD_SO_FAILED", false, 0L, 0L, localHashMap, "");
      }
      return paramBoolean;
    }
  }
  
  private static long b()
  {
    long l2 = BaseApplicationImpl.a.getSharedPreferences("so_sp", 0).getLong("first_qq_lauch_201932", 0L);
    long l1 = l2;
    if (l2 == 0L) {
      l1 = BaseApplicationImpl.c;
    }
    return l1;
  }
  
  private static String b()
  {
    return "lib/armeabi/";
  }
  
  private static void b()
  {
    Object localObject = BaseApplicationImpl.a.getSharedPreferences("so_sp", 0);
    if (QLog.isColorLevel()) {
      QLog.d("AVModuleExtract", 2, "setQQFirstLauchTime:" + BaseApplicationImpl.c);
    }
    localObject = ((SharedPreferences)localObject).edit();
    if (BaseApplicationImpl.c > 0L) {}
    for (long l = BaseApplicationImpl.c;; l = SystemClock.uptimeMillis())
    {
      ((SharedPreferences.Editor)localObject).putLong("first_qq_lauch_201932", l).commit();
      return;
    }
  }
  
  public static boolean b(Context paramContext)
  {
    return (a(paramContext, "TcVpxDec")) && (a(paramContext, "TcVpxEnc"));
  }
  
  /* Error */
  public static boolean b(Context paramContext, String paramString, boolean paramBoolean)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: iconst_0
    //   4: istore 6
    //   6: iconst_0
    //   7: istore 7
    //   9: aload_0
    //   10: ldc 11
    //   12: iconst_0
    //   13: invokevirtual 42	android/content/Context:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   16: astore 25
    //   18: ldc -18
    //   20: invokestatic 244	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   23: invokevirtual 248	java/lang/Integer:intValue	()I
    //   26: istore_3
    //   27: new 87	java/lang/StringBuilder
    //   30: dup
    //   31: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   34: ldc 14
    //   36: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: aload_1
    //   40: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   46: astore 26
    //   48: aload 25
    //   50: aload 26
    //   52: iconst_m1
    //   53: invokeinterface 252 3 0
    //   58: istore 4
    //   60: invokestatic 77	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   63: ifeq +49 -> 112
    //   66: ldc 8
    //   68: iconst_2
    //   69: new 87	java/lang/StringBuilder
    //   72: dup
    //   73: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   76: ldc -2
    //   78: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: aload_1
    //   82: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: ldc_w 256
    //   88: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   91: iload 4
    //   93: invokevirtual 259	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   96: ldc_w 261
    //   99: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   102: iload_3
    //   103: invokevirtual 259	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   106: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   109: invokestatic 83	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   112: invokestatic 162	com/tencent/mobileqq/startup/step/UpdateAvSo:a	()Ljava/lang/String;
    //   115: astore 28
    //   117: aload 28
    //   119: invokestatic 267	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   122: istore 5
    //   124: iload 5
    //   126: ifeq +17 -> 143
    //   129: iconst_0
    //   130: istore_2
    //   131: ldc 2
    //   133: monitorexit
    //   134: iload_2
    //   135: ireturn
    //   136: astore 14
    //   138: iconst_0
    //   139: istore_3
    //   140: goto -113 -> 27
    //   143: new 90	java/io/File
    //   146: dup
    //   147: new 87	java/lang/StringBuilder
    //   150: dup
    //   151: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   154: aload 28
    //   156: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   159: aload_1
    //   160: invokestatic 157	com/tencent/mobileqq/startup/step/UpdateAvSo:a	(Ljava/lang/String;)Ljava/lang/String;
    //   163: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   169: invokespecial 160	java/io/File:<init>	(Ljava/lang/String;)V
    //   172: astore 27
    //   174: iload 4
    //   176: iload_3
    //   177: if_icmpne +16 -> 193
    //   180: aload 27
    //   182: invokevirtual 165	java/io/File:exists	()Z
    //   185: ifeq +8 -> 193
    //   188: iconst_1
    //   189: istore_2
    //   190: goto -59 -> 131
    //   193: invokestatic 31	android/os/SystemClock:uptimeMillis	()J
    //   196: lstore 12
    //   198: aload 27
    //   200: invokevirtual 214	java/io/File:delete	()Z
    //   203: pop
    //   204: iload 7
    //   206: istore 5
    //   208: aload 27
    //   210: invokevirtual 165	java/io/File:exists	()Z
    //   213: ifne +88 -> 301
    //   216: iload_2
    //   217: ifeq +202 -> 419
    //   220: aload_0
    //   221: aload 28
    //   223: ldc_w 269
    //   226: aload_1
    //   227: invokestatic 157	com/tencent/mobileqq/startup/step/UpdateAvSo:a	(Ljava/lang/String;)Ljava/lang/String;
    //   230: invokestatic 274	com/tencent/mobileqq/utils/SoLoadUtil:a	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    //   233: istore 4
    //   235: iload 7
    //   237: istore 5
    //   239: aload 27
    //   241: invokevirtual 165	java/io/File:exists	()Z
    //   244: ifeq +57 -> 301
    //   247: iload 4
    //   249: ifeq +118 -> 367
    //   252: aload 27
    //   254: invokevirtual 214	java/io/File:delete	()Z
    //   257: pop
    //   258: new 87	java/lang/StringBuilder
    //   261: dup
    //   262: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   265: ldc 85
    //   267: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   270: ldc_w 276
    //   273: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   276: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   279: astore_0
    //   280: iconst_0
    //   281: istore_2
    //   282: iload_2
    //   283: istore 5
    //   285: invokestatic 77	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   288: ifeq +13 -> 301
    //   291: ldc 8
    //   293: iconst_2
    //   294: aload_0
    //   295: invokestatic 187	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   298: iload_2
    //   299: istore 5
    //   301: invokestatic 31	android/os/SystemClock:uptimeMillis	()J
    //   304: lstore 8
    //   306: iload 5
    //   308: istore_2
    //   309: invokestatic 77	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   312: ifeq -181 -> 131
    //   315: ldc 8
    //   317: iconst_2
    //   318: new 87	java/lang/StringBuilder
    //   321: dup
    //   322: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   325: ldc_w 278
    //   328: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   331: aload_1
    //   332: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   335: ldc_w 280
    //   338: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   341: lload 8
    //   343: lload 12
    //   345: lsub
    //   346: invokevirtual 226	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   349: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   352: invokestatic 187	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   355: iload 5
    //   357: istore_2
    //   358: goto -227 -> 131
    //   361: astore_0
    //   362: ldc 2
    //   364: monitorexit
    //   365: aload_0
    //   366: athrow
    //   367: iload_3
    //   368: ifne +27 -> 395
    //   371: aload 25
    //   373: invokeinterface 54 1 0
    //   378: aload 26
    //   380: iconst_m1
    //   381: invokeinterface 284 3 0
    //   386: invokeinterface 64 1 0
    //   391: pop
    //   392: goto +1033 -> 1425
    //   395: aload 25
    //   397: invokeinterface 54 1 0
    //   402: aload 26
    //   404: iload_3
    //   405: invokeinterface 284 3 0
    //   410: invokeinterface 64 1 0
    //   415: pop
    //   416: goto +1009 -> 1425
    //   419: aconst_null
    //   420: astore 21
    //   422: aconst_null
    //   423: astore 22
    //   425: aconst_null
    //   426: astore 23
    //   428: aconst_null
    //   429: astore 15
    //   431: aconst_null
    //   432: astore 20
    //   434: aconst_null
    //   435: astore 17
    //   437: aconst_null
    //   438: astore 24
    //   440: aconst_null
    //   441: astore 14
    //   443: aload 24
    //   445: astore 18
    //   447: aload 15
    //   449: astore 16
    //   451: aload 22
    //   453: astore 19
    //   455: new 90	java/io/File
    //   458: dup
    //   459: aload 28
    //   461: invokespecial 160	java/io/File:<init>	(Ljava/lang/String;)V
    //   464: astore 29
    //   466: aload 24
    //   468: astore 18
    //   470: aload 15
    //   472: astore 16
    //   474: aload 22
    //   476: astore 19
    //   478: aload 29
    //   480: invokevirtual 165	java/io/File:exists	()Z
    //   483: ifne +30 -> 513
    //   486: aload 24
    //   488: astore 18
    //   490: aload 15
    //   492: astore 16
    //   494: aload 22
    //   496: astore 19
    //   498: aload 29
    //   500: invokevirtual 287	java/io/File:mkdir	()Z
    //   503: istore 5
    //   505: iload 6
    //   507: istore_2
    //   508: iload 5
    //   510: ifeq +531 -> 1041
    //   513: aload 24
    //   515: astore 18
    //   517: aload 15
    //   519: astore 16
    //   521: aload 22
    //   523: astore 19
    //   525: aload_0
    //   526: invokevirtual 291	android/content/Context:getAssets	()Landroid/content/res/AssetManager;
    //   529: new 87	java/lang/StringBuilder
    //   532: dup
    //   533: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   536: invokestatic 293	com/tencent/mobileqq/startup/step/UpdateAvSo:b	()Ljava/lang/String;
    //   539: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   542: aload_1
    //   543: invokestatic 157	com/tencent/mobileqq/startup/step/UpdateAvSo:a	(Ljava/lang/String;)Ljava/lang/String;
    //   546: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   549: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   552: invokevirtual 299	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   555: astore 15
    //   557: aload 23
    //   559: astore_0
    //   560: aload 15
    //   562: ifnull +46 -> 608
    //   565: aload 14
    //   567: astore 18
    //   569: aload 15
    //   571: astore 16
    //   573: aload 22
    //   575: astore 19
    //   577: new 301	java/io/FileOutputStream
    //   580: dup
    //   581: new 87	java/lang/StringBuilder
    //   584: dup
    //   585: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   588: aload 28
    //   590: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   593: aload_1
    //   594: invokestatic 157	com/tencent/mobileqq/startup/step/UpdateAvSo:a	(Ljava/lang/String;)Ljava/lang/String;
    //   597: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   600: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   603: iconst_1
    //   604: invokespecial 304	java/io/FileOutputStream:<init>	(Ljava/lang/String;Z)V
    //   607: astore_0
    //   608: lconst_0
    //   609: lstore 8
    //   611: aload 14
    //   613: astore 18
    //   615: aload 15
    //   617: astore 16
    //   619: aload_0
    //   620: astore 19
    //   622: sipush 8192
    //   625: newarray byte
    //   627: astore 17
    //   629: lload 8
    //   631: lstore 10
    //   633: aload 15
    //   635: ifnull +185 -> 820
    //   638: aload 14
    //   640: astore 18
    //   642: aload 15
    //   644: astore 16
    //   646: aload_0
    //   647: astore 19
    //   649: aload 15
    //   651: aload 17
    //   653: iconst_0
    //   654: aload 17
    //   656: arraylength
    //   657: invokevirtual 310	java/io/InputStream:read	([BII)I
    //   660: istore 4
    //   662: lload 8
    //   664: lstore 10
    //   666: iload 4
    //   668: iconst_m1
    //   669: if_icmpeq +151 -> 820
    //   672: aload 14
    //   674: astore 18
    //   676: aload 15
    //   678: astore 16
    //   680: aload_0
    //   681: astore 19
    //   683: aload_0
    //   684: aload 17
    //   686: iconst_0
    //   687: iload 4
    //   689: invokevirtual 316	java/io/OutputStream:write	([BII)V
    //   692: lload 8
    //   694: iload 4
    //   696: i2l
    //   697: ladd
    //   698: lstore 8
    //   700: goto -71 -> 629
    //   703: astore 15
    //   705: aconst_null
    //   706: astore 16
    //   708: aload 24
    //   710: astore 18
    //   712: aload 22
    //   714: astore 19
    //   716: aload_0
    //   717: invokevirtual 291	android/content/Context:getAssets	()Landroid/content/res/AssetManager;
    //   720: new 87	java/lang/StringBuilder
    //   723: dup
    //   724: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   727: invokestatic 293	com/tencent/mobileqq/startup/step/UpdateAvSo:b	()Ljava/lang/String;
    //   730: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   733: aload_1
    //   734: invokestatic 157	com/tencent/mobileqq/startup/step/UpdateAvSo:a	(Ljava/lang/String;)Ljava/lang/String;
    //   737: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   740: ldc_w 318
    //   743: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   746: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   749: invokevirtual 299	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   752: astore 17
    //   754: aload 17
    //   756: astore 15
    //   758: aload 17
    //   760: ifnull -203 -> 557
    //   763: aload 24
    //   765: astore 18
    //   767: aload 17
    //   769: astore 16
    //   771: aload 22
    //   773: astore 19
    //   775: aload_0
    //   776: invokevirtual 291	android/content/Context:getAssets	()Landroid/content/res/AssetManager;
    //   779: new 87	java/lang/StringBuilder
    //   782: dup
    //   783: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   786: invokestatic 293	com/tencent/mobileqq/startup/step/UpdateAvSo:b	()Ljava/lang/String;
    //   789: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   792: aload_1
    //   793: invokestatic 157	com/tencent/mobileqq/startup/step/UpdateAvSo:a	(Ljava/lang/String;)Ljava/lang/String;
    //   796: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   799: ldc_w 320
    //   802: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   805: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   808: invokevirtual 299	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   811: astore 14
    //   813: aload 17
    //   815: astore 15
    //   817: goto -260 -> 557
    //   820: aload 14
    //   822: ifnull +64 -> 886
    //   825: aload 14
    //   827: astore 18
    //   829: aload 15
    //   831: astore 16
    //   833: aload_0
    //   834: astore 19
    //   836: aload 14
    //   838: aload 17
    //   840: iconst_0
    //   841: aload 17
    //   843: arraylength
    //   844: invokevirtual 310	java/io/InputStream:read	([BII)I
    //   847: istore 4
    //   849: iload 4
    //   851: iconst_m1
    //   852: if_icmpeq +34 -> 886
    //   855: aload 14
    //   857: astore 18
    //   859: aload 15
    //   861: astore 16
    //   863: aload_0
    //   864: astore 19
    //   866: aload_0
    //   867: aload 17
    //   869: iconst_0
    //   870: iload 4
    //   872: invokevirtual 316	java/io/OutputStream:write	([BII)V
    //   875: lload 10
    //   877: iload 4
    //   879: i2l
    //   880: ladd
    //   881: lstore 10
    //   883: goto -63 -> 820
    //   886: iload 6
    //   888: istore_2
    //   889: aload 14
    //   891: astore 17
    //   893: aload 15
    //   895: astore 20
    //   897: aload_0
    //   898: astore 21
    //   900: aload 14
    //   902: astore 18
    //   904: aload 15
    //   906: astore 16
    //   908: aload_0
    //   909: astore 19
    //   911: aload 27
    //   913: invokevirtual 165	java/io/File:exists	()Z
    //   916: ifeq +125 -> 1041
    //   919: aload 14
    //   921: astore 18
    //   923: aload 15
    //   925: astore 16
    //   927: aload_0
    //   928: astore 19
    //   930: lload 10
    //   932: aload 27
    //   934: invokevirtual 323	java/io/File:length	()J
    //   937: lcmp
    //   938: ifeq +149 -> 1087
    //   941: aload 14
    //   943: astore 18
    //   945: aload 15
    //   947: astore 16
    //   949: aload_0
    //   950: astore 19
    //   952: aload 27
    //   954: invokevirtual 214	java/io/File:delete	()Z
    //   957: pop
    //   958: aload 14
    //   960: astore 18
    //   962: aload 15
    //   964: astore 16
    //   966: aload_0
    //   967: astore 19
    //   969: new 87	java/lang/StringBuilder
    //   972: dup
    //   973: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   976: ldc 85
    //   978: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   981: ldc_w 276
    //   984: invokevirtual 97	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   987: invokevirtual 102	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   990: astore 20
    //   992: aload 14
    //   994: astore 18
    //   996: aload 15
    //   998: astore 16
    //   1000: aload_0
    //   1001: astore 19
    //   1003: invokestatic 77	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1006: ifeq +403 -> 1409
    //   1009: aload 14
    //   1011: astore 18
    //   1013: aload 15
    //   1015: astore 16
    //   1017: aload_0
    //   1018: astore 19
    //   1020: ldc 8
    //   1022: iconst_2
    //   1023: aload 20
    //   1025: invokestatic 187	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1028: iconst_0
    //   1029: istore_2
    //   1030: aload_0
    //   1031: astore 21
    //   1033: aload 15
    //   1035: astore 20
    //   1037: aload 14
    //   1039: astore 17
    //   1041: aload 21
    //   1043: ifnull +8 -> 1051
    //   1046: aload 21
    //   1048: invokevirtual 326	java/io/OutputStream:close	()V
    //   1051: aload 20
    //   1053: ifnull +8 -> 1061
    //   1056: aload 20
    //   1058: invokevirtual 327	java/io/InputStream:close	()V
    //   1061: iload_2
    //   1062: istore 5
    //   1064: aload 17
    //   1066: ifnull -765 -> 301
    //   1069: aload 17
    //   1071: invokevirtual 327	java/io/InputStream:close	()V
    //   1074: iload_2
    //   1075: istore 5
    //   1077: goto -776 -> 301
    //   1080: astore_0
    //   1081: iload_2
    //   1082: istore 5
    //   1084: goto -783 -> 301
    //   1087: iload_3
    //   1088: ifne +38 -> 1126
    //   1091: aload 14
    //   1093: astore 18
    //   1095: aload 15
    //   1097: astore 16
    //   1099: aload_0
    //   1100: astore 19
    //   1102: aload 25
    //   1104: invokeinterface 54 1 0
    //   1109: aload 26
    //   1111: iconst_m1
    //   1112: invokeinterface 284 3 0
    //   1117: invokeinterface 64 1 0
    //   1122: pop
    //   1123: goto +308 -> 1431
    //   1126: aload 14
    //   1128: astore 18
    //   1130: aload 15
    //   1132: astore 16
    //   1134: aload_0
    //   1135: astore 19
    //   1137: aload 25
    //   1139: invokeinterface 54 1 0
    //   1144: aload 26
    //   1146: iload_3
    //   1147: invokeinterface 284 3 0
    //   1152: invokeinterface 64 1 0
    //   1157: pop
    //   1158: goto +273 -> 1431
    //   1161: astore 18
    //   1163: aload 14
    //   1165: astore 16
    //   1167: aload 15
    //   1169: astore 14
    //   1171: ldc 85
    //   1173: astore 17
    //   1175: aload_0
    //   1176: astore 15
    //   1178: aload 16
    //   1180: astore_0
    //   1181: aload 18
    //   1183: astore 16
    //   1185: invokestatic 77	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1188: ifeq +13 -> 1201
    //   1191: ldc 8
    //   1193: iconst_2
    //   1194: aload 17
    //   1196: aload 16
    //   1198: invokestatic 330	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1201: aload 15
    //   1203: ifnull +8 -> 1211
    //   1206: aload 15
    //   1208: invokevirtual 326	java/io/OutputStream:close	()V
    //   1211: aload 14
    //   1213: ifnull +8 -> 1221
    //   1216: aload 14
    //   1218: invokevirtual 327	java/io/InputStream:close	()V
    //   1221: aload_0
    //   1222: ifnull +181 -> 1403
    //   1225: aload_0
    //   1226: invokevirtual 327	java/io/InputStream:close	()V
    //   1229: iconst_0
    //   1230: istore 5
    //   1232: goto -931 -> 301
    //   1235: astore_0
    //   1236: iconst_0
    //   1237: istore 5
    //   1239: goto -938 -> 301
    //   1242: astore_0
    //   1243: aload 19
    //   1245: astore 15
    //   1247: aload 15
    //   1249: ifnull +8 -> 1257
    //   1252: aload 15
    //   1254: invokevirtual 326	java/io/OutputStream:close	()V
    //   1257: aload 16
    //   1259: ifnull +8 -> 1267
    //   1262: aload 16
    //   1264: invokevirtual 327	java/io/InputStream:close	()V
    //   1267: aload 18
    //   1269: ifnull +8 -> 1277
    //   1272: aload 18
    //   1274: invokevirtual 327	java/io/InputStream:close	()V
    //   1277: aload_0
    //   1278: athrow
    //   1279: astore_0
    //   1280: goto -229 -> 1051
    //   1283: astore_0
    //   1284: goto -223 -> 1061
    //   1287: astore 15
    //   1289: goto -78 -> 1211
    //   1292: astore 14
    //   1294: goto -73 -> 1221
    //   1297: astore_1
    //   1298: goto -41 -> 1257
    //   1301: astore_1
    //   1302: goto -35 -> 1267
    //   1305: astore_1
    //   1306: goto -29 -> 1277
    //   1309: astore_1
    //   1310: aload_0
    //   1311: astore 18
    //   1313: aload_1
    //   1314: astore_0
    //   1315: aload 14
    //   1317: astore 16
    //   1319: goto -72 -> 1247
    //   1322: astore 16
    //   1324: aconst_null
    //   1325: astore_0
    //   1326: aconst_null
    //   1327: astore 14
    //   1329: aconst_null
    //   1330: astore 15
    //   1332: ldc 85
    //   1334: astore 17
    //   1336: goto -151 -> 1185
    //   1339: astore 16
    //   1341: aconst_null
    //   1342: astore_0
    //   1343: aload 17
    //   1345: astore 14
    //   1347: aconst_null
    //   1348: astore 15
    //   1350: ldc 85
    //   1352: astore 17
    //   1354: goto -169 -> 1185
    //   1357: astore 16
    //   1359: aload 14
    //   1361: astore_0
    //   1362: aload 15
    //   1364: astore 14
    //   1366: aconst_null
    //   1367: astore 15
    //   1369: ldc 85
    //   1371: astore 17
    //   1373: goto -188 -> 1185
    //   1376: astore 16
    //   1378: aload_0
    //   1379: astore 17
    //   1381: aload 20
    //   1383: astore 18
    //   1385: aload 14
    //   1387: astore_0
    //   1388: aload 15
    //   1390: astore 14
    //   1392: aload 17
    //   1394: astore 15
    //   1396: aload 18
    //   1398: astore 17
    //   1400: goto -215 -> 1185
    //   1403: iconst_0
    //   1404: istore 5
    //   1406: goto -1105 -> 301
    //   1409: iconst_0
    //   1410: istore_2
    //   1411: aload 14
    //   1413: astore 17
    //   1415: aload 15
    //   1417: astore 20
    //   1419: aload_0
    //   1420: astore 21
    //   1422: goto -381 -> 1041
    //   1425: iconst_1
    //   1426: istore 5
    //   1428: goto -1127 -> 301
    //   1431: iconst_1
    //   1432: istore_2
    //   1433: aload 14
    //   1435: astore 17
    //   1437: aload 15
    //   1439: astore 20
    //   1441: aload_0
    //   1442: astore 21
    //   1444: goto -403 -> 1041
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1447	0	paramContext	Context
    //   0	1447	1	paramString	String
    //   0	1447	2	paramBoolean	boolean
    //   26	1121	3	i	int
    //   58	820	4	j	int
    //   122	1305	5	bool1	boolean
    //   4	883	6	bool2	boolean
    //   7	229	7	bool3	boolean
    //   304	395	8	l1	long
    //   631	300	10	l2	long
    //   196	148	12	l3	long
    //   136	1	14	localNumberFormatException	NumberFormatException
    //   441	776	14	localObject1	Object
    //   1292	24	14	localIOException1	java.io.IOException
    //   1327	107	14	localObject2	Object
    //   429	248	15	localInputStream	java.io.InputStream
    //   703	1	15	localFileNotFoundException	java.io.FileNotFoundException
    //   756	497	15	localObject3	Object
    //   1287	1	15	localIOException2	java.io.IOException
    //   1330	108	15	localObject4	Object
    //   449	869	16	localObject5	Object
    //   1322	1	16	localIOException3	java.io.IOException
    //   1339	1	16	localIOException4	java.io.IOException
    //   1357	1	16	localIOException5	java.io.IOException
    //   1376	1	16	localIOException6	java.io.IOException
    //   435	1001	17	localObject6	Object
    //   445	684	18	localObject7	Object
    //   1161	112	18	localIOException7	java.io.IOException
    //   1311	86	18	localObject8	Object
    //   453	791	19	localObject9	Object
    //   432	1008	20	localObject10	Object
    //   420	1023	21	localContext	Context
    //   423	349	22	localObject11	Object
    //   426	132	23	localObject12	Object
    //   438	326	24	localObject13	Object
    //   16	1122	25	localSharedPreferences	SharedPreferences
    //   46	1099	26	str1	String
    //   172	781	27	localFile1	File
    //   115	474	28	str2	String
    //   464	35	29	localFile2	File
    // Exception table:
    //   from	to	target	type
    //   18	27	136	java/lang/NumberFormatException
    //   9	18	361	finally
    //   18	27	361	finally
    //   27	112	361	finally
    //   112	124	361	finally
    //   143	174	361	finally
    //   180	188	361	finally
    //   193	204	361	finally
    //   208	216	361	finally
    //   220	235	361	finally
    //   239	247	361	finally
    //   252	280	361	finally
    //   285	298	361	finally
    //   301	306	361	finally
    //   309	355	361	finally
    //   371	392	361	finally
    //   395	416	361	finally
    //   1046	1051	361	finally
    //   1056	1061	361	finally
    //   1069	1074	361	finally
    //   1206	1211	361	finally
    //   1216	1221	361	finally
    //   1225	1229	361	finally
    //   1252	1257	361	finally
    //   1262	1267	361	finally
    //   1272	1277	361	finally
    //   1277	1279	361	finally
    //   525	557	703	java/io/FileNotFoundException
    //   1069	1074	1080	java/io/IOException
    //   622	629	1161	java/io/IOException
    //   649	662	1161	java/io/IOException
    //   683	692	1161	java/io/IOException
    //   836	849	1161	java/io/IOException
    //   866	875	1161	java/io/IOException
    //   911	919	1161	java/io/IOException
    //   930	941	1161	java/io/IOException
    //   952	958	1161	java/io/IOException
    //   969	992	1161	java/io/IOException
    //   1102	1123	1161	java/io/IOException
    //   1137	1158	1161	java/io/IOException
    //   1225	1229	1235	java/io/IOException
    //   455	466	1242	finally
    //   478	486	1242	finally
    //   498	505	1242	finally
    //   525	557	1242	finally
    //   577	608	1242	finally
    //   622	629	1242	finally
    //   649	662	1242	finally
    //   683	692	1242	finally
    //   716	754	1242	finally
    //   775	813	1242	finally
    //   836	849	1242	finally
    //   866	875	1242	finally
    //   911	919	1242	finally
    //   930	941	1242	finally
    //   952	958	1242	finally
    //   969	992	1242	finally
    //   1003	1009	1242	finally
    //   1020	1028	1242	finally
    //   1102	1123	1242	finally
    //   1137	1158	1242	finally
    //   1046	1051	1279	java/io/IOException
    //   1056	1061	1283	java/io/IOException
    //   1206	1211	1287	java/io/IOException
    //   1216	1221	1292	java/io/IOException
    //   1252	1257	1297	java/io/IOException
    //   1262	1267	1301	java/io/IOException
    //   1272	1277	1305	java/io/IOException
    //   1185	1201	1309	finally
    //   455	466	1322	java/io/IOException
    //   478	486	1322	java/io/IOException
    //   498	505	1322	java/io/IOException
    //   525	557	1322	java/io/IOException
    //   716	754	1322	java/io/IOException
    //   775	813	1339	java/io/IOException
    //   577	608	1357	java/io/IOException
    //   1003	1009	1376	java/io/IOException
    //   1020	1028	1376	java/io/IOException
  }
  
  protected boolean a()
  {
    a();
    b();
    return true;
  }
}
