package com.tencent.mobileqq.app.message;

import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarData;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.activity.ChatActivityFacade.HongbaoParams;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.contact.troop.TroopNotificationUtils;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.RecentUtil;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecommendTroopManagerImp;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.ark.ArkAppCenter;
import com.tencent.mobileqq.data.ChatHistorySearchData;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.data.DraftSummaryInfo;
import com.tencent.mobileqq.data.DraftTextInfo;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.NeedHandleUserData;
import com.tencent.mobileqq.data.PubAccountAssistantData;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.Sqlite;
import com.tencent.mobileqq.data.TransFileInfo;
import com.tencent.mobileqq.data.TroopAssistantData;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.DraftTextManager;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.revokemsg.RevokeMsgInfo;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.troop.data.MessageInfo;
import com.tencent.mobileqq.troop.data.TroopAndDiscMsgProxy;
import com.tencent.mobileqq.troop.data.TroopMessageManager;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.SecurityUtile;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MsgAutoMonitorUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import mqq.manager.Manager;
import msf.msgsvc.msg_svc.PbBindUinMsgReadedConfirmReq;
import msf.msgsvc.msg_svc.PbC2CReadedReportReq;
import msf.msgsvc.msg_svc.PbC2CReadedReportReq.UinPairReadInfo;
import msf.msgsvc.msg_svc.PbDiscussReadedReportReq;
import msf.msgsvc.msg_svc.PbGroupReadedReportReq;
import msf.msgsvc.msg_svc.PbMsgReadedReportReq;
import nkj;
import nkk;
import nkl;
import nkm;
import nkn;
import nko;

