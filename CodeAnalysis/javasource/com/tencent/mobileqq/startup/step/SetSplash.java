package com.tencent.mobileqq.startup.step;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources.NotFoundException;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.startup.director.StartupDirector;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.util.CommonUtil;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import mqq.app.AppActivity;
import mqq.os.MqqHandler;
import ree;
import ref;

public class SetSplash
  extends Step
{
  public static final int a = 2200;
  static final long jdField_a_of_type_Long = 86400000L;
  static final String jdField_a_of_type_JavaLangString = "splashshowtime";
  public static final int b = 2201;
  static final int c = 3;
  
  public SetSplash() {}
  
  private static int a(String paramString)
  {
    int i = Calendar.getInstance().get(1);
    paramString = i + "-" + paramString;
    Object localObject = new SimpleDateFormat("yyyy-MM-dd");
    try
    {
      paramString = ((SimpleDateFormat)localObject).parse(paramString);
      localObject = Calendar.getInstance();
      ((Calendar)localObject).setTime(paramString);
      ((Calendar)localObject).set(11, 0);
      ((Calendar)localObject).set(12, 0);
      ((Calendar)localObject).set(13, 0);
      ((Calendar)localObject).set(14, 0);
      paramString = ((Calendar)localObject).getTime();
      localObject = Calendar.getInstance();
      ((Calendar)localObject).set(11, 0);
      ((Calendar)localObject).set(12, 0);
      ((Calendar)localObject).set(13, 0);
      ((Calendar)localObject).set(14, 0);
      localObject = ((Calendar)localObject).getTime();
      long l = (paramString.getTime() - ((Date)localObject).getTime()) / 86400000L;
      return (int)l;
    }
    catch (Exception paramString) {}
    return -1;
  }
  
  /* Error */
  public static long a(android.app.Activity paramActivity, StartupDirector paramStartupDirector)
  {
    // Byte code:
    //   0: aload_0
    //   1: instanceof 86
    //   4: ifeq +707 -> 711
    //   7: aload_0
    //   8: checkcast 86	com/tencent/mobileqq/app/IphoneTitleBarActivity
    //   11: ldc 87
    //   13: invokevirtual 91	com/tencent/mobileqq/app/IphoneTitleBarActivity:setContentViewNoTitle	(I)V
    //   16: aload_0
    //   17: ldc 92
    //   19: invokevirtual 98	android/app/Activity:findViewById	(I)Landroid/view/View;
    //   22: checkcast 100	android/widget/ImageView
    //   25: astore 21
    //   27: aload_0
    //   28: invokestatic 105	com/tencent/mobileqq/utils/SharedPreUtils:b	(Landroid/content/Context;)Ljava/lang/String;
    //   31: astore 17
    //   33: aload_0
    //   34: invokevirtual 109	android/app/Activity:getFilesDir	()Ljava/io/File;
    //   37: astore 18
    //   39: aload 18
    //   41: ifnull +705 -> 746
    //   44: aload 18
    //   46: invokevirtual 114	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   49: astore 19
    //   51: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   54: ifeq +29 -> 83
    //   57: ldc 122
    //   59: iconst_2
    //   60: new 37	java/lang/StringBuilder
    //   63: dup
    //   64: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   67: aload 17
    //   69: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   72: aload 18
    //   74: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   77: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   80: invokestatic 129	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   83: aload 18
    //   85: ifnull +1126 -> 1211
    //   88: aload 17
    //   90: ldc -125
    //   92: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   95: ifne +1116 -> 1211
    //   98: aload 17
    //   100: invokestatic 139	com/tencent/mobileqq/startup/step/SetSplash:a	(Ljava/lang/String;)I
    //   103: ifne +1108 -> 1211
    //   106: new 37	java/lang/StringBuilder
    //   109: dup
    //   110: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   113: aload 19
    //   115: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   118: ldc -115
    //   120: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   123: aload_0
    //   124: invokestatic 143	com/tencent/mobileqq/utils/SharedPreUtils:a	(Landroid/content/Context;)Ljava/lang/String;
    //   127: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   130: ldc -115
    //   132: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: ldc -111
    //   137: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   143: astore 17
    //   145: new 111	java/io/File
    //   148: dup
    //   149: aload 17
    //   151: invokespecial 146	java/io/File:<init>	(Ljava/lang/String;)V
    //   154: astore 18
    //   156: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   159: ifeq +37 -> 196
    //   162: ldc 122
    //   164: iconst_2
    //   165: new 37	java/lang/StringBuilder
    //   168: dup
    //   169: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   172: aload 17
    //   174: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   177: ldc -108
    //   179: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   182: aload 18
    //   184: invokevirtual 151	java/io/File:exists	()Z
    //   187: invokevirtual 154	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   190: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   193: invokestatic 157	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   196: aload 18
    //   198: invokevirtual 151	java/io/File:exists	()Z
    //   201: ifeq +1010 -> 1211
    //   204: new 159	android/graphics/drawable/BitmapDrawable
    //   207: dup
    //   208: aload_0
    //   209: invokevirtual 163	android/app/Activity:getResources	()Landroid/content/res/Resources;
    //   212: aload 17
    //   214: invokestatic 168	com/tencent/mobileqq/util/BitmapManager:a	(Ljava/lang/String;)Landroid/graphics/Bitmap;
    //   217: invokespecial 171	android/graphics/drawable/BitmapDrawable:<init>	(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    //   220: astore 17
    //   222: aload_1
    //   223: ifnull +10 -> 233
    //   226: aload_1
    //   227: ldc2_w 172
    //   230: putfield 177	com/tencent/mobileqq/startup/director/StartupDirector:b	J
    //   233: aload 17
    //   235: ifnull +969 -> 1204
    //   238: invokestatic 179	com/tencent/mobileqq/startup/step/SetSplash:a	()V
    //   241: aload 17
    //   243: astore 18
    //   245: aload 18
    //   247: astore 17
    //   249: aload 18
    //   251: ifnonnull +25 -> 276
    //   254: aload 18
    //   256: astore 17
    //   258: invokestatic 185	com/tencent/common/app/BaseApplicationImpl:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   261: invokestatic 188	com/tencent/mobileqq/startup/step/SetSplash:a	(Landroid/content/Context;)Z
    //   264: ifeq +12 -> 276
    //   267: invokestatic 185	com/tencent/common/app/BaseApplicationImpl:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   270: aload_1
    //   271: invokestatic 191	com/tencent/mobileqq/startup/step/SetSplash:a	(Landroid/content/Context;Lcom/tencent/mobileqq/startup/director/StartupDirector;)Landroid/graphics/drawable/AnimationDrawable;
    //   274: astore 17
    //   276: aload 17
    //   278: astore 18
    //   280: aload 17
    //   282: ifnonnull +916 -> 1198
    //   285: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   288: ifeq +11 -> 299
    //   291: ldc -63
    //   293: iconst_2
    //   294: ldc -61
    //   296: invokestatic 129	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   299: new 37	java/lang/StringBuilder
    //   302: dup
    //   303: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   306: aload 19
    //   308: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   311: ldc -115
    //   313: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   316: ldc -59
    //   318: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   321: ldc -115
    //   323: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   326: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   329: astore 22
    //   331: new 111	java/io/File
    //   334: dup
    //   335: new 37	java/lang/StringBuilder
    //   338: dup
    //   339: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   342: aload 19
    //   344: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   347: ldc -115
    //   349: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   352: ldc -59
    //   354: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   357: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   360: invokespecial 146	java/io/File:<init>	(Ljava/lang/String;)V
    //   363: astore 23
    //   365: aconst_null
    //   366: astore 20
    //   368: aconst_null
    //   369: astore 18
    //   371: aload 20
    //   373: astore 19
    //   375: aload 23
    //   377: ifnull +485 -> 862
    //   380: aload 20
    //   382: astore 19
    //   384: aload 23
    //   386: invokevirtual 151	java/io/File:exists	()Z
    //   389: ifeq +473 -> 862
    //   392: aload 20
    //   394: astore 19
    //   396: aload 23
    //   398: invokevirtual 200	java/io/File:isDirectory	()Z
    //   401: ifeq +461 -> 862
    //   404: aload 23
    //   406: invokevirtual 204	java/io/File:listFiles	()[Ljava/io/File;
    //   409: astore 23
    //   411: aload 23
    //   413: arraylength
    //   414: istore_3
    //   415: lconst_0
    //   416: lstore 11
    //   418: lconst_0
    //   419: lstore 9
    //   421: iconst_0
    //   422: istore_2
    //   423: aload 18
    //   425: astore 19
    //   427: iload_2
    //   428: iload_3
    //   429: if_icmpge +433 -> 862
    //   432: aload 23
    //   434: iload_2
    //   435: aaload
    //   436: astore 24
    //   438: aload 18
    //   440: astore 20
    //   442: lload 11
    //   444: lstore 13
    //   446: lload 9
    //   448: lstore 15
    //   450: aload 24
    //   452: ifnull +240 -> 692
    //   455: aload 24
    //   457: invokevirtual 207	java/io/File:getName	()Ljava/lang/String;
    //   460: astore 25
    //   462: aload 25
    //   464: ldc -47
    //   466: invokevirtual 213	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   469: astore 26
    //   471: aload 18
    //   473: astore 20
    //   475: lload 11
    //   477: lstore 13
    //   479: lload 9
    //   481: lstore 15
    //   483: aload 26
    //   485: ifnull +207 -> 692
    //   488: aload 18
    //   490: astore 20
    //   492: lload 11
    //   494: lstore 13
    //   496: lload 9
    //   498: lstore 15
    //   500: aload 26
    //   502: arraylength
    //   503: iconst_3
    //   504: if_icmpne +188 -> 692
    //   507: aload 26
    //   509: iconst_0
    //   510: aaload
    //   511: astore 19
    //   513: lload 11
    //   515: lstore 5
    //   517: lload 9
    //   519: lstore 7
    //   521: aload 19
    //   523: ifnull +60 -> 583
    //   526: lload 11
    //   528: lstore 5
    //   530: lload 9
    //   532: lstore 7
    //   534: aload 19
    //   536: invokevirtual 216	java/lang/String:trim	()Ljava/lang/String;
    //   539: ldc -125
    //   541: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   544: ifne +39 -> 583
    //   547: aload 19
    //   549: ldc -38
    //   551: invokevirtual 221	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   554: istore 4
    //   556: aload 19
    //   558: iconst_0
    //   559: iload 4
    //   561: invokevirtual 225	java/lang/String:substring	(II)Ljava/lang/String;
    //   564: invokestatic 231	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   567: lstore 7
    //   569: aload 19
    //   571: iload 4
    //   573: iconst_1
    //   574: iadd
    //   575: invokevirtual 234	java/lang/String:substring	(I)Ljava/lang/String;
    //   578: invokestatic 231	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   581: lstore 5
    //   583: lload 7
    //   585: lload 5
    //   587: invokestatic 239	com/tencent/mobileqq/util/CommonUtil:a	(JJ)Z
    //   590: ifeq +205 -> 795
    //   593: aload 18
    //   595: astore 19
    //   597: aload 18
    //   599: ifnonnull +34 -> 633
    //   602: new 111	java/io/File
    //   605: dup
    //   606: new 37	java/lang/StringBuilder
    //   609: dup
    //   610: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   613: aload 22
    //   615: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   618: aload 26
    //   620: iconst_1
    //   621: aaload
    //   622: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   625: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   628: invokespecial 146	java/io/File:<init>	(Ljava/lang/String;)V
    //   631: astore 19
    //   633: aload 19
    //   635: astore 20
    //   637: lload 5
    //   639: lstore 13
    //   641: lload 7
    //   643: lstore 15
    //   645: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   648: ifeq +44 -> 692
    //   651: ldc -63
    //   653: iconst_2
    //   654: new 37	java/lang/StringBuilder
    //   657: dup
    //   658: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   661: ldc -15
    //   663: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   666: aload 24
    //   668: invokevirtual 114	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   671: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   674: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   677: invokestatic 129	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   680: lload 7
    //   682: lstore 15
    //   684: lload 5
    //   686: lstore 13
    //   688: aload 19
    //   690: astore 20
    //   692: iload_2
    //   693: iconst_1
    //   694: iadd
    //   695: istore_2
    //   696: aload 20
    //   698: astore 18
    //   700: lload 13
    //   702: lstore 11
    //   704: lload 15
    //   706: lstore 9
    //   708: goto -285 -> 423
    //   711: aload_0
    //   712: ldc 87
    //   714: invokevirtual 244	android/app/Activity:setContentView	(I)V
    //   717: goto -701 -> 16
    //   720: astore_1
    //   721: aload_1
    //   722: invokestatic 250	android/util/Log:getStackTraceString	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   725: astore_1
    //   726: ldc -4
    //   728: iconst_1
    //   729: aload_1
    //   730: invokestatic 157	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   733: aload_0
    //   734: ldc -2
    //   736: aload_1
    //   737: invokestatic 259	com/tencent/mobileqq/app/InjectUtils:a	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    //   740: aload_0
    //   741: invokevirtual 262	android/app/Activity:finish	()V
    //   744: lconst_0
    //   745: lreturn
    //   746: ldc_w 264
    //   749: astore 19
    //   751: goto -700 -> 51
    //   754: astore 18
    //   756: aconst_null
    //   757: astore 17
    //   759: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   762: ifeq +14 -> 776
    //   765: ldc 122
    //   767: iconst_2
    //   768: ldc_w 266
    //   771: aload 18
    //   773: invokestatic 269	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   776: aload 18
    //   778: invokevirtual 272	java/lang/Throwable:printStackTrace	()V
    //   781: goto -548 -> 233
    //   784: astore 19
    //   786: lconst_0
    //   787: lstore 7
    //   789: lconst_0
    //   790: lstore 5
    //   792: goto -209 -> 583
    //   795: aload 18
    //   797: astore 19
    //   799: lload 5
    //   801: invokestatic 277	java/lang/System:currentTimeMillis	()J
    //   804: lcmp
    //   805: ifge -172 -> 633
    //   808: new 111	java/io/File
    //   811: dup
    //   812: new 37	java/lang/StringBuilder
    //   815: dup
    //   816: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   819: aload 22
    //   821: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   824: aload 25
    //   826: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   829: invokevirtual 51	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   832: invokespecial 146	java/io/File:<init>	(Ljava/lang/String;)V
    //   835: astore 20
    //   837: aload 18
    //   839: astore 19
    //   841: aload 20
    //   843: invokevirtual 151	java/io/File:exists	()Z
    //   846: ifeq -213 -> 633
    //   849: aload 20
    //   851: invokevirtual 280	java/io/File:delete	()Z
    //   854: pop
    //   855: aload 18
    //   857: astore 19
    //   859: goto -226 -> 633
    //   862: aload 17
    //   864: astore 18
    //   866: aload 19
    //   868: ifnull +330 -> 1198
    //   871: aload 17
    //   873: astore 18
    //   875: aload 19
    //   877: invokevirtual 151	java/io/File:exists	()Z
    //   880: ifeq +318 -> 1198
    //   883: aload 17
    //   885: astore 18
    //   887: aload 19
    //   889: invokevirtual 283	java/io/File:isFile	()Z
    //   892: ifeq +306 -> 1198
    //   895: new 159	android/graphics/drawable/BitmapDrawable
    //   898: dup
    //   899: aload_0
    //   900: invokevirtual 163	android/app/Activity:getResources	()Landroid/content/res/Resources;
    //   903: aload 19
    //   905: invokevirtual 114	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   908: invokestatic 168	com/tencent/mobileqq/util/BitmapManager:a	(Ljava/lang/String;)Landroid/graphics/Bitmap;
    //   911: invokespecial 171	android/graphics/drawable/BitmapDrawable:<init>	(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    //   914: astore 18
    //   916: aload_1
    //   917: ifnull +10 -> 927
    //   920: aload_1
    //   921: ldc2_w 284
    //   924: putfield 177	com/tencent/mobileqq/startup/director/StartupDirector:b	J
    //   927: aload 18
    //   929: astore_1
    //   930: aload_1
    //   931: astore 18
    //   933: aload_1
    //   934: ifnull +264 -> 1198
    //   937: invokestatic 179	com/tencent/mobileqq/startup/step/SetSplash:a	()V
    //   940: aload_1
    //   941: ifnonnull +203 -> 1144
    //   944: new 159	android/graphics/drawable/BitmapDrawable
    //   947: dup
    //   948: aload_0
    //   949: invokevirtual 163	android/app/Activity:getResources	()Landroid/content/res/Resources;
    //   952: aload_0
    //   953: invokevirtual 289	android/app/Activity:getAssets	()Landroid/content/res/AssetManager;
    //   956: ldc_w 291
    //   959: invokevirtual 297	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   962: invokespecial 300	android/graphics/drawable/BitmapDrawable:<init>	(Landroid/content/res/Resources;Ljava/io/InputStream;)V
    //   965: astore 17
    //   967: aload 17
    //   969: astore_1
    //   970: aload_1
    //   971: ifnull +34 -> 1005
    //   974: aload 21
    //   976: aload_1
    //   977: invokevirtual 304	android/widget/ImageView:setImageDrawable	(Landroid/graphics/drawable/Drawable;)V
    //   980: aload_1
    //   981: instanceof 306
    //   984: ifeq +21 -> 1005
    //   987: aload_1
    //   988: checkcast 306	android/graphics/drawable/AnimationDrawable
    //   991: astore_1
    //   992: aload_1
    //   993: ifnull +12 -> 1005
    //   996: aload_1
    //   997: iconst_0
    //   998: invokevirtual 310	android/graphics/drawable/AnimationDrawable:setOneShot	(Z)V
    //   1001: aload_1
    //   1002: invokevirtual 313	android/graphics/drawable/AnimationDrawable:start	()V
    //   1005: aload 21
    //   1007: invokevirtual 317	android/widget/ImageView:getDrawable	()Landroid/graphics/drawable/Drawable;
    //   1010: astore_1
    //   1011: aload_1
    //   1012: ifnull +96 -> 1108
    //   1015: aload_1
    //   1016: instanceof 159
    //   1019: ifne +17 -> 1036
    //   1022: aload_1
    //   1023: instanceof 319
    //   1026: ifne +10 -> 1036
    //   1029: aload_1
    //   1030: instanceof 306
    //   1033: ifeq +75 -> 1108
    //   1036: aload_0
    //   1037: invokevirtual 163	android/app/Activity:getResources	()Landroid/content/res/Resources;
    //   1040: invokevirtual 325	android/content/res/Resources:getDisplayMetrics	()Landroid/util/DisplayMetrics;
    //   1043: getfield 330	android/util/DisplayMetrics:widthPixels	I
    //   1046: istore_2
    //   1047: aload_0
    //   1048: invokevirtual 163	android/app/Activity:getResources	()Landroid/content/res/Resources;
    //   1051: invokevirtual 325	android/content/res/Resources:getDisplayMetrics	()Landroid/util/DisplayMetrics;
    //   1054: getfield 333	android/util/DisplayMetrics:heightPixels	I
    //   1057: istore_3
    //   1058: aload_1
    //   1059: invokevirtual 339	android/graphics/drawable/Drawable:getIntrinsicHeight	()I
    //   1062: iload_2
    //   1063: imul
    //   1064: aload_1
    //   1065: invokevirtual 342	android/graphics/drawable/Drawable:getIntrinsicWidth	()I
    //   1068: idiv
    //   1069: istore 4
    //   1071: aload 21
    //   1073: invokevirtual 346	android/widget/ImageView:getLayoutParams	()Landroid/view/ViewGroup$LayoutParams;
    //   1076: astore_0
    //   1077: aload_0
    //   1078: iload_2
    //   1079: putfield 351	android/view/ViewGroup$LayoutParams:width	I
    //   1082: aload_0
    //   1083: iload 4
    //   1085: putfield 354	android/view/ViewGroup$LayoutParams:height	I
    //   1088: aload 21
    //   1090: aload_0
    //   1091: invokevirtual 358	android/widget/ImageView:setLayoutParams	(Landroid/view/ViewGroup$LayoutParams;)V
    //   1094: iload 4
    //   1096: iload_3
    //   1097: if_icmpgt +63 -> 1160
    //   1100: aload 21
    //   1102: getstatic 364	android/widget/ImageView$ScaleType:FIT_XY	Landroid/widget/ImageView$ScaleType;
    //   1105: invokevirtual 368	android/widget/ImageView:setScaleType	(Landroid/widget/ImageView$ScaleType;)V
    //   1108: lconst_0
    //   1109: lreturn
    //   1110: astore 18
    //   1112: aload 17
    //   1114: astore_1
    //   1115: aload 18
    //   1117: astore 17
    //   1119: ldc 122
    //   1121: iconst_1
    //   1122: ldc -125
    //   1124: aload 17
    //   1126: invokestatic 269	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1129: goto -199 -> 930
    //   1132: astore 17
    //   1134: ldc 122
    //   1136: iconst_1
    //   1137: ldc -125
    //   1139: aload 17
    //   1141: invokestatic 269	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1144: goto -174 -> 970
    //   1147: astore_1
    //   1148: ldc 122
    //   1150: iconst_1
    //   1151: ldc -125
    //   1153: aload_1
    //   1154: invokestatic 269	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1157: goto -152 -> 1005
    //   1160: iload 4
    //   1162: iload_3
    //   1163: if_icmple -55 -> 1108
    //   1166: aload 21
    //   1168: getstatic 371	android/widget/ImageView$ScaleType:CENTER_CROP	Landroid/widget/ImageView$ScaleType;
    //   1171: invokevirtual 368	android/widget/ImageView:setScaleType	(Landroid/widget/ImageView$ScaleType;)V
    //   1174: goto -66 -> 1108
    //   1177: astore_0
    //   1178: aload_0
    //   1179: invokevirtual 272	java/lang/Throwable:printStackTrace	()V
    //   1182: goto -74 -> 1108
    //   1185: astore 17
    //   1187: aload 18
    //   1189: astore_1
    //   1190: goto -71 -> 1119
    //   1193: astore 18
    //   1195: goto -436 -> 759
    //   1198: aload 18
    //   1200: astore_1
    //   1201: goto -261 -> 940
    //   1204: aload 17
    //   1206: astore 18
    //   1208: goto -963 -> 245
    //   1211: aconst_null
    //   1212: astore 18
    //   1214: goto -969 -> 245
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1217	0	paramActivity	android.app.Activity
    //   0	1217	1	paramStartupDirector	StartupDirector
    //   422	657	2	i	int
    //   414	750	3	j	int
    //   554	610	4	k	int
    //   515	285	5	l1	long
    //   519	269	7	l2	long
    //   419	288	9	l3	long
    //   416	287	11	l4	long
    //   444	257	13	l5	long
    //   448	257	15	l6	long
    //   31	1094	17	localObject1	Object
    //   1132	8	17	localThrowable1	Throwable
    //   1185	20	17	localThrowable2	Throwable
    //   37	662	18	localObject2	Object
    //   754	102	18	localThrowable3	Throwable
    //   864	68	18	localObject3	Object
    //   1110	78	18	localThrowable4	Throwable
    //   1193	6	18	localThrowable5	Throwable
    //   1206	7	18	localThrowable6	Throwable
    //   49	701	19	localObject4	Object
    //   784	1	19	localException	Exception
    //   797	107	19	localThrowable7	Throwable
    //   366	484	20	localObject5	Object
    //   25	1142	21	localImageView	android.widget.ImageView
    //   329	491	22	str1	String
    //   363	70	23	localObject6	Object
    //   436	231	24	localObject7	Object
    //   460	365	25	str2	String
    //   469	150	26	arrayOfString	String[]
    // Exception table:
    //   from	to	target	type
    //   0	16	720	android/content/res/Resources$NotFoundException
    //   711	717	720	android/content/res/Resources$NotFoundException
    //   204	222	754	java/lang/Throwable
    //   547	583	784	java/lang/Exception
    //   895	916	1110	java/lang/Throwable
    //   944	967	1132	java/lang/Throwable
    //   987	992	1147	java/lang/Throwable
    //   996	1005	1147	java/lang/Throwable
    //   1005	1011	1177	java/lang/Throwable
    //   1015	1036	1177	java/lang/Throwable
    //   1036	1094	1177	java/lang/Throwable
    //   1100	1108	1177	java/lang/Throwable
    //   1166	1174	1177	java/lang/Throwable
    //   920	927	1185	java/lang/Throwable
    //   226	233	1193	java/lang/Throwable
  }
  
  private static AnimationDrawable a(Context paramContext, StartupDirector paramStartupDirector)
  {
    for (;;)
    {
      int k;
      int m;
      int n;
      try
      {
        Object localObject1 = PreferenceManager.getDefaultSharedPreferences(paramContext);
        String str = ((SharedPreferences)localObject1).getString("dynamic_splash_config_md5", null);
        k = ((SharedPreferences)localObject1).getInt("dynamic_splash_config_play_times", -1);
        m = ((SharedPreferences)localObject1).getInt("dynamic_splash_config_play_internal", -1);
        if ((!TextUtils.isEmpty(str)) && (k > 0) && (m > 0))
        {
          localObject1 = BaseApplicationImpl.getContext().getFilesDir().getAbsolutePath() + "/" + "dynamicSplash";
          str = (String)localObject1 + "/" + str;
          localObject1 = new File(str);
          if ((((File)localObject1).exists()) && (((File)localObject1).isDirectory()))
          {
            localObject1 = ((File)localObject1).listFiles();
            if (localObject1 == null) {
              return null;
            }
            n = localObject1.length - 1;
            if (n <= 0) {
              return null;
            }
            localObject1 = new AnimationDrawable();
            BitmapFactory.Options localOptions = new BitmapFactory.Options();
            inPreferredConfig = Bitmap.Config.RGB_565;
            j = 0;
            i = 1;
            if (i > n) {
              break label446;
            }
            Object localObject2 = new File(str + "/" + String.valueOf(i) + ".png");
            if ((!((File)localObject2).exists()) || (((File)localObject2).length() <= 0L)) {
              break label437;
            }
            localObject2 = BitmapManager.a(((File)localObject2).getAbsolutePath(), localOptions);
            if (localObject2 == null) {
              break label439;
            }
            j = 1;
            ((AnimationDrawable)localObject1).addFrame(new BitmapDrawable(paramContext.getResources(), (Bitmap)localObject2), m);
            break label439;
            if (QLog.isColorLevel()) {
              QLog.d("SetSplash", 2, "getDynamicSplashDrawable() playTimes=" + k + ", playInterval=" + m + ", totalFilesCount=" + n + ", totalPlayTime=" + i);
            }
            ThreadManager.a(new ref(), 5, null, false);
            if (paramStartupDirector != null) {
              b = i;
            }
            return localObject1;
          }
          return null;
        }
      }
      catch (Throwable paramContext)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SetSplash", 2, "", paramContext);
        }
        return null;
      }
      return null;
      label437:
      return null;
      label439:
      i += 1;
      continue;
      label446:
      if (j == 0) {
        return null;
      }
      int j = k * m * n;
      if (j <= 0) {
        return null;
      }
      int i = j;
      if (j > 5000) {
        i = 5000;
      }
    }
  }
  
  private static void a()
  {
    ThreadManager.a().postDelayed(new ree(), 5000L);
  }
  
  private static boolean a(Context paramContext)
  {
    try
    {
      SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(paramContext);
      String str2 = localSharedPreferences.getString("dynamic_splash_config_effective_time", null);
      paramContext = localSharedPreferences.getString("dynamic_splash_config_md5", null);
      long l3 = localSharedPreferences.getLong("dynamic_splash_config_folder_modify_time", -1L);
      if (localSharedPreferences.getInt("dynamic_splash_config_show_times", -1) <= 0) {
        return false;
      }
      boolean bool = TextUtils.isEmpty(str2);
      if (!bool) {}
      int i;
      long l2;
      long l1;
      String str1;
      return false;
    }
    catch (Throwable paramContext)
    {
      try
      {
        i = str2.indexOf("|");
        l2 = Long.parseLong(str2.substring(0, i));
        l1 = Long.parseLong(str2.substring(i + 1));
        if (!CommonUtil.a(l2, l1))
        {
          if (!QLog.isColorLevel()) {
            break label312;
          }
          QLog.d("SetSplash", 2, "needShowDynamicSplash() the current time is not effective");
          return false;
          paramContext = paramContext;
          if (!QLog.isColorLevel()) {
            break label312;
          }
          QLog.d("SetSplash", 2, "needShowDynamicSplash() ERROR msg=" + paramContext.getMessage());
          return false;
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          l1 = 0L;
          l2 = 0L;
        }
        if ((l3 >= 0L) && (!TextUtils.isEmpty(paramContext)))
        {
          str1 = BaseApplicationImpl.getContext().getFilesDir().getAbsolutePath() + "/" + "dynamicSplash";
          paramContext = new File(str1 + "/" + paramContext);
          if ((paramContext.exists()) && (paramContext.isDirectory()) && (l3 == paramContext.lastModified()) && (DeviceInfoUtil.c() >= 805306368L)) {
            return true;
          }
          if (QLog.isColorLevel()) {
            QLog.d("SetSplash", 2, "needShowDynamicSplash() the folder of splash is modified, NOT show");
          }
        }
      }
    }
  }
  
  public static boolean b()
  {
    long l1 = BaseApplicationImpl.a().getSharedPreferences("banner_and_splash", 0).getLong("splashshowtime", 0L);
    long l2 = System.currentTimeMillis();
    if ((l2 > l1) && (l2 <= 86400000L + l1)) {
      return false;
    }
    if (l2 > l1 + 86400000L)
    {
      BaseApplicationImpl localBaseApplicationImpl = BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
      Object localObject1 = localBaseApplicationImpl.getFilesDir();
      int j;
      long l4;
      long l3;
      int i;
      if (localObject1 != null)
      {
        localObject1 = ((File)localObject1).getAbsolutePath();
        localObject2 = new File((String)localObject1 + "/" + "splashpic");
        if ((localObject2 != null) && (((File)localObject2).exists()) && (((File)localObject2).isDirectory()))
        {
          localObject2 = ((File)localObject2).listFiles();
          if (localObject2 != null)
          {
            j = localObject2.length;
            l4 = 0L;
            l3 = 0L;
            i = 0;
          }
        }
      }
      else
      {
        for (;;)
        {
          if (i >= j) {
            break label343;
          }
          Object localObject3 = localObject2[i];
          long l5 = l4;
          long l6 = l3;
          if (localObject3 != null)
          {
            localObject3 = ((File)localObject3).getName().split("_");
            l5 = l4;
            l6 = l3;
            if (localObject3 != null)
            {
              l5 = l4;
              l6 = l3;
              if (localObject3.length == 3)
              {
                localObject3 = localObject3[0];
                l1 = l4;
                l2 = l3;
                if (localObject3 != null)
                {
                  l1 = l4;
                  l2 = l3;
                  if (((String)localObject3).trim().equals("")) {}
                }
                try
                {
                  int k = ((String)localObject3).indexOf("|");
                  l2 = Long.parseLong(((String)localObject3).substring(0, k));
                  l1 = Long.parseLong(((String)localObject3).substring(k + 1));
                  l5 = l1;
                  l6 = l2;
                  if (CommonUtil.a(l2, l1))
                  {
                    return true;
                    localObject1 = "/data/data/com.tencent.mobileqq/files";
                  }
                }
                catch (Exception localException)
                {
                  for (;;)
                  {
                    l2 = 0L;
                    l1 = 0L;
                  }
                }
              }
            }
          }
          i += 1;
          l4 = l5;
          l3 = l6;
        }
      }
      label343:
      Object localObject2 = SharedPreUtils.b(BaseApplicationImpl.getContext());
      if (QLog.isColorLevel()) {
        QLog.i("SetSplash", 2, "bir = " + (String)localObject2);
      }
      if ((!((String)localObject2).equals("")) && (a((String)localObject2) == 0))
      {
        localObject1 = new File((String)localObject1 + "/" + SharedPreUtils.a(localBaseApplicationImpl) + "/" + "birthdayflashlogo.png");
        if ((localObject1 != null) && (((File)localObject1).exists()) && (((File)localObject1).length() > 1L)) {
          return true;
        }
      }
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("SetSplash", 2, "now time less than last show time");
    }
    return false;
  }
  
  protected boolean a()
  {
    AppActivity localAppActivity = a.a;
    try
    {
      boolean bool = localAppActivity.showPreview();
      if (!bool) {
        break label35;
      }
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      label35:
      do
      {
        if (QLog.isColorLevel()) {
          QLog.d("SetSplash", 2, "", localNotFoundException);
        }
      } while (a(localAppActivity, a) <= 0L);
      BaseApplicationImpl.jdField_a_of_type_Long = 0L;
      BaseApplicationImpl.b = 0L;
      BaseApplicationImpl.c = 0L;
      a.c = 0L;
    }
    return true;
    return true;
  }
}
