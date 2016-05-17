import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lwq
  implements Runnable
{
  public lwq(AvatarPendantActivity paramAvatarPendantActivity, String paramString, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: invokestatic 40	android/os/SystemClock:uptimeMillis	()J
    //   3: lstore 5
    //   5: new 42	java/io/File
    //   8: dup
    //   9: aload_0
    //   10: getfield 16	lwq:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   13: invokespecial 45	java/io/File:<init>	(Ljava/lang/String;)V
    //   16: astore 10
    //   18: invokestatic 49	com/tencent/mobileqq/utils/AvatarPendantUtil:a	()V
    //   21: aload 10
    //   23: invokevirtual 53	java/io/File:exists	()Z
    //   26: ifeq +246 -> 272
    //   29: aload 10
    //   31: invokestatic 59	com/tencent/mobileqq/utils/FileUtils:b	(Ljava/io/File;)Ljava/lang/String;
    //   34: astore 12
    //   36: aload 12
    //   38: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   41: ifne +231 -> 272
    //   44: aload_0
    //   45: getfield 14	lwq:jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity	Lcom/tencent/mobileqq/activity/pendant/AvatarPendantActivity;
    //   48: getfield 71	com/tencent/mobileqq/activity/pendant/AvatarPendantActivity:app	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   51: bipush 45
    //   53: invokevirtual 77	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   56: checkcast 79	com/tencent/mobileqq/vas/AvatarPendantManager
    //   59: invokevirtual 82	com/tencent/mobileqq/vas/AvatarPendantManager:a	()Ljava/util/List;
    //   62: astore 11
    //   64: new 84	org/json/JSONObject
    //   67: dup
    //   68: aload 12
    //   70: invokespecial 85	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   73: astore 12
    //   75: aload 12
    //   77: ldc 87
    //   79: invokevirtual 91	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   82: ifeq +152 -> 234
    //   85: aload 12
    //   87: ldc 87
    //   89: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   92: iconst_1
    //   93: if_icmpne +135 -> 228
    //   96: iconst_1
    //   97: istore 9
    //   99: iload 9
    //   101: putstatic 98	com/tencent/mobileqq/vas/AvatarPendantManager:c	Z
    //   104: aload 12
    //   106: ldc 100
    //   108: invokevirtual 104	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   111: astore 15
    //   113: new 106	java/util/HashSet
    //   116: dup
    //   117: invokespecial 107	java/util/HashSet:<init>	()V
    //   120: astore 13
    //   122: aload 15
    //   124: ldc 109
    //   126: invokevirtual 91	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   129: ifeq +197 -> 326
    //   132: aload 15
    //   134: ldc 109
    //   136: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   139: astore 14
    //   141: aload 14
    //   143: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   146: ifne +180 -> 326
    //   149: aload 14
    //   151: ldc 115
    //   153: invokevirtual 121	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   156: astore 14
    //   158: aload 14
    //   160: arraylength
    //   161: istore_2
    //   162: iconst_0
    //   163: istore_1
    //   164: iload_1
    //   165: iload_2
    //   166: if_icmpge +160 -> 326
    //   169: aload 14
    //   171: iload_1
    //   172: aaload
    //   173: astore 16
    //   175: aload 16
    //   177: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   180: ifne +14 -> 194
    //   183: aload 13
    //   185: aload 16
    //   187: invokestatic 127	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   190: invokevirtual 131	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   193: pop
    //   194: iload_1
    //   195: iconst_1
    //   196: iadd
    //   197: istore_1
    //   198: goto -34 -> 164
    //   201: astore 10
    //   203: invokestatic 136	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   206: ifeq +13 -> 219
    //   209: ldc -118
    //   211: iconst_2
    //   212: ldc -116
    //   214: aload 10
    //   216: invokestatic 144	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   219: return
    //   220: astore 10
    //   222: aload 10
    //   224: invokevirtual 147	java/io/IOException:printStackTrace	()V
    //   227: return
    //   228: iconst_0
    //   229: istore 9
    //   231: goto -132 -> 99
    //   234: iconst_0
    //   235: putstatic 98	com/tencent/mobileqq/vas/AvatarPendantManager:c	Z
    //   238: goto -134 -> 104
    //   241: astore 12
    //   243: aload 11
    //   245: invokeinterface 152 1 0
    //   250: aload 10
    //   252: invokevirtual 155	java/io/File:delete	()Z
    //   255: pop
    //   256: invokestatic 136	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   259: ifeq +13 -> 272
    //   262: ldc -118
    //   264: iconst_2
    //   265: ldc -99
    //   267: aload 12
    //   269: invokestatic 144	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   272: invokestatic 40	android/os/SystemClock:uptimeMillis	()J
    //   275: lstore 7
    //   277: invokestatic 136	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   280: ifeq -61 -> 219
    //   283: ldc -118
    //   285: iconst_2
    //   286: new 159	java/lang/StringBuilder
    //   289: dup
    //   290: invokespecial 160	java/lang/StringBuilder:<init>	()V
    //   293: ldc -94
    //   295: invokevirtual 166	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   298: lload 7
    //   300: lload 5
    //   302: lsub
    //   303: invokevirtual 169	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   306: ldc -85
    //   308: invokevirtual 166	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   311: aload 10
    //   313: invokevirtual 174	java/io/File:length	()J
    //   316: invokevirtual 169	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   319: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   322: invokestatic 182	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   325: return
    //   326: new 106	java/util/HashSet
    //   329: dup
    //   330: invokespecial 107	java/util/HashSet:<init>	()V
    //   333: astore 14
    //   335: aload 15
    //   337: ldc -72
    //   339: invokevirtual 91	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   342: ifeq +68 -> 410
    //   345: aload 15
    //   347: ldc -72
    //   349: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   352: astore 16
    //   354: aload 16
    //   356: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   359: ifne +51 -> 410
    //   362: aload 16
    //   364: ldc 115
    //   366: invokevirtual 121	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   369: astore 16
    //   371: aload 16
    //   373: arraylength
    //   374: istore_2
    //   375: iconst_0
    //   376: istore_1
    //   377: iload_1
    //   378: iload_2
    //   379: if_icmpge +31 -> 410
    //   382: aload 16
    //   384: iload_1
    //   385: aaload
    //   386: astore 17
    //   388: aload 17
    //   390: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   393: ifne +945 -> 1338
    //   396: aload 14
    //   398: aload 17
    //   400: invokestatic 127	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   403: invokevirtual 131	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   406: pop
    //   407: goto +931 -> 1338
    //   410: new 106	java/util/HashSet
    //   413: dup
    //   414: invokespecial 107	java/util/HashSet:<init>	()V
    //   417: astore 16
    //   419: aload 15
    //   421: ldc -70
    //   423: invokevirtual 91	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   426: ifeq +68 -> 494
    //   429: aload 15
    //   431: ldc -70
    //   433: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   436: astore 15
    //   438: aload 15
    //   440: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   443: ifne +51 -> 494
    //   446: aload 15
    //   448: ldc 115
    //   450: invokevirtual 121	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   453: astore 15
    //   455: aload 15
    //   457: arraylength
    //   458: istore_2
    //   459: iconst_0
    //   460: istore_1
    //   461: iload_1
    //   462: iload_2
    //   463: if_icmpge +31 -> 494
    //   466: aload 15
    //   468: iload_1
    //   469: aaload
    //   470: astore 17
    //   472: aload 17
    //   474: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   477: ifne +868 -> 1345
    //   480: aload 16
    //   482: aload 17
    //   484: invokestatic 127	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   487: invokevirtual 131	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   490: pop
    //   491: goto +854 -> 1345
    //   494: new 188	android/util/SparseArray
    //   497: dup
    //   498: invokespecial 189	android/util/SparseArray:<init>	()V
    //   501: astore 15
    //   503: aload 12
    //   505: ldc -65
    //   507: invokevirtual 104	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   510: astore 17
    //   512: aload 17
    //   514: invokevirtual 195	org/json/JSONObject:keys	()Ljava/util/Iterator;
    //   517: astore 18
    //   519: ldc -59
    //   521: iconst_0
    //   522: iconst_2
    //   523: invokevirtual 201	java/lang/String:substring	(II)Ljava/lang/String;
    //   526: astore 19
    //   528: aload 18
    //   530: invokeinterface 206 1 0
    //   535: ifeq +375 -> 910
    //   538: aload 18
    //   540: invokeinterface 210 1 0
    //   545: invokevirtual 211	java/lang/Object:toString	()Ljava/lang/String;
    //   548: astore 20
    //   550: aload 20
    //   552: ifnull -24 -> 528
    //   555: aload 17
    //   557: aload 20
    //   559: invokevirtual 104	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   562: astore 21
    //   564: aload 21
    //   566: ldc -43
    //   568: invokevirtual 104	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   571: astore 22
    //   573: aload 22
    //   575: ldc -41
    //   577: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   580: ifeq -52 -> 528
    //   583: aload 19
    //   585: aload 22
    //   587: ldc -39
    //   589: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   592: iconst_0
    //   593: iconst_2
    //   594: invokevirtual 201	java/lang/String:substring	(II)Ljava/lang/String;
    //   597: invokevirtual 220	java/lang/String:compareTo	(Ljava/lang/String;)I
    //   600: iflt -72 -> 528
    //   603: new 222	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo
    //   606: dup
    //   607: invokespecial 223	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:<init>	()V
    //   610: astore 20
    //   612: aload 20
    //   614: aload 22
    //   616: ldc -31
    //   618: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   621: putfield 228	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_c_of_type_Int	I
    //   624: aload 20
    //   626: aload 22
    //   628: ldc -26
    //   630: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   633: putfield 233	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:f	I
    //   636: aload 20
    //   638: aload 22
    //   640: ldc -21
    //   642: invokevirtual 239	org/json/JSONObject:getLong	(Ljava/lang/String;)J
    //   645: putfield 242	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Long	J
    //   648: aload 20
    //   650: aload 22
    //   652: ldc -12
    //   654: invokevirtual 239	org/json/JSONObject:getLong	(Ljava/lang/String;)J
    //   657: putfield 246	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_b_of_type_Long	J
    //   660: aload 21
    //   662: ldc -8
    //   664: invokevirtual 104	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   667: astore 21
    //   669: aload 20
    //   671: aload 21
    //   673: ldc -6
    //   675: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   678: putfield 252	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_b_of_type_Int	I
    //   681: aload 20
    //   683: aload 21
    //   685: ldc -2
    //   687: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   690: putfield 255	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   693: aload 20
    //   695: aload 21
    //   697: ldc_w 257
    //   700: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   703: putfield 259	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   706: aload 20
    //   708: aload 21
    //   710: ldc_w 261
    //   713: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   716: invokestatic 127	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   719: invokevirtual 265	java/lang/Integer:intValue	()I
    //   722: putfield 267	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Int	I
    //   725: aload 21
    //   727: ldc_w 269
    //   730: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   733: iconst_1
    //   734: if_icmpne +618 -> 1352
    //   737: iconst_1
    //   738: istore 9
    //   740: aload 20
    //   742: iload 9
    //   744: putfield 270	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Boolean	Z
    //   747: aload 20
    //   749: aload 21
    //   751: ldc_w 272
    //   754: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   757: putfield 274	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   760: aload 13
    //   762: aload 20
    //   764: getfield 267	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Int	I
    //   767: invokestatic 277	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   770: invokevirtual 280	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   773: ifeq +91 -> 864
    //   776: aload 20
    //   778: bipush 7
    //   780: putfield 283	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:g	I
    //   783: invokestatic 288	com/tencent/mobileqq/msf/core/NetConnInfoCenter:getServerTimeMillis	()J
    //   786: lstore 7
    //   788: aload 20
    //   790: getfield 228	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_c_of_type_Int	I
    //   793: iconst_1
    //   794: if_icmpne +96 -> 890
    //   797: aload 20
    //   799: getfield 242	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Long	J
    //   802: lload 7
    //   804: lcmp
    //   805: ifgt +85 -> 890
    //   808: lload 7
    //   810: aload 20
    //   812: getfield 246	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_b_of_type_Long	J
    //   815: lcmp
    //   816: ifgt +74 -> 890
    //   819: aload 20
    //   821: bipush 10
    //   823: putfield 291	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:h	I
    //   826: aload 16
    //   828: aload 20
    //   830: getfield 267	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Int	I
    //   833: invokestatic 277	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   836: invokevirtual 280	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   839: ifeq +10 -> 849
    //   842: aload 20
    //   844: bipush 9
    //   846: putfield 291	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:h	I
    //   849: aload 15
    //   851: aload 20
    //   853: getfield 267	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Int	I
    //   856: aload 20
    //   858: invokevirtual 295	android/util/SparseArray:put	(ILjava/lang/Object;)V
    //   861: goto -333 -> 528
    //   864: aload 14
    //   866: aload 20
    //   868: getfield 267	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_a_of_type_Int	I
    //   871: invokestatic 277	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   874: invokevirtual 280	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   877: ifeq -94 -> 783
    //   880: aload 20
    //   882: bipush 8
    //   884: putfield 283	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:g	I
    //   887: goto -104 -> 783
    //   890: aload 20
    //   892: getfield 228	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:jdField_c_of_type_Int	I
    //   895: bipush 6
    //   897: if_icmpne -71 -> 826
    //   900: aload 20
    //   902: bipush 6
    //   904: putfield 291	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo:h	I
    //   907: goto -81 -> 826
    //   910: aload 11
    //   912: invokeinterface 152 1 0
    //   917: aload 12
    //   919: ldc_w 297
    //   922: invokevirtual 301	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   925: astore 12
    //   927: aload 12
    //   929: invokevirtual 305	org/json/JSONArray:length	()I
    //   932: istore_3
    //   933: iconst_0
    //   934: istore_1
    //   935: iload_1
    //   936: iload_3
    //   937: if_icmpge +333 -> 1270
    //   940: aload 12
    //   942: iload_1
    //   943: invokevirtual 309	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   946: checkcast 84	org/json/JSONObject
    //   949: astore 13
    //   951: aload 13
    //   953: ldc -41
    //   955: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   958: ifne +6 -> 964
    //   961: goto +397 -> 1358
    //   964: aload 13
    //   966: ldc_w 311
    //   969: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   972: astore 16
    //   974: aload 16
    //   976: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   979: ifne +379 -> 1358
    //   982: aload 13
    //   984: ldc_w 313
    //   987: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   990: bipush 100
    //   992: if_icmpge +366 -> 1358
    //   995: new 315	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo
    //   998: dup
    //   999: invokespecial 316	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:<init>	()V
    //   1002: astore 14
    //   1004: aload 14
    //   1006: new 318	java/util/ArrayList
    //   1009: dup
    //   1010: invokespecial 319	java/util/ArrayList:<init>	()V
    //   1013: putfield 322	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   1016: aload 16
    //   1018: ldc 115
    //   1020: invokevirtual 121	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1023: astore 16
    //   1025: aload 16
    //   1027: arraylength
    //   1028: istore 4
    //   1030: iconst_0
    //   1031: istore_2
    //   1032: iload_2
    //   1033: iload 4
    //   1035: if_icmpge +56 -> 1091
    //   1038: aload 16
    //   1040: iload_2
    //   1041: aaload
    //   1042: astore 17
    //   1044: aload 17
    //   1046: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   1049: ifne +316 -> 1365
    //   1052: aload 15
    //   1054: aload 17
    //   1056: invokestatic 127	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   1059: invokevirtual 265	java/lang/Integer:intValue	()I
    //   1062: invokevirtual 323	android/util/SparseArray:get	(I)Ljava/lang/Object;
    //   1065: checkcast 222	com/tencent/mobileqq/vas/AvatarPendantShopItemInfo
    //   1068: astore 17
    //   1070: aload 17
    //   1072: ifnull +293 -> 1365
    //   1075: aload 14
    //   1077: getfield 322	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   1080: aload 17
    //   1082: invokeinterface 324 2 0
    //   1087: pop
    //   1088: goto +277 -> 1365
    //   1091: aload 14
    //   1093: getfield 322	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   1096: invokeinterface 327 1 0
    //   1101: ifle +257 -> 1358
    //   1104: aload 14
    //   1106: aload 13
    //   1108: ldc_w 313
    //   1111: invokevirtual 95	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   1114: putfield 328	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_a_of_type_Int	I
    //   1117: aload 14
    //   1119: aload 13
    //   1121: ldc_w 330
    //   1124: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1127: putfield 331	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   1130: aload 13
    //   1132: ldc_w 333
    //   1135: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1138: invokestatic 65	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   1141: ifne +120 -> 1261
    //   1144: aload 14
    //   1146: aload 13
    //   1148: ldc_w 333
    //   1151: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1154: invokestatic 127	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   1157: invokevirtual 265	java/lang/Integer:intValue	()I
    //   1160: putfield 334	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_b_of_type_Int	I
    //   1163: aload 14
    //   1165: aload 13
    //   1167: ldc_w 272
    //   1170: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1173: putfield 336	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:d	Ljava/lang/String;
    //   1176: aload 14
    //   1178: aload 13
    //   1180: ldc_w 338
    //   1183: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1186: putfield 340	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:e	Ljava/lang/String;
    //   1189: aload 14
    //   1191: aload 13
    //   1193: ldc_w 342
    //   1196: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1199: putfield 343	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   1202: aload 14
    //   1204: aload 13
    //   1206: ldc -2
    //   1208: invokevirtual 113	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   1211: putfield 344	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   1214: aload 14
    //   1216: iconst_m1
    //   1217: putfield 345	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_c_of_type_Int	I
    //   1220: aload 14
    //   1222: getfield 340	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:e	Ljava/lang/String;
    //   1225: ifnull +23 -> 1248
    //   1228: aload 14
    //   1230: getfield 340	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:e	Ljava/lang/String;
    //   1233: ldc_w 347
    //   1236: invokevirtual 350	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1239: ifne +9 -> 1248
    //   1242: aload 14
    //   1244: iconst_1
    //   1245: putfield 351	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_a_of_type_Boolean	Z
    //   1248: aload 11
    //   1250: aload 14
    //   1252: invokeinterface 324 2 0
    //   1257: pop
    //   1258: goto +100 -> 1358
    //   1261: aload 14
    //   1263: iconst_0
    //   1264: putfield 334	com/tencent/mobileqq/vas/AvatarPendantShopSeriesInfo:jdField_b_of_type_Int	I
    //   1267: goto -104 -> 1163
    //   1270: aload_0
    //   1271: getfield 14	lwq:jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity	Lcom/tencent/mobileqq/activity/pendant/AvatarPendantActivity;
    //   1274: getfield 354	com/tencent/mobileqq/activity/pendant/AvatarPendantActivity:a	Landroid/os/Handler;
    //   1277: sipush 1000
    //   1280: invokevirtual 360	android/os/Handler:sendEmptyMessage	(I)Z
    //   1283: pop
    //   1284: aload_0
    //   1285: getfield 14	lwq:jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity	Lcom/tencent/mobileqq/activity/pendant/AvatarPendantActivity;
    //   1288: getfield 71	com/tencent/mobileqq/activity/pendant/AvatarPendantActivity:app	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1291: invokevirtual 363	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1294: ldc_w 365
    //   1297: iconst_0
    //   1298: invokevirtual 371	com/tencent/qphone/base/util/BaseApplication:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   1301: invokeinterface 377 1 0
    //   1306: ldc_w 365
    //   1309: iconst_0
    //   1310: invokeinterface 383 3 0
    //   1315: invokeinterface 386 1 0
    //   1320: pop
    //   1321: aload_0
    //   1322: getfield 18	lwq:jdField_a_of_type_Boolean	Z
    //   1325: ifeq -1053 -> 272
    //   1328: aload_0
    //   1329: getfield 14	lwq:jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity	Lcom/tencent/mobileqq/activity/pendant/AvatarPendantActivity;
    //   1332: invokevirtual 388	com/tencent/mobileqq/activity/pendant/AvatarPendantActivity:e	()V
    //   1335: goto -1063 -> 272
    //   1338: iload_1
    //   1339: iconst_1
    //   1340: iadd
    //   1341: istore_1
    //   1342: goto -965 -> 377
    //   1345: iload_1
    //   1346: iconst_1
    //   1347: iadd
    //   1348: istore_1
    //   1349: goto -888 -> 461
    //   1352: iconst_0
    //   1353: istore 9
    //   1355: goto -615 -> 740
    //   1358: iload_1
    //   1359: iconst_1
    //   1360: iadd
    //   1361: istore_1
    //   1362: goto -427 -> 935
    //   1365: iload_2
    //   1366: iconst_1
    //   1367: iadd
    //   1368: istore_2
    //   1369: goto -337 -> 1032
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1372	0	this	lwq
    //   163	1199	1	i	int
    //   161	1208	2	j	int
    //   932	6	3	k	int
    //   1028	8	4	m	int
    //   3	298	5	l1	long
    //   275	534	7	l2	long
    //   97	1257	9	bool	boolean
    //   16	14	10	localFile	java.io.File
    //   201	14	10	localOutOfMemoryError	OutOfMemoryError
    //   220	92	10	localIOException	java.io.IOException
    //   62	1187	11	localList	java.util.List
    //   34	71	12	localObject1	Object
    //   241	677	12	localException	Exception
    //   925	16	12	localJSONArray	org.json.JSONArray
    //   120	1085	13	localObject2	Object
    //   139	1123	14	localObject3	Object
    //   111	942	15	localObject4	Object
    //   173	866	16	localObject5	Object
    //   386	695	17	localObject6	Object
    //   517	22	18	localIterator	java.util.Iterator
    //   526	58	19	str	String
    //   548	353	20	localObject7	Object
    //   562	188	21	localJSONObject1	org.json.JSONObject
    //   571	80	22	localJSONObject2	org.json.JSONObject
    // Exception table:
    //   from	to	target	type
    //   29	36	201	java/lang/OutOfMemoryError
    //   29	36	220	java/io/IOException
    //   64	96	241	java/lang/Exception
    //   99	104	241	java/lang/Exception
    //   104	162	241	java/lang/Exception
    //   175	194	241	java/lang/Exception
    //   234	238	241	java/lang/Exception
    //   326	375	241	java/lang/Exception
    //   388	407	241	java/lang/Exception
    //   410	459	241	java/lang/Exception
    //   472	491	241	java/lang/Exception
    //   494	528	241	java/lang/Exception
    //   528	550	241	java/lang/Exception
    //   555	737	241	java/lang/Exception
    //   740	783	241	java/lang/Exception
    //   783	826	241	java/lang/Exception
    //   826	849	241	java/lang/Exception
    //   849	861	241	java/lang/Exception
    //   864	887	241	java/lang/Exception
    //   890	907	241	java/lang/Exception
    //   910	933	241	java/lang/Exception
    //   940	961	241	java/lang/Exception
    //   964	1030	241	java/lang/Exception
    //   1044	1070	241	java/lang/Exception
    //   1075	1088	241	java/lang/Exception
    //   1091	1163	241	java/lang/Exception
    //   1163	1248	241	java/lang/Exception
    //   1248	1258	241	java/lang/Exception
    //   1261	1267	241	java/lang/Exception
    //   1270	1335	241	java/lang/Exception
  }
}