public class QQMessageFacade
  extends Observable
  implements Manager
{
  public static final int a = 1;
  public static final String a = "dataline_manager_ipad";
  public static final boolean a = true;
  public static final int b = 2;
  public static final String b = "dataline_manager_pc";
  public static final int c = 3;
  public static final String c = "notification";
  public static final int d = 4;
  public static final int e = 2;
  private static final String jdField_e_of_type_JavaLangString = "table_last_clip_time";
  public static final int f = 4;
  public static final int g = 5;
  public static final int h = 6;
  public static final int i = 7;
  public static final int j = 8;
  public static final int k = 9;
  private static final int m = 5000;
  private static final int n = 90;
  private static final int o = 8;
  public Handler a;
  private final QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private BaseMessageManager jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
  private QQMessageFacade.Message jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$Message;
  private DraftTextManager jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager;
  private Object jdField_a_of_type_JavaLangObject;
  private final List jdField_a_of_type_JavaUtilList;
  public final Map a;
  public final ConcurrentHashMap a;
  public final AtomicInteger a;
  private BaseMessageManager jdField_b_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
  public Map b;
  public final ConcurrentHashMap b;
  private volatile boolean jdField_b_of_type_Boolean;
  private BaseMessageManager jdField_c_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
  private Map jdField_c_of_type_JavaUtilMap;
  private ConcurrentHashMap jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap;
  private BaseMessageManager jdField_d_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
  private String jdField_d_of_type_JavaLangString;
  private BaseMessageManager jdField_e_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
  private final String f;
  private int l;
  private volatile int p;
  
  public QQMessageFacade(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_d_of_type_JavaLangString = null;
    l = -1;
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_b_of_type_Boolean = false;
    p = -1;
    jdField_c_of_type_JavaUtilMap = new ConcurrentHashMap();
    jdField_a_of_type_JavaLangObject = new Object();
    f = "Q.msg.QQMessageFacade";
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_JavaUtilMap = new ConcurrentHashMap();
    jdField_b_of_type_JavaUtilMap = new ConcurrentHashMap();
    jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager = DraftTextManager.a(paramQQAppInterface);
    a();
  }
  
  private int a(int paramInt)
  {
    int i3 = 0;
    int i1 = 0;
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a();
    int i2 = i1;
    if (localObject != null)
    {
      if (((Set)localObject).isEmpty()) {
        i2 = i1;
      }
    }
    else {
      return i2;
    }
    if (QLog.isColorLevel()) {}
    for (StringBuilder localStringBuilder = new StringBuilder("getUnreadMsgsNum type=" + paramInt + "{");; localStringBuilder = null)
    {
      localObject = ((Set)localObject).iterator();
      i1 = i3;
      while (((Iterator)localObject).hasNext())
      {
        ConversationInfo localConversationInfo = (ConversationInfo)((Iterator)localObject).next();
        if ((localConversationInfo != null) && (uin != null) && (!AppConstants.aB.equals(uin)) && (!TextUtils.equals(AppConstants.aX, uin)))
        {
          i2 = a(type).a(paramInt, localConversationInfo);
          if ((QLog.isColorLevel()) && (localStringBuilder != null) && (i2 > 0)) {
            localStringBuilder.append("[" + uin + "," + type + "," + i2 + "]");
          }
          i1 += i2;
        }
      }
      i2 = i1;
      if (!QLog.isColorLevel()) {
        break;
      }
      i2 = i1;
      if (localStringBuilder == null) {
        break;
      }
      i2 = i1;
      if (i1 <= 0) {
        break;
      }
      localStringBuilder.append("}");
      QLog.d("Q.msg.QQMessageFacade", 2, localStringBuilder.toString());
      return i1;
    }
  }
  
  private int a(List paramList, QQMessageFacade.Message paramMessage)
  {
    int i2;
    if ((paramList == null) || (paramMessage == null))
    {
      i2 = -1;
      return i2;
    }
    int i1 = 0;
    for (;;)
    {
      if (i1 >= paramList.size()) {
        break label54;
      }
      i2 = i1;
      if (a((QQMessageFacade.Message)paramList.get(i1), paramMessage)) {
        break;
      }
      i1 += 1;
    }
    label54:
    return -1;
  }
  
  public static long a(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    long l1 = 0L;
    if ((paramInt == 1) || (paramInt == 3000))
    {
      QQMessageFacade.Message localMessage = paramQQAppInterface.a().a(paramString, paramInt);
      l1 = shmsgseq;
      if (localMessage.isLongMsg())
      {
        paramQQAppInterface = paramQQAppInterface.a().b(paramString, paramInt);
        if ((paramQQAppInterface != null) && (paramQQAppInterface.size() > 0)) {
          l1 = Math.max(l1, getsize1shmsgseq);
        }
      }
    }
    else
    {
      return l1;
    }
    return l1;
  }
  
  private MsgProxy a(int paramInt)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt);
  }
  
  private QQMessageFacade.Message a(String paramString, int paramInt, EntityManager paramEntityManager)
  {
    return a(paramInt).a(paramString, paramInt, paramEntityManager);
  }
  
  /* Error */
  private void a(long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4: invokevirtual 139	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/proxy/ProxyManager;
    //   7: invokevirtual 297	com/tencent/mobileqq/app/proxy/ProxyManager:a	()Lcom/tencent/mobileqq/app/proxy/RecentUserProxy;
    //   10: iconst_1
    //   11: invokevirtual 302	com/tencent/mobileqq/app/proxy/RecentUserProxy:a	(Z)Ljava/util/List;
    //   14: invokeinterface 303 1 0
    //   19: astore 8
    //   21: iconst_0
    //   22: istore_3
    //   23: iconst_0
    //   24: istore 4
    //   26: aload 8
    //   28: invokeinterface 190 1 0
    //   33: ifeq +422 -> 455
    //   36: aload 8
    //   38: invokeinterface 194 1 0
    //   43: checkcast 305	com/tencent/mobileqq/data/RecentUser
    //   46: astore 9
    //   48: iload 4
    //   50: iconst_1
    //   51: iadd
    //   52: istore 7
    //   54: iload_3
    //   55: istore 6
    //   57: iload 7
    //   59: istore 5
    //   61: aload 9
    //   63: getfield 308	com/tencent/mobileqq/data/RecentUser:lastmsgtime	J
    //   66: lload_1
    //   67: lcmp
    //   68: ifle +377 -> 445
    //   71: aload 9
    //   73: getfield 309	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   76: getstatic 312	com/tencent/mobileqq/app/AppConstants:al	Ljava/lang/String;
    //   79: invokevirtual 210	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   82: ifeq +103 -> 185
    //   85: invokestatic 317	com/tencent/mobileqq/managers/TroopAssistantManager:a	()Lcom/tencent/mobileqq/managers/TroopAssistantManager;
    //   88: aload_0
    //   89: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   92: invokevirtual 320	com/tencent/mobileqq/managers/TroopAssistantManager:a	(Lcom/tencent/mobileqq/app/QQAppInterface;)Ljava/util/List;
    //   95: invokeinterface 303 1 0
    //   100: astore 9
    //   102: iload 7
    //   104: iconst_1
    //   105: isub
    //   106: istore 4
    //   108: aload 9
    //   110: invokeinterface 190 1 0
    //   115: ifeq +67 -> 182
    //   118: aload 9
    //   120: invokeinterface 194 1 0
    //   125: checkcast 322	com/tencent/mobileqq/data/TroopAssistantData
    //   128: astore 10
    //   130: iload 4
    //   132: iconst_1
    //   133: iadd
    //   134: istore 5
    //   136: iload 5
    //   138: istore 4
    //   140: aload 10
    //   142: getfield 323	com/tencent/mobileqq/data/TroopAssistantData:lastmsgtime	J
    //   145: lload_1
    //   146: lcmp
    //   147: ifle -39 -> 108
    //   150: iload_3
    //   151: iconst_1
    //   152: iadd
    //   153: istore_3
    //   154: aload_0
    //   155: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   158: aload 10
    //   160: getfield 326	com/tencent/mobileqq/data/TroopAssistantData:troopUin	Ljava/lang/String;
    //   163: iconst_1
    //   164: invokestatic 330	com/tencent/mobileqq/data/MessageRecord:getTableName	(Ljava/lang/String;I)Ljava/lang/String;
    //   167: iconst_1
    //   168: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   171: invokevirtual 340	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   174: pop
    //   175: iload 5
    //   177: istore 4
    //   179: goto -71 -> 108
    //   182: goto -156 -> 26
    //   185: aload 9
    //   187: getfield 309	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   190: aload 9
    //   192: getfield 341	com/tencent/mobileqq/data/RecentUser:type	I
    //   195: invokestatic 346	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Z
    //   198: ifeq +115 -> 313
    //   201: iload 7
    //   203: iconst_1
    //   204: isub
    //   205: istore 4
    //   207: aload_0
    //   208: aload 9
    //   210: getfield 309	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   213: aload 9
    //   215: getfield 341	com/tencent/mobileqq/data/RecentUser:type	I
    //   218: invokevirtual 273	com/tencent/mobileqq/app/message/QQMessageFacade:b	(Ljava/lang/String;I)Ljava/util/List;
    //   221: invokeinterface 303 1 0
    //   226: astore 9
    //   228: aload 9
    //   230: invokeinterface 190 1 0
    //   235: ifeq +75 -> 310
    //   238: aload 9
    //   240: invokeinterface 194 1 0
    //   245: checkcast 275	com/tencent/mobileqq/data/MessageRecord
    //   248: astore 10
    //   250: iload 4
    //   252: iconst_1
    //   253: iadd
    //   254: istore 5
    //   256: iload 5
    //   258: istore 4
    //   260: aload 10
    //   262: getfield 349	com/tencent/mobileqq/data/MessageRecord:time	J
    //   265: lload_1
    //   266: lcmp
    //   267: ifle -39 -> 228
    //   270: iload_3
    //   271: iconst_1
    //   272: iadd
    //   273: istore_3
    //   274: aload_0
    //   275: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   278: aload 10
    //   280: getfield 352	com/tencent/mobileqq/data/MessageRecord:senderuin	Ljava/lang/String;
    //   283: aload 10
    //   285: getfield 355	com/tencent/mobileqq/data/MessageRecord:istroop	I
    //   288: invokestatic 330	com/tencent/mobileqq/data/MessageRecord:getTableName	(Ljava/lang/String;I)Ljava/lang/String;
    //   291: aload 10
    //   293: getfield 355	com/tencent/mobileqq/data/MessageRecord:istroop	I
    //   296: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   299: invokevirtual 340	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   302: pop
    //   303: iload 5
    //   305: istore 4
    //   307: goto -79 -> 228
    //   310: goto -128 -> 182
    //   313: iload_3
    //   314: istore 4
    //   316: aload 9
    //   318: getfield 309	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   321: invokestatic 360	java/lang/Long:valueOf	(Ljava/lang/String;)Ljava/lang/Long;
    //   324: invokevirtual 364	java/lang/Long:longValue	()J
    //   327: ldc2_w 365
    //   330: lcmp
    //   331: ifle +46 -> 377
    //   334: iload_3
    //   335: iconst_1
    //   336: iadd
    //   337: istore_3
    //   338: iload_3
    //   339: istore 4
    //   341: aload_0
    //   342: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   345: aload 9
    //   347: getfield 309	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   350: aload 9
    //   352: getfield 341	com/tencent/mobileqq/data/RecentUser:type	I
    //   355: invokestatic 330	com/tencent/mobileqq/data/MessageRecord:getTableName	(Ljava/lang/String;I)Ljava/lang/String;
    //   358: aload 9
    //   360: getfield 341	com/tencent/mobileqq/data/RecentUser:type	I
    //   363: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   366: invokevirtual 340	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   369: pop
    //   370: iload 7
    //   372: istore 4
    //   374: goto -192 -> 182
    //   377: iload 7
    //   379: iconst_1
    //   380: isub
    //   381: istore 4
    //   383: goto -9 -> 374
    //   386: astore 9
    //   388: iload 7
    //   390: iconst_1
    //   391: isub
    //   392: istore_3
    //   393: aload 9
    //   395: invokevirtual 369	java/lang/NumberFormatException:printStackTrace	()V
    //   398: iload 4
    //   400: istore 6
    //   402: iload_3
    //   403: istore 5
    //   405: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   408: ifeq +37 -> 445
    //   411: ldc 91
    //   413: iconst_2
    //   414: new 162	java/lang/StringBuilder
    //   417: dup
    //   418: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   421: ldc_w 371
    //   424: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   427: aload 9
    //   429: invokevirtual 374	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   432: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   435: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   438: iload_3
    //   439: istore 5
    //   441: iload 4
    //   443: istore 6
    //   445: iload 6
    //   447: istore_3
    //   448: iload 5
    //   450: istore 4
    //   452: goto -270 -> 182
    //   455: iload_3
    //   456: iload 4
    //   458: if_icmpne +173 -> 631
    //   461: aload_0
    //   462: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   465: invokevirtual 377	java/util/concurrent/ConcurrentHashMap:keySet	()Ljava/util/Set;
    //   468: astore 10
    //   470: aload_0
    //   471: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   474: invokevirtual 380	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   477: astore 8
    //   479: aload 8
    //   481: ldc_w 382
    //   484: aconst_null
    //   485: invokevirtual 387	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   488: astore 9
    //   490: aload 9
    //   492: ifnull +140 -> 632
    //   495: aload 9
    //   497: astore 8
    //   499: aload 9
    //   501: invokeinterface 392 1 0
    //   506: ifeq +126 -> 632
    //   509: aload 9
    //   511: astore 8
    //   513: aload 9
    //   515: iconst_0
    //   516: invokeinterface 396 2 0
    //   521: invokestatic 401	com/tencent/mobileqq/utils/SecurityUtile:b	(Ljava/lang/String;)Ljava/lang/String;
    //   524: astore 11
    //   526: aload 9
    //   528: astore 8
    //   530: aload 10
    //   532: aload 11
    //   534: invokeinterface 404 2 0
    //   539: ifne -44 -> 495
    //   542: aload 9
    //   544: astore 8
    //   546: aload_0
    //   547: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   550: aload 11
    //   552: aload 11
    //   554: invokestatic 408	com/tencent/mobileqq/data/MessageRecord:getTypeByTableName	(Ljava/lang/String;)I
    //   557: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   560: invokevirtual 340	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   563: pop
    //   564: goto -69 -> 495
    //   567: astore 10
    //   569: aload 9
    //   571: astore 8
    //   573: aload 10
    //   575: invokevirtual 409	java/lang/Exception:printStackTrace	()V
    //   578: aload 9
    //   580: astore 8
    //   582: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   585: ifeq +34 -> 619
    //   588: aload 9
    //   590: astore 8
    //   592: ldc 91
    //   594: iconst_2
    //   595: new 162	java/lang/StringBuilder
    //   598: dup
    //   599: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   602: ldc_w 371
    //   605: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   608: aload 10
    //   610: invokevirtual 374	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   613: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   616: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   619: aload 9
    //   621: ifnull +10 -> 631
    //   624: aload 9
    //   626: invokeinterface 412 1 0
    //   631: return
    //   632: aload 9
    //   634: ifnull -3 -> 631
    //   637: aload 9
    //   639: invokeinterface 412 1 0
    //   644: return
    //   645: astore 9
    //   647: aconst_null
    //   648: astore 8
    //   650: aload 8
    //   652: ifnull +10 -> 662
    //   655: aload 8
    //   657: invokeinterface 412 1 0
    //   662: aload 9
    //   664: athrow
    //   665: astore 9
    //   667: goto -17 -> 650
    //   670: astore 10
    //   672: aconst_null
    //   673: astore 9
    //   675: goto -106 -> 569
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	678	0	this	QQMessageFacade
    //   0	678	1	paramLong	long
    //   22	437	3	i1	int
    //   24	435	4	i2	int
    //   59	390	5	i3	int
    //   55	391	6	i4	int
    //   52	340	7	i5	int
    //   19	637	8	localObject1	Object
    //   46	313	9	localObject2	Object
    //   386	42	9	localNumberFormatException	NumberFormatException
    //   488	150	9	localCursor	Cursor
    //   645	18	9	localObject3	Object
    //   665	1	9	localObject4	Object
    //   673	1	9	localObject5	Object
    //   128	403	10	localObject6	Object
    //   567	42	10	localException1	Exception
    //   670	1	10	localException2	Exception
    //   524	29	11	str	String
    // Exception table:
    //   from	to	target	type
    //   316	334	386	java/lang/NumberFormatException
    //   341	370	386	java/lang/NumberFormatException
    //   499	509	567	java/lang/Exception
    //   513	526	567	java/lang/Exception
    //   530	542	567	java/lang/Exception
    //   546	564	567	java/lang/Exception
    //   479	490	645	finally
    //   499	509	665	finally
    //   513	526	665	finally
    //   530	542	665	finally
    //   546	564	665	finally
    //   573	578	665	finally
    //   582	588	665	finally
    //   592	619	665	finally
    //   479	490	670	java/lang/Exception
  }
  
  private void a(String paramString, MessageRecord paramMessageRecord)
  {
    paramString = (SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13);
    if (!AnonymousChatHelper.a(paramMessageRecord))
    {
      int i1 = paramString.g();
      vipBubbleID = SVIPHandler.a(paramString.e(), i1);
      vipBubbleDiyTextId = i1;
    }
  }
  
  private void a(List paramList, EntityManager paramEntityManager, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
  {
    long l1 = System.currentTimeMillis();
    if (QLog.isColorLevel())
    {
      localObject1 = new StringBuilder().append("addMultiMessagesInner size = ");
      if (paramList != null) {
        break label105;
      }
    }
    label105:
    for (int i1 = 0;; i1 = paramList.size())
    {
      a(i1 + " sync = " + paramBoolean1 + " saveToDB = " + paramBoolean2 + " needUpdateUnread = " + paramBoolean3 + " needAddAIO = " + paramBoolean4, null);
      if ((paramList != null) && (!paramList.isEmpty())) {
        break;
      }
      return;
    }
    Object localObject1 = new BaseMessageManager.AddMessageContext(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    long l2 = paramList.size();
    Object localObject2 = paramList.iterator();
    Object localObject3;
    while (((Iterator)localObject2).hasNext())
    {
      localObject3 = (MessageRecord)((Iterator)localObject2).next();
      a(istroop).a((MessageRecord)localObject3, paramEntityManager, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, (BaseMessageManager.AddMessageContext)localObject1);
    }
    paramEntityManager = e.keySet().iterator();
    while (paramEntityManager.hasNext())
    {
      localObject2 = (String)paramEntityManager.next();
      localObject2 = ((List)e.get(localObject2)).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = (MessageRecord)((Iterator)localObject2).next();
        TroopBarAssistantManager.a().a((MessageRecord)localObject3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
    }
    e.clear();
    paramEntityManager = f.keySet().iterator();
    while (paramEntityManager.hasNext())
    {
      localObject2 = (String)paramEntityManager.next();
      localObject3 = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
      if (localObject3 != null) {
        ((EcShopAssistantManager)localObject3).a((MessageRecord)f.get(localObject2), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
    }
    paramEntityManager = a();
    int i2;
    if (paramEntityManager != null)
    {
      i2 = 0;
      if (istroop == 1)
      {
        localObject2 = jdField_a_of_type_ComTencentMobileqqModelTroopInfoManager.a(frienduin);
        i1 = i2;
        if (localObject2 != null)
        {
          i1 = i2;
          if (((MessageInfo)localObject2).b() == shmsgseq) {
            i1 = ((MessageInfo)localObject2).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true, frienduin);
          }
        }
        bizType = i1;
      }
    }
    else
    {
      localObject2 = jdField_a_of_type_JavaUtilMap.keySet().iterator();
    }
    for (;;)
    {
      if (!((Iterator)localObject2).hasNext()) {
        break label746;
      }
      localObject3 = (String)((Iterator)localObject2).next();
      localObject3 = (RecentUser)jdField_a_of_type_JavaUtilMap.get(localObject3);
      try
      {
        HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (RecentUser)localObject3);
        RecentUtil.a((RecentUser)localObject3, this);
        jdField_a_of_type_ComTencentMobileqqAppProxyRecentUserProxy.a((RecentUser)localObject3);
        if (paramEntityManager == null) {
          continue;
        }
        if (istroop != 3000) {
          break label729;
        }
        jdField_a_of_type_ComTencentMobileqqModelTroopInfoManager.b(uin + "&" + 3000);
      }
      catch (Exception localException) {}
      if (QLog.isColorLevel())
      {
        QLog.e("Q.msg.QQMessageFacade", 2, "addMultiMessagesInner --> Catch Exception .Info = " + localException);
        continue;
        i1 = i2;
        if (istroop != 3000) {
          break;
        }
        localObject2 = jdField_a_of_type_ComTencentMobileqqModelTroopInfoManager.a(frienduin + "&" + 3000);
        i1 = i2;
        if (localObject2 == null) {
          break;
        }
        i1 = i2;
        if (((MessageInfo)localObject2).b() != shmsgseq) {
          break;
        }
        i1 = ((MessageInfo)localObject2).a();
        break;
        label729:
        jdField_a_of_type_ComTencentMobileqqModelTroopInfoManager.b(uin);
      }
    }
    label746:
    paramEntityManager = jdField_b_of_type_JavaUtilMap.keySet().iterator();
    while (paramEntityManager.hasNext())
    {
      localObject2 = (String)paramEntityManager.next();
      TroopAssistantManager.a().a((MessageRecord)jdField_b_of_type_JavaUtilMap.get(localObject2), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    if (paramBoolean3) {
      jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade.a(paramList);
    }
    paramList = jdField_c_of_type_JavaUtilMap.keySet().iterator();
    while (paramList.hasNext())
    {
      paramEntityManager = (String)paramList.next();
      paramEntityManager = (MessageRecord)jdField_c_of_type_JavaUtilMap.get(paramEntityManager);
      paramEntityManager = a(frienduin, istroop);
      a(paramEntityManager);
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.QQMessageFacade", 2, "addMessage decodeMsg uin = " + frienduin + " , type = " + istroop + " ,msgType:" + msgtype + ", con = " + paramEntityManager.getLogColorContent());
      }
    }
    MsgAutoMonitorUtil.a().a(System.currentTimeMillis() - l1, l2);
  }
  
  private boolean a(QQMessageFacade.Message paramMessage1, QQMessageFacade.Message paramMessage2)
  {
    return a(frienduin, frienduin);
  }
  
  private boolean a(String paramString1, String paramString2)
  {
    if ((paramString1 != null) && (paramString2 != null)) {
      return paramString1.equals(paramString2);
    }
    return (paramString1 == null) && (paramString2 == null);
  }
  
  private boolean a(List paramList, QQMessageFacade.Message paramMessage)
  {
    if ((paramList == null) || (paramMessage == null)) {
      return false;
    }
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      if (a((QQMessageFacade.Message)paramList.next(), paramMessage)) {
        return true;
      }
    }
    return false;
  }
  
  private String b(String paramString, int paramInt)
  {
    return MsgProxyUtils.a(paramString, paramInt);
  }
  
  private void b(EntityManager paramEntityManager)
  {
    Object localObject = paramEntityManager.a(TroopAssistantData.class, false, null, null, null, null, "lastmsgtime desc", null);
    if ((localObject == null) || (((List)localObject).size() == 0)) {}
    for (;;)
    {
      return;
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        a(nexttroopUin, 1, paramEntityManager);
      }
    }
  }
  
  private MessageRecord c(String paramString, int paramInt)
  {
    paramString = MsgProxyUtils.b(a(paramInt).b(paramString, paramInt));
    if ((paramString != null) && (!paramString.isEmpty())) {
      return (MessageRecord)paramString.get(paramString.size() - 1);
    }
    return null;
  }
  
  private void d(QQMessageFacade.Message paramMessage)
  {
    if ((paramMessage != null) && (frienduin != null) && (frienduin.equals(AppConstants.af)) && (istroop == 1009))
    {
      unReadNum = 0;
      Object localObject = a(istroop).a(frienduin, istroop);
      if ((localObject != null) && (!((List)localObject).isEmpty()))
      {
        EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
          int i1 = unReadNum;
          unReadNum = (a(istroop).a(senderuin, istroop, 0L) + i1);
        }
        localEntityManager.a();
      }
    }
  }
  
  private void h(String paramString, int paramInt)
  {
    Object localObject = a(paramInt).a(paramString, paramInt);
    if ((localObject != null) && (!((List)localObject).isEmpty()))
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
        if (MsgProxyUtils.c(senderuin))
        {
          h(senderuin, istroop);
        }
        else if (((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).b(senderuin))
        {
          a().a(paramString, paramInt, frienduin, istroop);
          a(paramString, paramInt, senderuin, selfuin);
          QQMessageFacade.Message localMessage = a(senderuin, paramInt);
          RecentUserProxy localRecentUserProxy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
          RecentUser localRecentUser = localRecentUserProxy.a(frienduin, istroop);
          lastmsgtime = time;
          RecentUtil.a(localRecentUser, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          localRecentUserProxy.a(localRecentUser);
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.QQMessageFacade", 2, "refreshMsgBox uin=" + paramString + ",type=" + paramInt + ",move " + senderuin + " from box to recentlist");
          }
          setChanged();
          notifyObservers(localRecentUser);
        }
      }
    }
  }
  
  private void n()
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      if (localIterator.hasNext()) {
        nextcounter = 0;
      }
    }
    jdField_a_of_type_JavaUtilList.clear();
  }
  
  public int a()
  {
    return l;
  }
  
  public int a(String paramString, int paramInt)
  {
    return a(paramString, paramInt, true, true);
  }
  
  public int a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, 0, paramLong1, paramLong2, false);
  }
  
  public int a(String paramString, int paramInt, long paramLong, MessageRecord paramMessageRecord)
  {
    return a(paramInt).a(paramString, paramInt, paramLong, paramMessageRecord);
  }
  
  public int a(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    return a(paramInt).a(paramString, paramInt, paramMessageRecord);
  }
  
  public int a(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    return a(paramInt).a(paramString, paramInt, paramBoolean1, paramBoolean2);
  }
  
  public long a(String paramString)
  {
    List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0).b(paramString, 0);
    Object localObject2 = null;
    Object localObject1 = localObject2;
    int i1;
    if (localList != null)
    {
      i1 = localList.size() - 1;
      localObject1 = localObject2;
      if (i1 >= 0)
      {
        localObject1 = (MessageRecord)localList.get(i1);
        if (!senderuin.equals(paramString)) {
          break label178;
        }
        if (!QLog.isColorLevel()) {
          break label198;
        }
        QLog.i("vip", 2, "getLastC2CBubleID find in cache");
      }
    }
    label152:
    label178:
    label198:
    for (;;)
    {
      if (localObject1 == null)
      {
        paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0).a(paramString, 0, Long.MAX_VALUE, 1, String.format("issend<>%d and issend<>%d", new Object[] { Integer.valueOf(1), Integer.valueOf(2) }));
        if ((paramString != null) && (!paramString.isEmpty()))
        {
          paramString = (MessageRecord)paramString.get(0);
          localObject1 = paramString;
          if (QLog.isColorLevel())
          {
            QLog.d("vip", 2, "getLastC2CBubleID find in db");
            localObject1 = paramString;
          }
        }
      }
      for (;;)
      {
        if (localObject1 == null)
        {
          return 0L;
          i1 -= 1;
          break;
        }
        return vipBubbleID;
        paramString = (String)localObject1;
        break label152;
      }
    }
  }
  
  public long a(String paramString, int paramInt)
  {
    List localList = a(paramInt).b(paramString, paramInt);
    if ((localList == null) || (localList.isEmpty())) {
      return MessageCache.a();
    }
    if ((a()) && (a().equals(paramString)) && (a() == paramInt)) {
      return getsize1time;
    }
    paramInt = localList.size() - 1;
    while (paramInt >= 0)
    {
      if (getisread) {
        return gettime;
      }
      paramInt -= 1;
    }
    return Math.max(get0time - 1L, 0L);
  }
  
  public long a(String paramString1, String paramString2)
  {
    paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0).b(paramString1, 0);
    int i1;
    MessageRecord localMessageRecord;
    if (paramString1 != null)
    {
      i1 = paramString1.size() - 1;
      if (i1 >= 0)
      {
        localMessageRecord = (MessageRecord)paramString1.get(i1);
        if (senderuin.equals(paramString2))
        {
          paramString1 = localMessageRecord;
          if (QLog.isColorLevel()) {
            QLog.i("vip", 2, "getLastC2CBubleID find in cache");
          }
        }
      }
    }
    for (paramString1 = localMessageRecord;; paramString1 = null)
    {
      if (paramString1 == null)
      {
        return 0L;
        i1 -= 1;
        break;
      }
      return vipBubbleID;
    }
  }
  
  public BaseMessageManager a(int paramInt)
  {
    if (paramInt == 1)
    {
      if (jdField_b_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {}
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (jdField_b_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {
          jdField_b_of_type_ComTencentMobileqqAppMessageBaseMessageManager = new TroopMessageManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
        }
        return jdField_b_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
      }
    }
    if (paramInt == 3000)
    {
      if (jdField_c_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {}
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (jdField_c_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {
          jdField_c_of_type_ComTencentMobileqqAppMessageBaseMessageManager = new DiscMessageManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
        }
        return jdField_c_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
      }
    }
    if (paramInt == 7000)
    {
      if (jdField_d_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {}
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (jdField_d_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {
          jdField_d_of_type_ComTencentMobileqqAppMessageBaseMessageManager = new SubMessageManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
        }
        return jdField_d_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
      }
    }
    if (paramInt == 1026)
    {
      if (e == null) {}
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (e == null) {
          e = new HCTopicMessageManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
        }
        return e;
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {}
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager == null) {
        jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager = new C2CMessageManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
      }
      return jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager;
    }
  }
  
  public C2CMessageManager a()
  {
    return (C2CMessageManager)a(0);
  }
  
  public ConversationFacade a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
  }
  
  public DatalineMessageManager a(int paramInt)
  {
    switch (paramInt)
    {
    }
    for (String str = "dataline_manager_pc";; str = "dataline_manager_ipad") {
      return (DatalineMessageManager)a(str);
    }
  }
  
  public DiscMessageManager a()
  {
    return (DiscMessageManager)a(3000);
  }
  
  public IMessageManager a(String paramString)
  {
    if (jdField_c_of_type_JavaUtilMap == null) {
      return null;
    }
    if (!jdField_c_of_type_JavaUtilMap.containsKey(paramString)) {}
    for (;;)
    {
      Object localObject;
      synchronized (jdField_c_of_type_JavaUtilMap)
      {
        if (jdField_c_of_type_JavaUtilMap.containsKey(paramString)) {
          break label114;
        }
        if ("dataline_manager_pc".equals(paramString))
        {
          localObject = new DatalineMessagePcManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
          if (localObject != null) {
            break label102;
          }
          return null;
        }
      }
      if ("dataline_manager_ipad".equals(paramString))
      {
        localObject = new DatalineMessageIpadManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
        continue;
        label102:
        jdField_c_of_type_JavaUtilMap.put(paramString, localObject);
        label114:
        return (IMessageManager)jdField_c_of_type_JavaUtilMap.get(paramString);
      }
      else
      {
        localObject = null;
      }
    }
  }
  
  public QQMessageFacade.Message a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$Message;
  }
  
  public QQMessageFacade.Message a(String paramString, int paramInt)
  {
    if (paramString == null)
    {
      paramString = new QQMessageFacade.Message();
      return paramString;
    }
    System.currentTimeMillis();
    StringBuilder localStringBuilder = new StringBuilder("Case:");
    String str1 = b(paramString, paramInt);
    QQMessageFacade.Message localMessage = (QQMessageFacade.Message)jdField_a_of_type_JavaUtilMap.get(str1);
    Object localObject;
    if (localMessage != null)
    {
      localObject = localMessage;
      if (isCacheValid) {}
    }
    else
    {
      if (p != 0) {
        break label152;
      }
      localObject = new QQMessageFacade.Message();
      frienduin = paramString;
      istroop = paramInt;
      jdField_a_of_type_JavaUtilMap.put(str1, localObject);
      localStringBuilder.append("All-In");
    }
    for (;;)
    {
      paramString = (String)localObject;
      if (localObject == null) {
        break;
      }
      paramString = (String)localObject;
      if (!MsgProxyUtils.a(frienduin, istroop)) {
        break;
      }
      istroop = MsgProxyUtils.a(istroop);
      return localObject;
      label152:
      if (!jdField_b_of_type_Boolean)
      {
        localObject = localMessage;
        if (localMessage == null)
        {
          localObject = new QQMessageFacade.Message();
          frienduin = paramString;
          istroop = paramInt;
          isCacheValid = false;
          jdField_a_of_type_JavaUtilMap.put(str1, localObject);
        }
        localStringBuilder.append("Not-Finish-Yet");
      }
      else
      {
        localObject = MessageRecord.getTableName(paramString, paramInt);
        String str2 = MessageRecord.getOldTableName(paramString, paramInt);
        EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
        if ((!localEntityManager.d((String)localObject)) && (!localEntityManager.d(str2))) {
          break label325;
        }
        localMessage = a(paramString, paramInt, localEntityManager);
        localStringBuilder.append("Check-DB");
        localObject = localMessage;
        if (localMessage == null)
        {
          localObject = new QQMessageFacade.Message();
          frienduin = paramString;
          istroop = paramInt;
          jdField_a_of_type_JavaUtilMap.put(str1, localObject);
        }
        localEntityManager.a();
      }
    }
    label325:
    if (localMessage == null)
    {
      localObject = new QQMessageFacade.Message();
      frienduin = paramString;
      istroop = paramInt;
      jdField_a_of_type_JavaUtilMap.put(str1, localObject);
    }
    for (;;)
    {
      localStringBuilder.append("Not-In-TableCache");
      break;
      isCacheValid = true;
      localObject = localMessage;
    }
  }
  
  public ChatHistorySearchData a(SessionInfo paramSessionInfo, String paramString)
  {
    return a(jdField_a_of_type_Int).a(paramSessionInfo, paramString);
  }
  
  public ChatHistorySearchData a(String paramString, int paramInt, List paramList)
  {
    if ((paramList == null) || (paramList.size() == 0) || (TextUtils.isEmpty(paramString))) {
      return null;
    }
    ChatHistorySearchData localChatHistorySearchData = new ChatHistorySearchData();
    mSearchData1 = a(paramInt).c(paramString, paramInt, paramList);
    return localChatHistorySearchData;
  }
  
  public DraftSummaryInfo a(String paramString, int paramInt)
  {
    if ((paramString != null) && (jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager != null)) {
      return jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, paramInt);
    }
    return null;
  }
  
  public MessageRecord a(MessageRecord paramMessageRecord)
  {
    if (longMsgIndex == 0) {}
    List localList;
    do
    {
      return paramMessageRecord;
      localList = a(istroop).b(frienduin, istroop);
    } while ((localList == null) || (localList.isEmpty()));
    int i1 = localList.size() - 1;
    if (i1 >= 0)
    {
      MessageRecord localMessageRecord = (MessageRecord)localList.get(i1);
      if (MsgProxyUtils.a(localMessageRecord, paramMessageRecord))
      {
        if (longMsgIndex == 0) {
          return localMessageRecord;
        }
        if (longMsgIndex < longMsgIndex) {
          paramMessageRecord = localMessageRecord;
        }
      }
      for (;;)
      {
        i1 -= 1;
        break;
      }
    }
    return paramMessageRecord;
  }
  
  public MessageRecord a(String paramString, int paramInt)
  {
    Object localObject1 = a(paramInt).b(paramString, paramInt);
    if (localObject1 != null)
    {
      int i1 = ((List)localObject1).size() - 1;
      Object localObject2;
      if (i1 >= 0)
      {
        localObject2 = (MessageRecord)((List)localObject1).get(i1);
        if ((isValid) && (!MsgProxyUtils.g(msgtype)))
        {
          localObject1 = localObject2;
          if (!((MessageRecord)localObject2).isLongMsg()) {}
        }
      }
      for (localObject1 = a((MessageRecord)localObject2);; localObject1 = null)
      {
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = a(paramInt).a(paramString, paramInt, null);
        }
        return localObject2;
        i1 -= 1;
        break;
      }
    }
    return null;
  }
  
  public MessageRecord a(String paramString, int paramInt, long paramLong)
  {
    return a(paramInt).a(paramString, paramInt, paramLong);
  }
  
  public MessageRecord a(String paramString1, int paramInt1, long paramLong1, String paramString2, String paramString3, long paramLong2, int paramInt2)
  {
    return a(paramInt1).a(paramString1, paramInt1, paramLong1, paramString2, paramString3, paramLong2, paramInt2);
  }
  
  public MessageRecord a(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    MsgProxy localMsgProxy = a(paramInt);
    if ((localMsgProxy instanceof TroopAndDiscMsgProxy)) {
      return ((TroopAndDiscMsgProxy)localMsgProxy).a(paramString, paramInt, paramMessageRecord);
    }
    return null;
  }
  
  public MessageRecord a(String paramString, int paramInt, MessageRecord paramMessageRecord, List paramList)
  {
    MsgProxy localMsgProxy = a(paramInt);
    if ((localMsgProxy instanceof TroopAndDiscMsgProxy)) {
      return ((TroopAndDiscMsgProxy)localMsgProxy).a(paramString, paramInt, paramMessageRecord, paramList);
    }
    return null;
  }
  
  public TroopMessageManager a()
  {
    return (TroopMessageManager)a(1);
  }
  
  public String a()
  {
    return jdField_d_of_type_JavaLangString;
  }
  
  public String a(Context paramContext, MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    QQMessageFacade.Message localMessage = new QQMessageFacade.Message();
    MessageRecord.copyMessageRecordBaseField(localMessage, paramMessageRecord);
    emoRecentMsg = null;
    fileType = -1;
    a(localMessage);
    paramMessageRecord = new MsgSummary();
    MsgUtils.a(paramContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessage, istroop, paramMessageRecord, nickName, false, paramBoolean);
    return paramMessageRecord.a(paramContext).toString();
  }
  
  public String a(String paramString, int paramInt)
  {
    if ((paramString != null) && (jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager != null)) {
      return jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, paramInt);
    }
    return null;
  }
  
  public List a()
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      List localList2 = (List)((ArrayList)jdField_a_of_type_JavaUtilList).clone();
      return localList2;
    }
  }
  
  public List a(String paramString, int paramInt)
  {
    return a(paramString, paramInt, -1L);
  }
  
  public List a(String paramString, int paramInt1, int paramInt2)
  {
    return a(paramInt1).a(paramString, paramInt1, paramInt2, null);
  }
  
  public List a(String paramString, int paramInt, long paramLong)
  {
    int i2 = 0;
    paramString = a(paramInt).a(paramString, paramInt, paramLong);
    ChatMessage localChatMessage;
    if ((paramInt == 7100) || (paramInt == 1001))
    {
      if (paramString == null) {}
      for (int i1 = 0;; i1 = paramString.size())
      {
        i1 -= 1;
        while (i1 >= 0)
        {
          localChatMessage = (ChatMessage)paramString.get(i1);
          if ((localChatMessage != null) && (((paramInt == 7100) && (MessageUtils.a(msgtype))) || ((paramInt == 1001) && (msgtype == 61525)))) {
            paramString.remove(localChatMessage);
          }
          i1 -= 1;
        }
      }
    }
    if (paramInt == 1008)
    {
      if (paramString == null)
      {
        paramInt = i2;
        paramInt -= 1;
        label148:
        if (paramInt < 0) {
          break label260;
        }
        localChatMessage = (ChatMessage)paramString.get(paramInt);
        if (localChatMessage != null) {
          break label186;
        }
      }
      for (;;)
      {
        paramInt -= 1;
        break label148;
        paramInt = paramString.size();
        break;
        label186:
        if (((localChatMessage instanceof MessageForText)) && (PAWeatherItemBuilder.a(senderuin)) && (!msg.startsWith(" "))) {
          paramString.remove(localChatMessage);
        }
        if ((msgtype == 60528) && (ArkAppCenter.a())) {
          paramString.remove(localChatMessage);
        }
      }
    }
    try
    {
      label260:
      Collections.sort(paramString, new nkm(this));
      return paramString;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.w("Q.msg.QQMessageFacade", 2, "Collections sort exception ! ", localException);
    }
    return paramString;
  }
  
  public List a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    return a(paramInt).a(paramString, paramInt, paramLong1, paramLong2);
  }
  
  public List a(String paramString, int paramInt, List paramList)
  {
    return a(paramInt).a(paramString, paramInt, paramList);
  }
  
  public List a(String paramString, int paramInt, int[] paramArrayOfInt)
  {
    return a(paramInt).a(paramString, paramInt, 5000, paramArrayOfInt);
  }
  
  public List a(String paramString, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    return a(paramInt1).a(paramString, paramInt1, paramInt2, paramArrayOfInt);
  }
  
  public ConcurrentHashMap a()
  {
    return jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap;
  }
  
  public msg_svc.PbMsgReadedReportReq a(String paramString, int paramInt, boolean paramBoolean)
  {
    long l1 = System.currentTimeMillis();
    StringBuilder localStringBuilder;
    msg_svc.PbMsgReadedReportReq localPbMsgReadedReportReq;
    Object localObject2;
    Object localObject1;
    label156:
    Object localObject3;
    if (MsgProxyUtils.a(paramString, paramInt))
    {
      d(paramString, paramInt);
      List localList = b(paramString, paramInt);
      if (localList == null) {
        return null;
      }
      localStringBuilder = new StringBuilder();
      paramString = null;
      localPbMsgReadedReportReq = new msg_svc.PbMsgReadedReportReq();
      paramInt = localList.size() - 1;
      if (paramInt >= 0)
      {
        localObject2 = (MessageRecord)localList.get(paramInt);
        if (localObject2 == null) {
          localObject1 = paramString;
        }
        do
        {
          do
          {
            paramInt -= 1;
            paramString = (String)localObject1;
            break;
            if (!MsgProxyUtils.c(senderuin)) {
              break label291;
            }
            localObject2 = b(senderuin, istroop);
            localObject1 = paramString;
          } while (localObject2 == null);
          localObject1 = paramString;
        } while (((List)localObject2).isEmpty());
        localObject2 = ((List)localObject2).iterator();
        do
        {
          localObject1 = paramString;
          if (!((Iterator)localObject2).hasNext()) {
            break;
          }
          localObject3 = (MessageRecord)((Iterator)localObject2).next();
        } while (localObject3 == null);
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(senderuin, istroop) <= 0) {
          break label556;
        }
        a(senderuin, istroop, false, paramBoolean);
        localObject1 = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
        peer_uin.set(Long.valueOf(senderuin).longValue());
        last_read_time.set((int)time);
        if (paramString != null) {
          break label553;
        }
        paramString = new msg_svc.PbC2CReadedReportReq();
        label279:
        pair_info.add((MessageMicro)localObject1);
      }
    }
    label291:
    label553:
    label556:
    for (;;)
    {
      break label156;
      localObject1 = paramString;
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(senderuin, istroop) <= 0) {
        break;
      }
      a(senderuin, istroop, false, paramBoolean);
      localObject3 = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
      peer_uin.set(Long.valueOf(senderuin).longValue());
      last_read_time.set((int)time);
      localObject1 = paramString;
      if (paramString == null) {
        localObject1 = new msg_svc.PbC2CReadedReportReq();
      }
      pair_info.add((MessageMicro)localObject3);
      localStringBuilder.append("{MSGBOX:").append(senderuin).append("}");
      break;
      if (paramString != null)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a();
        if (localObject1 != null) {
          sync_cookie.set(ByteStringMicro.copyFrom((byte[])localObject1));
        }
        c2c_read_report.set(paramString);
        if (QLog.isColorLevel())
        {
          QLog.d("Q.msg.QQMessageFacade", 2, "<ReadReport_LBS>setLbsFriendReaded: " + localStringBuilder.toString());
          long l2 = System.currentTimeMillis();
          QLog.d("Q.msg_box", 2, "setBoxMsgReaded[cost:" + (l2 - l1) + "]");
        }
        return localPbMsgReadedReportReq;
      }
      return null;
      break label279;
    }
  }
  
  public msg_svc.PbMsgReadedReportReq a(boolean paramBoolean)
  {
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a();
    if ((localObject2 == null) || (((Set)localObject2).isEmpty())) {
      return null;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    Object localObject1 = null;
    msg_svc.PbMsgReadedReportReq localPbMsgReadedReportReq = new msg_svc.PbMsgReadedReportReq();
    Iterator localIterator = ((Set)localObject2).iterator();
    Object localObject3;
    Object localObject4;
    label187:
    label257:
    Object localObject5;
    for (;;)
    {
      if (localIterator.hasNext())
      {
        localObject3 = (ConversationInfo)localIterator.next();
        if ((ConversationFacade.a((ConversationInfo)localObject3) > 0) && (a().b(uin, type))) {
          if (MsgProxyUtils.a(uin, type))
          {
            localObject3 = b(uin, type);
            if (localObject3 == null) {
              continue;
            }
            int i1 = ((List)localObject3).size();
            i1 -= 1;
            if (i1 >= 0)
            {
              localObject4 = (MessageRecord)((List)localObject3).get(i1);
              if (localObject4 == null) {
                localObject2 = localObject1;
              }
              do
              {
                do
                {
                  do
                  {
                    i1 -= 1;
                    localObject1 = localObject2;
                    break;
                    if (!MsgProxyUtils.c(senderuin)) {
                      break label368;
                    }
                    localObject4 = b(senderuin, istroop);
                    localObject2 = localObject1;
                  } while (localObject4 == null);
                  localObject2 = localObject1;
                } while (((List)localObject4).isEmpty());
                localObject4 = ((List)localObject4).iterator();
                localObject2 = localObject1;
              } while (!((Iterator)localObject4).hasNext());
              localObject5 = (MessageRecord)((Iterator)localObject4).next();
              a(senderuin, istroop, true, paramBoolean);
              localObject2 = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
              peer_uin.set(Long.valueOf(senderuin).longValue());
              last_read_time.set((int)time);
              if (localObject1 != null) {
                break label1128;
              }
              localObject1 = new msg_svc.PbC2CReadedReportReq();
            }
          }
        }
      }
    }
    label368:
    label676:
    label1125:
    label1128:
    for (;;)
    {
      pair_info.add((MessageMicro)localObject2);
      break label257;
      a(senderuin, istroop, true, paramBoolean);
      localObject5 = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
      peer_uin.set(Long.valueOf(senderuin).longValue());
      last_read_time.set((int)time);
      localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = new msg_svc.PbC2CReadedReportReq();
      }
      pair_info.add((MessageMicro)localObject5);
      localStringBuilder.append("{MSGBOX:").append(frienduin).append("}");
      break label187;
      break;
      if (7000 == type)
      {
        if (AppConstants.ag.equals(uin)) {
          break;
        }
        localObject2 = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
        if (localObject2 == null) {
          break;
        }
        ((SubAccountManager)localObject2).b(uin);
        localObject2 = ((SubAccountManager)localObject2).a(uin);
        if (localObject2 == null) {
          break;
        }
        localObject3 = new msg_svc.PbBindUinMsgReadedConfirmReq();
        sync_cookie.set(ByteStringMicro.copyFrom((byte[])localObject2));
        bind_uin_read_report.set((MessageMicro)localObject3);
        localStringBuilder.append("{SUBUIN}");
        break;
      }
      long l1;
      if ((1006 == type) || ((MsgProxyUtils.c(type)) && (Long.valueOf(uin).longValue() > 10000L)))
      {
        a(uin, type, true, paramBoolean);
        l1 = b(uin, type);
        if (l1 == -1L)
        {
          if (localObject1 != null)
          {
            localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a();
            if (localObject2 != null) {
              sync_cookie.set(ByteStringMicro.copyFrom((byte[])localObject2));
            }
            c2c_read_report.set((MessageMicro)localObject1);
          }
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.QQMessageFacade", 2, "<ReadReport_All>setAllReaded: " + localStringBuilder.toString());
          }
          return localPbMsgReadedReportReq;
        }
        localObject4 = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
        localObject2 = uin;
        if (1006 == type) {
          localObject2 = ContactUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin);
        }
        if (TextUtils.isEmpty((CharSequence)localObject2)) {
          break;
        }
        peer_uin.set(Long.valueOf((String)localObject2).longValue());
        localStringBuilder.append("{C2C:").append(Long.valueOf((String)localObject2)).append(type).append("}");
        last_read_time.set((int)l1);
        if (localObject1 != null) {
          break label1125;
        }
        localObject1 = new msg_svc.PbC2CReadedReportReq();
      }
      for (;;)
      {
        pair_info.add((MessageMicro)localObject4);
        break;
        if (3000 == type)
        {
          a(uin, type, true, paramBoolean);
          l1 = b(uin, type);
          if (l1 == -1L) {
            break label676;
          }
          localObject2 = new msg_svc.PbDiscussReadedReportReq();
          conf_uin.set(Long.valueOf(uin).longValue());
          last_read_seq.set(l1);
          dis_read_report.add((MessageMicro)localObject2);
          break;
        }
        if ((1 != type) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(uin, type))) {
          break;
        }
        a(uin, type, true, paramBoolean);
        HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin);
        l1 = b(uin, type);
        if (l1 == -1L) {
          break label676;
        }
        localObject2 = new msg_svc.PbGroupReadedReportReq();
        group_code.set(Long.valueOf(uin).longValue());
        last_read_seq.set(l1);
        grp_read_report.add((MessageMicro)localObject2);
        break;
      }
    }
  }
  
  public void a()
  {
    ThreadManager.a(new nkj(this), 10, null, false);
  }
  
  public void a(int paramInt)
  {
    String str = String.valueOf(AppConstants.aD);
    if (a().a(str, 4001) <= 0) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.QQMessageFacade", 2, "setRecommendMsgReaded return : unread=0");
      }
    }
    do
    {
      return;
      QQMessageFacade.Message localMessage = a(str, 4001);
      paramInt = a(4001).a(paramInt, localMessage);
      a().c(str, 4001, -paramInt);
    } while (paramInt == 0);
    setChanged();
    notifyObservers(a(str, 4001));
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
    int i1;
    if (p == -1)
    {
      if (localEntityManager.d(ConversationInfo.getConversationInfoTableName()))
      {
        i1 = 1;
        p = i1;
      }
    }
    else
    {
      localObject = ((RecentUserProxy)localObject).a(true);
      if ((localObject == null) || (((List)localObject).size() <= 0)) {
        break label324;
      }
      i1 = ((List)localObject).size();
      if (paramInt <= 0) {
        break label366;
      }
      if (i1 <= paramInt) {
        break label266;
      }
    }
    for (;;)
    {
      label90:
      i1 = 0;
      label92:
      if (i1 < paramInt)
      {
        RecentUser localRecentUser = (RecentUser)((List)localObject).get(i1);
        a(uin, type, localEntityManager);
        if ((type == 1) && (HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin, false))) {
          a(uin, 1026, localEntityManager);
        }
        if (i1 == 8)
        {
          setChanged();
          notifyObservers(new RecentUser());
        }
        if (MsgProxyUtils.a(uin, type))
        {
          if (!AppConstants.aq.equals(uin)) {
            break label271;
          }
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.aN, type)) {
            a(AppConstants.aN, type, localEntityManager);
          }
        }
        for (;;)
        {
          i1 += 1;
          break label92;
          i1 = 0;
          break;
          label266:
          paramInt = i1;
          break label90;
          label271:
          if ((AppConstants.aG.equals(uin)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.aO, type))) {
            a(AppConstants.aO, type, localEntityManager);
          }
        }
      }
      label324:
      if (paramBoolean) {
        b(localEntityManager);
      }
      if ((paramBoolean) || (((List)localObject).size() > 8))
      {
        setChanged();
        notifyObservers(new RecentUser());
      }
      return;
      label366:
      paramInt = i1;
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, MessageRecord paramMessageRecord, ArrayList paramArrayList, ChatActivityFacade.HongbaoParams paramHongbaoParams)
  {
    ThreadManager.a(new nko(this, paramQQAppInterface, paramMessageRecord, paramArrayList, paramHongbaoParams), 8, null, false);
  }
  
  public void a(QQMessageFacade.Message paramMessage)
  {
    try
    {
      a(istroop).a(paramMessage);
      return;
    }
    catch (Throwable paramMessage)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("Q.msg.QQMessageFacade", 2, "decodeMsg ERROR", paramMessage);
    }
  }
  
  public void a(MessageRecord paramMessageRecord)
  {
    Object localObject1;
    Object localObject2;
    if ((paramMessageRecord instanceof MessageForShortVideo))
    {
      localObject1 = (MessageForShortVideo)paramMessageRecord;
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      if (!((MessageForShortVideo)localObject1).isSendFromLocal())
      {
        ((TransFileController)localObject2).a(frienduin, uniseq);
        ShortVideoUtils.a((MessageForShortVideo)localObject1);
      }
    }
    else
    {
      if (paramMessageRecord.isSendFromLocal()) {
        break label78;
      }
    }
    for (;;)
    {
      return;
      ((TransFileController)localObject2).b(frienduin, uniseq);
      break;
      label78:
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      localObject2 = new ArrayList();
      Object localObject3;
      if ((paramMessageRecord instanceof MessageForMixedMsg))
      {
        paramMessageRecord = (MessageForMixedMsg)paramMessageRecord;
        i2 = msgElemList.size();
        i1 = 0;
        while (i1 < i2)
        {
          localObject3 = (MessageRecord)msgElemList.get(i1);
          if ((localObject3 instanceof MessageForPic)) {
            ((List)localObject2).add((MessageForPic)localObject3);
          }
          i1 += 1;
        }
      }
      if ((paramMessageRecord instanceof MessageForLongMsg))
      {
        paramMessageRecord = (MessageForLongMsg)paramMessageRecord;
        int i3 = longMsgFragmentList.size();
        i1 = 0;
        if (i1 < i3)
        {
          localObject3 = (MessageRecord)longMsgFragmentList.get(i1);
          if ((localObject3 instanceof MessageForPic)) {
            ((List)localObject2).add((MessageForPic)localObject3);
          }
          for (;;)
          {
            i1 += 1;
            break;
            if ((localObject3 instanceof MessageForMixedMsg))
            {
              localObject3 = (MessageForMixedMsg)localObject3;
              int i4 = msgElemList.size();
              i2 = 0;
              while (i2 < i4)
              {
                MessageRecord localMessageRecord = (MessageRecord)msgElemList.get(i2);
                if ((localMessageRecord instanceof MessageForPic)) {
                  ((List)localObject2).add((MessageForPic)localMessageRecord);
                }
                i2 += 1;
              }
            }
          }
        }
      }
      else
      {
        if (!(paramMessageRecord instanceof MessageForPic)) {
          continue;
        }
        ((List)localObject2).add((MessageForPic)paramMessageRecord);
      }
      int i2 = ((List)localObject2).size();
      int i1 = 0;
      while (i1 < i2)
      {
        paramMessageRecord = (MessageForPic)((List)localObject2).get(i1);
        paramMessageRecord = frienduin + uniseq + "_" + subMsgId;
        localObject3 = ((TransFileController)localObject1).a(paramMessageRecord);
        if ((localObject3 != null) && ((localObject3 instanceof BaseTransProcessor)))
        {
          ((BaseTransProcessor)localObject3).j();
          ((TransFileController)localObject1).a(paramMessageRecord);
        }
        i1 += 1;
      }
    }
  }
  
  public void a(MessageRecord paramMessageRecord, MessageObserver paramMessageObserver)
  {
    a(paramMessageRecord, paramMessageObserver, false);
  }
  
  public void a(MessageRecord paramMessageRecord, MessageObserver paramMessageObserver, boolean paramBoolean)
  {
    if (paramMessageRecord == null) {}
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("SendMsgBtn", 2, " addAndSendMessage addSendMessage start currenttime:" + System.currentTimeMillis());
      }
      if ((paramMessageRecord instanceof ChatMessage)) {
        mPendantAnimatable = true;
      }
      b(paramMessageRecord, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      if (QLog.isColorLevel()) {
        QLog.d("SendMsgBtn", 2, " addAndSendMessage addSendMessage end and sendMessage start currenttime:" + System.currentTimeMillis());
      }
      b(paramMessageRecord, paramMessageObserver, paramBoolean);
    } while (!QLog.isColorLevel());
    QLog.d("SendMsgBtn", 2, " addAndSendMessage sendMessage end currenttime:" + System.currentTimeMillis());
  }
  
  public void a(MessageRecord paramMessageRecord, String paramString)
  {
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString).createEntityManager();
    try
    {
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(paramMessageRecord);
      a(localArrayList, paramString, false, true, true, true);
      setChanged();
      if (((paramMessageRecord instanceof ChatMessage)) && (paramMessageRecord.isSend())) {
        mPendantAnimatable = true;
      }
      notifyObservers(paramMessageRecord);
      c(localArrayList);
      return;
    }
    finally
    {
      paramString.a();
    }
  }
  
  public void a(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    a(istroop).a(paramMessageRecord, true, paramBoolean);
  }
  
  public void a(RecentUser paramRecentUser)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramRecentUser, false);
    a(uin, type, true, true);
    if (type == 1) {
      HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin);
    }
  }
  
  public void a(EntityManager paramEntityManager)
  {
    Object localObject = paramEntityManager.a(PubAccountAssistantData.class, false, null, null, null, null, "mLastMsgTime desc", null);
    if ((localObject != null) && (((List)localObject).size() > 0))
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        PubAccountAssistantData localPubAccountAssistantData = (PubAccountAssistantData)((Iterator)localObject).next();
        a(mUin, mType, paramEntityManager);
      }
    }
    localObject = paramEntityManager.a(TroopBarData.class, false, null, null, null, null, "mLastMsgTime desc", null);
    if ((localObject != null) && (((List)localObject).size() > 0))
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        a(nextmUin, 1008, paramEntityManager);
      }
    }
  }
  
  public void a(Object paramObject)
  {
    setChanged();
    notifyObservers(paramObject);
  }
  
  public void a(String paramString)
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    paramString = (ArrayList)localEntityManager.a(TransFileInfo.class, false, "friendUin = ?", new String[] { paramString }, null, null, null, null);
    if (paramString != null)
    {
      paramString = paramString.iterator();
      while (paramString.hasNext()) {
        localEntityManager.b((TransFileInfo)paramString.next());
      }
    }
    localEntityManager.a();
  }
  
  public void a(String paramString, int paramInt)
  {
    jdField_d_of_type_JavaLangString = paramString;
    l = paramInt;
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    a(paramInt1).a(paramString, paramInt1, paramInt2, paramRefreshMessageContext);
  }
  
  public void a(String paramString, int paramInt, long paramLong)
  {
    a(paramInt).a(paramString, paramInt, paramLong, false);
  }
  
  public void a(String paramString, int paramInt1, long paramLong, int paramInt2)
  {
    a(paramString, paramInt1, paramLong, 32768, paramInt2);
    paramString = a(paramString, paramInt1);
    if ((paramString != null) && (uniseq == paramLong))
    {
      extraflag = 32768;
      sendFailCode = paramInt2;
      setChanged();
      notifyObservers(paramString);
    }
  }
  
  public void a(String paramString, int paramInt1, long paramLong, int paramInt2, int paramInt3)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "updateMsgExtraFlagByuniseq: peerUin = " + paramString + " type = " + paramInt1 + " uniseq = " + paramLong);
    }
    MessageRecord localMessageRecord = a(paramInt1).a(paramString, paramInt1, paramLong, paramInt2, paramInt3);
    a(paramInt1).a(paramString, paramInt1, localMessageRecord, 3);
  }
  
  public void a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "updateC2CMsgTimeByUniseq: peerUin = " + paramString + " type = " + paramInt + " uniseq = " + paramLong1 + " time = " + paramLong2);
    }
    MessageRecord localMessageRecord = a(paramInt).a(paramString, paramInt, paramLong1, paramLong2);
    a(paramInt).a(paramString, paramInt, localMessageRecord, 3);
  }
  
  public void a(String paramString, int paramInt, long paramLong1, long paramLong2, long paramLong3)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "updateGroupMsgSeqAndTimeByUniseq: peerUin = " + paramString + " type = " + paramInt + " uniseq = " + paramLong1 + " shmsgseq = " + paramLong2 + " time = " + paramLong3);
    }
    Object localObject = a(paramInt);
    if ((localObject instanceof TroopAndDiscMsgProxy)) {}
    for (localObject = ((TroopAndDiscMsgProxy)localObject).b(paramString, paramInt, paramLong1, paramLong2, paramLong3);; localObject = null)
    {
      a(paramInt).a(paramString, paramInt, (MessageRecord)localObject, 3);
      a(paramString, paramInt, paramLong2);
      setChanged();
      notifyObservers(localObject);
      if (localObject == null) {}
      do
      {
        return;
        paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      } while ((!paramString.f()) || ((!paramString.d((MessageRecord)localObject)) && (!paramString.a(frienduin, istroop, uniseq))));
      if (QLog.isColorLevel()) {
        QLog.d("revokeMsg", 2, "updateGroupMsgSeqAndTimeByUniseq, in revoking cache");
      }
      paramString.f(null);
      a(paramInt).b();
      return;
    }
  }
  
  public void a(String paramString, int paramInt, long paramLong, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    if (!a())
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.QQMessageFacade", 2, "loadMoreAIOMessage isChatting = false!");
      }
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new nkk(this, paramInt, paramString, paramLong, paramRefreshMessageContext));
  }
  
  public void a(String paramString1, int paramInt, long paramLong, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "updateMsgContent: peerUin = " + paramString1 + " type = " + paramInt + " uniseq = " + paramLong);
    }
    paramString2 = a(paramInt).a(paramString1, paramInt, paramLong, paramString2);
    a(paramInt).a(paramString1, paramInt, paramString2, 2);
  }
  
  public void a(String paramString1, int paramInt, long paramLong, String paramString2, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "updateMsgFieldByUniseq: peerUin = " + paramString1 + " type = " + paramInt + " uniseq = " + paramLong + " fieldName = " + paramString2 + " fieldValue = " + paramObject);
    }
    paramString2 = a(paramInt).a(paramString1, paramInt, paramLong, paramString2, paramObject);
    a(paramInt).a(paramString1, paramInt, paramString2, 3);
  }
  
  public void a(String paramString, int paramInt, long paramLong, boolean paramBoolean)
  {
    a(paramInt).a(paramString, paramInt, paramLong, paramBoolean);
  }
  
  public void a(String paramString, int paramInt, long paramLong, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "updateMsgContentByUniSeq: peerUin = " + paramString + " type = " + paramInt + " uniseq = " + paramLong);
    }
    paramArrayOfByte = a(paramInt).a(paramString, paramInt, paramLong, paramArrayOfByte);
    a(paramInt).a(paramString, paramInt, paramArrayOfByte, 2);
  }
  
  public void a(String paramString, int paramInt, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    List localList = a(paramString, paramInt);
    if (localList == null) {}
    for (int i1 = 0;; i1 = localList.size())
    {
      i1 = 10 - i1;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.QQMessageFacade", 2, "refreshMessageListHeadByAIOBreak numTroopRefresh = " + h + ", count = " + i1);
      }
      if (i1 <= 0) {
        break;
      }
      h = true;
      a(paramInt).a(paramString, paramInt, i1, paramRefreshMessageContext);
      return;
    }
    jdField_d_of_type_Boolean = true;
    jdField_a_of_type_JavaLangString = paramString;
    c = paramInt;
    jdField_d_of_type_Int = i1;
    a(paramRefreshMessageContext);
  }
  
  public void a(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    a(paramInt).b(paramString, paramInt, paramMessageRecord);
  }
  
  public void a(String paramString1, int paramInt, String paramString2)
  {
    if ((jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager != null) && (paramString2 != null) && (paramString1 != null) && (paramString1.length() >= 5))
    {
      DraftTextInfo localDraftTextInfo = new DraftTextInfo();
      uin = paramString1;
      type = paramInt;
      text = paramString2.toString();
      jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localDraftTextInfo);
    }
  }
  
  public void a(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    a(paramInt).a(paramString1, paramInt, paramString2, paramString3);
  }
  
  public void a(String paramString1, int paramInt, String paramString2, String paramString3, long paramLong)
  {
    if (QLog.isColorLevel()) {}
    for (long l1 = System.currentTimeMillis();; l1 = 0L)
    {
      if (TextUtils.isEmpty(paramString3)) {
        paramLong = 0L;
      }
      for (;;)
      {
        a(paramInt).a(paramString1, paramInt, paramString2, paramString3, paramLong);
        if (QLog.isColorLevel()) {
          QLog.i("notification", 2, "notifyDraftUpdated| " + (System.currentTimeMillis() - l1) + " drafttime = " + paramLong);
        }
        return;
      }
    }
  }
  
  public void a(String paramString, int paramInt, List paramList)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      a(get0istroop).a(paramString, paramInt, paramList);
      setChanged();
      notifyObservers(paramList.get(0));
    }
  }
  
  public void a(String paramString, int paramInt, List paramList1, List paramList2, Bundle paramBundle)
  {
    a(paramInt).a(paramString, paramInt, paramList1, paramList2, paramBundle);
  }
  
  public void a(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    a(paramInt).a(paramString, paramInt, paramBoolean1, paramBoolean2);
  }
  
  public void a(String paramString, long paramLong)
  {
    if (paramLong < 0L) {
      return;
    }
    e(paramString, 1);
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, paramString1);
    }
  }
  
  public void a(String paramString, Collection paramCollection)
  {
    if (paramCollection != null)
    {
      a("------------" + paramString + "--------------" + paramCollection.size(), "");
      return;
    }
    a("------------" + paramString + "-------------- is null", "");
  }
  
  public void a(ArrayList paramArrayList)
  {
    a(get0jdField_a_of_type_Int).a(paramArrayList);
  }
  
  public void a(ArrayList paramArrayList, String paramString, boolean paramBoolean)
  {
    boolean bool = true;
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString).createEntityManager();
    if (!paramBoolean) {}
    for (;;)
    {
      try
      {
        a(paramArrayList, paramString, paramBoolean, bool, true, true);
        paramString.a();
        if ((paramBoolean) && (paramArrayList != null) && (!paramArrayList.isEmpty())) {
          a(get0istroop).a(paramArrayList, null);
        }
        paramString = MsgProxyUtils.a(paramArrayList);
        if (paramString != null)
        {
          setChanged();
          notifyObservers(paramString);
        }
        return;
      }
      finally
      {
        paramString.a();
      }
      bool = false;
    }
  }
  
  public void a(ArrayList paramArrayList, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    boolean bool = true;
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString).createEntityManager();
    if (!paramBoolean1) {}
    for (;;)
    {
      try
      {
        a(paramArrayList, paramString, paramBoolean1, bool, paramBoolean2, true);
        paramString.a();
        if ((paramBoolean1) && (paramArrayList != null) && (!paramArrayList.isEmpty())) {
          a(get0istroop).a(paramArrayList, null);
        }
        if (paramBoolean2)
        {
          paramString = MsgProxyUtils.a(paramArrayList);
          if (paramString != null)
          {
            setChanged();
            notifyObservers(paramString);
          }
        }
        return;
      }
      finally
      {
        paramString.a();
      }
      bool = false;
    }
  }
  
  public void a(ArrayList paramArrayList, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    boolean bool = true;
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString).createEntityManager();
    if (!paramBoolean1) {}
    for (;;)
    {
      try
      {
        a(paramArrayList, paramString, paramBoolean1, bool, paramBoolean2, true);
        paramString.a();
        if ((paramBoolean1) && (paramArrayList != null) && (!paramArrayList.isEmpty())) {
          a(get0istroop).a(paramArrayList, null);
        }
        if ((paramBoolean2) || (paramBoolean3))
        {
          paramString = MsgProxyUtils.a(paramArrayList);
          if (paramString != null)
          {
            setChanged();
            notifyObservers(paramString);
          }
        }
        return;
      }
      finally
      {
        paramString.a();
      }
      bool = false;
    }
  }
  
  public void a(ArrayList paramArrayList, boolean paramBoolean)
  {
    if ((paramArrayList == null) || (paramArrayList.isEmpty())) {}
    int i1;
    do
    {
      return;
      i1 = get0jdField_a_of_type_Int;
      a(i1).b(paramArrayList);
    } while ((!paramBoolean) || ((i1 != 1) && (i1 != 3000)));
    paramArrayList = get0jdField_a_of_type_JavaLangString;
    a(paramArrayList, i1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramArrayList, i1));
  }
  
  public void a(List paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty())) {
      a(get0istroop).a(paramList, null);
    }
    c(paramList);
  }
  
  public void a(List paramList, String paramString)
  {
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    try
    {
      a(paramList, paramString, false, true, true, true);
      paramString.a();
      paramString = MsgProxyUtils.a(paramList);
      if (paramString != null)
      {
        setChanged();
        notifyObservers(paramString);
      }
      c(paramList);
      return;
    }
    finally
    {
      paramString.a();
    }
  }
  
  public void a(List paramList, boolean paramBoolean)
  {
    if (paramList.size() != 0) {
      a(get0istroop).a(paramList, true, paramBoolean);
    }
  }
  
  public boolean a()
  {
    return (jdField_d_of_type_JavaLangString != null) && (l >= 0);
  }
  
  public boolean a(MessageRecord paramMessageRecord)
  {
    return afrienduin, istroop).uniseq == uniseq;
  }
  
  public boolean a(String paramString)
  {
    return b(paramString, 0);
  }
  
  public boolean a(String paramString, int paramInt)
  {
    paramString = b(paramString, paramInt);
    if (jdField_a_of_type_JavaUtilMap.containsKey(paramString))
    {
      paramString = (QQMessageFacade.Message)jdField_a_of_type_JavaUtilMap.get(paramString);
      if ((time > 0L) && (senderuin != null)) {
        return true;
      }
    }
    return false;
  }
  
  public boolean a(String paramString, int paramInt1, int paramInt2, long paramLong)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (MsgProxyUtils.k(paramInt2))
    {
      bool1 = bool2;
      if (MsgProxyUtils.g(paramInt2))
      {
        bool1 = bool2;
        if (a(paramInt1).d(paramString, paramInt1, paramLong) != null) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public boolean a(String paramString, int paramInt, List paramList, boolean paramBoolean)
  {
    if ((paramList != null) && (paramList.isEmpty())) {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.QQMessageFacade", 2, "refresh C2C autopull step 0 , FAIL! , timestamp = " + System.currentTimeMillis());
      }
    }
    do
    {
      return false;
      jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(b(paramString, paramInt), Boolean.valueOf(true));
      paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).e(paramString, paramInt);
    } while ((paramString == null) || (paramString.isEmpty()));
    if (!paramBoolean) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).c();
    }
    a("refresh C2C autopull, size = " + paramString.size(), ", timestamp = " + System.currentTimeMillis());
    return true;
  }
  
  public boolean a(String paramString, int paramInt, boolean paramBoolean)
  {
    paramBoolean = true;
    boolean bool = true;
    List localList = b(paramString, paramInt);
    if ((localList == null) || (localList.isEmpty()))
    {
      paramBoolean = false;
      return paramBoolean;
    }
    if (localList.size() == 1)
    {
      MessageRecord localMessageRecord = (MessageRecord)localList.get(0);
      if ((msgtype == 63530) || (!isValid)) {
        return false;
      }
      if (shmsgseq > Math.max(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt)) + 1L) {}
      for (;;)
      {
        paramBoolean = bool;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.msg.QQMessageFacade", 2, "isAIOBreak = " + bool + "; cacheList size = " + localList.size() + "; msgseq = " + shmsgseq + ", expiredSeq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString) + ", delLastSeq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt));
        return bool;
        bool = false;
      }
    }
    if (localList.size() > 1)
    {
      paramString = (MessageRecord)localList.get(localList.size() - 1);
      if ((msgtype == 63530) || (!isValid)) {
        return false;
      }
      paramString = MsgProxyUtils.a(localList, false);
      if (paramString.size() < 10) {}
      for (bool = paramBoolean;; bool = false)
      {
        paramBoolean = bool;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.msg.QQMessageFacade", 2, "isAIOBreak = " + bool + "; cacheList size = " + localList.size() + "; continuedList size = " + paramString.size());
        return bool;
      }
    }
    return false;
  }
  
  public int b()
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      for (int i1 = 0; localIterator.hasNext(); i1 = nextcounter + i1) {}
      return i1;
    }
  }
  
  public long b(String paramString, int paramInt)
  {
    long l2 = -1L;
    Object localObject;
    long l1;
    if ((paramInt == 1) || (paramInt == 3000) || (paramInt == 1026))
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt);
      l2 = shmsgseq;
      l1 = l2;
      if (((QQMessageFacade.Message)localObject).isLongMsg())
      {
        paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString, paramInt);
        l1 = l2;
        if (paramString != null)
        {
          l1 = l2;
          if (paramString.size() > 0) {
            return Math.max(l2, getsize1shmsgseq);
          }
        }
      }
    }
    else
    {
      l1 = l2;
      if (MsgProxyUtils.c(paramInt))
      {
        paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).b(paramString, paramInt);
        l1 = l2;
        if (paramString != null)
        {
          l1 = l2;
          if (!paramString.isEmpty())
          {
            paramInt = paramString.size() - 1;
            for (;;)
            {
              l1 = l2;
              if (paramInt < 0) {
                break;
              }
              localObject = (MessageRecord)paramString.get(paramInt);
              if (!MsgUtils.b(issend)) {
                return time;
              }
              paramInt -= 1;
            }
          }
        }
      }
    }
    return l1;
  }
  
  public QQMessageFacade.Message b(String paramString, int paramInt)
  {
    if (paramString == null)
    {
      paramString = null;
      return paramString;
    }
    String str1 = b(paramString, paramInt);
    Object localObject = (QQMessageFacade.Message)jdField_a_of_type_JavaUtilMap.get(str1);
    QQMessageFacade.Message localMessage = (QQMessageFacade.Message)jdField_a_of_type_JavaUtilMap.get(str1);
    localObject = localMessage;
    EntityManager localEntityManager;
    if (localMessage == null)
    {
      localObject = MessageRecord.getTableName(paramString, paramInt);
      String str2 = MessageRecord.getOldTableName(paramString, paramInt);
      localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      if ((!localEntityManager.d((String)localObject)) && (!localEntityManager.d(str2))) {
        break label150;
      }
      paramString = a(paramString, paramInt, localEntityManager);
    }
    for (;;)
    {
      localEntityManager.a();
      localObject = paramString;
      paramString = (String)localObject;
      if (localObject == null) {
        break;
      }
      paramString = (String)localObject;
      if (!MsgProxyUtils.a(frienduin, istroop)) {
        break;
      }
      istroop = MsgProxyUtils.a(istroop);
      return localObject;
      label150:
      if (localMessage == null)
      {
        localObject = new QQMessageFacade.Message();
        frienduin = paramString;
        istroop = paramInt;
        jdField_a_of_type_JavaUtilMap.put(str1, localObject);
        paramString = (String)localObject;
      }
      else
      {
        isCacheValid = true;
        paramString = localMessage;
      }
    }
  }
  
  public MessageRecord b(String paramString, int paramInt)
  {
    Object localObject1 = a(paramInt).b(paramString, paramInt);
    if (localObject1 != null)
    {
      int i1 = ((List)localObject1).size() - 1;
      Object localObject2;
      if (i1 >= 0)
      {
        localObject2 = (MessageRecord)((List)localObject1).get(i1);
        if (PublicAccountUtil.a((MessageRecord)localObject2)) {}
        while ((!isValid) || (MsgProxyUtils.g(msgtype)))
        {
          i1 -= 1;
          break;
        }
        localObject1 = localObject2;
        if (!((MessageRecord)localObject2).isLongMsg()) {}
      }
      for (localObject1 = a((MessageRecord)localObject2);; localObject1 = null)
      {
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = a(paramInt).a(paramString, paramInt, null);
        }
        return localObject2;
      }
    }
    return null;
  }
  
  public MessageRecord b(String paramString, int paramInt, long paramLong)
  {
    return a(paramInt).b(paramString, paramInt, paramLong);
  }
  
  public String b(Context paramContext, MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    paramContext = new QQMessageFacade.Message();
    MessageRecord.copyMessageRecordBaseField(paramContext, paramMessageRecord);
    emoRecentMsg = null;
    fileType = -1;
    a(paramContext);
    return MsgUtils.a(nickName, 0.4F);
  }
  
  public List b(String paramString, int paramInt)
  {
    return a(paramInt).b(paramString, paramInt);
  }
  
  public void b()
  {
    jdField_d_of_type_JavaLangString = null;
    l = -1;
  }
  
  public void b(int paramInt)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(4001).b(String.valueOf(AppConstants.aD), 4001);
    if ((localObject == null) || (((List)localObject).size() == 0)) {}
    do
    {
      return;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramInt);
    } while (a(4001).a(paramInt) <= 0);
    setChanged();
    localObject = new RecentUser();
    uin = String.valueOf(AppConstants.aB);
    notifyObservers(localObject);
  }
  
  public void b(QQMessageFacade.Message paramMessage)
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$Message = paramMessage;
  }
  
  public void b(MessageRecord paramMessageRecord)
  {
    if (paramMessageRecord == null) {}
    do
    {
      MessageForFile localMessageForFile;
      FileManagerEntity localFileManagerEntity;
      do
      {
        do
        {
          return;
        } while (a(istroop).a(paramMessageRecord));
        if (msgtype != 63531) {
          break label149;
        }
        localMessageForFile = (MessageForFile)paramMessageRecord;
        localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, senderuin, istroop);
        if (localFileManagerEntity == null) {
          break;
        }
      } while ((!localMessageForFile.isSend()) || ((status != 1) && (status != -1) && (status != 3)));
      if (QLog.isColorLevel()) {
        QLog.d("MsgRevert<FileAssistant>", 2, "doMsgRevokeReqForFileMsg, msgForFile");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessageRecord, localFileManagerEntity, new nkn(this, paramMessageRecord, localFileManagerEntity));
      return;
    } while (!QLog.isColorLevel());
    QLog.e("MsgRevert<FileAssistant>", 2, "doMsgRevokeReqForFileMsg, return");
    return;
    label149:
    a(istroop).c(paramMessageRecord);
  }
  
  public void b(MessageRecord paramMessageRecord, MessageObserver paramMessageObserver)
  {
    b(paramMessageRecord, paramMessageObserver, false);
  }
  
  public void b(MessageRecord paramMessageRecord, MessageObserver paramMessageObserver, boolean paramBoolean)
  {
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() == localLooper.getThread())
    {
      ThreadManager.a(new nkl(this, paramMessageRecord, paramMessageObserver, paramBoolean), 10, null, false);
      return;
    }
    c(paramMessageRecord, paramMessageObserver, paramBoolean);
  }
  
  public void b(MessageRecord paramMessageRecord, String paramString)
  {
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    try
    {
      a(frienduin, paramMessageRecord);
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(paramMessageRecord);
      a(localArrayList, paramString, false, true, true, true);
      if (QLog.isColorLevel()) {
        QLog.d("sendmsg", 2, String.format("addSendMessage key = %d %s %d", new Object[] { Long.valueOf(uniseq), frienduin, Integer.valueOf(istroop) }));
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramMessageRecord);
      setChanged();
      notifyObservers(paramMessageRecord);
      return;
    }
    finally
    {
      paramString.a();
    }
  }
  
  /* Error */
  public void b(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4: invokevirtual 380	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   7: astore 10
    //   9: aload 10
    //   11: ifnonnull +4 -> 15
    //   14: return
    //   15: aload 10
    //   17: aload_1
    //   18: invokevirtual 1603	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;)I
    //   21: istore_3
    //   22: iload_3
    //   23: sipush 6000
    //   26: if_icmple -12 -> 14
    //   29: iload_3
    //   30: sipush 5000
    //   33: isub
    //   34: sipush 1000
    //   37: invokestatic 1606	java/lang/Math:max	(II)I
    //   40: istore_3
    //   41: iload_2
    //   42: ifne +362 -> 404
    //   45: ldc_w 1608
    //   48: iconst_3
    //   49: anewarray 86	java/lang/Object
    //   52: dup
    //   53: iconst_0
    //   54: aload_1
    //   55: aastore
    //   56: dup
    //   57: iconst_1
    //   58: aload_1
    //   59: aastore
    //   60: dup
    //   61: iconst_2
    //   62: iload_3
    //   63: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   66: aastore
    //   67: invokestatic 703	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   70: astore 6
    //   72: ldc_w 1610
    //   75: iconst_3
    //   76: anewarray 86	java/lang/Object
    //   79: dup
    //   80: iconst_0
    //   81: aload_1
    //   82: aastore
    //   83: dup
    //   84: iconst_1
    //   85: aload_1
    //   86: aastore
    //   87: dup
    //   88: iconst_2
    //   89: iload_3
    //   90: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   93: aastore
    //   94: invokestatic 703	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   97: astore 7
    //   99: iload_2
    //   100: ifne +112 -> 212
    //   103: iconst_2
    //   104: anewarray 206	java/lang/String
    //   107: astore 8
    //   109: aload 8
    //   111: iconst_0
    //   112: ldc_w 1611
    //   115: aastore
    //   116: aload 8
    //   118: iconst_1
    //   119: ldc_w 1612
    //   122: aastore
    //   123: aload 10
    //   125: aload_1
    //   126: aload 8
    //   128: aconst_null
    //   129: aconst_null
    //   130: aload 8
    //   132: iconst_0
    //   133: aaload
    //   134: iload_3
    //   135: invokestatic 1614	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   138: invokevirtual 1617	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   141: astore 9
    //   143: aload 9
    //   145: invokeinterface 1620 1 0
    //   150: ifeq +62 -> 212
    //   153: aload 9
    //   155: aload 9
    //   157: aload 8
    //   159: iconst_0
    //   160: aaload
    //   161: invokeinterface 1623 2 0
    //   166: invokeinterface 1627 2 0
    //   171: lstore 4
    //   173: aload 9
    //   175: aload 9
    //   177: aload 8
    //   179: iconst_1
    //   180: aaload
    //   181: invokeinterface 1623 2 0
    //   186: invokeinterface 396 2 0
    //   191: astore 8
    //   193: aload_0
    //   194: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   197: bipush 91
    //   199: invokevirtual 495	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   202: checkcast 1629	com/tencent/mobileqq/app/MessageRoamManager
    //   205: aload 8
    //   207: lload 4
    //   209: invokevirtual 1631	com/tencent/mobileqq/app/MessageRoamManager:a	(Ljava/lang/String;J)V
    //   212: aload_0
    //   213: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   216: invokevirtual 621	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/persistence/EntityManagerFactory;
    //   219: invokevirtual 1634	com/tencent/mobileqq/persistence/EntityManagerFactory:createMessageRecordEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   222: checkcast 1636	com/tencent/mobileqq/persistence/MessageRecordEntityManager
    //   225: astore 8
    //   227: aload 8
    //   229: invokevirtual 1639	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   232: astore 9
    //   234: invokestatic 446	java/lang/System:currentTimeMillis	()J
    //   237: lstore 4
    //   239: aload 9
    //   241: ifnull +8 -> 249
    //   244: aload 9
    //   246: invokevirtual 1642	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   249: aload 8
    //   251: aload 7
    //   253: aconst_null
    //   254: aload_0
    //   255: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   258: invokevirtual 1645	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	(Ljava/lang/String;[Ljava/lang/String;Lcom/tencent/mobileqq/app/QQAppInterface;)Ljava/util/List;
    //   261: astore 7
    //   263: aload 7
    //   265: ifnull +330 -> 595
    //   268: aload 7
    //   270: invokeinterface 303 1 0
    //   275: astore 7
    //   277: aload 7
    //   279: invokeinterface 190 1 0
    //   284: ifeq +311 -> 595
    //   287: aload 7
    //   289: invokeinterface 194 1 0
    //   294: checkcast 275	com/tencent/mobileqq/data/MessageRecord
    //   297: astore 11
    //   299: aload 11
    //   301: invokevirtual 1648	com/tencent/mobileqq/data/MessageRecord:isSupportFTS	()Z
    //   304: ifeq -27 -> 277
    //   307: aload 11
    //   309: getfield 829	com/tencent/mobileqq/data/MessageRecord:isValid	Z
    //   312: ifeq -35 -> 277
    //   315: aload 11
    //   317: getfield 830	com/tencent/mobileqq/data/MessageRecord:msgtype	I
    //   320: sipush 63530
    //   323: if_icmpeq -46 -> 277
    //   326: aload 11
    //   328: invokestatic 1653	com/tencent/mobileqq/utils/fts/FTSMessageCodec:a	(Lcom/tencent/mobileqq/data/MessageRecord;)Lcom/tencent/mobileqq/data/fts/FTSMessage;
    //   331: astore 11
    //   333: aload 11
    //   335: invokevirtual 1658	com/tencent/mobileqq/data/fts/FTSMessage:deleteOpt	()V
    //   338: aload 8
    //   340: aload 11
    //   342: invokestatic 1661	com/tencent/mobileqq/utils/fts/FTSMessageCodec:a	(Lcom/tencent/mobileqq/data/fts/FTSMessage;)Lcom/tencent/mobileqq/data/FTSMessageSync;
    //   345: invokevirtual 1664	com/tencent/mobileqq/persistence/MessageRecordEntityManager:b	(Lcom/tencent/mobileqq/persistence/Entity;)V
    //   348: goto -71 -> 277
    //   351: astore_1
    //   352: aload_1
    //   353: invokevirtual 409	java/lang/Exception:printStackTrace	()V
    //   356: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   359: ifeq +29 -> 388
    //   362: ldc 91
    //   364: iconst_2
    //   365: new 162	java/lang/StringBuilder
    //   368: dup
    //   369: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   372: ldc_w 1666
    //   375: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   378: aload_1
    //   379: invokevirtual 374	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   382: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   385: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   388: aload 9
    //   390: ifnull +8 -> 398
    //   393: aload 9
    //   395: invokevirtual 1667	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   398: aload 8
    //   400: invokevirtual 1668	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   403: return
    //   404: iload_2
    //   405: iconst_1
    //   406: if_icmpeq +17 -> 423
    //   409: iload_2
    //   410: sipush 3000
    //   413: if_icmpeq +10 -> 423
    //   416: iload_2
    //   417: sipush 1026
    //   420: if_icmpne +60 -> 480
    //   423: ldc_w 1670
    //   426: iconst_3
    //   427: anewarray 86	java/lang/Object
    //   430: dup
    //   431: iconst_0
    //   432: aload_1
    //   433: aastore
    //   434: dup
    //   435: iconst_1
    //   436: aload_1
    //   437: aastore
    //   438: dup
    //   439: iconst_2
    //   440: iload_3
    //   441: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   444: aastore
    //   445: invokestatic 703	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   448: astore 6
    //   450: ldc_w 1672
    //   453: iconst_3
    //   454: anewarray 86	java/lang/Object
    //   457: dup
    //   458: iconst_0
    //   459: aload_1
    //   460: aastore
    //   461: dup
    //   462: iconst_1
    //   463: aload_1
    //   464: aastore
    //   465: dup
    //   466: iconst_2
    //   467: iload_3
    //   468: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   471: aastore
    //   472: invokestatic 703	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   475: astore 7
    //   477: goto -378 -> 99
    //   480: ldc_w 1674
    //   483: iconst_3
    //   484: anewarray 86	java/lang/Object
    //   487: dup
    //   488: iconst_0
    //   489: aload_1
    //   490: aastore
    //   491: dup
    //   492: iconst_1
    //   493: aload_1
    //   494: aastore
    //   495: dup
    //   496: iconst_2
    //   497: iload_3
    //   498: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   501: aastore
    //   502: invokestatic 703	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   505: astore 6
    //   507: ldc_w 1676
    //   510: iconst_3
    //   511: anewarray 86	java/lang/Object
    //   514: dup
    //   515: iconst_0
    //   516: aload_1
    //   517: aastore
    //   518: dup
    //   519: iconst_1
    //   520: aload_1
    //   521: aastore
    //   522: dup
    //   523: iconst_2
    //   524: iload_3
    //   525: invokestatic 336	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   528: aastore
    //   529: invokestatic 703	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   532: astore 7
    //   534: goto -435 -> 99
    //   537: astore 8
    //   539: aconst_null
    //   540: astore 9
    //   542: aload 9
    //   544: ifnull +10 -> 554
    //   547: aload 9
    //   549: invokeinterface 412 1 0
    //   554: aload 8
    //   556: invokevirtual 409	java/lang/Exception:printStackTrace	()V
    //   559: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   562: ifeq -350 -> 212
    //   565: ldc 91
    //   567: iconst_2
    //   568: new 162	java/lang/StringBuilder
    //   571: dup
    //   572: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   575: ldc_w 1666
    //   578: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   581: aload 8
    //   583: invokevirtual 374	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   586: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   589: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   592: goto -380 -> 212
    //   595: aload 10
    //   597: aload 6
    //   599: invokevirtual 1677	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;)Z
    //   602: pop
    //   603: aload 9
    //   605: ifnull +8 -> 613
    //   608: aload 9
    //   610: invokevirtual 1678	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   613: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   616: ifeq +54 -> 670
    //   619: ldc 91
    //   621: iconst_2
    //   622: new 162	java/lang/StringBuilder
    //   625: dup
    //   626: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   629: ldc_w 1680
    //   632: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   635: aload_1
    //   636: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   639: ldc_w 922
    //   642: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   645: iload_3
    //   646: invokevirtual 172	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   649: ldc_w 1682
    //   652: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   655: invokestatic 446	java/lang/System:currentTimeMillis	()J
    //   658: lload 4
    //   660: lsub
    //   661: invokevirtual 1039	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   664: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   667: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   670: aload 9
    //   672: ifnull +8 -> 680
    //   675: aload 9
    //   677: invokevirtual 1667	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   680: aload 8
    //   682: invokevirtual 1668	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   685: return
    //   686: astore_1
    //   687: aload 9
    //   689: ifnull +8 -> 697
    //   692: aload 9
    //   694: invokevirtual 1667	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   697: aload 8
    //   699: invokevirtual 1668	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   702: aload_1
    //   703: athrow
    //   704: astore 8
    //   706: goto -164 -> 542
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	709	0	this	QQMessageFacade
    //   0	709	1	paramString	String
    //   0	709	2	paramInt	int
    //   21	625	3	i1	int
    //   171	488	4	l1	long
    //   70	528	6	str	String
    //   97	436	7	localObject1	Object
    //   107	292	8	localObject2	Object
    //   537	161	8	localException1	Exception
    //   704	1	8	localException2	Exception
    //   141	552	9	localObject3	Object
    //   7	589	10	localSQLiteDatabase	SQLiteDatabase
    //   297	44	11	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   234	239	351	java/lang/Exception
    //   244	249	351	java/lang/Exception
    //   249	263	351	java/lang/Exception
    //   268	277	351	java/lang/Exception
    //   277	348	351	java/lang/Exception
    //   595	603	351	java/lang/Exception
    //   608	613	351	java/lang/Exception
    //   613	670	351	java/lang/Exception
    //   103	109	537	java/lang/Exception
    //   123	143	537	java/lang/Exception
    //   234	239	686	finally
    //   244	249	686	finally
    //   249	263	686	finally
    //   268	277	686	finally
    //   277	348	686	finally
    //   352	388	686	finally
    //   595	603	686	finally
    //   608	613	686	finally
    //   613	670	686	finally
    //   143	212	704	java/lang/Exception
  }
  
  public void b(String paramString, int paramInt, long paramLong)
  {
    b(paramString, paramInt, paramLong, true);
  }
  
  public void b(String paramString, int paramInt, long paramLong, boolean paramBoolean)
  {
    int i1 = 1;
    MessageRecord localMessageRecord = b(paramString, paramInt, paramLong);
    if (a(paramInt).c(paramString, paramInt, paramLong) == 2) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt, localMessageRecord);
    }
    if (!paramBoolean) {}
    label127:
    label132:
    label147:
    do
    {
      for (;;)
      {
        return;
        if (localMessageRecord == null) {
          break label147;
        }
        if ((localMessageRecord instanceof MessageForLongMsg))
        {
          if (!MsgProxyUtils.a(localMessageRecord, a(frienduin, istroop))) {
            break label127;
          }
          paramInt = i1;
        }
        while (paramInt != 0)
        {
          if (!MsgProxyUtils.s(istroop)) {
            break label132;
          }
          a(istroop).a(localMessageRecord);
          return;
          paramInt = i1;
          if (!a(localMessageRecord)) {
            paramInt = 0;
          }
        }
      }
      a(istroop).b(localMessageRecord);
      return;
    } while (!QLog.isColorLevel());
    QLog.w("Q.msg.QQMessageFacade", 2, "removeMsgByUniseq error: message not found. uin=" + paramString + ",type=" + paramInt + ",uniseq=" + paramLong);
  }
  
  public void b(String paramString, long paramLong)
  {
    if (paramLong < 0L) {
      return;
    }
    e(paramString, 3000);
  }
  
  public void b(List paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
        a(istroop).a(frienduin, istroop, localMessageRecord, null, false, true, true);
      }
    }
    c(paramList);
  }
  
  public void b(List paramList, String paramString)
  {
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    try
    {
      a(paramList, paramString, false, true, true, false);
      paramString.a();
      paramString = MsgProxyUtils.a(paramList);
      if (paramString != null)
      {
        setChanged();
        notifyObservers(paramString);
      }
      c(paramList);
      return;
    }
    finally
    {
      paramString.a();
    }
  }
  
  public boolean b(String paramString, int paramInt)
  {
    return c(paramString, paramInt);
  }
  
  public int c()
  {
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public MessageRecord c(String paramString, int paramInt, long paramLong)
  {
    return a(paramInt).c(paramString, paramInt, paramLong);
  }
  
  public void c()
  {
    a(0).c();
    a(3000).c();
    a(1).c();
    a(1026).c();
  }
  
  public void c(int paramInt)
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      while (localIterator.hasNext())
      {
        QQMessageFacade.Message localMessage = (QQMessageFacade.Message)localIterator.next();
        if (istroop == paramInt) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(localMessage);
        }
      }
    }
  }
  
  public void c(QQMessageFacade.Message paramMessage)
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      if (a(jdField_a_of_type_JavaUtilList, paramMessage))
      {
        jdField_a_of_type_JavaUtilList.set(a(jdField_a_of_type_JavaUtilList, paramMessage), paramMessage);
        return;
      }
      jdField_a_of_type_JavaUtilList.add(paramMessage);
    }
  }
  
  public void c(MessageRecord paramMessageRecord, MessageObserver paramMessageObserver, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "sendMessage: mr_uinType:" + istroop + " mr_msgType:" + msgtype);
    }
    try
    {
      if (msgUid == 0L) {
        msgUid = MessageUtils.a(MessageUtils.a());
      }
      if ((msgtype == 64536) || (msgtype == 64487)) {
        if (istroop == 1001)
        {
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(frienduin))
          {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((MessageForText)paramMessageRecord);
            return;
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessageRecord, null, paramBoolean);
          return;
        }
      }
    }
    catch (Exception paramMessageRecord)
    {
      if (QLog.isColorLevel())
      {
        QLog.e("Q.msg.QQMessageFacade", 2, "sendMessage ERROR:" + paramMessageRecord.getMessage(), paramMessageRecord);
        return;
        if (istroop == 1003)
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((MessageForText)paramMessageRecord);
          return;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessageRecord, null, paramBoolean);
        return;
        if ((msgtype == 63525) || (msgtype == 63529) || (msgtype == 60527) || (msgtype == 63534) || (msgtype == 63536) || (msgtype == 63526) || (msgtype == 63516) || (msgtype == 63514) || (msgtype == 60528)) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessageRecord, paramMessageObserver, paramBoolean);
        }
      }
    }
  }
  
  public void c(String paramString, int paramInt)
  {
    a(paramString, paramInt, true, false);
  }
  
  public void c(String paramString, long paramLong)
  {
    if (paramLong < 0L) {
      return;
    }
    e(paramString, 0);
  }
  
  public void c(List paramList)
  {
    if ((paramList != null) && (paramList.size() > 0)) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(8020, true, paramList);
    }
  }
  
  public void c(List paramList, String paramString)
  {
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString).createEntityManager();
    try
    {
      a(paramList, paramString, true, false, true, true);
      paramString.a();
      paramString = MsgProxyUtils.a(paramList);
      if (paramString != null)
      {
        setChanged();
        notifyObservers(paramString);
      }
      c(paramList);
      return;
    }
    finally
    {
      paramString.a();
    }
  }
  
  public boolean c(String paramString, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a.b())
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString, paramInt);
      return true;
    }
    return false;
  }
  
  public int d()
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      i1 = 0;
      while (localIterator.hasNext())
      {
        QQMessageFacade.Message localMessage = (QQMessageFacade.Message)localIterator.next();
        if (istroop != 1008)
        {
          if (7000 != istroop) {
            break label117;
          }
          SubAccountManager localSubAccountManager = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
          if (localSubAccountManager == null) {
            break label108;
          }
          i2 = localSubAccountManager.c(frienduin);
          break label110;
        }
      }
      return i1;
    }
    label108:
    int i2 = 0;
    label110:
    int i1 = i2 + i1;
    for (;;)
    {
      break;
      label117:
      i1 += 1;
    }
  }
  
  public void d()
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    boolean bool;
    int i1;
    if (p == -1)
    {
      bool = localEntityManager.d(ConversationInfo.getConversationInfoTableName());
      if (bool)
      {
        i1 = 1;
        p = i1;
      }
    }
    for (;;)
    {
      localEntityManager.a();
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.QQMessageFacade", 2, "CACHE : refreshCache start : Lazy : " + bool);
      }
      long l1 = System.currentTimeMillis();
      if (bool)
      {
        a(0, true);
        jdField_b_of_type_Boolean = true;
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.QQMessageFacade", 2, "CACHE : refreshCache finish : TimeSpend:" + (System.currentTimeMillis() - l1));
        }
        return;
        i1 = 0;
        break;
        e();
      }
      bool = true;
    }
  }
  
  public void d(String paramString, int paramInt)
  {
    a(paramInt).b(paramString, paramInt, false, false);
  }
  
  public boolean d(String paramString, int paramInt)
  {
    if ((paramString != null) && (jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager != null)) {
      return jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager.a(paramString, paramInt);
    }
    return false;
  }
  
  public int e()
  {
    int i1 = a(2);
    if ((i1 != 0) && (QLog.isColorLevel())) {
      QLog.d("Q.msg.QQMessageFacade", 2, "Recent Msg Unread=" + i1);
    }
    int i2;
    if (a().b(AppConstants.aB, 9000))
    {
      i2 = TroopNotificationUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if ((i2 != 0) && (QLog.isColorLevel())) {
        QLog.d("Q.msg.QQMessageFacade", 2, "Recent TroopNotification Unread=" + i2);
      }
      i1 += i2;
    }
    for (;;)
    {
      i2 = i1;
      if (a().b(AppConstants.am, 4000))
      {
        i2 = ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).a();
        if ((i2 != 0) && (QLog.isColorLevel())) {
          QLog.d("Q.msg.QQMessageFacade", 2, "Recent NewFriendUnread Unread=" + i2);
        }
        i2 = i1 + i2;
      }
      i1 = i2;
      if (a().b(AppConstants.aT, 9003))
      {
        BlessManager localBlessManager = (BlessManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(137);
        i1 = i2;
        if (localBlessManager != null) {
          i1 = i2 + localBlessManager.b();
        }
      }
      return i1;
    }
  }
  
  public void e()
  {
    a("refreshCache", "");
    System.currentTimeMillis();
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    Object localObject1 = localEntityManager.a(Sqlite.class, "select distinct tbl_name from Sqlite_master where tbl_name like \"mr_%\"", null);
    int i2;
    if (localObject1 != null)
    {
      List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(true);
      boolean bool1 = localEntityManager.d(ConversationInfo.getConversationInfoTableName());
      ConversationFacade localConversationFacade = a();
      StringBuilder localStringBuilder = new StringBuilder(128);
      Iterator localIterator = ((List)localObject1).iterator();
      int i1 = 0;
      boolean bool2;
      Object localObject2;
      label645:
      do
      {
        Object localObject3;
        do
        {
          do
          {
            do
            {
              i2 = i1;
              if (!localIterator.hasNext()) {
                break;
              }
              localObject3 = (Sqlite)localIterator.next();
              tbl_name = SecurityUtile.a(tbl_name);
            } while (tbl_name.equals("mr_fileManager"));
            bool2 = tbl_name.endsWith("_New");
            localObject2 = a(MsgProxyUtils.a(tbl_name)).a(tbl_name, localEntityManager);
            if (QLog.isDevelopLevel()) {
              QLog.d("Q.msg.QQMessageFacade", 4, "getMsgProxy().queryLastMessage = " + localObject2);
            }
          } while ((localObject2 == null) || ((localObject2 != null) && (frienduin == null)));
          localObject1 = localObject2;
          if (localObject2 != null)
          {
            localObject1 = localObject2;
            if (uniseq == 0L)
            {
              a(istroop).b(frienduin, istroop);
              localObject2 = a(istroop).a(tbl_name, localEntityManager);
              localObject1 = localObject2;
              if (QLog.isColorLevel())
              {
                QLog.d("Q.msg.QQMessageFacade", 2, "requeryLastMessage = " + localObject2);
                localObject1 = localObject2;
              }
            }
          }
          if (localObject1 == null) {
            break label1003;
          }
        } while (((AppConstants.ai.equals(frienduin)) && (!tbl_name.equals(DataLineMsgRecord.tableName()))) || ((AppConstants.aj.equals(frienduin)) && (!tbl_name.equals(DataLineMsgRecord.tableName(1)))));
        if (((!AppConstants.aq.equals(frienduin)) && (MsgProxyUtils.a(istroop) == 1001)) || ((!AppConstants.aG.equals(frienduin)) && (MsgProxyUtils.a(istroop) == 1010)))
        {
          localObject2 = a(istroop).b(frienduin, istroop);
          if ((localObject2 != null) && (((List)localObject2).size() > 0))
          {
            localObject2 = ((List)localObject2).iterator();
            while (((Iterator)localObject2).hasNext())
            {
              localObject3 = (MessageRecord)((Iterator)localObject2).next();
              if ((senderuin != null) && (senderuin.equals(frienduin)) && (!MessageUtils.a(msgtype)))
              {
                hasReply = true;
                if (QLog.isColorLevel()) {
                  QLog.d("Q.msg.QQMessageFacade", 2, "requeryLastMessage = " + localObject1 + ",hasReply=" + hasReply);
                }
              }
            }
          }
        }
        a((QQMessageFacade.Message)localObject1);
        if (!bool1)
        {
          d((QQMessageFacade.Message)localObject1);
          if (localList != null)
          {
            i2 = 0;
            if (i2 < localList.size())
            {
              localObject2 = (RecentUser)localList.get(i2);
              if ((localObject2 == null) || (uin == null) || (!uin.equals(frienduin))) {
                break;
              }
              if ((MsgProxyUtils.s(istroop)) && (a().a(frienduin, MsgProxyUtils.a(istroop))))
              {
                if (istroop != 1009) {
                  a(AppConstants.af, 1009, frienduin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
                }
                if (istroop != 1001) {
                  a(AppConstants.aq, 1001, frienduin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
                }
              }
            }
          }
          localStringBuilder.setLength(0);
          localStringBuilder.append("refreshCache message uin = ").append(frienduin).append(", type = ").append(istroop).append(", unread = ").append(unReadNum).append(", time = ").append(time);
          a(localStringBuilder.toString(), "");
        }
        localObject2 = b(frienduin, istroop);
      } while ((!bool2) && (jdField_a_of_type_JavaUtilMap.containsKey(localObject2)));
      jdField_a_of_type_JavaUtilMap.put(localObject2, localObject1);
      i2 = i1 + 1;
      i1 = i2;
      if (!bool1)
      {
        localConversationFacade.b(frienduin, istroop, unReadNum);
        i1 = i2;
      }
    }
    label1003:
    for (;;)
    {
      break;
      i2 += 1;
      break label645;
      i2 = 0;
      localEntityManager.a();
      MsgAutoMonitorUtil.a().a("MSG_TableNum", i2 + "");
      return;
    }
  }
  
  public void e(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "removeNotification uin" + paramString + ",type:" + paramInt);
    }
    if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Pause) || (jdField_a_of_type_JavaUtilList.size() == 0)) {
      return;
    }
    Object localObject = null;
    for (;;)
    {
      QQMessageFacade.Message localMessage;
      synchronized (jdField_a_of_type_JavaUtilList)
      {
        Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
        if (!localIterator.hasNext()) {
          break label304;
        }
        localMessage = (QQMessageFacade.Message)localIterator.next();
        if (((paramInt == istroop) || ((MsgProxyUtils.c(paramInt)) && (MsgProxyUtils.c(istroop)))) && (frienduin.equals(paramString)))
        {
          counter = 0;
          localIterator.remove();
          bool1 = true;
          if (QLog.isColorLevel())
          {
            paramString = new StringBuilder().append("removeNotification remove:").append(bool1).append(",preMsg is null");
            if (localObject != null) {
              break label288;
            }
            bool2 = true;
            QLog.d("notification", 2, bool2 + ",iterator.hasNext():" + localIterator.hasNext());
          }
          if (!bool1) {
            break label294;
          }
          if ((localObject != null) || (!localIterator.hasNext())) {
            break label298;
          }
          paramString = (QQMessageFacade.Message)localIterator.next();
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString);
          return;
        }
      }
      localObject = localMessage;
      continue;
      label288:
      boolean bool2 = false;
      continue;
      label294:
      return;
      label298:
      paramString = localObject;
      continue;
      label304:
      boolean bool1 = false;
    }
  }
  
  public int f()
  {
    return a(6);
  }
  
  public void f()
  {
    Object localObject1 = new RecentUser().getTableName();
    SQLiteDatabase localSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localSQLiteDatabase == null) {
      return;
    }
    localObject1 = localSQLiteDatabase.a((String)localObject1, new String[] { "uin", "type" }, null, null, null, null);
    if (localObject1 != null) {}
    try
    {
      ((Cursor)localObject1).moveToFirst();
      int i1 = 0;
      while (i1 < ((Cursor)localObject1).getCount())
      {
        a(((Cursor)localObject1).getString(0), ((Cursor)localObject1).getInt(1), false, true);
        ((Cursor)localObject1).moveToNext();
        i1 += 1;
      }
      if (localObject1 != null) {
        ((Cursor)localObject1).close();
      }
      a(0).e();
      a(0).d();
      a(3000).e();
      a(3000).d();
      a(1).e();
      a(1).d();
      return;
    }
    finally
    {
      if (localObject1 != null) {
        ((Cursor)localObject1).close();
      }
    }
  }
  
  public void f(String paramString, int paramInt)
  {
    paramString = new QQMessageFacade.MessageNotifyParam(paramString, paramInt, 0, null);
    setChanged();
    notifyObservers(paramString);
  }
  
  public int g()
  {
    return a(7);
  }
  
  public void g()
  {
    Object localObject = new RecentUser().getTableName();
    String str1 = new TroopAssistantData().getTableName();
    String str2 = new PubAccountAssistantData().getTableName();
    String str3 = new TroopBarData().getTableName();
    String str4 = new NeedHandleUserData().getTableName();
    SQLiteDatabase localSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localSQLiteDatabase == null) {
      return;
    }
    localSQLiteDatabase.a((String)localObject, null, null);
    localSQLiteDatabase.a(str1, null, null);
    localSQLiteDatabase.a(str2, null, null);
    localSQLiteDatabase.a(str4, null, null);
    localSQLiteDatabase.a(str3, null, null);
    ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).h();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.w();
    GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
    localObject = (RecommendTroopManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(21);
    if (localObject != null)
    {
      ((RecommendTroopManagerImp)localObject).b();
      ((RecommendTroopManagerImp)localObject).a(1);
    }
    TroopAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
    i();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().c();
  }
  
  public void g(String paramString, int paramInt)
  {
    if ((paramString == null) || (paramString.length() < 5)) {}
    while ((jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager == null) || (paramString == null) || (paramString.length() < 5)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, paramInt);
  }
  
  public int h()
  {
    return a(8);
  }
  
  public void h()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, true);
  }
  
  public int i()
  {
    return a(9);
  }
  
  public void i()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, true);
  }
  
  public void j()
  {
    n();
  }
  
  public void k()
  {
    h(AppConstants.af, 1009);
    h(AppConstants.aq, 1001);
    h(AppConstants.aG, 1010);
  }
  
  /* Error */
  public void l()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4: invokevirtual 1942	com/tencent/mobileqq/app/QQAppInterface:getApplication	()Lmqq/app/MobileQQ;
    //   7: aload_0
    //   8: getfield 106	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   11: invokevirtual 1230	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   14: iconst_0
    //   15: invokevirtual 1948	mqq/app/MobileQQ:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   18: astore 4
    //   20: aload 4
    //   22: ldc 26
    //   24: lconst_0
    //   25: invokeinterface 1953 4 0
    //   30: lstore_2
    //   31: invokestatic 446	java/lang/System:currentTimeMillis	()J
    //   34: ldc2_w 1954
    //   37: ldiv
    //   38: lload_2
    //   39: lsub
    //   40: ldc2_w 1956
    //   43: lcmp
    //   44: ifge +4 -> 48
    //   47: return
    //   48: aload_0
    //   49: lload_2
    //   50: invokespecial 1959	com/tencent/mobileqq/app/message/QQMessageFacade:a	(J)V
    //   53: new 162	java/lang/StringBuilder
    //   56: dup
    //   57: ldc_w 1961
    //   60: invokespecial 181	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   63: astore 5
    //   65: aload_0
    //   66: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   69: astore 7
    //   71: aload 7
    //   73: monitorenter
    //   74: new 75	java/util/concurrent/ConcurrentHashMap
    //   77: dup
    //   78: aload_0
    //   79: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   82: invokespecial 1964	java/util/concurrent/ConcurrentHashMap:<init>	(Ljava/util/Map;)V
    //   85: astore 6
    //   87: aload_0
    //   88: getfield 78	com/tencent/mobileqq/app/message/QQMessageFacade:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   91: invokevirtual 1965	java/util/concurrent/ConcurrentHashMap:clear	()V
    //   94: aload 7
    //   96: monitorexit
    //   97: aload 6
    //   99: invokevirtual 377	java/util/concurrent/ConcurrentHashMap:keySet	()Ljava/util/Set;
    //   102: invokeinterface 185 1 0
    //   107: astore 7
    //   109: aload 7
    //   111: invokeinterface 190 1 0
    //   116: ifeq +114 -> 230
    //   119: aload 7
    //   121: invokeinterface 194 1 0
    //   126: checkcast 206	java/lang/String
    //   129: astore 8
    //   131: aload 6
    //   133: aload 8
    //   135: invokevirtual 1966	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   138: checkcast 332	java/lang/Integer
    //   141: invokevirtual 1969	java/lang/Integer:intValue	()I
    //   144: istore_1
    //   145: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   148: ifeq +23 -> 171
    //   151: aload 5
    //   153: ldc_w 1971
    //   156: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   159: aload 8
    //   161: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   164: ldc_w 1973
    //   167: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   170: pop
    //   171: aload_0
    //   172: aload 8
    //   174: iload_1
    //   175: invokevirtual 1974	com/tencent/mobileqq/app/message/QQMessageFacade:b	(Ljava/lang/String;I)V
    //   178: goto -69 -> 109
    //   181: astore 4
    //   183: aload 4
    //   185: invokevirtual 409	java/lang/Exception:printStackTrace	()V
    //   188: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   191: ifeq -144 -> 47
    //   194: ldc 91
    //   196: iconst_2
    //   197: new 162	java/lang/StringBuilder
    //   200: dup
    //   201: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   204: ldc_w 1976
    //   207: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   210: aload 4
    //   212: invokevirtual 374	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   215: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   218: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   221: return
    //   222: astore 4
    //   224: aload 7
    //   226: monitorexit
    //   227: aload 4
    //   229: athrow
    //   230: aload 4
    //   232: invokeinterface 1980 1 0
    //   237: ldc 26
    //   239: invokestatic 446	java/lang/System:currentTimeMillis	()J
    //   242: ldc2_w 1954
    //   245: ldiv
    //   246: invokeinterface 1986 4 0
    //   251: invokeinterface 1989 1 0
    //   256: pop
    //   257: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   260: ifeq -213 -> 47
    //   263: ldc 91
    //   265: iconst_2
    //   266: aload 5
    //   268: invokevirtual 178	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   271: invokestatic 240	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   274: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	275	0	this	QQMessageFacade
    //   144	31	1	i1	int
    //   30	20	2	l1	long
    //   18	3	4	localSharedPreferences	android.content.SharedPreferences
    //   181	30	4	localException	Exception
    //   222	9	4	localObject1	Object
    //   63	204	5	localStringBuilder	StringBuilder
    //   85	47	6	localConcurrentHashMap	ConcurrentHashMap
    //   129	44	8	str	String
    // Exception table:
    //   from	to	target	type
    //   48	53	181	java/lang/Exception
    //   74	97	222	finally
    //   224	227	222	finally
  }
  
  public void m()
  {
    ConcurrentHashMap localConcurrentHashMap = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().f();
    if (localConcurrentHashMap.isEmpty()) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("revokeMsg", 2, "handleRevokeNotifyAfterSyncMsg");
    }
    Iterator localIterator = localConcurrentHashMap.keySet().iterator();
    while (localIterator.hasNext()) {
      a((ArrayList)localConcurrentHashMap.get(localIterator.next()), true);
    }
    localConcurrentHashMap.clear();
  }
  
  public void notifyObservers(Object paramObject)
  {
    long l1 = System.currentTimeMillis();
    super.notifyObservers(paramObject);
    MsgAutoMonitorUtil.a().c(System.currentTimeMillis() - l1);
    MsgAutoMonitorUtil.a().c();
  }
  
  public void onDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager != null) {
      jdField_a_of_type_ComTencentMobileqqManagersDraftTextManager.a();
    }
    if (jdField_a_of_type_JavaUtilMap != null) {
      jdField_a_of_type_JavaUtilMap.clear();
    }
    if (jdField_b_of_type_JavaUtilMap != null) {
      jdField_b_of_type_JavaUtilMap.clear();
    }
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      jdField_a_of_type_JavaUtilList.clear();
      jdField_b_of_type_Boolean = false;
      deleteObservers();
      return;
    }
  }
}
