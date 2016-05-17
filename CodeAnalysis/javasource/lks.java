import com.tencent.biz.ProtoUtils.TroopProtocolObserver;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lks
  extends ProtoUtils.TroopProtocolObserver
{
  public lks(TroopChatPie paramTroopChatPie, boolean paramBoolean)
  {
    super(paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  public void a(int paramInt, byte[] paramArrayOfByte, android.os.Bundle paramBundle)
  {
    // Byte code:
    //   0: iload_1
    //   1: ifne +7 -> 8
    //   4: aload_2
    //   5: ifnonnull +11 -> 16
    //   8: aload_0
    //   9: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   12: invokevirtual 31	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:az	()V
    //   15: return
    //   16: new 33	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody
    //   19: dup
    //   20: invokespecial 35	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody:<init>	()V
    //   23: astore 14
    //   25: aload 14
    //   27: aload_2
    //   28: invokevirtual 39	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   31: pop
    //   32: aload 14
    //   34: getfield 43	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody:rpt_msg_member_level_info	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   37: invokevirtual 49	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   40: astore 12
    //   42: aload_0
    //   43: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   46: getfield 52	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   49: bipush 51
    //   51: invokevirtual 58	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   54: checkcast 60	com/tencent/mobileqq/app/TroopManager
    //   57: astore 13
    //   59: aload 12
    //   61: ifnull +542 -> 603
    //   64: aload_0
    //   65: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   68: getfield 52	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   71: invokevirtual 63	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/persistence/EntityManagerFactory;
    //   74: invokevirtual 69	com/tencent/mobileqq/persistence/EntityManagerFactory:createEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   77: astore 15
    //   79: aconst_null
    //   80: astore_2
    //   81: invokestatic 75	com/tencent/mobileqq/msf/core/NetConnInfoCenter:getServerTime	()J
    //   84: lstore 4
    //   86: lload 4
    //   88: ldc2_w 76
    //   91: ladd
    //   92: lstore 4
    //   94: aload 15
    //   96: invokevirtual 82	com/tencent/mobileqq/persistence/EntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   99: astore_3
    //   100: aload_3
    //   101: astore_2
    //   102: lload 4
    //   104: lstore 8
    //   106: lload 4
    //   108: lstore 10
    //   110: aload_2
    //   111: invokevirtual 86	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   114: lload 4
    //   116: lstore 8
    //   118: lload 4
    //   120: lstore 10
    //   122: aload 12
    //   124: invokeinterface 92 1 0
    //   129: astore 16
    //   131: lload 4
    //   133: lstore 8
    //   135: lload 4
    //   137: lstore 10
    //   139: aload 16
    //   141: invokeinterface 98 1 0
    //   146: ifeq +543 -> 689
    //   149: lload 4
    //   151: lstore 8
    //   153: lload 4
    //   155: lstore 10
    //   157: aload 16
    //   159: invokeinterface 102 1 0
    //   164: checkcast 104	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo
    //   167: astore 17
    //   169: lload 4
    //   171: lstore 8
    //   173: lload 4
    //   175: lstore 10
    //   177: aload 17
    //   179: getfield 108	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint32_special_title_expire_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   182: invokevirtual 113	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   185: ifeq +464 -> 649
    //   188: lload 4
    //   190: lstore 8
    //   192: lload 4
    //   194: lstore 10
    //   196: aload 17
    //   198: getfield 108	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint32_special_title_expire_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   201: invokevirtual 116	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   204: iconst_m1
    //   205: if_icmpeq +29 -> 234
    //   208: lload 4
    //   210: lstore 8
    //   212: lload 4
    //   214: lstore 10
    //   216: aload 17
    //   218: getfield 108	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint32_special_title_expire_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   221: invokevirtual 116	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   224: i2l
    //   225: invokestatic 75	com/tencent/mobileqq/msf/core/NetConnInfoCenter:getServerTime	()J
    //   228: lsub
    //   229: lconst_0
    //   230: lcmp
    //   231: ifle +418 -> 649
    //   234: lload 4
    //   236: lstore 8
    //   238: lload 4
    //   240: lstore 10
    //   242: aload 13
    //   244: aload_0
    //   245: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   248: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   251: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   254: aload 17
    //   256: getfield 128	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   259: invokevirtual 132	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   262: invokestatic 138	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   265: invokevirtual 141	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/mobileqq/data/TroopMemberInfo;
    //   268: astore 12
    //   270: aload 12
    //   272: astore_3
    //   273: aload 12
    //   275: ifnonnull +64 -> 339
    //   278: lload 4
    //   280: lstore 8
    //   282: lload 4
    //   284: lstore 10
    //   286: new 143	com/tencent/mobileqq/data/TroopMemberInfo
    //   289: dup
    //   290: invokespecial 144	com/tencent/mobileqq/data/TroopMemberInfo:<init>	()V
    //   293: astore_3
    //   294: lload 4
    //   296: lstore 8
    //   298: lload 4
    //   300: lstore 10
    //   302: aload_3
    //   303: aload 17
    //   305: getfield 128	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   308: invokevirtual 132	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   311: invokestatic 138	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   314: putfield 147	com/tencent/mobileqq/data/TroopMemberInfo:memberuin	Ljava/lang/String;
    //   317: lload 4
    //   319: lstore 8
    //   321: lload 4
    //   323: lstore 10
    //   325: aload_3
    //   326: aload_0
    //   327: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   330: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   333: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   336: putfield 150	com/tencent/mobileqq/data/TroopMemberInfo:troopuin	Ljava/lang/String;
    //   339: lload 4
    //   341: lstore 8
    //   343: lload 4
    //   345: lstore 10
    //   347: aload 17
    //   349: getfield 154	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:bytes_special_title	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   352: invokevirtual 159	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   355: invokevirtual 165	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   358: astore 12
    //   360: lload 4
    //   362: lstore 8
    //   364: lload 4
    //   366: lstore 10
    //   368: aload 17
    //   370: getfield 108	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint32_special_title_expire_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   373: invokevirtual 116	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   376: istore_1
    //   377: lload 4
    //   379: lstore 6
    //   381: iload_1
    //   382: ifeq +19 -> 401
    //   385: lload 4
    //   387: lstore 6
    //   389: iload_1
    //   390: i2l
    //   391: lload 4
    //   393: lcmp
    //   394: ifge +7 -> 401
    //   397: iload_1
    //   398: i2l
    //   399: lstore 6
    //   401: lload 6
    //   403: lstore 8
    //   405: lload 6
    //   407: lstore 10
    //   409: aload_3
    //   410: getfield 169	com/tencent/mobileqq/data/TroopMemberInfo:mUniqueTitleExpire	I
    //   413: iload_1
    //   414: if_icmpne +23 -> 437
    //   417: lload 6
    //   419: lstore 8
    //   421: lload 6
    //   423: lstore 10
    //   425: aload_3
    //   426: getfield 172	com/tencent/mobileqq/data/TroopMemberInfo:mUniqueTitle	Ljava/lang/String;
    //   429: aload 12
    //   431: invokestatic 178	android/text/TextUtils:equals	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    //   434: ifne +342 -> 776
    //   437: lload 6
    //   439: lstore 8
    //   441: lload 6
    //   443: lstore 10
    //   445: aload_3
    //   446: aload 12
    //   448: putfield 172	com/tencent/mobileqq/data/TroopMemberInfo:mUniqueTitle	Ljava/lang/String;
    //   451: lload 6
    //   453: lstore 8
    //   455: lload 6
    //   457: lstore 10
    //   459: aload_3
    //   460: iload_1
    //   461: putfield 169	com/tencent/mobileqq/data/TroopMemberInfo:mUniqueTitleExpire	I
    //   464: lload 6
    //   466: lstore 8
    //   468: lload 6
    //   470: lstore 10
    //   472: aload_3
    //   473: aload 17
    //   475: getfield 181	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:bytes_nick_name	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   478: invokevirtual 159	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   481: invokevirtual 165	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   484: putfield 184	com/tencent/mobileqq/data/TroopMemberInfo:friendnick	Ljava/lang/String;
    //   487: lload 6
    //   489: lstore 8
    //   491: lload 6
    //   493: lstore 10
    //   495: aload_3
    //   496: invokevirtual 187	com/tencent/mobileqq/data/TroopMemberInfo:getStatus	()I
    //   499: sipush 1000
    //   502: if_icmpne +48 -> 550
    //   505: lload 6
    //   507: lstore 8
    //   509: lload 6
    //   511: lstore 10
    //   513: aload 15
    //   515: aload_3
    //   516: invokevirtual 191	com/tencent/mobileqq/persistence/EntityManager:b	(Lcom/tencent/mobileqq/persistence/Entity;)V
    //   519: lload 6
    //   521: lstore 8
    //   523: lload 6
    //   525: lstore 10
    //   527: aload 13
    //   529: aload_0
    //   530: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   533: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   536: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   539: aload_3
    //   540: getfield 147	com/tencent/mobileqq/data/TroopMemberInfo:memberuin	Ljava/lang/String;
    //   543: iconst_0
    //   544: invokevirtual 194	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;Ljava/lang/String;Z)V
    //   547: goto +229 -> 776
    //   550: lload 6
    //   552: lstore 8
    //   554: lload 6
    //   556: lstore 10
    //   558: aload 15
    //   560: aload_3
    //   561: invokevirtual 197	com/tencent/mobileqq/persistence/EntityManager:a	(Lcom/tencent/mobileqq/persistence/Entity;)Z
    //   564: pop
    //   565: goto -46 -> 519
    //   568: astore_3
    //   569: lload 8
    //   571: lstore 4
    //   573: aload_2
    //   574: ifnull +7 -> 581
    //   577: aload_2
    //   578: invokevirtual 199	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   581: aload 13
    //   583: aload_0
    //   584: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   587: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   590: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   593: lload 4
    //   595: invokevirtual 202	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;J)V
    //   598: aload 15
    //   600: invokevirtual 203	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   603: aload 14
    //   605: getfield 206	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody:uint64_end_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   608: invokevirtual 132	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   611: lconst_0
    //   612: lcmp
    //   613: ifeq +143 -> 756
    //   616: aload_0
    //   617: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   620: aload 14
    //   622: getfield 206	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody:uint64_end_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   625: invokevirtual 132	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   628: aload 14
    //   630: getfield 209	tencent/im/oidb/cmd0x787/oidb_0x787$RspBody:uint64_data_time	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   633: invokevirtual 132	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   636: invokevirtual 212	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:a	(JJ)V
    //   639: return
    //   640: astore_2
    //   641: aload_0
    //   642: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   645: invokevirtual 31	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:az	()V
    //   648: return
    //   649: lload 4
    //   651: lstore 8
    //   653: lload 4
    //   655: lstore 10
    //   657: aload 13
    //   659: aload_0
    //   660: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   663: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   666: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   669: aload 17
    //   671: getfield 128	tencent/im/oidb/cmd0x787/oidb_0x787$MemberLevelInfo:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   674: invokevirtual 132	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   677: invokestatic 138	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   680: ldc -42
    //   682: iconst_0
    //   683: invokevirtual 217	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    //   686: goto +94 -> 780
    //   689: lload 4
    //   691: lstore 8
    //   693: lload 4
    //   695: lstore 10
    //   697: aload_2
    //   698: invokevirtual 220	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   701: aload_2
    //   702: ifnull +7 -> 709
    //   705: aload_2
    //   706: invokevirtual 199	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   709: aload 13
    //   711: aload_0
    //   712: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   715: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   718: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   721: lload 4
    //   723: invokevirtual 202	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;J)V
    //   726: goto -128 -> 598
    //   729: aload_2
    //   730: ifnull +7 -> 737
    //   733: aload_2
    //   734: invokevirtual 199	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   737: aload 13
    //   739: aload_0
    //   740: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   743: getfield 119	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   746: getfield 124	com/tencent/mobileqq/activity/aio/SessionInfo:a	Ljava/lang/String;
    //   749: lload 4
    //   751: invokevirtual 202	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;J)V
    //   754: aload_3
    //   755: athrow
    //   756: aload_0
    //   757: getfield 10	lks:a	Lcom/tencent/mobileqq/activity/aio/rebuild/TroopChatPie;
    //   760: invokevirtual 31	com/tencent/mobileqq/activity/aio/rebuild/TroopChatPie:az	()V
    //   763: return
    //   764: astore_3
    //   765: lload 10
    //   767: lstore 4
    //   769: goto -40 -> 729
    //   772: astore_3
    //   773: goto -200 -> 573
    //   776: lload 6
    //   778: lstore 4
    //   780: goto -649 -> 131
    //   783: astore_3
    //   784: aconst_null
    //   785: astore_2
    //   786: goto -57 -> 729
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	789	0	this	lks
    //   0	789	1	paramInt	int
    //   0	789	2	paramArrayOfByte	byte[]
    //   0	789	3	paramBundle	android.os.Bundle
    //   84	695	4	l1	long
    //   379	398	6	l2	long
    //   104	588	8	l3	long
    //   108	658	10	l4	long
    //   40	407	12	localObject	Object
    //   57	681	13	localTroopManager	com.tencent.mobileqq.app.TroopManager
    //   23	606	14	localRspBody	tencent.im.oidb.cmd0x787.oidb_0x787.RspBody
    //   77	522	15	localEntityManager	com.tencent.mobileqq.persistence.EntityManager
    //   129	29	16	localIterator	java.util.Iterator
    //   167	503	17	localMemberLevelInfo	tencent.im.oidb.cmd0x787.oidb_0x787.MemberLevelInfo
    // Exception table:
    //   from	to	target	type
    //   110	114	568	java/lang/Exception
    //   122	131	568	java/lang/Exception
    //   139	149	568	java/lang/Exception
    //   157	169	568	java/lang/Exception
    //   177	188	568	java/lang/Exception
    //   196	208	568	java/lang/Exception
    //   216	234	568	java/lang/Exception
    //   242	270	568	java/lang/Exception
    //   286	294	568	java/lang/Exception
    //   302	317	568	java/lang/Exception
    //   325	339	568	java/lang/Exception
    //   347	360	568	java/lang/Exception
    //   368	377	568	java/lang/Exception
    //   409	417	568	java/lang/Exception
    //   425	437	568	java/lang/Exception
    //   445	451	568	java/lang/Exception
    //   459	464	568	java/lang/Exception
    //   472	487	568	java/lang/Exception
    //   495	505	568	java/lang/Exception
    //   513	519	568	java/lang/Exception
    //   527	547	568	java/lang/Exception
    //   558	565	568	java/lang/Exception
    //   657	686	568	java/lang/Exception
    //   697	701	568	java/lang/Exception
    //   16	59	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   64	79	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   81	86	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   577	581	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   581	598	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   598	603	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   603	639	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   705	709	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   709	726	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   733	737	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   737	756	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   756	763	640	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   110	114	764	finally
    //   122	131	764	finally
    //   139	149	764	finally
    //   157	169	764	finally
    //   177	188	764	finally
    //   196	208	764	finally
    //   216	234	764	finally
    //   242	270	764	finally
    //   286	294	764	finally
    //   302	317	764	finally
    //   325	339	764	finally
    //   347	360	764	finally
    //   368	377	764	finally
    //   409	417	764	finally
    //   425	437	764	finally
    //   445	451	764	finally
    //   459	464	764	finally
    //   472	487	764	finally
    //   495	505	764	finally
    //   513	519	764	finally
    //   527	547	764	finally
    //   558	565	764	finally
    //   657	686	764	finally
    //   697	701	764	finally
    //   94	100	772	java/lang/Exception
    //   94	100	783	finally
  }
}
