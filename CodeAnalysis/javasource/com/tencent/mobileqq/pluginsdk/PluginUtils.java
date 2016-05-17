package com.tencent.mobileqq.pluginsdk;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class PluginUtils
{
  public static final String CONFIG_FILE_EXTEND_NAME = ".cfg";
  private static final int a = 8192;
  private static Map b = new ConcurrentHashMap();
  private static Map c = new ConcurrentHashMap();
  private static final String d = ".tmp";
  
  public PluginUtils() {}
  
  private static File a(Context paramContext, String paramString)
  {
    File localFile = (File)b.get(paramString);
    Object localObject = localFile;
    if (localFile == null)
    {
      localObject = getPluginInstallDir(paramContext);
      if (localObject == null) {
        localObject = null;
      }
    }
    else
    {
      return localObject;
    }
    int i = paramString.lastIndexOf('.');
    if ((i != -1) && (!paramString.substring(i).equalsIgnoreCase(".apk"))) {
      paramContext = paramString.substring(0, i) + ".apk";
    }
    for (;;)
    {
      paramString = new File((File)localObject, paramContext);
      localObject = paramString;
      if (paramString == null) {
        break;
      }
      b.put(paramContext, paramString);
      return paramString;
      paramContext = paramString;
      if (i == -1) {
        paramContext = paramString + ".apk";
      }
    }
  }
  
  /* Error */
  public static String extractLibs(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 8
    //   3: aconst_null
    //   4: astore 9
    //   6: aload_1
    //   7: astore 6
    //   9: aload_1
    //   10: getstatic 91	java/io/File:separator	Ljava/lang/String;
    //   13: invokevirtual 94	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   16: ifne +25 -> 41
    //   19: new 65	java/lang/StringBuilder
    //   22: dup
    //   23: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   26: aload_1
    //   27: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: getstatic 91	java/io/File:separator	Ljava/lang/String;
    //   33: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   39: astore 6
    //   41: new 96	com/tencent/commonsdk/zip/QZipFile
    //   44: dup
    //   45: aload_0
    //   46: invokespecial 99	com/tencent/commonsdk/zip/QZipFile:<init>	(Ljava/lang/String;)V
    //   49: astore 5
    //   51: aload 5
    //   53: astore 4
    //   55: aload 5
    //   57: invokevirtual 105	java/util/zip/ZipFile:entries	()Ljava/util/Enumeration;
    //   60: astore 10
    //   62: aconst_null
    //   63: astore_1
    //   64: aload 5
    //   66: astore 4
    //   68: aload 10
    //   70: invokeinterface 111 1 0
    //   75: ifeq +245 -> 320
    //   78: aload 5
    //   80: astore 4
    //   82: aload 10
    //   84: invokeinterface 115 1 0
    //   89: checkcast 117	java/util/zip/ZipEntry
    //   92: invokevirtual 120	java/util/zip/ZipEntry:getName	()Ljava/lang/String;
    //   95: astore_3
    //   96: aload 5
    //   98: astore 4
    //   100: aload_3
    //   101: getstatic 91	java/io/File:separator	Ljava/lang/String;
    //   104: invokevirtual 94	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   107: ifne -43 -> 64
    //   110: aload 5
    //   112: astore 4
    //   114: aload_3
    //   115: ldc 122
    //   117: invokevirtual 126	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   120: ifne -56 -> 64
    //   123: aload 5
    //   125: astore 4
    //   127: new 43	java/io/File
    //   130: dup
    //   131: new 65	java/lang/StringBuilder
    //   134: dup
    //   135: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   138: aload 6
    //   140: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: aload_3
    //   144: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   150: invokespecial 127	java/io/File:<init>	(Ljava/lang/String;)V
    //   153: astore 7
    //   155: aload_1
    //   156: astore_3
    //   157: aload 7
    //   159: ifnull +743 -> 902
    //   162: aload 5
    //   164: astore 4
    //   166: aload 7
    //   168: invokevirtual 128	java/io/File:getName	()Ljava/lang/String;
    //   171: getstatic 133	android/os/Build:CPU_ABI	Ljava/lang/String;
    //   174: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   177: ifeq +14 -> 191
    //   180: aload 5
    //   182: astore 4
    //   184: getstatic 133	android/os/Build:CPU_ABI	Ljava/lang/String;
    //   187: astore_3
    //   188: goto +714 -> 902
    //   191: aload 5
    //   193: astore 4
    //   195: getstatic 142	android/os/Build$VERSION:SDK_INT	I
    //   198: bipush 7
    //   200: if_icmple +38 -> 238
    //   203: aload 5
    //   205: astore 4
    //   207: aload 7
    //   209: invokevirtual 128	java/io/File:getName	()Ljava/lang/String;
    //   212: getstatic 145	android/os/Build:CPU_ABI2	Ljava/lang/String;
    //   215: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   218: ifeq +20 -> 238
    //   221: aload_1
    //   222: ifnonnull +16 -> 238
    //   225: aload 5
    //   227: astore 4
    //   229: getstatic 145	android/os/Build:CPU_ABI2	Ljava/lang/String;
    //   232: astore_3
    //   233: aload_3
    //   234: astore_1
    //   235: goto -80 -> 155
    //   238: aload 5
    //   240: astore 4
    //   242: getstatic 133	android/os/Build:CPU_ABI	Ljava/lang/String;
    //   245: ldc -109
    //   247: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   250: ifeq +56 -> 306
    //   253: aload_1
    //   254: ifnonnull +52 -> 306
    //   257: aload 5
    //   259: astore 4
    //   261: aload 7
    //   263: invokevirtual 128	java/io/File:getName	()Ljava/lang/String;
    //   266: ldc -107
    //   268: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   271: ifne +20 -> 291
    //   274: aload 5
    //   276: astore 4
    //   278: aload 7
    //   280: invokevirtual 128	java/io/File:getName	()Ljava/lang/String;
    //   283: ldc -105
    //   285: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   288: ifeq +18 -> 306
    //   291: aload 5
    //   293: astore 4
    //   295: aload 7
    //   297: invokevirtual 128	java/io/File:getName	()Ljava/lang/String;
    //   300: astore_3
    //   301: aload_3
    //   302: astore_1
    //   303: goto -148 -> 155
    //   306: aload 5
    //   308: astore 4
    //   310: aload 7
    //   312: invokevirtual 155	java/io/File:getParentFile	()Ljava/io/File;
    //   315: astore 7
    //   317: goto -162 -> 155
    //   320: aload 5
    //   322: invokestatic 161	com/tencent/mobileqq/pluginsdk/IOUtil:closeZipFile	(Ljava/util/zip/ZipFile;)V
    //   325: aconst_null
    //   326: astore_3
    //   327: aload_1
    //   328: astore 5
    //   330: aload_3
    //   331: astore_1
    //   332: aload 9
    //   334: astore 4
    //   336: aload_3
    //   337: ifnonnull +332 -> 669
    //   340: aload_3
    //   341: astore_1
    //   342: aload 9
    //   344: astore 4
    //   346: aload 5
    //   348: ifnull +321 -> 669
    //   351: new 101	java/util/zip/ZipFile
    //   354: dup
    //   355: aload_0
    //   356: invokespecial 162	java/util/zip/ZipFile:<init>	(Ljava/lang/String;)V
    //   359: astore_1
    //   360: aload_1
    //   361: astore 4
    //   363: sipush 4096
    //   366: newarray byte
    //   368: astore 10
    //   370: aload_1
    //   371: astore 4
    //   373: aload_1
    //   374: invokevirtual 105	java/util/zip/ZipFile:entries	()Ljava/util/Enumeration;
    //   377: astore 11
    //   379: aload_3
    //   380: astore_0
    //   381: aload_1
    //   382: astore 4
    //   384: aload 11
    //   386: invokeinterface 111 1 0
    //   391: ifeq +503 -> 894
    //   394: aload_1
    //   395: astore 4
    //   397: aload 11
    //   399: invokeinterface 115 1 0
    //   404: checkcast 117	java/util/zip/ZipEntry
    //   407: astore 12
    //   409: aload_1
    //   410: astore 4
    //   412: aload 12
    //   414: invokevirtual 120	java/util/zip/ZipEntry:getName	()Ljava/lang/String;
    //   417: astore 9
    //   419: aload_1
    //   420: astore 4
    //   422: aload 9
    //   424: getstatic 91	java/io/File:separator	Ljava/lang/String;
    //   427: invokevirtual 94	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   430: ifne -49 -> 381
    //   433: aload_1
    //   434: astore 4
    //   436: aload 9
    //   438: ldc 122
    //   440: invokevirtual 126	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   443: ifne -62 -> 381
    //   446: aload_1
    //   447: astore 4
    //   449: new 43	java/io/File
    //   452: dup
    //   453: new 65	java/lang/StringBuilder
    //   456: dup
    //   457: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   460: aload 6
    //   462: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   465: aload 9
    //   467: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   473: invokespecial 127	java/io/File:<init>	(Ljava/lang/String;)V
    //   476: astore 7
    //   478: aload_1
    //   479: astore 4
    //   481: aload 9
    //   483: getstatic 91	java/io/File:separator	Ljava/lang/String;
    //   486: invokevirtual 165	java/lang/String:lastIndexOf	(Ljava/lang/String;)I
    //   489: istore_2
    //   490: aload 9
    //   492: astore_3
    //   493: iload_2
    //   494: iconst_m1
    //   495: if_icmpeq +15 -> 510
    //   498: aload_1
    //   499: astore 4
    //   501: aload 9
    //   503: iload_2
    //   504: iconst_1
    //   505: iadd
    //   506: invokevirtual 57	java/lang/String:substring	(I)Ljava/lang/String;
    //   509: astore_3
    //   510: aload_1
    //   511: astore 4
    //   513: new 43	java/io/File
    //   516: dup
    //   517: new 65	java/lang/StringBuilder
    //   520: dup
    //   521: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   524: aload 6
    //   526: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   529: aload_3
    //   530: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   533: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   536: invokespecial 127	java/io/File:<init>	(Ljava/lang/String;)V
    //   539: astore 9
    //   541: aload 7
    //   543: astore_3
    //   544: aload_3
    //   545: ifnull +344 -> 889
    //   548: aload_1
    //   549: astore 4
    //   551: aload_3
    //   552: invokevirtual 128	java/io/File:getName	()Ljava/lang/String;
    //   555: aload 5
    //   557: invokevirtual 137	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   560: ifeq +161 -> 721
    //   563: iconst_1
    //   564: istore_2
    //   565: iload_2
    //   566: ifeq +226 -> 792
    //   569: aload_1
    //   570: astore 4
    //   572: aload 9
    //   574: invokevirtual 155	java/io/File:getParentFile	()Ljava/io/File;
    //   577: invokevirtual 168	java/io/File:mkdirs	()Z
    //   580: pop
    //   581: aload_1
    //   582: aload 12
    //   584: invokevirtual 172	java/util/zip/ZipFile:getInputStream	(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    //   587: astore_3
    //   588: new 174	java/io/FileOutputStream
    //   591: dup
    //   592: aload 9
    //   594: invokespecial 177	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   597: astore 7
    //   599: aload_3
    //   600: aload 10
    //   602: invokevirtual 183	java/io/InputStream:read	([B)I
    //   605: istore_2
    //   606: iload_2
    //   607: ifle +125 -> 732
    //   610: aload 7
    //   612: aload 10
    //   614: iconst_0
    //   615: iload_2
    //   616: invokevirtual 187	java/io/FileOutputStream:write	([BII)V
    //   619: goto -20 -> 599
    //   622: astore 4
    //   624: aload_3
    //   625: astore_0
    //   626: aload 7
    //   628: astore_3
    //   629: aload 4
    //   631: invokevirtual 190	java/io/IOException:printStackTrace	()V
    //   634: aload 4
    //   636: invokestatic 194	com/tencent/mobileqq/pluginsdk/PluginUtils:getExceptionInfo	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   639: astore 7
    //   641: aload_1
    //   642: astore 4
    //   644: aload_3
    //   645: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   648: aload_1
    //   649: astore 4
    //   651: aload_0
    //   652: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   655: aload 7
    //   657: astore_0
    //   658: aload_0
    //   659: astore_3
    //   660: aload_0
    //   661: ifnull +133 -> 794
    //   664: aload_1
    //   665: astore 4
    //   667: aload_0
    //   668: astore_1
    //   669: aload 4
    //   671: invokestatic 161	com/tencent/mobileqq/pluginsdk/IOUtil:closeZipFile	(Ljava/util/zip/ZipFile;)V
    //   674: aload_1
    //   675: areturn
    //   676: astore_3
    //   677: aconst_null
    //   678: astore 5
    //   680: aconst_null
    //   681: astore_1
    //   682: aload 5
    //   684: astore 4
    //   686: aload_3
    //   687: invokevirtual 190	java/io/IOException:printStackTrace	()V
    //   690: aload 5
    //   692: astore 4
    //   694: aload_3
    //   695: invokestatic 194	com/tencent/mobileqq/pluginsdk/PluginUtils:getExceptionInfo	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   698: astore_3
    //   699: aload 5
    //   701: invokestatic 161	com/tencent/mobileqq/pluginsdk/IOUtil:closeZipFile	(Ljava/util/zip/ZipFile;)V
    //   704: aload_1
    //   705: astore 5
    //   707: goto -377 -> 330
    //   710: astore_0
    //   711: aconst_null
    //   712: astore 4
    //   714: aload 4
    //   716: invokestatic 161	com/tencent/mobileqq/pluginsdk/IOUtil:closeZipFile	(Ljava/util/zip/ZipFile;)V
    //   719: aload_0
    //   720: athrow
    //   721: aload_1
    //   722: astore 4
    //   724: aload_3
    //   725: invokevirtual 155	java/io/File:getParentFile	()Ljava/io/File;
    //   728: astore_3
    //   729: goto -185 -> 544
    //   732: aload_1
    //   733: astore 4
    //   735: aload 7
    //   737: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   740: aload_1
    //   741: astore 4
    //   743: aload_3
    //   744: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   747: goto -89 -> 658
    //   750: aload_1
    //   751: astore 4
    //   753: aload 5
    //   755: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   758: aload_1
    //   759: astore 4
    //   761: aload_3
    //   762: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   765: aload_1
    //   766: astore 4
    //   768: aload_0
    //   769: athrow
    //   770: astore_0
    //   771: aload_1
    //   772: astore 4
    //   774: aload_0
    //   775: invokevirtual 190	java/io/IOException:printStackTrace	()V
    //   778: aload_1
    //   779: astore 4
    //   781: aload_0
    //   782: invokestatic 194	com/tencent/mobileqq/pluginsdk/PluginUtils:getExceptionInfo	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   785: astore_0
    //   786: aload_1
    //   787: invokestatic 161	com/tencent/mobileqq/pluginsdk/IOUtil:closeZipFile	(Ljava/util/zip/ZipFile;)V
    //   790: aload_0
    //   791: areturn
    //   792: aload_0
    //   793: astore_3
    //   794: aload_3
    //   795: astore_0
    //   796: goto -415 -> 381
    //   799: astore_0
    //   800: aconst_null
    //   801: astore 4
    //   803: aload 4
    //   805: invokestatic 161	com/tencent/mobileqq/pluginsdk/IOUtil:closeZipFile	(Ljava/util/zip/ZipFile;)V
    //   808: aload_0
    //   809: athrow
    //   810: astore_0
    //   811: goto -8 -> 803
    //   814: astore_0
    //   815: aconst_null
    //   816: astore_1
    //   817: goto -46 -> 771
    //   820: astore_0
    //   821: aload 8
    //   823: astore 5
    //   825: goto -75 -> 750
    //   828: astore_0
    //   829: aload 7
    //   831: astore 5
    //   833: goto -83 -> 750
    //   836: astore 5
    //   838: aload_0
    //   839: astore 4
    //   841: aload 5
    //   843: astore_0
    //   844: aload_3
    //   845: astore 5
    //   847: aload 4
    //   849: astore_3
    //   850: goto -100 -> 750
    //   853: astore 4
    //   855: aconst_null
    //   856: astore_0
    //   857: aconst_null
    //   858: astore_3
    //   859: goto -230 -> 629
    //   862: astore 4
    //   864: aload_3
    //   865: astore_0
    //   866: aconst_null
    //   867: astore_3
    //   868: goto -239 -> 629
    //   871: astore_0
    //   872: goto -158 -> 714
    //   875: astore_3
    //   876: aconst_null
    //   877: astore_1
    //   878: goto -196 -> 682
    //   881: astore_3
    //   882: goto -200 -> 682
    //   885: astore_3
    //   886: goto -204 -> 682
    //   889: iconst_0
    //   890: istore_2
    //   891: goto -326 -> 565
    //   894: aload_1
    //   895: astore 4
    //   897: aload_0
    //   898: astore_1
    //   899: goto -230 -> 669
    //   902: aload_3
    //   903: astore_1
    //   904: goto -840 -> 64
    //   907: astore_0
    //   908: aconst_null
    //   909: astore_3
    //   910: aload 8
    //   912: astore 5
    //   914: goto -164 -> 750
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	917	0	paramString1	String
    //   0	917	1	paramString2	String
    //   489	402	2	i	int
    //   95	565	3	localObject1	Object
    //   676	19	3	localIOException1	java.io.IOException
    //   698	170	3	localObject2	Object
    //   875	1	3	localIOException2	java.io.IOException
    //   881	1	3	localIOException3	java.io.IOException
    //   885	18	3	localIOException4	java.io.IOException
    //   909	1	3	localObject3	Object
    //   53	518	4	localObject4	Object
    //   622	13	4	localIOException5	java.io.IOException
    //   642	206	4	localObject5	Object
    //   853	1	4	localIOException6	java.io.IOException
    //   862	1	4	localIOException7	java.io.IOException
    //   895	1	4	str1	String
    //   49	783	5	localObject6	Object
    //   836	6	5	localObject7	Object
    //   845	68	5	localObject8	Object
    //   7	518	6	str2	String
    //   153	677	7	localObject9	Object
    //   1	910	8	localObject10	Object
    //   4	589	9	localObject11	Object
    //   60	553	10	localObject12	Object
    //   377	21	11	localEnumeration	java.util.Enumeration
    //   407	176	12	localZipEntry	java.util.zip.ZipEntry
    // Exception table:
    //   from	to	target	type
    //   599	606	622	java/io/IOException
    //   610	619	622	java/io/IOException
    //   41	51	676	java/io/IOException
    //   41	51	710	finally
    //   363	370	770	java/io/IOException
    //   373	379	770	java/io/IOException
    //   384	394	770	java/io/IOException
    //   397	409	770	java/io/IOException
    //   412	419	770	java/io/IOException
    //   422	433	770	java/io/IOException
    //   436	446	770	java/io/IOException
    //   449	478	770	java/io/IOException
    //   481	490	770	java/io/IOException
    //   501	510	770	java/io/IOException
    //   513	541	770	java/io/IOException
    //   551	563	770	java/io/IOException
    //   572	581	770	java/io/IOException
    //   644	648	770	java/io/IOException
    //   651	655	770	java/io/IOException
    //   724	729	770	java/io/IOException
    //   735	740	770	java/io/IOException
    //   743	747	770	java/io/IOException
    //   753	758	770	java/io/IOException
    //   761	765	770	java/io/IOException
    //   768	770	770	java/io/IOException
    //   351	360	799	finally
    //   363	370	810	finally
    //   373	379	810	finally
    //   384	394	810	finally
    //   397	409	810	finally
    //   412	419	810	finally
    //   422	433	810	finally
    //   436	446	810	finally
    //   449	478	810	finally
    //   481	490	810	finally
    //   501	510	810	finally
    //   513	541	810	finally
    //   551	563	810	finally
    //   572	581	810	finally
    //   644	648	810	finally
    //   651	655	810	finally
    //   724	729	810	finally
    //   735	740	810	finally
    //   743	747	810	finally
    //   753	758	810	finally
    //   761	765	810	finally
    //   768	770	810	finally
    //   774	778	810	finally
    //   781	786	810	finally
    //   351	360	814	java/io/IOException
    //   588	599	820	finally
    //   599	606	828	finally
    //   610	619	828	finally
    //   629	641	836	finally
    //   581	588	853	java/io/IOException
    //   588	599	862	java/io/IOException
    //   55	62	871	finally
    //   68	78	871	finally
    //   82	96	871	finally
    //   100	110	871	finally
    //   114	123	871	finally
    //   127	155	871	finally
    //   166	180	871	finally
    //   184	188	871	finally
    //   195	203	871	finally
    //   207	221	871	finally
    //   229	233	871	finally
    //   242	253	871	finally
    //   261	274	871	finally
    //   278	291	871	finally
    //   295	301	871	finally
    //   310	317	871	finally
    //   686	690	871	finally
    //   694	699	871	finally
    //   55	62	875	java/io/IOException
    //   166	180	881	java/io/IOException
    //   184	188	881	java/io/IOException
    //   195	203	881	java/io/IOException
    //   207	221	881	java/io/IOException
    //   229	233	881	java/io/IOException
    //   242	253	881	java/io/IOException
    //   261	274	881	java/io/IOException
    //   278	291	881	java/io/IOException
    //   295	301	881	java/io/IOException
    //   310	317	881	java/io/IOException
    //   68	78	885	java/io/IOException
    //   82	96	885	java/io/IOException
    //   100	110	885	java/io/IOException
    //   114	123	885	java/io/IOException
    //   127	155	885	java/io/IOException
    //   581	588	907	finally
  }
  
  /* Error */
  public static String extractPluginAndGetMd5Code(Context paramContext, String paramString, File paramFile)
    throws Exception
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 5
    //   6: aload_2
    //   7: invokevirtual 205	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   10: astore 7
    //   12: new 65	java/lang/StringBuilder
    //   15: dup
    //   16: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   19: ldc -49
    //   21: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: aload 7
    //   26: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   32: invokestatic 212	com/tencent/mobileqq/pluginsdk/DebugHelper:debug	(Ljava/lang/String;)V
    //   35: aload_1
    //   36: ldc -42
    //   38: ldc -40
    //   40: invokevirtual 219	java/lang/String:replaceFirst	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   43: astore 8
    //   45: aload_2
    //   46: invokevirtual 222	java/io/File:exists	()Z
    //   49: ifeq +8 -> 57
    //   52: aload_2
    //   53: invokevirtual 225	java/io/File:delete	()Z
    //   56: pop
    //   57: new 43	java/io/File
    //   60: dup
    //   61: new 65	java/lang/StringBuilder
    //   64: dup
    //   65: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   68: aload 7
    //   70: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   73: ldc 21
    //   75: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   78: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   81: invokespecial 127	java/io/File:<init>	(Ljava/lang/String;)V
    //   84: astore_1
    //   85: aload_1
    //   86: invokevirtual 222	java/io/File:exists	()Z
    //   89: ifeq +8 -> 97
    //   92: aload_1
    //   93: invokevirtual 225	java/io/File:delete	()Z
    //   96: pop
    //   97: aload_1
    //   98: invokevirtual 228	java/io/File:createNewFile	()Z
    //   101: pop
    //   102: aload_0
    //   103: invokevirtual 234	android/content/Context:getAssets	()Landroid/content/res/AssetManager;
    //   106: new 65	java/lang/StringBuilder
    //   109: dup
    //   110: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   113: ldc -20
    //   115: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   118: aload 8
    //   120: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   123: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   126: invokevirtual 242	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   129: astore_0
    //   130: new 174	java/io/FileOutputStream
    //   133: dup
    //   134: aload_1
    //   135: invokespecial 177	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   138: astore 5
    //   140: sipush 8192
    //   143: newarray byte
    //   145: astore 6
    //   147: aload_0
    //   148: aload 6
    //   150: invokevirtual 183	java/io/InputStream:read	([B)I
    //   153: istore_3
    //   154: iload_3
    //   155: iconst_m1
    //   156: if_icmpeq +51 -> 207
    //   159: aload 5
    //   161: aload 6
    //   163: iconst_0
    //   164: iload_3
    //   165: invokevirtual 245	java/io/OutputStream:write	([BII)V
    //   168: goto -21 -> 147
    //   171: astore_2
    //   172: aload_0
    //   173: astore_1
    //   174: aload 5
    //   176: astore_0
    //   177: new 202	java/lang/Exception
    //   180: dup
    //   181: ldc -9
    //   183: aload_2
    //   184: invokespecial 250	java/lang/Exception:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   187: athrow
    //   188: astore 5
    //   190: aload_0
    //   191: astore_2
    //   192: aload_1
    //   193: astore_0
    //   194: aload 5
    //   196: astore_1
    //   197: aload_0
    //   198: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   201: aload_2
    //   202: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   205: aload_1
    //   206: athrow
    //   207: aload_0
    //   208: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   211: aload 5
    //   213: invokestatic 198	com/tencent/mobileqq/pluginsdk/IOUtil:closeStream	(Ljava/io/Closeable;)V
    //   216: aload_2
    //   217: invokevirtual 222	java/io/File:exists	()Z
    //   220: ifeq +8 -> 228
    //   223: aload_2
    //   224: invokevirtual 225	java/io/File:delete	()Z
    //   227: pop
    //   228: aload_1
    //   229: aload_2
    //   230: invokevirtual 254	java/io/File:renameTo	(Ljava/io/File;)Z
    //   233: istore 4
    //   235: new 65	java/lang/StringBuilder
    //   238: dup
    //   239: invokespecial 66	java/lang/StringBuilder:<init>	()V
    //   242: ldc_w 256
    //   245: invokevirtual 73	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   248: iload 4
    //   250: invokevirtual 259	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   253: invokevirtual 77	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   256: invokestatic 212	com/tencent/mobileqq/pluginsdk/DebugHelper:debug	(Ljava/lang/String;)V
    //   259: aload 7
    //   261: invokestatic 265	com/tencent/mobileqq/pluginsdk/PluginStatic:encodeFile	(Ljava/lang/String;)Ljava/lang/String;
    //   264: areturn
    //   265: astore_1
    //   266: aconst_null
    //   267: astore_0
    //   268: aload 6
    //   270: astore_2
    //   271: goto -74 -> 197
    //   274: astore_1
    //   275: aload 6
    //   277: astore_2
    //   278: goto -81 -> 197
    //   281: astore_1
    //   282: aload 5
    //   284: astore_2
    //   285: goto -88 -> 197
    //   288: astore_2
    //   289: aconst_null
    //   290: astore_0
    //   291: aload 5
    //   293: astore_1
    //   294: goto -117 -> 177
    //   297: astore_2
    //   298: aconst_null
    //   299: astore 5
    //   301: aload_0
    //   302: astore_1
    //   303: aload 5
    //   305: astore_0
    //   306: goto -129 -> 177
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	309	0	paramContext	Context
    //   0	309	1	paramString	String
    //   0	309	2	paramFile	File
    //   153	12	3	i	int
    //   233	16	4	bool	boolean
    //   4	171	5	localFileOutputStream	java.io.FileOutputStream
    //   188	104	5	localCloseable	java.io.Closeable
    //   299	5	5	localObject	Object
    //   1	275	6	arrayOfByte	byte[]
    //   10	250	7	str1	String
    //   43	76	8	str2	String
    // Exception table:
    //   from	to	target	type
    //   140	147	171	java/lang/Exception
    //   147	154	171	java/lang/Exception
    //   159	168	171	java/lang/Exception
    //   177	188	188	finally
    //   102	130	265	finally
    //   130	140	274	finally
    //   140	147	281	finally
    //   147	154	281	finally
    //   159	168	281	finally
    //   102	130	288	java/lang/Exception
    //   130	140	297	java/lang/Exception
  }
  
  public static String getExceptionInfo(Throwable paramThrowable)
  {
    while (paramThrowable.getCause() != null) {
      paramThrowable = paramThrowable.getCause();
    }
    StringWriter localStringWriter = new StringWriter();
    paramThrowable.printStackTrace(new PrintWriter(localStringWriter, true));
    return localStringWriter.getBuffer().toString();
  }
  
  public static File getInstalledPluginPath(Context paramContext, String paramString)
  {
    Object localObject = null;
    PluginBaseInfo localPluginBaseInfo = PluginBaseInfoHelper.createFromFile(getPluginCfgFile(getPluginInstallDir(paramContext), paramString), PluginBaseInfo.class);
    if ((localPluginBaseInfo == null) || (mState != 4) || (mInstalledPath == null)) {
      paramContext = a(paramContext, paramString);
    }
    do
    {
      return paramContext;
      paramContext = localObject;
    } while (!PluginStatic.a(mInstalledPath));
    return new File(mInstalledPath);
  }
  
  public static File getOptimizedDexPath(Context paramContext)
  {
    return paramContext.getDir("odex", 0);
  }
  
  public static PackageInfo getPackageInfo(Context paramContext, String paramString)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    PackageInfo localPackageInfo = (PackageInfo)c.get(paramString);
    paramContext = localPackageInfo;
    if (localPackageInfo == null)
    {
      DebugHelper.debug("PluginUtils.verifyPlugin.getPackageArchiveInfo start");
      localPackageInfo = localPackageManager.getPackageArchiveInfo(paramString, 128);
      DebugHelper.debug("PluginUtils.verifyPlugin.getPackageArchiveInfo end");
      paramContext = localPackageInfo;
      if (localPackageInfo != null)
      {
        c.put(paramString, localPackageInfo);
        paramContext = localPackageInfo;
      }
    }
    return paramContext;
  }
  
  public static File getPluginCfgFile(File paramFile, String paramString)
  {
    return new File(paramFile, paramString + ".cfg");
  }
  
  public static File getPluginInstallDir(Context paramContext)
  {
    return paramContext.getDir("installed_plugin", 0);
  }
  
  public static File getPluginLibPath(Context paramContext, String paramString)
  {
    String str = paramString;
    if (paramString.endsWith(".apk")) {
      str = paramString.substring(0, paramString.length() - ".apk".length());
    }
    return new File(paramContext.getDir("lib", 0), str);
  }
  
  static class a
    extends Exception
  {
    private static final long a = 1L;
    
    public a(String paramString)
    {
      super();
    }
  }
  
  static class b
    extends Exception
  {
    private static final long a = 1L;
    
    b() {}
  }
}
