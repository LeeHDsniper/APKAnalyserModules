package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import java.util.List;
import reg;

public class UpgradeDB
  extends Step
{
  private static final int M = 1000;
  private static final String jdField_a_of_type_JavaLangString = "UpgradeDB";
  private static final int b = 20000;
  private static final int c = 30000;
  public int a;
  public BaseApplicationImpl a;
  public Object a;
  private Thread jdField_a_of_type_JavaLangThread = new reg(this);
  private List jdField_a_of_type_JavaUtilList = null;
  public volatile boolean a;
  
  public UpgradeDB()
  {
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_JavaLangObject = new Object();
  }
  
  /* Error */
  protected boolean a()
  {
    // Byte code:
    //   0: aload_0
    //   1: getstatic 52	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   4: putfield 53	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   7: aload_0
    //   8: getfield 53	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   11: ifnonnull +8 -> 19
    //   14: aload_0
    //   15: invokespecial 55	com/tencent/mobileqq/startup/step/Step:a	()Z
    //   18: ireturn
    //   19: aload_0
    //   20: getfield 53	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   23: ldc 57
    //   25: iconst_0
    //   26: invokevirtual 61	com/tencent/common/app/BaseApplicationImpl:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   29: astore 17
    //   31: aload_0
    //   32: aload 17
    //   34: ldc 63
    //   36: iconst_m1
    //   37: invokeinterface 69 3 0
    //   42: putfield 28	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   45: aload_0
    //   46: getfield 28	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   49: iconst_m1
    //   50: if_icmpne +34 -> 84
    //   53: aload_0
    //   54: sipush 20000
    //   57: putfield 28	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   60: aload 17
    //   62: invokeinterface 73 1 0
    //   67: ldc 63
    //   69: aload_0
    //   70: getfield 28	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   73: invokeinterface 79 3 0
    //   78: invokeinterface 82 1 0
    //   83: pop
    //   84: aload_0
    //   85: new 84	java/util/ArrayList
    //   88: dup
    //   89: invokespecial 85	java/util/ArrayList:<init>	()V
    //   92: putfield 26	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   95: ldc 87
    //   97: invokestatic 93	java/util/regex/Pattern:compile	(Ljava/lang/String;)Ljava/util/regex/Pattern;
    //   100: astore 11
    //   102: aload_0
    //   103: getfield 42	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaLangThread	Ljava/lang/Thread;
    //   106: invokevirtual 98	java/lang/Thread:start	()V
    //   109: invokestatic 104	java/lang/System:nanoTime	()J
    //   112: lstore 7
    //   114: aload_0
    //   115: getfield 53	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   118: invokevirtual 108	com/tencent/common/app/BaseApplicationImpl:getFilesDir	()Ljava/io/File;
    //   121: invokevirtual 114	java/io/File:getPath	()Ljava/lang/String;
    //   124: astore 12
    //   126: new 110	java/io/File
    //   129: dup
    //   130: new 116	java/lang/StringBuilder
    //   133: dup
    //   134: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   137: aload 12
    //   139: iconst_0
    //   140: aload 12
    //   142: ldc 119
    //   144: invokevirtual 125	java/lang/String:lastIndexOf	(Ljava/lang/String;)I
    //   147: invokevirtual 129	java/lang/String:substring	(II)Ljava/lang/String;
    //   150: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   153: ldc -121
    //   155: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   158: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   161: invokespecial 141	java/io/File:<init>	(Ljava/lang/String;)V
    //   164: invokevirtual 145	java/io/File:listFiles	()[Ljava/io/File;
    //   167: astore 12
    //   169: aload 12
    //   171: ifnull +95 -> 266
    //   174: aload 12
    //   176: arraylength
    //   177: istore_2
    //   178: iconst_0
    //   179: istore_1
    //   180: iload_1
    //   181: iload_2
    //   182: if_icmpge +44 -> 226
    //   185: aload 12
    //   187: iload_1
    //   188: aaload
    //   189: astore 13
    //   191: aload 11
    //   193: aload 13
    //   195: invokevirtual 148	java/io/File:getName	()Ljava/lang/String;
    //   198: invokevirtual 152	java/util/regex/Pattern:matcher	(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    //   201: invokevirtual 157	java/util/regex/Matcher:find	()Z
    //   204: ifeq +15 -> 219
    //   207: aload_0
    //   208: getfield 26	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   211: aload 13
    //   213: invokeinterface 163 2 0
    //   218: pop
    //   219: iload_1
    //   220: iconst_1
    //   221: iadd
    //   222: istore_1
    //   223: goto -43 -> 180
    //   226: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   229: ifeq +37 -> 266
    //   232: ldc 11
    //   234: iconst_2
    //   235: new 116	java/lang/StringBuilder
    //   238: dup
    //   239: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   242: ldc -86
    //   244: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   247: invokestatic 104	java/lang/System:nanoTime	()J
    //   250: lload 7
    //   252: lsub
    //   253: ldc2_w 171
    //   256: ldiv
    //   257: invokevirtual 175	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   260: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   263: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   266: aload_0
    //   267: getfield 26	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   270: invokeinterface 182 1 0
    //   275: ifne +72 -> 347
    //   278: aload_0
    //   279: getfield 26	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   282: new 184	reh
    //   285: dup
    //   286: aload_0
    //   287: invokespecial 185	reh:<init>	(Lcom/tencent/mobileqq/startup/step/UpgradeDB;)V
    //   290: invokestatic 191	java/util/Collections:sort	(Ljava/util/List;Ljava/util/Comparator;)V
    //   293: aload_0
    //   294: getfield 26	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   297: invokeinterface 195 1 0
    //   302: astore 18
    //   304: aload 18
    //   306: invokeinterface 200 1 0
    //   311: ifeq +36 -> 347
    //   314: aload 18
    //   316: invokeinterface 204 1 0
    //   321: checkcast 110	java/io/File
    //   324: astore 11
    //   326: aload_0
    //   327: getfield 30	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Boolean	Z
    //   330: ifne +51 -> 381
    //   333: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   336: ifeq +11 -> 347
    //   339: ldc 11
    //   341: iconst_2
    //   342: ldc -50
    //   344: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   347: aload_0
    //   348: getfield 42	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaLangThread	Ljava/lang/Thread;
    //   351: invokevirtual 209	java/lang/Thread:isAlive	()Z
    //   354: ifeq +10 -> 364
    //   357: aload_0
    //   358: getfield 42	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaLangThread	Ljava/lang/Thread;
    //   361: invokevirtual 212	java/lang/Thread:interrupt	()V
    //   364: aload_0
    //   365: getfield 26	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   368: invokeinterface 182 1 0
    //   373: ifne +3 -> 376
    //   376: aload_0
    //   377: invokespecial 55	com/tencent/mobileqq/startup/step/Step:a	()Z
    //   380: ireturn
    //   381: aload 11
    //   383: invokevirtual 148	java/io/File:getName	()Ljava/lang/String;
    //   386: astore 16
    //   388: aconst_null
    //   389: astore 11
    //   391: aconst_null
    //   392: astore 12
    //   394: aconst_null
    //   395: astore 15
    //   397: aload 16
    //   399: ldc -42
    //   401: ldc -40
    //   403: invokevirtual 220	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   406: invokestatic 226	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   409: lstore 7
    //   411: new 228	com/tencent/mobileqq/data/QQEntityManagerFactory
    //   414: dup
    //   415: lload 7
    //   417: invokestatic 232	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   420: invokespecial 233	com/tencent/mobileqq/data/QQEntityManagerFactory:<init>	(Ljava/lang/String;)V
    //   423: astore 13
    //   425: aload 13
    //   427: invokevirtual 239	com/tencent/mobileqq/persistence/EntityManagerFactory:createEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   430: astore 14
    //   432: aload 14
    //   434: invokevirtual 244	com/tencent/mobileqq/persistence/EntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   437: astore 19
    //   439: aload 13
    //   441: lload 7
    //   443: invokestatic 232	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   446: invokevirtual 248	com/tencent/mobileqq/persistence/EntityManagerFactory:build	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/SQLiteOpenHelper;
    //   449: invokevirtual 253	com/tencent/mobileqq/app/SQLiteOpenHelper:a	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   452: astore 12
    //   454: aload_0
    //   455: getfield 30	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Boolean	Z
    //   458: ifne +50 -> 508
    //   461: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   464: ifeq +11 -> 475
    //   467: ldc 11
    //   469: iconst_2
    //   470: ldc -1
    //   472: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   475: aload 12
    //   477: ifnull +8 -> 485
    //   480: aload 12
    //   482: invokevirtual 259	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   485: aload 14
    //   487: ifnull +8 -> 495
    //   490: aload 14
    //   492: invokevirtual 261	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   495: aload 13
    //   497: ifnull -150 -> 347
    //   500: aload 13
    //   502: invokevirtual 264	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   505: goto -158 -> 347
    //   508: aload 17
    //   510: new 116	java/lang/StringBuilder
    //   513: dup
    //   514: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   517: lload 7
    //   519: invokevirtual 175	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   522: ldc_w 266
    //   525: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   528: ldc_w 268
    //   531: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   534: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   537: iconst_0
    //   538: invokeinterface 272 3 0
    //   543: ifeq +75 -> 618
    //   546: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   549: ifeq +36 -> 585
    //   552: ldc 11
    //   554: iconst_2
    //   555: new 116	java/lang/StringBuilder
    //   558: dup
    //   559: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   562: ldc_w 274
    //   565: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   568: aload 16
    //   570: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   573: ldc_w 276
    //   576: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   579: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   582: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   585: aload 12
    //   587: ifnull +8 -> 595
    //   590: aload 12
    //   592: invokevirtual 259	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   595: aload 14
    //   597: ifnull +8 -> 605
    //   600: aload 14
    //   602: invokevirtual 261	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   605: aload 13
    //   607: ifnull -303 -> 304
    //   610: aload 13
    //   612: invokevirtual 264	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   615: goto -311 -> 304
    //   618: aload 12
    //   620: invokevirtual 279	com/tencent/mobileqq/app/SQLiteDatabase:a	()[Ljava/lang/String;
    //   623: astore 11
    //   625: aload 11
    //   627: ifnonnull +36 -> 663
    //   630: aload 12
    //   632: ifnull +8 -> 640
    //   635: aload 12
    //   637: invokevirtual 259	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   640: aload 14
    //   642: ifnull +8 -> 650
    //   645: aload 14
    //   647: invokevirtual 261	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   650: aload 13
    //   652: ifnull -348 -> 304
    //   655: aload 13
    //   657: invokevirtual 264	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   660: goto -356 -> 304
    //   663: iconst_0
    //   664: istore_1
    //   665: iconst_0
    //   666: istore_2
    //   667: aload 19
    //   669: invokevirtual 282	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   672: invokestatic 104	java/lang/System:nanoTime	()J
    //   675: lstore 9
    //   677: aload 11
    //   679: arraylength
    //   680: istore 6
    //   682: iconst_0
    //   683: istore_3
    //   684: iconst_0
    //   685: istore 5
    //   687: iload 5
    //   689: iload 6
    //   691: if_icmpge +480 -> 1171
    //   694: aload 11
    //   696: iload 5
    //   698: aaload
    //   699: astore 15
    //   701: iload_3
    //   702: istore_1
    //   703: iload_3
    //   704: istore_2
    //   705: aload 15
    //   707: ldc_w 284
    //   710: invokevirtual 288	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   713: ifeq +18 -> 731
    //   716: iload_3
    //   717: istore_1
    //   718: iload_3
    //   719: istore_2
    //   720: aload 15
    //   722: ldc_w 290
    //   725: invokevirtual 293	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   728: ifne +33 -> 761
    //   731: iload_3
    //   732: istore_1
    //   733: iload_3
    //   734: istore_2
    //   735: aload 15
    //   737: ldc_w 295
    //   740: invokevirtual 293	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   743: ifne +18 -> 761
    //   746: iload_3
    //   747: istore_1
    //   748: iload_3
    //   749: istore_2
    //   750: aload 15
    //   752: ldc_w 297
    //   755: invokevirtual 293	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   758: ifeq +118 -> 876
    //   761: iload_3
    //   762: iconst_1
    //   763: iadd
    //   764: istore 4
    //   766: iload 4
    //   768: istore_1
    //   769: iload 4
    //   771: istore_2
    //   772: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   775: ifeq +47 -> 822
    //   778: iload 4
    //   780: istore_1
    //   781: iload 4
    //   783: istore_2
    //   784: ldc 11
    //   786: iconst_2
    //   787: new 116	java/lang/StringBuilder
    //   790: dup
    //   791: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   794: ldc_w 274
    //   797: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   800: aload 16
    //   802: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   805: ldc_w 299
    //   808: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   811: aload 15
    //   813: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   816: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   819: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   822: iload 4
    //   824: istore_1
    //   825: iload 4
    //   827: istore_2
    //   828: aload 12
    //   830: ldc_w 301
    //   833: iconst_2
    //   834: anewarray 32	java/lang/Object
    //   837: dup
    //   838: iconst_0
    //   839: new 116	java/lang/StringBuilder
    //   842: dup
    //   843: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   846: aload 15
    //   848: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   851: ldc_w 303
    //   854: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   857: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   860: aastore
    //   861: dup
    //   862: iconst_1
    //   863: aload 15
    //   865: aastore
    //   866: invokestatic 307	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   869: invokevirtual 309	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;)Z
    //   872: pop
    //   873: goto +728 -> 1601
    //   876: iload_3
    //   877: istore_1
    //   878: iload_3
    //   879: istore_2
    //   880: aload 15
    //   882: ldc_w 284
    //   885: invokevirtual 288	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   888: ifeq +18 -> 906
    //   891: iload_3
    //   892: istore_1
    //   893: iload_3
    //   894: istore_2
    //   895: aload 15
    //   897: ldc_w 311
    //   900: invokevirtual 293	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   903: ifne +21 -> 924
    //   906: iload_3
    //   907: istore_1
    //   908: iload_3
    //   909: istore_2
    //   910: iload_3
    //   911: istore 4
    //   913: aload 15
    //   915: ldc_w 313
    //   918: invokevirtual 293	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   921: ifeq +680 -> 1601
    //   924: iload_3
    //   925: iconst_1
    //   926: iadd
    //   927: istore 4
    //   929: iload 4
    //   931: istore_1
    //   932: iload 4
    //   934: istore_2
    //   935: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   938: ifeq +47 -> 985
    //   941: iload 4
    //   943: istore_1
    //   944: iload 4
    //   946: istore_2
    //   947: ldc 11
    //   949: iconst_2
    //   950: new 116	java/lang/StringBuilder
    //   953: dup
    //   954: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   957: ldc_w 274
    //   960: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   963: aload 16
    //   965: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   968: ldc_w 299
    //   971: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   974: aload 15
    //   976: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   979: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   982: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   985: iload 4
    //   987: istore_1
    //   988: iload 4
    //   990: istore_2
    //   991: aload 12
    //   993: ldc_w 315
    //   996: iconst_2
    //   997: anewarray 32	java/lang/Object
    //   1000: dup
    //   1001: iconst_0
    //   1002: new 116	java/lang/StringBuilder
    //   1005: dup
    //   1006: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   1009: aload 15
    //   1011: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1014: ldc_w 303
    //   1017: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1020: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1023: aastore
    //   1024: dup
    //   1025: iconst_1
    //   1026: aload 15
    //   1028: aastore
    //   1029: invokestatic 307	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   1032: invokevirtual 309	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;)Z
    //   1035: pop
    //   1036: goto +565 -> 1601
    //   1039: astore 11
    //   1041: iload_1
    //   1042: istore_2
    //   1043: iload_2
    //   1044: istore_1
    //   1045: aload 11
    //   1047: invokevirtual 318	java/lang/Exception:printStackTrace	()V
    //   1050: iload_2
    //   1051: istore_1
    //   1052: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1055: ifeq +16 -> 1071
    //   1058: iload_2
    //   1059: istore_1
    //   1060: ldc 11
    //   1062: iconst_2
    //   1063: ldc_w 320
    //   1066: aload 11
    //   1068: invokestatic 324	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1071: aload 19
    //   1073: invokevirtual 326	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1076: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1079: ifeq +59 -> 1138
    //   1082: ldc 11
    //   1084: iconst_2
    //   1085: new 116	java/lang/StringBuilder
    //   1088: dup
    //   1089: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   1092: ldc_w 274
    //   1095: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1098: aload 16
    //   1100: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1103: ldc_w 328
    //   1106: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1109: iload_2
    //   1110: invokevirtual 331	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1113: ldc_w 333
    //   1116: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1119: invokestatic 104	java/lang/System:nanoTime	()J
    //   1122: lload 9
    //   1124: lsub
    //   1125: ldc2_w 171
    //   1128: ldiv
    //   1129: invokevirtual 175	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1132: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1135: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1138: aload 12
    //   1140: ifnull +8 -> 1148
    //   1143: aload 12
    //   1145: invokevirtual 259	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   1148: aload 14
    //   1150: ifnull +8 -> 1158
    //   1153: aload 14
    //   1155: invokevirtual 261	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   1158: aload 13
    //   1160: ifnull -856 -> 304
    //   1163: aload 13
    //   1165: invokevirtual 264	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   1168: goto -864 -> 304
    //   1171: iload_3
    //   1172: istore_1
    //   1173: iload_3
    //   1174: istore_2
    //   1175: aload 19
    //   1177: invokevirtual 335	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   1180: iload_3
    //   1181: istore_1
    //   1182: iload_3
    //   1183: istore_2
    //   1184: aload 17
    //   1186: invokeinterface 73 1 0
    //   1191: new 116	java/lang/StringBuilder
    //   1194: dup
    //   1195: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   1198: lload 7
    //   1200: invokevirtual 175	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1203: ldc_w 266
    //   1206: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1209: ldc_w 268
    //   1212: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1215: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1218: iconst_1
    //   1219: invokeinterface 339 3 0
    //   1224: invokeinterface 82 1 0
    //   1229: pop
    //   1230: aload 19
    //   1232: invokevirtual 326	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1235: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1238: ifeq -100 -> 1138
    //   1241: ldc 11
    //   1243: iconst_2
    //   1244: new 116	java/lang/StringBuilder
    //   1247: dup
    //   1248: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   1251: ldc_w 274
    //   1254: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1257: aload 16
    //   1259: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1262: ldc_w 328
    //   1265: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1268: iload_3
    //   1269: invokevirtual 331	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1272: ldc_w 333
    //   1275: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1278: invokestatic 104	java/lang/System:nanoTime	()J
    //   1281: lload 9
    //   1283: lsub
    //   1284: ldc2_w 171
    //   1287: ldiv
    //   1288: invokevirtual 175	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1291: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1294: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1297: goto -159 -> 1138
    //   1300: astore 16
    //   1302: aload 12
    //   1304: astore 15
    //   1306: aload 14
    //   1308: astore 12
    //   1310: aload 13
    //   1312: astore 11
    //   1314: aload 15
    //   1316: astore 14
    //   1318: aload 16
    //   1320: astore 13
    //   1322: aload 13
    //   1324: invokevirtual 340	java/lang/NumberFormatException:printStackTrace	()V
    //   1327: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1330: ifeq +14 -> 1344
    //   1333: ldc 11
    //   1335: iconst_2
    //   1336: ldc_w 320
    //   1339: aload 13
    //   1341: invokestatic 324	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1344: aload 14
    //   1346: ifnull +8 -> 1354
    //   1349: aload 14
    //   1351: invokevirtual 259	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   1354: aload 12
    //   1356: ifnull +8 -> 1364
    //   1359: aload 12
    //   1361: invokevirtual 261	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   1364: aload 11
    //   1366: ifnull -1062 -> 304
    //   1369: aload 11
    //   1371: invokevirtual 264	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   1374: goto -1070 -> 304
    //   1377: astore 11
    //   1379: aload 19
    //   1381: invokevirtual 326	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1384: invokestatic 168	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1387: ifeq +59 -> 1446
    //   1390: ldc 11
    //   1392: iconst_2
    //   1393: new 116	java/lang/StringBuilder
    //   1396: dup
    //   1397: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   1400: ldc_w 274
    //   1403: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1406: aload 16
    //   1408: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1411: ldc_w 328
    //   1414: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1417: iload_1
    //   1418: invokevirtual 331	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1421: ldc_w 333
    //   1424: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1427: invokestatic 104	java/lang/System:nanoTime	()J
    //   1430: lload 9
    //   1432: lsub
    //   1433: ldc2_w 171
    //   1436: ldiv
    //   1437: invokevirtual 175	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1440: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1443: invokestatic 179	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1446: aload 11
    //   1448: athrow
    //   1449: astore 11
    //   1451: aload 12
    //   1453: ifnull +8 -> 1461
    //   1456: aload 12
    //   1458: invokevirtual 259	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   1461: aload 14
    //   1463: ifnull +8 -> 1471
    //   1466: aload 14
    //   1468: invokevirtual 261	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   1471: aload 13
    //   1473: ifnull +8 -> 1481
    //   1476: aload 13
    //   1478: invokevirtual 264	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   1481: aload 11
    //   1483: athrow
    //   1484: astore 11
    //   1486: aconst_null
    //   1487: astore 13
    //   1489: aconst_null
    //   1490: astore 14
    //   1492: aconst_null
    //   1493: astore 12
    //   1495: goto -44 -> 1451
    //   1498: astore 11
    //   1500: aconst_null
    //   1501: astore 14
    //   1503: aconst_null
    //   1504: astore 12
    //   1506: goto -55 -> 1451
    //   1509: astore 11
    //   1511: aconst_null
    //   1512: astore 12
    //   1514: goto -63 -> 1451
    //   1517: astore 16
    //   1519: aload 11
    //   1521: astore 13
    //   1523: aload 12
    //   1525: astore 15
    //   1527: aload 14
    //   1529: astore 12
    //   1531: aload 16
    //   1533: astore 11
    //   1535: aload 15
    //   1537: astore 14
    //   1539: goto -88 -> 1451
    //   1542: astore 13
    //   1544: aload 15
    //   1546: astore 14
    //   1548: goto -226 -> 1322
    //   1551: astore 14
    //   1553: aload 13
    //   1555: astore 11
    //   1557: aload 14
    //   1559: astore 13
    //   1561: aload 15
    //   1563: astore 14
    //   1565: goto -243 -> 1322
    //   1568: astore 16
    //   1570: aload 14
    //   1572: astore 12
    //   1574: aload 13
    //   1576: astore 11
    //   1578: aload 16
    //   1580: astore 13
    //   1582: aload 15
    //   1584: astore 14
    //   1586: goto -264 -> 1322
    //   1589: astore 11
    //   1591: iload_2
    //   1592: istore_1
    //   1593: goto -214 -> 1379
    //   1596: astore 11
    //   1598: goto -555 -> 1043
    //   1601: iload 5
    //   1603: iconst_1
    //   1604: iadd
    //   1605: istore 5
    //   1607: iload 4
    //   1609: istore_3
    //   1610: goto -923 -> 687
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1613	0	this	UpgradeDB
    //   179	1414	1	i	int
    //   177	1415	2	j	int
    //   683	927	3	k	int
    //   764	844	4	m	int
    //   685	921	5	n	int
    //   680	12	6	i1	int
    //   112	1087	7	l1	long
    //   675	756	9	l2	long
    //   100	595	11	localObject1	Object
    //   1039	28	11	localException1	Exception
    //   1312	58	11	localObject2	Object
    //   1377	70	11	localObject3	Object
    //   1449	33	11	localObject4	Object
    //   1484	1	11	localObject5	Object
    //   1498	1	11	localObject6	Object
    //   1509	11	11	localObject7	Object
    //   1533	44	11	localObject8	Object
    //   1589	1	11	localObject9	Object
    //   1596	1	11	localException2	Exception
    //   124	1449	12	localObject10	Object
    //   189	1333	13	localObject11	Object
    //   1542	12	13	localNumberFormatException1	NumberFormatException
    //   1559	22	13	localObject12	Object
    //   430	1117	14	localObject13	Object
    //   1551	7	14	localNumberFormatException2	NumberFormatException
    //   1563	22	14	localObject14	Object
    //   395	1188	15	localObject15	Object
    //   386	872	16	str	String
    //   1300	107	16	localNumberFormatException3	NumberFormatException
    //   1517	15	16	localObject16	Object
    //   1568	11	16	localNumberFormatException4	NumberFormatException
    //   29	1156	17	localSharedPreferences	android.content.SharedPreferences
    //   302	13	18	localIterator	java.util.Iterator
    //   437	943	19	localEntityTransaction	com.tencent.mobileqq.persistence.EntityTransaction
    // Exception table:
    //   from	to	target	type
    //   705	716	1039	java/lang/Exception
    //   720	731	1039	java/lang/Exception
    //   735	746	1039	java/lang/Exception
    //   750	761	1039	java/lang/Exception
    //   772	778	1039	java/lang/Exception
    //   784	822	1039	java/lang/Exception
    //   828	873	1039	java/lang/Exception
    //   880	891	1039	java/lang/Exception
    //   895	906	1039	java/lang/Exception
    //   913	924	1039	java/lang/Exception
    //   935	941	1039	java/lang/Exception
    //   947	985	1039	java/lang/Exception
    //   991	1036	1039	java/lang/Exception
    //   1175	1180	1039	java/lang/Exception
    //   1184	1230	1039	java/lang/Exception
    //   454	475	1300	java/lang/NumberFormatException
    //   508	585	1300	java/lang/NumberFormatException
    //   618	625	1300	java/lang/NumberFormatException
    //   667	677	1300	java/lang/NumberFormatException
    //   1071	1138	1300	java/lang/NumberFormatException
    //   1230	1297	1300	java/lang/NumberFormatException
    //   1379	1446	1300	java/lang/NumberFormatException
    //   1446	1449	1300	java/lang/NumberFormatException
    //   677	682	1377	finally
    //   1045	1050	1377	finally
    //   1052	1058	1377	finally
    //   1060	1071	1377	finally
    //   454	475	1449	finally
    //   508	585	1449	finally
    //   618	625	1449	finally
    //   667	677	1449	finally
    //   1071	1138	1449	finally
    //   1230	1297	1449	finally
    //   1379	1446	1449	finally
    //   1446	1449	1449	finally
    //   397	425	1484	finally
    //   425	432	1498	finally
    //   432	454	1509	finally
    //   1322	1344	1517	finally
    //   397	425	1542	java/lang/NumberFormatException
    //   425	432	1551	java/lang/NumberFormatException
    //   432	454	1568	java/lang/NumberFormatException
    //   705	716	1589	finally
    //   720	731	1589	finally
    //   735	746	1589	finally
    //   750	761	1589	finally
    //   772	778	1589	finally
    //   784	822	1589	finally
    //   828	873	1589	finally
    //   880	891	1589	finally
    //   895	906	1589	finally
    //   913	924	1589	finally
    //   935	941	1589	finally
    //   947	985	1589	finally
    //   991	1036	1589	finally
    //   1175	1180	1589	finally
    //   1184	1230	1589	finally
    //   677	682	1596	java/lang/Exception
  }
}
