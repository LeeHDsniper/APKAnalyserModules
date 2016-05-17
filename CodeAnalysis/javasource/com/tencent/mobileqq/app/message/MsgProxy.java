package com.tencent.mobileqq.app.message;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.commonsdk.util.LargerInteger;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.fms.FullMessageSearchResult.SearchResultItem;
import com.tencent.mobileqq.app.fms.FullMessageSearchTask;
import com.tencent.mobileqq.app.fms.MessageSearchUtils;
import com.tencent.mobileqq.app.fms.SearchStrategy;
import com.tencent.mobileqq.app.proxy.BaseProxy;
import com.tencent.mobileqq.app.proxy.MsgQueueItem;
import com.tencent.mobileqq.app.proxy.ProxyListener;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.ChatHistorySearchData;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.MessageRecordEntityManager;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MessageDBUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;
import njy;

public class MsgProxy
  extends BaseProxy
{
  public static final int a = -1;
  static final String jdField_a_of_type_JavaLangString = "Q.msg.MsgProxy";
  public static final int b = 1;
  public static final int c = 2;
  protected MessageRecordEntityManager a;
  private Object jdField_a_of_type_JavaLangObject;
  
  public MsgProxy(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    super(paramQQAppInterface, paramProxyManager);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager = null;
    jdField_a_of_type_JavaLangObject = new Object();
  }
  
  private int a(String paramString, int paramInt)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      List localList = d(paramString, paramInt);
      int i = 0;
      if (localList != null)
      {
        i = localList.size();
        localList.clear();
      }
      if (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().containsKey(a(paramString, paramInt))) {
        MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().remove(a(paramString, paramInt));
      }
      return i;
    }
  }
  
  private int a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      paramString = d(paramString, paramInt);
      paramInt = 0;
      if (paramString != null)
      {
        paramInt = paramString.size();
        Object localObject2 = new ArrayList();
        ((List)localObject2).addAll(paramString);
        localObject2 = ((List)localObject2).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
          if ((time >= paramLong1) && (time <= paramLong2) && (MsgProxyUtils.f(msgtype))) {
            paramString.remove(localMessageRecord);
          }
        }
      }
    }
    c();
    return paramInt;
  }
  
  private QQMessageFacade.Message a(String paramString, EntityManager paramEntityManager, int paramInt1, int paramInt2)
  {
    if (a(paramString, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramEntityManager);
    }
    int i;
    String str;
    if ((paramString.startsWith("mr_discusssion")) || (paramString.startsWith("mr_troop")))
    {
      i = 1;
      boolean bool = paramString.endsWith("_New");
      str = "select m.*,(select count() from %s mr where mr.isread=0) as unReadNum,(select count() from %s mr where mr.issend=0) as hasReply from %s m where m.isValid=1 and m.msgtype " + MsgProxyUtils.a() + " and m.longMsgId='%d' and m.issend='%d' order by %s limit 1";
      if (!bool) {
        break label177;
      }
      if (i == 0) {
        break label171;
      }
      paramEntityManager = "longMsgIndex asc , shmsgseq desc , _id desc";
    }
    for (;;)
    {
      paramString = String.format(str, new Object[] { paramString, paramString, paramString, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), paramEntityManager });
      paramString = a().a(QQMessageFacade.Message.class, paramString, null);
      if ((paramString == null) || (paramString.isEmpty())) {
        break label183;
      }
      return (QQMessageFacade.Message)paramString.get(0);
      i = 0;
      break;
      label171:
      paramEntityManager = "longMsgIndex asc , time desc , _id desc";
      continue;
      label177:
      paramEntityManager = "_id desc";
    }
    label183:
    return null;
  }
  
  private MessageRecord a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2, boolean paramBoolean)
  {
    if (paramMessageRecord1 == null) {}
    do
    {
      do
      {
        do
        {
          return paramMessageRecord2;
          if (!MsgProxyUtils.a(paramMessageRecord1, paramMessageRecord2)) {
            break;
          }
        } while (longMsgIndex > longMsgIndex);
        return paramMessageRecord1;
        if (!paramBoolean) {
          break;
        }
      } while (shmsgseq > shmsgseq);
      return paramMessageRecord1;
    } while (time > time);
    return paramMessageRecord1;
  }
  
  private List a(List paramList)
  {
    paramList = new ArrayList(paramList);
    HashSet localHashSet = new HashSet();
    int i = paramList.size() - 1;
    if (i >= 0)
    {
      if (localHashSet.contains(getsenderuin)) {
        paramList.remove(i);
      }
      for (;;)
      {
        i -= 1;
        break;
        localHashSet.add(getsenderuin);
      }
    }
    Collections.reverse(paramList);
    return paramList;
  }
  
  public static List a(List paramList, long paramLong)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    int j = paramList.size();
    int i = 0;
    while (i < j)
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.get(i);
      if (time >= paramLong) {
        localArrayList.add(localMessageRecord);
      }
      i += 1;
    }
    return localArrayList;
  }
  
  private void a(String paramString, int paramInt)
  {
    if (d(paramString, paramInt).size() == 0)
    {
      if (a(paramString, paramInt, true)) {
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
      }
      MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().remove(a(paramString, paramInt));
      b(paramString, paramInt, g(paramString, paramInt));
    }
  }
  
  private void a(String paramString, int paramInt, Entity arg3)
  {
    Object localObject;
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      localObject = d(paramString, paramInt);
      if ((localObject == null) || (((List)localObject).isEmpty())) {
        return;
      }
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.MsgProxy", 2, "setMsgRead " + localMessageRecord.getBaseInfoString());
        }
        if (!isread) {
          isread = true;
        }
      }
    }
    paramString = f(paramString, paramInt);
    if ((paramString == null) || (paramString.isEmpty())) {
      return;
    }
    paramString = paramString.iterator();
    while (paramString.hasNext())
    {
      localObject = (MessageRecord)paramString.next();
      if (!isread) {
        isread = true;
      }
    }
  }
  
  private boolean a()
  {
    Object localObject4 = null;
    for (;;)
    {
      try
      {
        Iterator localIterator = MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().keySet().iterator();
        Object localObject1 = null;
        if (!localIterator.hasNext()) {
          break label426;
        }
        String str = (String)localIterator.next();
        if (((str != null) && (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().keySet().contains(str))) || ((str != null) && (MsgProxyUtils.b(str)))) {
          continue;
        }
        if (str != null)
        {
          List localList = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(str);
          localObject5 = str;
          localObject6 = localList;
          if (localList != null)
          {
            localObject5 = str;
            localObject6 = localList;
            if (localList.size() > 0)
            {
              localObject5 = (MessageRecord)localList.get(0);
              if (a(frienduin, istroop, true)) {
                continue;
              }
              localObject5 = str;
              localObject6 = localList;
              if (localObject1 == null) {
                break label406;
              }
              if (localObject1.size() == 0)
              {
                localObject5 = str;
                localObject6 = localList;
                break label406;
              }
              if ((localList == null) || (localList.size() <= 0)) {
                break label416;
              }
              localObject5 = str;
              localObject6 = localList;
              if (getsize1time < getsize1time) {
                break label406;
              }
              break label416;
            }
          }
          if (localObject5 != null)
          {
            MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().remove(localObject5);
            if (QLog.isColorLevel())
            {
              if ((localObject6 == null) || (((List)localObject6).size() <= 0)) {
                continue;
              }
              l = getsize1time;
              QLog.d("Q.msg.MsgProxy", 2, new Object[] { "MsgPool.getPoolInstance().getMsgPool().remove:", localObject5, ",time=", Long.valueOf(l) });
            }
          }
          return true;
          long l = 0L;
          continue;
          localObject4 = localObject5;
        }
      }
      finally {}
      label406:
      Object localObject3;
      for (;;)
      {
        localObject3 = localObject6;
        break;
        label416:
        localObject5 = localObject4;
        localObject6 = localObject3;
      }
      label426:
      Object localObject5 = localObject4;
      Object localObject6 = localObject3;
    }
  }
  
  public static boolean a(int paramInt)
  {
    return (paramInt == 3000) || (paramInt == 1) || (paramInt == 1026);
  }
  
  /* Error */
  private void b(String paramString, int paramInt, List paramList)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 40	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6: invokevirtual 46	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   9: invokestatic 51	com/tencent/mobileqq/app/message/MsgPool:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/message/MsgPool;
    //   12: invokevirtual 245	com/tencent/mobileqq/app/message/MsgPool:a	()Ljava/util/concurrent/ConcurrentHashMap;
    //   15: invokevirtual 300	java/util/concurrent/ConcurrentHashMap:size	()I
    //   18: istore 4
    //   20: getstatic 303	com/tencent/mobileqq/app/message/MsgProxyUtils:a	[Ljava/lang/String;
    //   23: arraylength
    //   24: istore 5
    //   26: iload 4
    //   28: iload 5
    //   30: bipush 40
    //   32: iadd
    //   33: if_icmple +45 -> 78
    //   36: iconst_0
    //   37: istore 7
    //   39: aload_0
    //   40: invokespecial 305	com/tencent/mobileqq/app/message/MsgProxy:a	()Z
    //   43: istore 6
    //   45: invokestatic 257	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   48: ifeq +30 -> 78
    //   51: ldc 10
    //   53: iconst_2
    //   54: new 154	java/lang/StringBuilder
    //   57: dup
    //   58: invokespecial 155	java/lang/StringBuilder:<init>	()V
    //   61: ldc_w 307
    //   64: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   67: iload 6
    //   69: invokevirtual 310	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   72: invokevirtual 168	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   75: invokestatic 265	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   78: aload_0
    //   79: getfield 40	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   82: invokevirtual 46	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   85: invokestatic 51	com/tencent/mobileqq/app/message/MsgPool:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/message/MsgPool;
    //   88: invokevirtual 245	com/tencent/mobileqq/app/message/MsgPool:a	()Ljava/util/concurrent/ConcurrentHashMap;
    //   91: aload_0
    //   92: aload_1
    //   93: iload_2
    //   94: invokevirtual 73	com/tencent/mobileqq/app/message/MsgProxy:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   97: aload_3
    //   98: invokevirtual 314	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   101: pop
    //   102: aload_0
    //   103: monitorexit
    //   104: return
    //   105: astore 8
    //   107: iload 7
    //   109: istore 6
    //   111: invokestatic 257	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   114: ifeq -69 -> 45
    //   117: ldc 10
    //   119: iconst_2
    //   120: ldc_w 316
    //   123: aload 8
    //   125: invokestatic 320	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   128: iload 7
    //   130: istore 6
    //   132: goto -87 -> 45
    //   135: astore_1
    //   136: aload_0
    //   137: monitorexit
    //   138: aload_1
    //   139: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	140	0	this	MsgProxy
    //   0	140	1	paramString	String
    //   0	140	2	paramInt	int
    //   0	140	3	paramList	List
    //   18	16	4	i	int
    //   24	9	5	j	int
    //   43	88	6	bool1	boolean
    //   37	92	7	bool2	boolean
    //   105	19	8	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   39	45	105	java/lang/Exception
    //   2	26	135	finally
    //   39	45	135	finally
    //   45	78	135	finally
    //   78	102	135	finally
    //   111	128	135	finally
  }
  
  private void b(List paramList, ProxyListener paramProxyListener)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.next();
      if (versionCode > 0)
      {
        if (QLog.isColorLevel()) {
          QLog.d("vip", 2, "proxy addSync id=" + vipBubbleID);
        }
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c(frienduin, istroop, MessageRecord.getTableName(frienduin, istroop), localMessageRecord, 0, paramProxyListener);
      }
    }
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c();
  }
  
  private List c(String paramString1, int paramInt1, long paramLong, int paramInt2, String paramString2)
  {
    if (a(paramString1, paramInt1, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    String str1;
    String str2;
    if (paramInt2 > 0)
    {
      str1 = "limit " + paramInt2;
      str2 = "select * from " + MessageRecord.getTableName(paramString1, paramInt1) + " where time<%d %s order by time desc, _id desc %s";
      if (paramString2 != null) {
        break label272;
      }
    }
    label272:
    for (paramString2 = "";; paramString2 = "and " + paramString2)
    {
      paramString2 = String.format(str2, new Object[] { Long.valueOf(paramLong), paramString2, str1 });
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryMessageByTime: sql=" + paramString2 + ", peeruin = " + paramString1 + ", type = " + paramInt1);
      }
      paramString2 = a().a(paramString2, null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (paramString2 != null) {
        Collections.reverse(paramString2);
      }
      if (paramString2 == null) {
        break label298;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryMessageByTime: list size =" + paramString2.size() + ", peeruin = " + paramString1 + ", type = " + paramInt1);
      }
      return paramString2;
      str1 = "";
      break;
    }
    label298:
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageByTime: null list , peeruin = " + paramString1 + ", type = " + paramInt1);
    }
    return new ArrayList();
  }
  
  private MessageRecord g(String paramString, int paramInt, long paramLong)
  {
    Object localObject2 = MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt);
    List localList = null;
    for (;;)
    {
      Object localObject1;
      try
      {
        Object localObject3 = d(paramString, paramInt);
        localObject1 = localList;
        if (localObject3 != null)
        {
          Iterator localIterator = ((List)localObject3).iterator();
          localObject1 = localList;
          if (localIterator.hasNext())
          {
            localObject1 = (MessageRecord)localIterator.next();
            if (((MessageRecord)localObject1).getId() != paramLong) {
              continue;
            }
            ((List)localObject3).remove(localObject1);
          }
        }
        localList = f(paramString, paramInt);
        if (localList != null)
        {
          localObject3 = localList.iterator();
          if (((Iterator)localObject3).hasNext())
          {
            paramString = (MessageRecord)((Iterator)localObject3).next();
            if (paramString.getId() != paramLong) {
              continue;
            }
            localList.remove(paramString);
            return paramString;
          }
        }
      }
      finally {}
      paramString = (String)localObject1;
    }
  }
  
  protected int a(int paramInt)
  {
    int i = 0;
    int j = 0;
    for (;;)
    {
      synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(AppConstants.aD, paramInt))
      {
        Object localObject2 = d(AppConstants.aD, 4001);
        if (localObject2 != null)
        {
          int k = ((List)localObject2).size() - 1;
          i = j;
          j = k;
          if (j >= 0)
          {
            if (getmsgtype == paramInt)
            {
              ((List)localObject2).remove(j);
              i += 1;
            }
          }
          else {
            a(String.valueOf(AppConstants.aD), 4001, MessageRecord.getTableName(String.valueOf(AppConstants.aD), 4001), "msgtype=?", new String[] { String.valueOf(paramInt) }, null);
          }
        }
        else
        {
          if ((localObject2 != null) && (((List)localObject2).size() == 0) && (GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) <= 0))
          {
            localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
            RecentUser localRecentUser = ((RecentUserProxy)localObject2).a(AppConstants.aB, 9000);
            if (localRecentUser != null) {
              ((RecentUserProxy)localObject2).b(localRecentUser);
            }
          }
          return i;
        }
      }
      j -= 1;
    }
  }
  
  protected int a(int paramInt, QQMessageFacade.Message paramMessage)
  {
    int i = 0;
    String str = String.valueOf(AppConstants.aD);
    label312:
    label315:
    for (;;)
    {
      synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(str, 4001))
      {
        localObject2 = d(str, 4001);
        if ((localObject2 == null) || (((List)localObject2).isEmpty())) {
          return 0;
        }
        localObject2 = ((List)localObject2).iterator();
        MessageRecord localMessageRecord;
        if (((Iterator)localObject2).hasNext())
        {
          localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.MsgProxy", 2, "setRecommendMsgReaded " + localMessageRecord.getBaseInfoString());
          }
          if ((msgtype != paramInt) || (isread)) {
            break label312;
          }
          isread = true;
          i += 1;
          break label315;
        }
        localObject2 = f(str, 4001);
        if ((localObject2 != null) && (!((List)localObject2).isEmpty()))
        {
          localObject2 = ((List)localObject2).iterator();
          if (((Iterator)localObject2).hasNext())
          {
            localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
            if ((msgtype != paramInt) || (isread)) {
              continue;
            }
            isread = true;
          }
        }
      }
      Object localObject2 = new ContentValues();
      ((ContentValues)localObject2).put("isread", Boolean.valueOf(true));
      a(str, 4001, versionCode, (ContentValues)localObject2, "msgtype=? and isread=?", new String[] { String.valueOf(paramInt), "0" }, null);
      return i;
    }
  }
  
  protected int a(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    if (paramMessageRecord == null) {
      return -1;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "--->deleteC2CMsgByMessageRecord : peerUin:" + frienduin + " type:" + istroop + " uniseq:" + uniseq + " mr:" + paramMessageRecord + " dbid:" + paramMessageRecord.getId());
    }
    if (paramBoolean)
    {
      g(frienduin, istroop, paramMessageRecord.getId());
      label111:
      long l = paramMessageRecord.getId();
      if (l <= 0L) {
        break label189;
      }
      a(frienduin, istroop, MessageRecord.getTableName(frienduin, istroop), "_id=?", new String[] { String.valueOf(l) }, null);
    }
    for (;;)
    {
      if (isread) {
        break label242;
      }
      return 2;
      d(frienduin, istroop, uniseq);
      break label111;
      label189:
      if (uniseq == 0L) {
        break;
      }
      a(frienduin, istroop, MessageRecord.getTableName(frienduin, istroop), "uniseq=?", new String[] { String.valueOf(uniseq) }, null);
    }
    label242:
    a(frienduin, istroop);
    return 1;
  }
  
  protected int a(String paramString, int paramInt, long paramLong)
  {
    String str = MessageRecord.getTableName(paramString, paramInt);
    boolean bool = a(paramInt);
    Object localObject2;
    if (bool)
    {
      ??? = "shmsgseq desc , _id desc";
      if (!bool) {
        break label191;
      }
      localObject2 = "shmsgseq";
      localObject2 = String.format("select m.*,(select count() from %s mr where mr.isread=0 and mr.issend='0' and mr.%s>'%d') as unReadNum from %s m where m.%s>'%d' order by %s limit 1", new Object[] { str, localObject2, Long.valueOf(paramLong), str, localObject2, Long.valueOf(paramLong), ??? });
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().jdField_a_of_type_JavaLangObject)
      {
        if (a(paramString, paramInt, false)) {
          jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
        }
        localObject2 = a().a(QQMessageFacade.Message.class, (String)localObject2, null);
        if ((localObject2 != null) && (!((List)localObject2).isEmpty()))
        {
          i = get0unReadNum;
          paramInt = b(paramString, paramInt, paramLong);
          return i + paramInt;
          ??? = "time desc , _id desc";
          break;
          label191:
          localObject2 = "time";
        }
      }
      int i = 0;
    }
  }
  
  protected int a(String paramString, int paramInt, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    String str = "time>=? and time<=? and msgtype " + MsgProxyUtils.c();
    String[] arrayOfString = new String[2];
    arrayOfString[0] = String.valueOf(paramLong1);
    arrayOfString[1] = String.valueOf(paramLong2);
    int i = a(paramString, paramInt, paramLong1, paramLong2);
    if (paramBoolean)
    {
      a(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), str, arrayOfString, null);
      a(paramString, paramInt, MessageRecord.getOldTableName(paramString, paramInt), str, arrayOfString, null);
    }
    return i;
  }
  
  protected int a(String paramString, int paramInt, long paramLong, MessageRecord paramMessageRecord)
  {
    int i = 0;
    String str1 = null;
    String str2 = MessageRecord.getTableName(paramString, paramInt);
    paramString = str1;
    if (MsgProxyUtils.c(paramInt))
    {
      paramString = a();
      str1 = "( msgtype " + MsgProxyUtils.b() + " and isValid=1 ) " + "and ( (time >= ? and time < ?) or (time = ? and longMsgIndex <= ? and _id <= ?))";
      long l1 = time;
      long l2 = time;
      paramInt = longMsgIndex;
      long l3 = paramMessageRecord.getId();
      paramString = paramString.a(false, str2, new String[] { "_id" }, str1, new String[] { String.valueOf(paramLong), String.valueOf(l1), String.valueOf(l2), String.valueOf(paramInt), String.valueOf(l3) }, null, null, null, null);
    }
    paramInt = i;
    if (paramString != null)
    {
      paramInt = paramString.getCount();
      paramString.close();
    }
    return paramInt;
  }
  
  protected int a(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    int i = 0;
    String str1 = null;
    String str2 = MessageRecord.getTableName(paramString, paramInt);
    paramString = str1;
    if (MsgProxyUtils.c(paramInt))
    {
      paramString = a();
      str1 = "( msgtype " + MsgProxyUtils.b() + " and isValid=1 ) " + "and ( time < ? or (time = ? and longMsgIndex <= ? and _id <= ?))";
      long l1 = time;
      long l2 = time;
      paramInt = longMsgIndex;
      long l3 = paramMessageRecord.getId();
      paramString = paramString.a(false, str2, new String[] { "_id" }, str1, new String[] { String.valueOf(l1), String.valueOf(l2), String.valueOf(paramInt), String.valueOf(l3) }, null, null, null, null);
    }
    paramInt = i;
    if (paramString != null)
    {
      paramInt = paramString.getCount();
      paramString.close();
    }
    return paramInt;
  }
  
  protected int a(String paramString, int paramInt, boolean paramBoolean)
  {
    int i = a(paramString, paramInt);
    if (paramBoolean)
    {
      a(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), null, null, null);
      a(paramString, paramInt, MessageRecord.getOldTableName(paramString, paramInt), null, null, null);
    }
    return i;
  }
  
  protected int a(List paramList, boolean paramBoolean)
  {
    if ((paramList == null) || (paramList.size() == 0)) {
      return -1;
    }
    int i = paramList.size();
    Object localObject1 = (MessageRecord)paramList.get(paramList.size() - 1);
    String str = frienduin;
    int j = istroop;
    Object localObject2 = new ArrayList();
    localObject1 = new ArrayList();
    paramList = paramList.iterator();
    if (paramList.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.next();
      if (paramBoolean)
      {
        g(frienduin, istroop, localMessageRecord.getId());
        label124:
        if (localMessageRecord.getId() <= 0L) {
          break label176;
        }
        ((List)localObject2).add(String.valueOf(localMessageRecord.getId()));
      }
      for (;;)
      {
        break;
        d(frienduin, istroop, uniseq);
        break label124;
        label176:
        if (uniseq != 0L) {
          ((List)localObject1).add(String.valueOf(uniseq));
        } else {
          i -= 1;
        }
      }
    }
    if (((List)localObject2).size() > 100)
    {
      paramList = ((List)localObject2).iterator();
      while (paramList.hasNext())
      {
        localObject2 = (String)paramList.next();
        a(str, j, MessageRecord.getTableName(str, j), "_id=?", new String[] { localObject2 }, null);
      }
    }
    int k;
    if (((List)localObject2).size() != 0)
    {
      k = ((List)localObject2).size();
      paramList = new String[k];
      Arrays.fill(paramList, "?");
      paramList = Arrays.toString(paramList);
      paramList = "_id IN (" + paramList.substring(1, paramList.length() - 1) + ")";
      a(str, j, MessageRecord.getTableName(str, j), paramList, (String[])((List)localObject2).toArray(new String[k]), null);
    }
    if (((List)localObject1).size() > 100)
    {
      paramList = ((List)localObject1).iterator();
      while (paramList.hasNext())
      {
        localObject1 = (String)paramList.next();
        a(str, j, MessageRecord.getTableName(str, j), "uniseq=?", new String[] { localObject1 }, null);
      }
    }
    if (((List)localObject1).size() != 0)
    {
      k = ((List)localObject1).size();
      paramList = new String[k];
      Arrays.fill(paramList, "?");
      paramList = Arrays.toString(paramList);
      paramList = "uniseq IN (" + paramList.substring(1, paramList.length() - 1) + ")";
      a(str, j, MessageRecord.getTableName(str, j), paramList, (String[])((List)localObject1).toArray(new String[k]), null);
    }
    a(str, j);
    return i;
  }
  
  @Deprecated
  public Cursor a(String paramString, int paramInt)
  {
    int j = 0;
    List localList = b(paramString, paramInt);
    if (paramString.equals(String.valueOf(AppConstants.ap)))
    {
      ArrayList localArrayList = new ArrayList();
      int i = 0;
      while (i < localList.size())
      {
        localArrayList.add(localList.get(localList.size() - i - 1));
        i += 1;
      }
      new ArrayList();
      paramString = a(paramString, paramInt, Integer.MAX_VALUE);
      if (paramString != null)
      {
        paramInt = j;
        while (paramInt < paramString.size())
        {
          localArrayList.add(paramString.get(paramString.size() - paramInt - 1));
          paramInt += 1;
        }
      }
      return new njy(this, localArrayList);
    }
    return new njy(this, (List)((ArrayList)localList).clone());
  }
  
  @Deprecated
  protected Cursor a(List paramList)
  {
    return new njy(this, paramList);
  }
  
  public FullMessageSearchResult.SearchResultItem a(String paramString1, int paramInt1, String paramString2, int paramInt2, FullMessageSearchTask paramFullMessageSearchTask)
  {
    if (TextUtils.isEmpty(paramString1)) {
      paramString1 = null;
    }
    for (;;)
    {
      return paramString1;
      if (a(paramString1, paramInt1, true)) {
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c();
      }
      long l1 = NetConnInfoCenter.getServerTime();
      long l2 = SearchStrategy.a;
      Object localObject = MessageRecord.getTableName(paramString1, paramInt1);
      localObject = a().a(false, (String)localObject, null, "msgtype in (?,?,?) AND time>=?", new String[] { String.valueOf(64536), String.valueOf(64501), String.valueOf(63525), String.valueOf(60527), String.valueOf(l1 - l2) }, null, null, "time desc, longMsgIndex desc", String.valueOf(paramInt2));
      try
      {
        paramString2 = MessageSearchUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager, (Cursor)localObject, paramString1, paramInt1, paramString2, paramFullMessageSearchTask);
        paramString1 = paramString2;
        if (localObject == null) {
          continue;
        }
        ((Cursor)localObject).close();
        return paramString2;
      }
      catch (Exception paramString1)
      {
        paramString1 = paramString1;
        if (localObject != null) {
          ((Cursor)localObject).close();
        }
        return null;
      }
      finally
      {
        paramString1 = finally;
        if (localObject != null) {
          ((Cursor)localObject).close();
        }
        throw paramString1;
      }
    }
  }
  
  protected QQMessageFacade.Message a(String paramString, EntityManager paramEntityManager)
  {
    for (;;)
    {
      synchronized (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().jdField_a_of_type_JavaLangObject)
      {
        if (a(paramString, false)) {
          jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramEntityManager);
        }
        if (paramString.startsWith("mr_discusssion")) {
          break label373;
        }
        if (!paramString.startsWith("mr_troop")) {
          break label379;
        }
        break label373;
        boolean bool2 = paramString.endsWith("_New");
        localObject1 = new StringBuilder(1024);
        ((StringBuilder)localObject1).append("select m.*,(select count() from %s mr where mr.isread=0) as unReadNum,(select count() from %s mr where mr.issend=0) as hasReply from %s m where m.isValid=1 and m.msgtype ");
        ((StringBuilder)localObject1).append(MsgProxyUtils.a());
        ((StringBuilder)localObject1).append(" order by %s limit 1");
        Object localObject3 = ((StringBuilder)localObject1).toString();
        if (!bool2) {
          break label393;
        }
        if (!bool1) {
          break label385;
        }
        localObject1 = "shmsgseq desc , _id desc";
        localObject1 = String.format((String)localObject3, new Object[] { paramString, paramString, paramString, localObject1 });
        localObject1 = a().a(QQMessageFacade.Message.class, (String)localObject1, null);
        if ((localObject1 == null) || (((List)localObject1).isEmpty())) {
          break label368;
        }
        localObject1 = (QQMessageFacade.Message)((List)localObject1).get(0);
        if ((!((QQMessageFacade.Message)localObject1).isLongMsg()) || (longMsgIndex <= 0)) {
          break label362;
        }
        paramEntityManager = a(paramString, paramEntityManager, longMsgId, issend);
        paramString = a(paramString);
        if ((paramString == null) || (paramString.size() <= 0)) {
          break label357;
        }
        int i;
        if (paramEntityManager == null)
        {
          i = 0;
          paramString = paramString.iterator();
          localObject1 = paramEntityManager;
          if (paramString.hasNext())
          {
            localObject3 = (MessageRecord)paramString.next();
            if (!isread) {
              break label400;
            }
            j = 0;
            localObject1 = a((MessageRecord)localObject1, (MessageRecord)localObject3, bool1);
            i = j + i;
            continue;
          }
        }
        else
        {
          i = unReadNum;
          continue;
        }
        if (paramEntityManager == null)
        {
          paramString = new QQMessageFacade.Message();
          MessageRecord.copyMessageRecordBaseField(paramString, (MessageRecord)localObject1);
          unReadNum = i;
          return paramString;
        }
      }
      paramString = paramEntityManager;
      continue;
      label357:
      paramString = paramEntityManager;
      continue;
      label362:
      paramEntityManager = (EntityManager)localObject1;
      continue;
      label368:
      paramEntityManager = null;
      continue;
      label373:
      boolean bool1 = true;
      continue;
      label379:
      bool1 = false;
      continue;
      label385:
      Object localObject1 = "time desc , _id desc";
      continue;
      label393:
      localObject1 = "_id desc";
      continue;
      label400:
      int j = 1;
    }
  }
  
  protected ChatHistorySearchData a(Cursor paramCursor, SessionInfo paramSessionInfo, String paramString)
  {
    if ((paramCursor == null) || (paramCursor.getCount() == 0) || (paramSessionInfo == null) || (TextUtils.isEmpty(paramString))) {
      return null;
    }
    String str1 = jdField_a_of_type_JavaLangString;
    int j = jdField_a_of_type_Int;
    String str2 = paramString.toLowerCase(Locale.US);
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    paramString = new HashSet();
    a(paramSessionInfo, str1, j, paramString);
    HashSet localHashSet = new HashSet();
    paramString = paramString.iterator();
    Object localObject;
    while (paramString.hasNext())
    {
      str1 = (String)paramString.next();
      if (str1 != null)
      {
        localObject = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramSessionInfo, str1.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()), str1);
        if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((String)localObject).toLowerCase(Locale.US).contains(str2))) {
          localHashSet.add(str1);
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "getSearchResult, keyuins = " + localHashSet.toString());
    }
    if (paramCursor.isBeforeFirst()) {
      paramCursor.moveToFirst();
    }
    if (!paramCursor.isAfterLast())
    {
      paramString = a(paramCursor, paramSessionInfo, j);
      if ((TextUtils.isEmpty(paramString)) || (!localHashSet.contains(paramString))) {
        break label468;
      }
    }
    label465:
    label468:
    for (int i = 1;; i = 0)
    {
      if (i == 0)
      {
        localObject = paramCursor.getBlob(paramCursor.getColumnIndex("msgData"));
        str1 = "";
        paramString = str1;
        if (localObject != null) {
          paramString = str1;
        }
      }
      for (;;)
      {
        try
        {
          if (localObject.length > 0) {
            paramString = new String((byte[])localObject, "utf-8");
          }
          if (!paramString.toLowerCase(Locale.US).contains(str2)) {
            break label465;
          }
          i = 1;
          if (i != 0)
          {
            if (localArrayList1.size() >= 50) {
              continue;
            }
            paramString = (MessageRecord)a().a(MessageRecord.class, null, paramCursor);
            if (paramString != null) {
              localArrayList1.add(paramString);
            }
          }
          paramCursor.moveToNext();
        }
        catch (Exception paramString)
        {
          paramString.printStackTrace();
          paramString = "";
          continue;
          localArrayList2.add(Integer.valueOf(paramCursor.getInt(0)));
          continue;
        }
        if (localArrayList1.size() > 0)
        {
          paramCursor = new ChatHistorySearchData();
          mSearchData1 = localArrayList1;
          mSearchData2 = localArrayList2;
          return paramCursor;
        }
        return null;
      }
    }
  }
  
  protected ChatHistorySearchData a(SessionInfo paramSessionInfo, String paramString)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramSessionInfo != null)
    {
      localObject1 = localObject2;
      if (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString))
      {
        if (!TextUtils.isEmpty(paramString)) {
          break label35;
        }
        localObject1 = localObject2;
      }
    }
    for (;;)
    {
      return localObject1;
      label35:
      localObject1 = MessageRecord.getTableName(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
      Cursor localCursor = a().a(false, (String)localObject1, null, "msgtype = ?", new String[] { String.valueOf(64536) }, null, null, "time desc, longMsgIndex desc", null);
      try
      {
        paramSessionInfo = a(localCursor, paramSessionInfo, paramString);
        localObject1 = paramSessionInfo;
        if (localCursor == null) {
          continue;
        }
        localCursor.close();
        return paramSessionInfo;
      }
      catch (Exception paramSessionInfo)
      {
        paramSessionInfo = paramSessionInfo;
        localObject1 = localObject2;
        if (localCursor == null) {
          continue;
        }
        localCursor.close();
        return null;
      }
      finally
      {
        paramSessionInfo = finally;
        if (localCursor != null) {
          localCursor.close();
        }
        throw paramSessionInfo;
      }
    }
  }
  
  protected MessageRecord a(MessageRecord paramMessageRecord, int paramInt, boolean paramBoolean)
  {
    if (paramMessageRecord == null) {
      return null;
    }
    MessageRecord localMessageRecord = a(frienduin, istroop, uniseq);
    msgtype = paramInt;
    ContentValues localContentValues;
    if (localMessageRecord != null)
    {
      msgtype = paramInt;
      localContentValues = new ContentValues();
      localContentValues.put("msgtype", Integer.valueOf(paramInt));
      if (localMessageRecord == null) {
        break label180;
      }
      if (localMessageRecord.getId() <= 0L) {
        break label137;
      }
      a(frienduin, istroop, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
    }
    for (;;)
    {
      return localMessageRecord;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.w("Q.msg.MsgProxy", 2, "update : updateMessageType : set fail !");
      break;
      label137:
      a(frienduin, istroop, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(uniseq) }, null);
      continue;
      label180:
      if (paramMessageRecord.getId() > 0L) {
        a(frienduin, istroop, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(paramMessageRecord.getId()) }, null);
      }
    }
  }
  
  protected MessageRecord a(MessageRecord paramMessageRecord, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramMessageRecord == null) {
      return null;
    }
    MessageRecord localMessageRecord = a(frienduin, istroop, uniseq);
    isValid = paramBoolean1;
    ContentValues localContentValues;
    if (localMessageRecord != null)
    {
      isValid = paramBoolean1;
      localContentValues = new ContentValues();
      localContentValues.put("isValid", Boolean.valueOf(paramBoolean1));
      if (localMessageRecord == null) {
        break label196;
      }
      if (localMessageRecord.getId() <= 0L) {
        break label153;
      }
      a(frienduin, istroop, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
      label116:
      if ((localMessageRecord instanceof ChatMessage)) {
        ((ChatMessage)localMessageRecord).reParse();
      }
    }
    for (;;)
    {
      return localMessageRecord;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.w("Q.msg.MsgProxy", 2, "update : setMessageIsValidFlag : set fail !");
      break;
      label153:
      a(frienduin, istroop, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(uniseq) }, null);
      break label116;
      label196:
      if (paramMessageRecord.getId() > 0L) {
        a(frienduin, istroop, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(paramMessageRecord.getId()) }, null);
      }
    }
  }
  
  protected MessageRecord a(String paramString, int paramInt)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      paramString = d(paramString, paramInt);
      if ((paramString != null) && (!paramString.isEmpty()))
      {
        paramString = (MessageRecord)paramString.get(paramString.size() - 1);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.MsgProxy", 2, "getLastMsgFromList mr = " + paramString.getBaseInfoString());
        }
        return paramString;
      }
      return null;
    }
  }
  
  public MessageRecord a(String paramString, int paramInt, long paramLong)
  {
    MessageRecord localMessageRecord2 = null;
    if ((paramLong == 0L) || (paramString == null) || (paramString.length() == 0)) {
      return null;
    }
    Iterator localIterator = b(paramString, paramInt).iterator();
    MessageRecord localMessageRecord1;
    do
    {
      localMessageRecord1 = localMessageRecord2;
      if (!localIterator.hasNext()) {
        break;
      }
      localMessageRecord1 = (MessageRecord)localIterator.next();
    } while (uniseq != paramLong);
    if (localMessageRecord1 == null)
    {
      paramString = e(paramString, paramInt);
      if (paramString != null)
      {
        paramString = paramString.iterator();
        while (paramString.hasNext())
        {
          localMessageRecord2 = (MessageRecord)paramString.next();
          if (uniseq == paramLong) {
            return localMessageRecord2;
          }
        }
      }
    }
    return localMessageRecord1;
  }
  
  protected MessageRecord a(String paramString, int paramInt1, long paramLong, int paramInt2, int paramInt3)
  {
    MessageRecord localMessageRecord = a(paramString, paramInt1, paramLong);
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("extraflag", Integer.valueOf(paramInt2));
    localContentValues.put("sendFailCode", Integer.valueOf(paramInt3));
    if (localMessageRecord != null)
    {
      extraflag = paramInt2;
      sendFailCode = paramInt3;
      if (localMessageRecord.getId() > 0L) {
        a(paramString, paramInt1, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
      }
      for (;;)
      {
        if ((localMessageRecord instanceof ChatMessage)) {
          ((ChatMessage)localMessageRecord).reParse();
        }
        return localMessageRecord;
        a(paramString, paramInt1, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(uniseq) }, null);
      }
    }
    a(paramString, paramInt1, 3, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
    return localMessageRecord;
  }
  
  protected MessageRecord a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    MessageRecord localMessageRecord = a(paramString, paramInt, paramLong1);
    if (localMessageRecord != null)
    {
      time = paramLong2;
      int i = versionCode;
      if ((extraflag == 32772) || (extraflag == 32768))
      {
        extraflag = 0;
        sendFailCode = 0;
      }
      e(paramString, paramInt, paramLong1);
      a(paramString, paramInt, localMessageRecord);
      if (msgtype == 63531) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, frienduin, istroop, paramLong2);
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "update msgTime set msg =" + localMessageRecord.getBaseInfoString());
      }
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("time", Long.valueOf(paramLong2));
    if ((localMessageRecord != null) && (extraflag == 0))
    {
      localContentValues.put("extraflag", Integer.valueOf(0));
      localContentValues.put("sendFailCode", Integer.valueOf(0));
    }
    if (localMessageRecord != null)
    {
      if (localMessageRecord.getId() > 0L)
      {
        a(paramString, paramInt, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
        return localMessageRecord;
      }
      a(paramString, paramInt, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong1) }, null);
      return localMessageRecord;
    }
    a(paramString, paramInt, 3, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong1) }, null);
    return localMessageRecord;
  }
  
  protected MessageRecord a(String paramString, int paramInt, long paramLong1, long paramLong2, long paramLong3)
  {
    MessageRecord localMessageRecord = a(paramString, paramInt, paramLong1);
    if (localMessageRecord != null)
    {
      time = paramLong2;
      shmsgseq = paramLong3;
      e(paramString, paramInt, paramLong1);
      a(paramString, paramInt, localMessageRecord);
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("time", Long.valueOf(paramLong2));
    localContentValues.put("shmsgseq", Long.valueOf(paramLong3));
    if (localMessageRecord != null)
    {
      if (localMessageRecord.getId() > 0L)
      {
        a(paramString, paramInt, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
        return localMessageRecord;
      }
      a(paramString, paramInt, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong1) }, null);
      return localMessageRecord;
    }
    a(paramString, paramInt, 3, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong1) }, null);
    return localMessageRecord;
  }
  
  protected MessageRecord a(String paramString1, int paramInt, long paramLong, String paramString2)
  {
    if (paramString2 == null) {
      return null;
    }
    MessageRecord localMessageRecord = a(paramString1, paramInt, paramLong);
    ContentValues localContentValues = new ContentValues();
    if ((localMessageRecord == null) || (versionCode > 0)) {}
    try
    {
      localContentValues.put("msgData", paramString2.getBytes("UTF-8"));
      msg = paramString2;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "updateMsgContentByUniseq: set msg =" + localMessageRecord.getBaseInfoString());
      }
      if (localMessageRecord.getId() > 0L)
      {
        a(paramString1, paramInt, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
        label139:
        if ((localMessageRecord instanceof ChatMessage)) {
          ((ChatMessage)localMessageRecord).reParse();
        }
      }
      for (;;)
      {
        return localMessageRecord;
        localContentValues.put("msg", paramString2);
        break;
        a(paramString1, paramInt, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
        break label139;
        try
        {
          localContentValues.put("msgData", paramString2.getBytes("UTF-8"));
          a(paramString1, paramInt, 3, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
        }
        catch (UnsupportedEncodingException paramString2)
        {
          for (;;) {}
        }
      }
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;) {}
    }
  }
  
  protected MessageRecord a(String paramString1, int paramInt, long paramLong, String paramString2, Object paramObject)
  {
    MessageRecord localMessageRecord = a(paramString1, paramInt, paramLong);
    try
    {
      localObject = MessageRecord.class.getDeclaredField(paramString2);
      localClass = ((Field)localObject).getType();
      ((Field)localObject).setAccessible(true);
      if (localMessageRecord != null) {
        ((Field)localObject).set(localMessageRecord, paramObject);
      }
      if (Modifier.isStatic(((Field)localObject).getModifiers())) {
        break label476;
      }
      if (((Field)localObject).isAnnotationPresent(notColumn.class)) {
        return localMessageRecord;
      }
      localObject = new ContentValues();
      if (localClass != Long.TYPE) {
        break label189;
      }
      ((ContentValues)localObject).put(paramString2, (Long)paramObject);
    }
    catch (Exception paramString1)
    {
      Object localObject;
      for (;;)
      {
        Class localClass;
        paramString1.printStackTrace();
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.e("Q.msg.MsgProxy", 2, "updateMsgFieldByUniseq error! ", paramString1);
        return localMessageRecord;
        label189:
        if (localClass == Integer.TYPE)
        {
          ((ContentValues)localObject).put(paramString2, (Integer)paramObject);
        }
        else if (localClass == String.class)
        {
          ((ContentValues)localObject).put(paramString2, (String)paramObject);
        }
        else if (localClass == Byte.TYPE)
        {
          ((ContentValues)localObject).put(paramString2, (Byte)paramObject);
        }
        else if (localClass == [B.class)
        {
          ((ContentValues)localObject).put(paramString2, (byte[])paramObject);
        }
        else if (localClass == Short.TYPE)
        {
          ((ContentValues)localObject).put(paramString2, (Short)paramObject);
        }
        else if (localClass == Boolean.TYPE)
        {
          ((ContentValues)localObject).put(paramString2, (Boolean)paramObject);
        }
        else if (localClass == Float.TYPE)
        {
          ((ContentValues)localObject).put(paramString2, (Float)paramObject);
        }
        else if (localClass == Double.TYPE)
        {
          ((ContentValues)localObject).put(paramString2, (Double)paramObject);
        }
        else if (QLog.isColorLevel())
        {
          QLog.e("Q.msg.MsgProxy", 2, "updateMsgFieldByUniseq fieldType error! " + localClass.getClass().getSimpleName());
          continue;
          a(paramString1, paramInt, versionCode, (ContentValues)localObject, "uniseq=?", new String[] { String.valueOf(uniseq) }, null);
        }
      }
      a(paramString1, paramInt, 3, (ContentValues)localObject, "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
    }
    if (localMessageRecord != null) {
      if (localMessageRecord.getId() > 0L)
      {
        a(paramString1, paramInt, versionCode, (ContentValues)localObject, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
        if (!(localMessageRecord instanceof ChatMessage)) {
          break label476;
        }
        ((ChatMessage)localMessageRecord).reParse();
        return localMessageRecord;
      }
    }
    label476:
    return localMessageRecord;
  }
  
  protected MessageRecord a(String paramString1, int paramInt, long paramLong, String paramString2, String paramString3)
  {
    if (a(paramString1, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    paramString2 = String.format("select * from " + MessageRecord.getTableName(paramString1, paramInt) + " where time=%d and senderuin=%s", new Object[] { Long.valueOf(paramLong), paramString2 });
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMsgByConstraints: sql=" + paramString2 + ", peeruin = " + paramString1 + ", type = " + paramInt);
    }
    paramString1 = a().a(paramString2, null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (paramString1 != null)
    {
      paramString1 = paramString1.iterator();
      while (paramString1.hasNext())
      {
        paramString2 = (MessageRecord)paramString1.next();
        if (msg.equals(paramString3)) {
          return paramString2;
        }
      }
    }
    return null;
  }
  
  protected MessageRecord a(String paramString1, int paramInt1, long paramLong1, String paramString2, String paramString3, long paramLong2, int paramInt2)
  {
    MessageRecord localMessageRecord = a(paramString1, paramInt1, paramLong1);
    if (localMessageRecord != null)
    {
      paramString3 = TransfileUtile.b(msg, paramString2, paramString3, paramLong2, paramInt2);
      msg = paramString3;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "updateMsgContentToForward: set msg =" + localMessageRecord.getBaseInfoString());
      }
      paramString2 = new ContentValues();
      if ((versionCode <= 0) || (paramString3 == null)) {
        break label174;
      }
    }
    try
    {
      paramString2.put("msgData", paramString3.getBytes("UTF-8"));
      if (localMessageRecord.getId() > 0L) {
        a(paramString1, paramInt1, versionCode, paramString2, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
      }
      for (;;)
      {
        if ((localMessageRecord instanceof ChatMessage)) {
          ((ChatMessage)localMessageRecord).reParse();
        }
        return localMessageRecord;
        label174:
        paramString2.put("msg", paramString3);
        break;
        a(paramString1, paramInt1, versionCode, paramString2, "uniseq=?", new String[] { String.valueOf(uniseq) }, null);
      }
    }
    catch (UnsupportedEncodingException paramString3)
    {
      for (;;) {}
    }
  }
  
  protected MessageRecord a(String paramString, int paramInt, long paramLong, byte[] paramArrayOfByte)
  {
    MessageRecord localMessageRecord = a(paramString, paramInt, paramLong);
    ContentValues localContentValues = new ContentValues();
    if (paramArrayOfByte != null) {
      localContentValues.put("msgData", paramArrayOfByte);
    }
    if (localMessageRecord != null)
    {
      msgData = paramArrayOfByte;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "updateMsgContent: set msg =" + localMessageRecord.getBaseInfoString());
      }
      if (localMessageRecord.getId() > 0L) {
        a(paramString, paramInt, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(localMessageRecord.getId()) }, null);
      }
      for (;;)
      {
        if ((localMessageRecord instanceof ChatMessage)) {
          ((ChatMessage)localMessageRecord).reParse();
        }
        return localMessageRecord;
        a(paramString, paramInt, versionCode, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
      }
    }
    a(paramString, paramInt, 3, localContentValues, "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
    return localMessageRecord;
  }
  
  protected MessageRecord a(String paramString1, int paramInt, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryLastMsgForMessageTabFromDB, peerUin = " + paramString1 + ", type " + paramInt);
    }
    if (a(paramString1, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    if (a(paramInt))
    {
      localStringBuilder = new StringBuilder().append("select * from ").append(MessageRecord.getTableName(paramString1, paramInt)).append(" where isValid=1 and msgtype ").append(MsgProxyUtils.a()).append(" ");
      if (paramString2 != null) {}
      for (paramString1 = "and " + paramString2;; paramString1 = "")
      {
        paramString1 = paramString1 + " order by shmsgseq desc , _id desc limit 1";
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.MsgProxy", 2, "queryLastTABSupportMessageFromDB : sqlStr:" + paramString1);
        }
        paramString1 = a().a(paramString1, null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        if ((paramString1 != null) && (paramString1.size() >= 1)) {
          break;
        }
        return null;
      }
    }
    StringBuilder localStringBuilder = new StringBuilder().append("select * from ").append(MessageRecord.getTableName(paramString1, paramInt)).append(" where isValid=1 and msgtype ").append(MsgProxyUtils.a()).append(" ");
    if (paramString2 != null) {}
    for (paramString1 = "and " + paramString2;; paramString1 = "")
    {
      paramString1 = paramString1 + " order by time desc , _id desc limit 1";
      break;
    }
    return (MessageRecord)paramString1.get(0);
  }
  
  protected MessageRecordEntityManager a()
  {
    if ((jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager == null) || (!jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager.a())) {}
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if ((jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager == null) || (!jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager.a())) {
        jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager = ((MessageRecordEntityManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createMessageRecordEntityManager());
      }
      return jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager;
    }
  }
  
  protected String a(Cursor paramCursor, SessionInfo paramSessionInfo, int paramInt)
  {
    paramCursor.getString(paramCursor.getColumnIndex("senderuin"));
    if (MsgUtils.a(paramCursor.getInt(paramCursor.getColumnIndex("issend")))) {
      return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    }
    return jdField_a_of_type_JavaLangString;
  }
  
  protected String a(String paramString, int paramInt)
  {
    return MsgProxyUtils.a(paramString, paramInt);
  }
  
  protected List a(String paramString)
  {
    ArrayList localArrayList;
    synchronized (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a())
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a();
      localArrayList = new ArrayList();
      localObject = ((Vector)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        MsgQueueItem localMsgQueueItem = (MsgQueueItem)((Iterator)localObject).next();
        if ((jdField_a_of_type_ComTencentMobileqqPersistenceEntity instanceof MessageRecord))
        {
          MessageRecord localMessageRecord = (MessageRecord)jdField_a_of_type_ComTencentMobileqqPersistenceEntity;
          if ((TextUtils.equals(paramString, b)) && (i == 0)) {
            localArrayList.add(localMessageRecord);
          }
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, new Object[] { "getMsgListFromQueue tableName=", paramString, ", size=", Integer.valueOf(localArrayList.size()) });
    }
    return localArrayList;
  }
  
  public List a(String paramString, int paramInt)
  {
    return a(b(paramString, paramInt));
  }
  
  protected List a(String paramString, int paramInt1, int paramInt2)
  {
    if (a(paramString, paramInt1, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    Object localObject = String.format("select _id, extraflag, frienduin, isread, issend, istroop, msg, NULL as msgData, msgId, msgseq, msgtype, selfuin, senderuin, shmsgseq, time, 0 as versionCode, NULL as longMsgIndex, NULL as longMsgId, NULL as longMsgCount, 1 as isValid, NULL as msgUid, NULL as vipBubbleID, 0 as uniseq, 0 as sendFailCode, NULL as extStr, 0 as extInt, 0 as extLong from ( select _id, extraflag, frienduin, isread, issend, istroop, msg, NULL as msgData, msgId, msgseq, msgtype, selfuin, senderuin, shmsgseq, time, 0 as versionCode, NULL as longMsgIndex, NULL as longMsgId, NULL as longMsgCount, 1 as isValid, NULL as msgUid, NULL as vipBubbleID, 0 as uniseq, 0 as sendFailCode, NULL as extStr, 0 as extInt, 0 as extLong from " + MessageRecord.getOldTableName(paramString, paramInt1) + " order by _id desc limit " + paramInt2 + " ) order by _id asc", new Object[0]);
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromOldDB: sqlStr=" + (String)localObject + ", peeruin = " + paramString + ", type = " + paramInt1);
    }
    localObject = a().a((String)localObject, null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (localObject != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromOldDB: list size =" + ((List)localObject).size() + ", peeruin = " + paramString + ", type = " + paramInt1);
      }
      return localObject;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromOldDB: null list , peeruin = " + paramString + ", type = " + paramInt1);
    }
    return new ArrayList();
  }
  
  protected List a(String paramString, int paramInt1, int paramInt2, int[] paramArrayOfInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "getAllMessages uin " + paramString + " , type = " + paramInt1 + " , customTypes = " + Arrays.toString(paramArrayOfInt));
    }
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = e(paramString, paramInt1);
    if ((localObject1 == null) || (((List)localObject1).isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "getAllMessages from AIO CACHE FAIL！ ");
      }
      localObject1 = b(paramString, paramInt1);
    }
    for (;;)
    {
      long l3 = Long.MAX_VALUE;
      long l1 = Long.MAX_VALUE;
      HashSet localHashSet = new HashSet();
      int i;
      if ((paramArrayOfInt != null) && (paramArrayOfInt.length > 0))
      {
        i = 0;
        while (i < paramArrayOfInt.length)
        {
          localHashSet.add(Integer.valueOf(paramArrayOfInt[i]));
          i += 1;
        }
      }
      long l2;
      int j;
      long l5;
      long l4;
      if ((localObject1 != null) && (!((List)localObject1).isEmpty()))
      {
        if ((((List)localObject1).size() >= paramInt2) && (localHashSet.isEmpty()))
        {
          localArrayList.addAll(((List)localObject1).subList(((List)localObject1).size() - paramInt2, ((List)localObject1).size()));
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.MsgProxy", 2, "getAllMessages size = " + localArrayList.size());
          }
          return localArrayList;
        }
        Object localObject2 = ((List)localObject1).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
          if (shmsgseq < l3) {
            l3 = shmsgseq;
          }
        }
        localObject1 = ((List)localObject1).iterator();
        i = 3;
        l2 = Long.MAX_VALUE;
        while (((Iterator)localObject1).hasNext())
        {
          localObject2 = (MessageRecord)((Iterator)localObject1).next();
          if ((!a(paramInt1)) || (versionCode != 3) || (shmsgseq != l3) || (l3 == 0L))
          {
            if (!localHashSet.contains(Integer.valueOf(msgtype)))
            {
              j = i;
              l5 = l1;
              l4 = l2;
              if (!localHashSet.isEmpty()) {
                break label675;
              }
            }
            j = i;
            if (versionCode < i) {
              j = versionCode;
            }
            l4 = l2;
            if (((MessageRecord)localObject2).getId() > 0L)
            {
              l4 = l2;
              if (((MessageRecord)localObject2).getId() < l2) {
                l4 = ((MessageRecord)localObject2).getId();
              }
            }
            l5 = l1;
            if (time < l1) {
              l5 = time;
            }
            localArrayList.add(localObject2);
            if (localArrayList.size() < paramInt2) {
              break label675;
            }
            return localArrayList;
          }
        }
        l4 = l3;
        l3 = l1;
      }
      for (l1 = l4;; l1 = Long.MAX_VALUE)
      {
        if (a(paramInt1)) {
          localArrayList.addAll(0, a(paramString, paramInt1, l2, i, l1, paramInt2 - localArrayList.size(), paramArrayOfInt));
        }
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.MsgProxy", 2, "getAllMessages size = " + localArrayList.size());
          }
          return localArrayList;
          localArrayList.addAll(0, a(paramString, paramInt1, l2, i, l3, paramInt2 - localArrayList.size(), paramArrayOfInt));
        }
        label675:
        i = j;
        l1 = l5;
        l2 = l4;
        break;
        l3 = Long.MAX_VALUE;
        i = 3;
        l2 = Long.MAX_VALUE;
      }
    }
  }
  
  protected List a(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "getAIOMsgListAndJumpTo peerUin: " + paramString + " type: " + paramInt + " , from = " + paramLong);
    }
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      if (a(paramInt))
      {
        localList = c(paramString, paramInt, paramLong, 2147483647L);
        Object localObject1 = localList;
        if (localList == null) {
          localObject1 = new ArrayList();
        }
        MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().put(a(paramString, paramInt), localObject1);
        return localObject1;
      }
      List localList = d(paramString, paramInt, paramLong, 2147483647L);
    }
  }
  
  protected List a(String paramString1, int paramInt1, long paramLong1, int paramInt2, long paramLong2, int paramInt3, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryTimedMessageDBUnion, peerUin = " + paramString1 + ", type " + paramInt1 + ",_id = " + paramLong1 + ",versionCode = " + paramInt2 + ", from " + paramLong2 + ",count = " + paramInt3 + ",whrere = " + paramString2);
    }
    paramString2 = MessageDBUtils.a(MessageRecord.getOldTableName(paramString1, paramInt1), MessageRecord.getTableName(paramString1, paramInt1), paramLong1, paramInt2, paramLong2, paramInt3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(), paramString2);
    if (paramString2 != null)
    {
      if (a(paramString1, paramInt1, true)) {
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
      }
      paramString1 = a().a(paramString2.toString(), null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (QLog.isColorLevel()) {
        QLog.i("QQMessageFacade", 2, paramString2.toString());
      }
      if (paramString1 != null)
      {
        Collections.reverse(paramString1);
        paramString2 = paramString1.iterator();
        while (paramString2.hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)paramString2.next();
          if (QLog.isColorLevel()) {
            QLog.i("QQMessageFacade", 2, "queryTimedMessageDBUnion " + time + ", " + localMessageRecord.getId() + ", " + localMessageRecord.getLogColorContent());
          }
        }
        return paramString1;
      }
    }
    return new ArrayList();
  }
  
  public List a(String paramString, int paramInt1, long paramLong1, int paramInt2, long paramLong2, int paramInt3, int[] paramArrayOfInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryC2CMessageFromDB_UnionTables, peerUin = " + paramString + ", type " + paramInt1 + ",_id = " + paramLong1 + ",versionCode = " + paramInt2 + ", from " + paramLong2 + ",count = " + paramInt3 + ",customTypes = " + Arrays.toString(paramArrayOfInt));
    }
    Object localObject2 = null;
    if (a(paramString, paramInt1, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c();
    }
    Object localObject1 = localObject2;
    if (paramArrayOfInt != null)
    {
      localObject1 = localObject2;
      if (paramArrayOfInt.length > 0)
      {
        localObject1 = new StringBuilder(" and msgtype in ( ");
        int i = 0;
        while (i < paramArrayOfInt.length)
        {
          ((StringBuilder)localObject1).append(paramArrayOfInt[i]);
          if (i < paramArrayOfInt.length - 1) {
            ((StringBuilder)localObject1).append(" , ");
          }
          i += 1;
        }
        ((StringBuilder)localObject1).append(") ");
        localObject1 = ((StringBuilder)localObject1).toString();
      }
    }
    paramArrayOfInt = a(paramString, paramInt1, paramLong1, paramInt2, paramLong2, paramInt3, (String)localObject1);
    paramString = paramArrayOfInt;
    if (paramArrayOfInt == null) {
      paramString = new ArrayList();
    }
    return paramString;
  }
  
  protected List a(String paramString1, int paramInt1, long paramLong, int paramInt2, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageByTimeOrSeq:uin=" + paramString1 + ",type=" + paramInt1 + ",seq=" + paramLong + ",count=" + paramInt2);
    }
    if (a(paramString1, paramInt1, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c();
    }
    boolean bool = a(paramInt1);
    if (MessageDBUtils.a(MessageRecord.getTableName(paramString1, paramInt1), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b()))
    {
      if (bool) {}
      for (paramString1 = b(paramString1, paramInt1, paramLong, paramInt2, paramString2); paramString1 != null; paramString1 = c(paramString1, paramInt1, paramLong, paramInt2, paramString2)) {
        return paramString1;
      }
    }
    return new ArrayList();
  }
  
  protected List a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    if ((paramLong1 == 0L) || (paramLong2 == 0L) || (paramString == null) || (paramString.length() == 0)) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    Object localObject = c(paramString, paramInt);
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
        if ((shmsgseq == paramLong1) && (msgUid == paramLong2)) {
          localArrayList.add(localMessageRecord);
        }
      }
    }
    if (localArrayList.isEmpty())
    {
      paramString = e(paramString, paramInt, paramLong1, paramLong2);
      if ((paramString != null) && (!paramString.isEmpty())) {
        localArrayList.addAll(paramString);
      }
    }
    return localArrayList;
  }
  
  public List a(String paramString, int paramInt, long paramLong, Map paramMap)
  {
    Object localObject1 = paramMap;
    if (paramMap == null) {
      localObject1 = new HashMap();
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "querySameSeqMessageWithFilter,  peerUin = " + paramString + ", type " + paramInt + ", seq = " + paramLong + ", filterMsgSet.size = " + ((Map)localObject1).size() + ",filterMsgSet = " + ((Map)localObject1).keySet());
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where shmsgseq=?";
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "querySameSeqMessageWithFilter " + paramString);
    }
    paramMap = a();
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    paramMap = paramMap.a(paramString, new String[] { String.valueOf(paramLong) }, (QQAppInterface)localObject2);
    if (paramMap == null) {
      return new ArrayList();
    }
    paramString = new ArrayList();
    paramMap = paramMap.iterator();
    while (paramMap.hasNext())
    {
      localObject2 = (MessageRecord)paramMap.next();
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "filter msg , seq = " + shmsgseq + " ,id = " + ((MessageRecord)localObject2).getId() + ",uniseq=" + uniseq);
      }
      if ((!((Map)localObject1).containsKey("id&" + ((MessageRecord)localObject2).getId() + "&" + shmsgseq)) && (!((Map)localObject1).containsKey("uniseq&" + uniseq + "&" + shmsgseq))) {
        paramString.add(localObject2);
      }
    }
    return paramString;
  }
  
  protected List a(String paramString, int paramInt, List paramList)
  {
    if ((paramList == null) || (paramString == null) || (paramString.length() == 0) || (paramList.size() == 0)) {
      return new ArrayList();
    }
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    for (;;)
    {
      MessageRecord localMessageRecord;
      if (i < paramList.size())
      {
        localMessageRecord = a(paramString, paramInt, ((Long)paramList.get(i)).longValue());
        if (localMessageRecord != null) {}
      }
      else
      {
        if (i < paramList.size() - 1) {
          localArrayList.addAll(b(paramString, paramInt, paramList.subList(i, paramList.size())));
        }
        return localArrayList;
      }
      localArrayList.add(localMessageRecord);
      i += 1;
    }
  }
  
  protected List a(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "getAIOMsgList peerUin: " + paramString + " type: " + paramInt + " , autoInit = " + paramBoolean1);
    }
    label488:
    label501:
    label514:
    label557:
    label598:
    for (;;)
    {
      Object localObject2;
      synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
      {
        localObject1 = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().get(a(paramString, paramInt));
        if ((localObject1 != null) && (!((List)localObject1).isEmpty())) {
          break label557;
        }
        if (!paramBoolean1) {
          break label514;
        }
        localObject2 = d(paramString, paramInt);
        if ((localObject2 == null) || (((List)localObject2).isEmpty())) {
          break label501;
        }
        localObject1 = new ArrayList();
        if ((paramInt != 0) && (paramInt != 1000) && (paramInt != 1004)) {
          break label488;
        }
        if (((List)localObject2).size() > 15)
        {
          ((List)localObject1).addAll(((List)localObject2).subList(((List)localObject2).size() - 15, ((List)localObject2).size()));
          if ((((List)localObject2).size() > 15) && (MsgProxyUtils.a(paramString, paramInt, (List)localObject1)))
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.MsgProxy", 2, "getAIOMsgList : pull more long msg");
            }
            ((List)localObject1).clear();
            if (((List)localObject2).size() > 30) {
              ((List)localObject1).addAll(((List)localObject2).subList(((List)localObject2).size() - 30, ((List)localObject2).size()));
            }
          }
          else
          {
            localObject2 = a((List)localObject1, ((Long)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString).first).longValue());
            if ((localObject2 == null) || (((List)localObject2).isEmpty())) {
              break label598;
            }
            localObject1 = localObject2;
            localObject2 = localObject1;
            if (localObject1 == null) {
              localObject2 = new ArrayList();
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.MsgProxy", 2, "continuedList :" + ((List)localObject2).size());
            }
            MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().put(a(paramString, paramInt), localObject2);
            return (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().get(a(paramString, paramInt));
          }
        }
        else
        {
          ((List)localObject1).addAll((Collection)localObject2);
        }
      }
      ((List)localObject1).addAll((Collection)localObject2);
      continue;
      ((List)localObject1).addAll((Collection)localObject2);
      continue;
      Object localObject1 = a(paramString, paramInt, 15);
      continue;
      MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().remove(a(paramString, paramInt));
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "MsgPool.getPoolInstance().getAioMsgPool().remove :");
      }
      return null;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "getAIOMsgList from aiopool size = " + ((List)localObject1).size());
      }
    }
  }
  
  protected void a() {}
  
  protected void a(SessionInfo paramSessionInfo, String paramString, int paramInt, Set paramSet)
  {
    paramSet.add(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    paramSet.add(jdField_a_of_type_JavaLangString);
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString, ProxyListener paramProxyListener)
  {
    if (paramInt2 > 0)
    {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString1, paramInt1, MessageRecord.getTableName(paramString1, paramInt1), paramContentValues, paramString2, paramArrayOfString, 1, paramProxyListener);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString1, paramInt1, MessageRecord.getOldTableName(paramString1, paramInt1), paramContentValues, paramString2, paramArrayOfString, 1, paramProxyListener);
  }
  
  protected void a(String paramString, int paramInt, long paramLong)
  {
    b(paramString, paramInt, paramLong);
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("isread", Boolean.valueOf(true));
    if (a(paramInt)) {}
    String str2;
    String str3;
    for (String str1 = "shmsgseq";; str1 = "time")
    {
      str2 = String.valueOf(paramLong);
      str3 = MessageRecord.getTableName(paramString, paramInt);
      if ((!MsgProxyUtils.a(paramInt)) || (MsgProxyUtils.d() == null)) {
        break;
      }
      a(paramString, paramInt, str3, localContentValues, String.format("isread=? and %s<=? and " + MsgProxyUtils.d(), new Object[] { str1 }), new String[] { "0", str2 }, null);
      return;
    }
    a(paramString, paramInt, str3, localContentValues, String.format("isread=? and %s<=?", new Object[] { str1 }), new String[] { "0", str2 }, null);
  }
  
  public void a(String paramString, int paramInt, long paramLong, List paramList)
  {
    int j = 0;
    Object localObject2 = a(paramString, paramInt);
    for (;;)
    {
      synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
      {
        if (!MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().containsKey(localObject2)) {
          break label360;
        }
        localObject2 = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(localObject2);
        i = 0;
        if (i >= ((List)localObject2).size()) {
          break label364;
        }
        Object localObject3 = (MessageRecord)((List)localObject2).get(i);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.MsgProxy", 2, "find cache " + ((MessageRecord)localObject3).getBaseInfoString());
        }
        if (uniseq != paramLong) {
          break label370;
        }
        if ((i > 0) && (i < ((List)localObject2).size()))
        {
          localObject3 = new ArrayList();
          if (j < i)
          {
            MessageRecord localMessageRecord = (MessageRecord)((List)localObject2).get(j);
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.MsgProxy", 2, "removeList " + localMessageRecord.getBaseInfoString());
            }
            ((List)localObject3).add(localMessageRecord);
            j += 1;
            continue;
          }
          ((List)localObject2).removeAll((Collection)localObject3);
          ((List)localObject3).clear();
          ((List)localObject2).addAll(0, paramList);
          if (((List)localObject2).size() > 40)
          {
            i = ((List)localObject2).size() - 40;
            if (i > 0)
            {
              ((List)localObject2).remove(0);
              i -= 1;
              continue;
            }
          }
        }
        else
        {
          if (i != 0) {
            continue;
          }
          ((List)localObject2).addAll(0, paramList);
        }
      }
      b(paramString, paramInt, (List)localObject2);
      label360:
      return;
      label364:
      int i = 0;
      continue;
      label370:
      i += 1;
    }
  }
  
  protected void a(String paramString, int paramInt, QQMessageFacade.Message paramMessage)
  {
    a(paramString, paramInt, paramMessage);
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("isread", Boolean.valueOf(true));
    String str;
    if ((paramInt == 1001) && (msgtype != 64533) && (msgtype != 64505) && (msgtype != 64504) && (msgtype != 201)) {
      if (versionCode > 0)
      {
        str = MessageRecord.getTableName(String.valueOf(AppConstants.aq), 1001);
        a(paramString, paramInt, str, localContentValues, "senderuin=? and isread=?", new String[] { paramString, "0" }, null);
      }
    }
    for (;;)
    {
      a(paramString, paramInt, versionCode, localContentValues, "isread=?", new String[] { "0" }, null);
      return;
      str = MessageRecord.getOldTableName(String.valueOf(AppConstants.aq), 1001);
      break;
      if (paramInt == 1009) {
        a(paramString, paramInt, MessageRecord.getTableName(AppConstants.af, 1009), localContentValues, "senderuin=? and isread=?", new String[] { paramString, "0" }, null);
      } else if (paramInt == 1010) {
        a(paramString, paramInt, MessageRecord.getTableName(AppConstants.aG, 1010), localContentValues, "senderuin=? and isread=?", new String[] { paramString, "0" }, null);
      }
    }
  }
  
  protected void a(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      List localList = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(a(paramString, paramInt));
      if (localList != null)
      {
        MsgProxyUtils.a(localList, paramMessageRecord, true);
        if (localList.size() > 40) {
          localList.remove(0);
        }
        b(paramString, paramInt, localList);
      }
      return;
    }
  }
  
  protected void a(String paramString, int paramInt, MessageRecord paramMessageRecord, ProxyListener paramProxyListener)
  {
    if (versionCode > 0) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), paramMessageRecord, 0, paramProxyListener);
    }
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c();
  }
  
  protected void a(String paramString, int paramInt, MessageRecord paramMessageRecord, ProxyListener paramProxyListener, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((MsgProxyUtils.k(msgtype)) && (!MsgProxyUtils.a(frienduin, istroop))) {}
    while (!paramBoolean2) {
      return;
    }
    if (paramBoolean1)
    {
      a(paramString, paramInt, paramMessageRecord, paramProxyListener);
      return;
    }
    a(paramString, paramInt, paramMessageRecord, paramProxyListener);
  }
  
  public void a(String paramString, int paramInt, MessageRecord paramMessageRecord, ProxyListener paramProxyListener, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    a(paramString, paramInt, paramMessageRecord, paramBoolean3);
    a(paramString, paramInt, paramMessageRecord, paramProxyListener, paramBoolean1, paramBoolean2);
  }
  
  protected void a(String paramString, int paramInt, MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "insertToList " + paramMessageRecord.getBaseInfoString());
    }
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      Object localObject1;
      for (;;)
      {
        localObject1 = d(paramString, paramInt);
        Object localObject2 = a(paramString, paramInt);
        MsgProxyUtils.a((List)localObject1, paramMessageRecord, true);
        if ((((List)localObject1).size() > 40) && (!MsgProxyUtils.a(paramString))) {
          ((List)localObject1).remove(0);
        }
        if ((MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().containsKey(localObject2)) && (paramBoolean))
        {
          localObject2 = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().get(localObject2);
          localObject1 = localObject2;
          if (localObject2 == null) {
            localObject1 = new ArrayList();
          }
          if (!paramString.equals(AppConstants.ap)) {
            break;
          }
          ((List)localObject1).add(0, paramMessageRecord);
        }
        return;
        QLog.d("Q.msg.MsgProxy", 1, "insertToList " + paramMessageRecord.getUserLogString());
      }
      ((List)localObject1).add(paramMessageRecord);
    }
  }
  
  protected void a(String paramString, int paramInt, Entity paramEntity, ProxyListener paramProxyListener)
  {
    if (((paramEntity instanceof MessageRecord)) && (versionCode > 0)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), paramEntity, 0, paramProxyListener);
    }
  }
  
  protected void a(String paramString1, int paramInt, String paramString2, ContentValues paramContentValues, String paramString3, String[] paramArrayOfString, ProxyListener paramProxyListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString1, paramInt, paramString2, paramContentValues, paramString3, paramArrayOfString, 1, paramProxyListener);
  }
  
  protected void a(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    List localList;
    ArrayList localArrayList;
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString1, paramInt))
    {
      localList = d(paramString1, paramInt);
      localArrayList = new ArrayList();
      if (localList != null)
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
          if ((senderuin != null) && (selfuin != null) && (senderuin.equals(paramString2)) && (selfuin.equals(paramString3))) {
            localArrayList.add(localMessageRecord);
          }
        }
      }
    }
    localList.removeAll(localArrayList);
    localArrayList.clear();
    a(paramString1, paramInt, MessageRecord.getTableName(paramString1, paramInt), "senderuin=? and selfuin=?", new String[] { paramString2, paramString3 }, null);
  }
  
  protected void a(String paramString1, int paramInt, String paramString2, String paramString3, String[] paramArrayOfString, ProxyListener paramProxyListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString1, paramInt, paramString2, paramString3, paramArrayOfString, 2, paramProxyListener);
  }
  
  public void a(String paramString, int paramInt, List paramList)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      if (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().containsKey(a(paramString, paramInt)))
      {
        List localList = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().get(a(paramString, paramInt));
        paramString = localList;
        if (localList == null) {
          paramString = new ArrayList();
        }
        localList = MsgProxyUtils.a(paramString, paramList);
        paramString.addAll(0, localList);
        paramList.clear();
        paramList.addAll(localList);
      }
      return;
    }
  }
  
  public void a(List paramList, ProxyListener paramProxyListener)
  {
    b(MsgProxyUtils.a(paramList), paramProxyListener);
  }
  
  protected boolean a(int paramInt, long paramLong, MessageRecord paramMessageRecord)
  {
    if (a(paramInt)) {
      if (paramLong < shmsgseq) {}
    }
    while (paramLong >= time)
    {
      return true;
      return false;
    }
    return false;
  }
  
  boolean a(String paramString, int paramInt)
  {
    return (paramString.length() >= 6) && ((paramInt == 0) || (a(paramInt)));
  }
  
  public boolean a(String paramString, int paramInt, boolean paramBoolean)
  {
    if (paramString == null) {
      return false;
    }
    for (;;)
    {
      int i;
      synchronized (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a())
      {
        Vector localVector2 = jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a();
        i = 0;
        if (i < localVector2.size())
        {
          MsgQueueItem localMsgQueueItem = (MsgQueueItem)localVector2.get(i);
          if ((MsgProxyUtils.a(jdField_a_of_type_JavaLangString, paramString, h, paramInt)) && ((i == 1) || (i == 2) || ((paramBoolean) && (i == 0))))
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.MsgProxy", 2, new Object[] { "needTransSaveToDatabase uin=", paramString, ", type=", LargerInteger.valueOf(paramInt), ", hasInsertAction=", Boolean.valueOf(paramBoolean), ",result=true" });
            }
            return true;
          }
        }
        else
        {
          return false;
        }
      }
      i += 1;
    }
  }
  
  protected boolean a(String paramString, boolean paramBoolean)
  {
    if (paramString == null) {
      return false;
    }
    synchronized (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a())
    {
      Iterator localIterator = jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a().iterator();
      while (localIterator.hasNext())
      {
        MsgQueueItem localMsgQueueItem = (MsgQueueItem)localIterator.next();
        if (TextUtils.isEmpty(b)) {
          return true;
        }
        if ((paramString.equals(b)) && ((i == 1) || (i == 2) || ((paramBoolean) && (i == 0))))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.MsgProxy", 2, new Object[] { "needTransSaveToDatabase tableName=", paramString, ", hasInsertAction=", Boolean.valueOf(paramBoolean), ",result=true" });
          }
          return true;
        }
      }
      return false;
    }
  }
  
  protected int b(String paramString, int paramInt, long paramLong)
  {
    int i = 0;
    if (paramString == null) {
      return 0;
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a())
      {
        Iterator localIterator = jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a().iterator();
        if (localIterator.hasNext())
        {
          MsgQueueItem localMsgQueueItem = (MsgQueueItem)localIterator.next();
          if ((jdField_a_of_type_ComTencentMobileqqPersistenceEntity instanceof MessageRecord))
          {
            MessageRecord localMessageRecord = (MessageRecord)jdField_a_of_type_ComTencentMobileqqPersistenceEntity;
            if ((MsgProxyUtils.a(frienduin, paramString, istroop, paramInt)) && (i == 0) && (time > paramLong) && (!isread) && (!localMessageRecord.isSend())) {
              i += 1;
            }
          }
        }
        else
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.MsgProxy", 2, new Object[] { "getUnreadCountFromQueue uin=", paramString, ", type=", Integer.valueOf(paramInt), ", lastRead=", Integer.valueOf(i) });
          }
          return i;
        }
      }
    }
  }
  
  @Deprecated
  public Cursor b(String paramString, int paramInt)
  {
    return a(a(b(paramString, paramInt)));
  }
  
  protected MessageRecord b(String paramString, int paramInt, long paramLong)
  {
    Object localObject2;
    if ((paramLong == 0L) || (paramString == null) || (paramString.length() == 0))
    {
      localObject2 = null;
      return localObject2;
    }
    Object localObject1 = c(paramString, paramInt);
    if (localObject1 != null)
    {
      localObject2 = ((List)localObject1).iterator();
      do
      {
        if (!((Iterator)localObject2).hasNext()) {
          break;
        }
        localObject1 = (MessageRecord)((Iterator)localObject2).next();
      } while (uniseq != paramLong);
    }
    for (;;)
    {
      localObject2 = localObject1;
      if (localObject1 != null) {
        break;
      }
      paramString = c(paramString, paramInt, paramLong);
      localObject2 = localObject1;
      if (paramString == null) {
        break;
      }
      localObject2 = localObject1;
      if (paramString.isEmpty()) {
        break;
      }
      return (MessageRecord)paramString.get(0);
      localObject1 = null;
    }
  }
  
  protected String b(String paramString, int paramInt)
  {
    if (MsgProxyUtils.a(paramString)) {
      return "select * from " + MessageRecord.getTableName(paramString, paramInt) + " order by time desc , _id desc";
    }
    if (MsgProxyUtils.c(paramInt)) {
      return "select * from " + MessageRecord.getTableName(paramString, paramInt) + " order by time desc , _id desc limit " + 40;
    }
    return "select * from " + MessageRecord.getTableName(paramString, paramInt) + " order by _id desc limit " + 40;
  }
  
  public List b(String paramString, int paramInt)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      paramString = d(paramString, paramInt);
      if (paramString != null)
      {
        paramString = (List)((ArrayList)paramString).clone();
        return paramString;
      }
      return paramString;
    }
  }
  
  protected List b(String paramString, int paramInt1, int paramInt2)
  {
    if (a(paramString, paramInt1, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    Object localObject = String.format("select * from " + MessageRecord.getTableName(paramString, paramInt1) + " where isValid=1 and msgtype != ? order by shmsgseq desc , _id desc limit ?", new Object[0]);
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryValidMessageBySeq: sql=" + (String)localObject + ", peeruin = " + paramString + ", type = " + paramInt1);
    }
    MessageRecordEntityManager localMessageRecordEntityManager = a();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    localObject = localMessageRecordEntityManager.a((String)localObject, new String[] { String.valueOf(63530), String.valueOf(paramInt2) }, localQQAppInterface);
    if (localObject != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryValidMessageBySeq: list size =" + ((List)localObject).size() + ", peeruin = " + paramString + ", type = " + paramInt1);
      }
      return localObject;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryValidMessageBySeq: null list , peeruin = " + paramString + ", type = " + paramInt1);
    }
    return new ArrayList();
  }
  
  protected List b(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessagesByMsgUidFromDB, peerUin[" + FileManagerUtil.e(paramString) + "] type[" + paramInt + "] msgUid[" + paramLong + "]");
    }
    if ((paramLong == 0L) && (QLog.isColorLevel())) {
      QLog.e("Q.msg.MsgProxy", 2, "queryMessagesByMsgUidFromDB Warning! msgUid==0");
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where msguid=?";
    MessageRecordEntityManager localMessageRecordEntityManager = a();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    paramString = localMessageRecordEntityManager.a(paramString, new String[] { String.valueOf(paramLong) }, localQQAppInterface);
    if (paramString != null) {
      return paramString;
    }
    return new ArrayList();
  }
  
  protected List b(String paramString1, int paramInt1, long paramLong, int paramInt2, String paramString2)
  {
    if (a(paramString1, paramInt1, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    Object localObject = "select * from " + MessageRecord.getTableName(paramString1, paramInt1) + " where shmsgseq<=? and shmsgseq>? %s order by shmsgseq asc";
    long l;
    if (paramString2 == null)
    {
      paramString2 = "";
      paramString2 = String.format((String)localObject, new Object[] { paramString2 });
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryMessageBySeq: sql=" + paramString2 + ", peeruin = " + paramString1 + ", type = " + paramInt1);
      }
      if (paramInt2 > 0) {
        break label274;
      }
      l = 0L;
    }
    for (;;)
    {
      localObject = a();
      QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      paramString2 = ((MessageRecordEntityManager)localObject).a(paramString2, new String[] { String.valueOf(paramLong), String.valueOf(l) }, localQQAppInterface);
      if (paramString2 == null) {
        break label298;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryMessageBySeq: list size =" + paramString2.size() + ", peeruin = " + paramString1 + ", type = " + paramInt1);
      }
      return paramString2;
      paramString2 = "and " + paramString2;
      break;
      label274:
      if (paramLong > paramInt2) {
        l = paramLong - paramInt2;
      } else {
        l = 0L;
      }
    }
    label298:
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageBySeq: null list , peeruin = " + paramString1 + ", type = " + paramInt1);
    }
    return new ArrayList();
  }
  
  public List b(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromBySeq, peerUin = " + paramString + ", type " + paramInt + ",beginSeq = " + paramLong1 + ",endSeq = " + paramLong2);
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where shmsgseq>=? and shmsgseq<=? order by shmsgseq asc";
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromBySeq " + paramString);
    }
    Object localObject = a();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    localObject = ((MessageRecordEntityManager)localObject).a(paramString, new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) }, localQQAppInterface);
    paramString = (String)localObject;
    if (localObject == null) {
      paramString = new ArrayList();
    }
    return paramString;
  }
  
  protected List b(String paramString, int paramInt, List paramList)
  {
    int j = 0;
    Object localObject;
    int i;
    if (QLog.isColorLevel())
    {
      localObject = new StringBuilder().append("queryMessagesByMsgUniseqFromDB, peerUin[").append(FileManagerUtil.e(paramString)).append("] type[").append(paramInt).append("] uniseqList[");
      if (paramList == null)
      {
        i = 0;
        QLog.d("Q.msg.MsgProxy", 2, i + "]");
      }
    }
    else
    {
      if ((paramList != null) && (paramList.size() != 0)) {
        break label125;
      }
      if (QLog.isColorLevel()) {
        QLog.e("Q.msg.MsgProxy", 2, "queryMessagesByMsgUniseqFromDB Warning! uniseq==0");
      }
      paramString = new ArrayList();
    }
    label125:
    do
    {
      return paramString;
      i = paramList.size();
      break;
      if (a(paramString, paramInt, true)) {
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
      }
      localObject = new String[paramList.size()];
      StringBuilder localStringBuilder = new StringBuilder("(");
      i = j;
      while (i < paramList.size())
      {
        localObject[i] = String.valueOf(((Long)paramList.get(i)).longValue());
        localStringBuilder.append("?");
        if (i < paramList.size() - 1) {
          localStringBuilder.append(",");
        }
        i += 1;
      }
      localStringBuilder.append(")");
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxy", 2, "queryMessagesByMsgUniseqFromDB, uniseq list=" + localStringBuilder.toString());
      }
      paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where uniseq in " + localStringBuilder.toString();
      paramList = a().a(paramString, (String[])localObject, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      paramString = paramList;
    } while (paramList != null);
    return new ArrayList();
  }
  
  public void b()
  {
    if ((jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager != null) && (jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager.a())) {
      jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager.a();
    }
  }
  
  protected void b(String paramString, int paramInt, long paramLong)
  {
    Object localObject2;
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      localObject2 = d(paramString, paramInt);
      if ((localObject2 == null) || (((List)localObject2).isEmpty())) {
        return;
      }
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
        if ((!isread) && (a(paramInt, paramLong, localMessageRecord)) && ((!MsgProxyUtils.a(paramInt)) || (!MsgProxyUtils.j(msgtype)))) {
          isread = true;
        }
      }
    }
    paramString = f(paramString, paramInt);
    if ((paramString == null) || (paramString.isEmpty())) {
      return;
    }
    paramString = paramString.iterator();
    while (paramString.hasNext())
    {
      localObject2 = (MessageRecord)paramString.next();
      if ((!isread) && (a(paramInt, paramLong, (MessageRecord)localObject2)) && ((!MsgProxyUtils.a(paramInt)) || (!MsgProxyUtils.j(msgtype)))) {
        isread = true;
      }
    }
  }
  
  protected void b(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    if ((paramMessageRecord == null) || (uniseq != 0L)) {}
    do
    {
      return;
      if (paramMessageRecord.getId() > 0L)
      {
        paramMessageRecord.createMessageUniseq();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("uniseq", Long.valueOf(uniseq));
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.MsgProxy", 2, "updateUniseqByID: set msg =" + paramMessageRecord.getBaseInfoString());
        }
        a(paramString, paramInt, versionCode, localContentValues, "_id=?", new String[] { String.valueOf(paramMessageRecord.getId()) }, null);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.w("Q.msg.MsgProxy", 2, "updateUniseqByID ERROR: _id<0 !");
  }
  
  protected int c(String paramString, int paramInt, long paramLong)
  {
    MessageRecord localMessageRecord = d(paramString, paramInt, paramLong);
    Object localObject;
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder().append("--->removeSingleMsg : peerUin:").append(paramString).append(" type:").append(paramInt).append(" uniseq:").append(paramLong).append(" mr:").append(localMessageRecord).append(" dbid:");
      if (localMessageRecord != null)
      {
        localObject = Long.valueOf(localMessageRecord.getId());
        QLog.d("Q.msg.MsgProxy", 2, localObject);
      }
    }
    else
    {
      if (localMessageRecord == null) {
        break label213;
      }
      long l = localMessageRecord.getId();
      if (l == -1L) {
        break label182;
      }
      a(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), "_id=?", new String[] { String.valueOf(l) }, null);
    }
    for (;;)
    {
      a(frienduin, istroop);
      if (!isread) {
        break label211;
      }
      return 1;
      localObject = "mr is null.";
      break;
      label182:
      a(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
    }
    label211:
    return 2;
    label213:
    a(paramString, paramInt, MessageRecord.getTableName(paramString, paramInt), "uniseq=?", new String[] { String.valueOf(paramLong) }, null);
    return 1;
  }
  
  protected MessageRecord c(String paramString, int paramInt, long paramLong)
  {
    if ((paramLong == 0L) || (paramString == null) || (paramString.length() == 0)) {
      return null;
    }
    Object localObject = c(paramString, paramInt);
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
        if ((shmsgseq == paramLong) && (!MsgProxyUtils.q(msgtype))) {
          return localMessageRecord;
        }
      }
    }
    return f(paramString, paramInt, paramLong);
  }
  
  protected List c(String paramString, int paramInt)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      paramString = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(a(paramString, paramInt));
      if (paramString != null)
      {
        paramString = (List)((ArrayList)paramString).clone();
        return paramString;
      }
      return paramString;
    }
  }
  
  protected List c(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessagesByMsgUniseqFromDB, peerUin[" + FileManagerUtil.e(paramString) + "] type[" + paramInt + "] uniseq[" + paramLong + "]");
    }
    if (paramLong == 0L)
    {
      if (QLog.isColorLevel()) {
        QLog.e("Q.msg.MsgProxy", 2, "queryMessagesByMsgUniseqFromDB Warning! uniseq==0");
      }
      paramString = new ArrayList();
    }
    Object localObject;
    do
    {
      return paramString;
      if (a(paramString, paramInt, true)) {
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
      }
      paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where uniseq=?";
      localObject = a();
      QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      localObject = ((MessageRecordEntityManager)localObject).a(paramString, new String[] { String.valueOf(paramLong) }, localQQAppInterface);
      paramString = (String)localObject;
    } while (localObject != null);
    return new ArrayList();
  }
  
  public List c(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromSeqRange, peerUin = " + paramString + ", type " + paramInt + ",beginSeq = " + paramLong1 + ",endSeq = " + paramLong2);
    }
    Object localObject1 = b(paramString, paramInt);
    ArrayList localArrayList = new ArrayList();
    if ((localObject1 != null) && (((List)localObject1).size() > 0))
    {
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (MessageRecord)((Iterator)localObject1).next();
        if ((shmsgseq >= paramLong1) && (shmsgseq <= paramLong2)) {
          localArrayList.add(localObject2);
        }
      }
    }
    if ((localArrayList.size() > 0) && (get0shmsgseq == paramLong1)) {
      return localArrayList;
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    localObject1 = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where shmsgseq>=? and shmsgseq<=? order by shmsgseq asc";
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromBySeq " + (String)localObject1);
    }
    if (localArrayList.size() > 0) {
      paramLong2 = get0shmsgseq;
    }
    paramLong1 = Math.min(paramLong1, paramLong2);
    if (localArrayList != null)
    {
      localObject2 = localArrayList.iterator();
      do
      {
        for (;;)
        {
          if (!((Iterator)localObject2).hasNext()) {
            break label379;
          }
          localObject3 = (MessageRecord)((Iterator)localObject2).next();
          if (shmsgseq != paramLong2) {
            break;
          }
          ((Iterator)localObject2).remove();
        }
      } while (shmsgseq <= paramLong2);
    }
    label379:
    Object localObject2 = a();
    Object localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    localObject1 = ((MessageRecordEntityManager)localObject2).a((String)localObject1, new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) }, (QQAppInterface)localObject3);
    if (QLog.isColorLevel())
    {
      paramString = new StringBuilder().append("queryMessageFromTimeRange, peerUin = ").append(paramString).append(", type ").append(paramInt).append(",queryBeginSeq = ").append(paramLong1).append(",queryEndSeq = ").append(paramLong2).append(",resultSize=");
      if (localObject1 != null) {
        break label522;
      }
    }
    label522:
    for (paramInt = 0;; paramInt = ((List)localObject1).size())
    {
      QLog.d("Q.msg.MsgProxy", 2, paramInt);
      if (localObject1 != null) {
        localArrayList.addAll(0, (Collection)localObject1);
      }
      return localArrayList;
    }
  }
  
  /* Error */
  protected List c(String paramString, int paramInt, List paramList)
  {
    // Byte code:
    //   0: aload_3
    //   1: astore 4
    //   3: aload_3
    //   4: invokeinterface 64 1 0
    //   9: bipush 50
    //   11: if_icmple +14 -> 25
    //   14: aload_3
    //   15: iconst_0
    //   16: bipush 50
    //   18: invokeinterface 987 3 0
    //   23: astore 4
    //   25: aload_1
    //   26: iload_2
    //   27: invokestatic 337	com/tencent/mobileqq/data/MessageRecord:getTableName	(Ljava/lang/String;I)Ljava/lang/String;
    //   30: astore_1
    //   31: iconst_1
    //   32: anewarray 141	java/lang/String
    //   35: astore_3
    //   36: new 86	java/util/ArrayList
    //   39: dup
    //   40: invokespecial 87	java/util/ArrayList:<init>	()V
    //   43: astore 5
    //   45: aload 4
    //   47: invokeinterface 95 1 0
    //   52: astore 6
    //   54: aload 6
    //   56: invokeinterface 101 1 0
    //   61: ifeq +110 -> 171
    //   64: aload_3
    //   65: iconst_0
    //   66: aload 6
    //   68: invokeinterface 105 1 0
    //   73: checkcast 172	java/lang/Integer
    //   76: invokevirtual 1385	java/lang/Integer:intValue	()I
    //   79: invokestatic 387	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   82: aastore
    //   83: aload_0
    //   84: invokevirtual 183	com/tencent/mobileqq/app/message/MsgProxy:a	()Lcom/tencent/mobileqq/persistence/MessageRecordEntityManager;
    //   87: iconst_0
    //   88: aload_1
    //   89: aconst_null
    //   90: ldc_w 1387
    //   93: aload_3
    //   94: aconst_null
    //   95: aconst_null
    //   96: aconst_null
    //   97: aconst_null
    //   98: invokevirtual 511	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   101: astore 4
    //   103: aload 5
    //   105: aload_0
    //   106: invokevirtual 183	com/tencent/mobileqq/app/message/MsgProxy:a	()Lcom/tencent/mobileqq/persistence/MessageRecordEntityManager;
    //   109: ldc 107
    //   111: aconst_null
    //   112: aload 4
    //   114: invokevirtual 693	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	(Ljava/lang/Class;Ljava/lang/String;Landroid/database/Cursor;)Lcom/tencent/mobileqq/persistence/Entity;
    //   117: checkcast 107	com/tencent/mobileqq/data/MessageRecord
    //   120: invokevirtual 694	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   123: pop
    //   124: aload 4
    //   126: ifnull -72 -> 54
    //   129: aload 4
    //   131: invokeinterface 519 1 0
    //   136: goto -82 -> 54
    //   139: astore 7
    //   141: aload 4
    //   143: ifnull -89 -> 54
    //   146: aload 4
    //   148: invokeinterface 519 1 0
    //   153: goto -99 -> 54
    //   156: astore_1
    //   157: aload 4
    //   159: ifnull +10 -> 169
    //   162: aload 4
    //   164: invokeinterface 519 1 0
    //   169: aload_1
    //   170: athrow
    //   171: aload 5
    //   173: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	174	0	this	MsgProxy
    //   0	174	1	paramString	String
    //   0	174	2	paramInt	int
    //   0	174	3	paramList	List
    //   1	162	4	localObject	Object
    //   43	129	5	localArrayList	ArrayList
    //   52	15	6	localIterator	Iterator
    //   139	1	7	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   103	124	139	java/lang/Exception
    //   103	124	156	finally
  }
  
  protected void c()
  {
    try
    {
      MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().clear();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  protected MessageRecord d(String paramString, int paramInt, long paramLong)
  {
    Object localObject2 = MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt);
    List localList = null;
    for (;;)
    {
      Object localObject1;
      try
      {
        Object localObject3 = d(paramString, paramInt);
        localObject1 = localList;
        if (localObject3 != null)
        {
          Iterator localIterator = ((List)localObject3).iterator();
          localObject1 = localList;
          if (localIterator.hasNext())
          {
            localObject1 = (MessageRecord)localIterator.next();
            if (uniseq != paramLong) {
              continue;
            }
            ((List)localObject3).remove(localObject1);
          }
        }
        localList = f(paramString, paramInt);
        if (localList != null)
        {
          localObject3 = localList.iterator();
          if (((Iterator)localObject3).hasNext())
          {
            paramString = (MessageRecord)((Iterator)localObject3).next();
            if (uniseq != paramLong) {
              continue;
            }
            localList.remove(paramString);
            return paramString;
          }
        }
      }
      finally {}
      paramString = (String)localObject1;
    }
  }
  
  protected List d(String paramString, int paramInt)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      List localList2 = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(a(paramString, paramInt));
      List localList1 = localList2;
      if (localList2 == null)
      {
        localList1 = g(paramString, paramInt);
        b(paramString, paramInt, localList1);
      }
      if ((localList1 != null) && (QLog.isColorLevel())) {
        QLog.d("Q.msg.MsgProxy", 2, new Object[] { "getMsgList uin ", paramString, " , type = ", Integer.valueOf(paramInt), " itemList size=", Integer.valueOf(localList1.size()) });
      }
      return localList1;
    }
  }
  
  public List d(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromTimeRange, peerUin = " + paramString + ", type " + paramInt + ",beginTime = " + paramLong1 + ",endTime = " + paramLong2);
    }
    Object localObject1 = b(paramString, paramInt);
    ArrayList localArrayList = new ArrayList();
    if ((localObject1 != null) && (((List)localObject1).size() > 0))
    {
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (MessageRecord)((Iterator)localObject1).next();
        if ((time >= paramLong1) && (time <= paramLong2)) {
          localArrayList.add(localObject2);
        }
      }
    }
    if ((localArrayList.size() > 0) && (get0time == paramLong1)) {
      return localArrayList;
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    localObject1 = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where time>=? and time<=? order by time asc";
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessageFromTimeRange " + (String)localObject1);
    }
    if (localArrayList.size() > 0) {
      paramLong2 = get0time;
    }
    paramLong1 = Math.min(paramLong1, paramLong2);
    if (localArrayList != null)
    {
      localObject2 = localArrayList.iterator();
      do
      {
        for (;;)
        {
          if (!((Iterator)localObject2).hasNext()) {
            break label379;
          }
          localObject3 = (MessageRecord)((Iterator)localObject2).next();
          if (time != paramLong2) {
            break;
          }
          ((Iterator)localObject2).remove();
        }
      } while (time <= paramLong2);
    }
    label379:
    Object localObject2 = a();
    Object localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    localObject1 = ((MessageRecordEntityManager)localObject2).a((String)localObject1, new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) }, (QQAppInterface)localObject3);
    if (QLog.isColorLevel())
    {
      paramString = new StringBuilder().append("queryMessageFromTimeRange, peerUin = ").append(paramString).append(", type ").append(paramInt).append(",queryBeginTime = ").append(paramLong1).append(",queryEndTime = ").append(paramLong2).append(",resultSize=");
      if (localObject1 != null) {
        break label522;
      }
    }
    label522:
    for (paramInt = 0;; paramInt = ((List)localObject1).size())
    {
      QLog.d("Q.msg.MsgProxy", 2, paramInt);
      if (localObject1 != null) {
        localArrayList.addAll(0, (Collection)localObject1);
      }
      return localArrayList;
    }
  }
  
  protected void d()
  {
    MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().clear();
    MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).b().clear();
  }
  
  protected MessageRecord e(String paramString, int paramInt, long paramLong)
  {
    for (;;)
    {
      synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
      {
        List localList = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(a(paramString, paramInt));
        if (localList != null)
        {
          Iterator localIterator = localList.iterator();
          if (localIterator.hasNext())
          {
            paramString = (MessageRecord)localIterator.next();
            if (uniseq != paramLong) {
              continue;
            }
            localList.remove(paramString);
            return paramString;
          }
        }
      }
      paramString = null;
    }
  }
  
  public List e(String paramString, int paramInt)
  {
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      paramString = f(paramString, paramInt);
      if (paramString != null)
      {
        paramString = (List)((ArrayList)paramString).clone();
        return paramString;
      }
      return paramString;
    }
  }
  
  protected List e(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessagesByShmsgseqFromDB, peerUin[" + FileManagerUtil.e(paramString) + "] type[" + paramInt + "] shmsgseq[" + paramLong1 + "] msgUid[" + paramLong2 + "]");
    }
    if (((paramLong1 == 0L) || (paramLong2 == 0L)) && (QLog.isColorLevel())) {
      QLog.e("Q.msg.MsgProxy", 2, "queryMessagesByShmsgseqFromDB Warning! shmsgseq == 0 || msgUid == 0");
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where shmsgseq=? and msgUid=?";
    MessageRecordEntityManager localMessageRecordEntityManager = a();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    paramString = localMessageRecordEntityManager.a(paramString, new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) }, localQQAppInterface);
    if (paramString != null) {
      return paramString;
    }
    return new ArrayList();
  }
  
  /* Error */
  protected void e()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 132	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager	Lcom/tencent/mobileqq/app/proxy/ProxyManager;
    //   4: invokevirtual 341	com/tencent/mobileqq/app/proxy/ProxyManager:c	()V
    //   7: aload_0
    //   8: getfield 132	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager	Lcom/tencent/mobileqq/app/proxy/ProxyManager;
    //   11: invokevirtual 1414	com/tencent/mobileqq/app/proxy/ProxyManager:d	()V
    //   14: aload_0
    //   15: invokevirtual 183	com/tencent/mobileqq/app/message/MsgProxy:a	()Lcom/tencent/mobileqq/persistence/MessageRecordEntityManager;
    //   18: invokevirtual 1417	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   21: astore 12
    //   23: aload_0
    //   24: getfield 40	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   27: invokevirtual 1419	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   30: astore 13
    //   32: aload 13
    //   34: invokevirtual 1424	com/tencent/mobileqq/app/SQLiteDatabase:b	()[Ljava/lang/String;
    //   37: astore 14
    //   39: aload 14
    //   41: ifnonnull +4 -> 45
    //   44: return
    //   45: aconst_null
    //   46: astore 8
    //   48: iconst_0
    //   49: istore_1
    //   50: iload_1
    //   51: aload 14
    //   53: arraylength
    //   54: if_icmpge -10 -> 44
    //   57: aload 14
    //   59: iload_1
    //   60: aaload
    //   61: astore 15
    //   63: aconst_null
    //   64: astore 9
    //   66: aload 15
    //   68: ldc_w 1426
    //   71: invokevirtual 145	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   74: ifeq +43 -> 117
    //   77: new 154	java/lang/StringBuilder
    //   80: dup
    //   81: invokespecial 155	java/lang/StringBuilder:<init>	()V
    //   84: ldc_w 1428
    //   87: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   90: aload 15
    //   92: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   95: ldc_w 1430
    //   98: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: aload 15
    //   103: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: ldc_w 548
    //   109: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   112: invokevirtual 168	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   115: astore 9
    //   117: aload 8
    //   119: astore 10
    //   121: aload 9
    //   123: ifnull +445 -> 568
    //   126: invokestatic 257	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   129: ifeq +31 -> 160
    //   132: ldc_w 353
    //   135: iconst_2
    //   136: new 154	java/lang/StringBuilder
    //   139: dup
    //   140: invokespecial 155	java/lang/StringBuilder:<init>	()V
    //   143: ldc_w 1432
    //   146: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: aload 9
    //   151: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   154: invokevirtual 168	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   157: invokestatic 265	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   160: aconst_null
    //   161: astore 10
    //   163: aload 13
    //   165: aload 9
    //   167: aconst_null
    //   168: invokevirtual 1435	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   171: astore 9
    //   173: aload 8
    //   175: astore 11
    //   177: aload 9
    //   179: ifnull +295 -> 474
    //   182: aload 8
    //   184: astore 11
    //   186: aload 9
    //   188: astore 10
    //   190: aload 9
    //   192: invokeinterface 516 1 0
    //   197: ifle +277 -> 474
    //   200: aload 9
    //   202: astore 10
    //   204: aload 9
    //   206: invokeinterface 668 1 0
    //   211: pop
    //   212: aload 9
    //   214: astore 10
    //   216: aload 9
    //   218: aload 9
    //   220: ldc_w 1437
    //   223: invokeinterface 1440 2 0
    //   228: invokeinterface 1444 2 0
    //   233: lstore 6
    //   235: aload 9
    //   237: astore 10
    //   239: aload 9
    //   241: aload 9
    //   243: ldc_w 1445
    //   246: invokeinterface 1440 2 0
    //   251: invokeinterface 925 2 0
    //   256: astore 16
    //   258: aload 9
    //   260: astore 10
    //   262: aload 9
    //   264: aload 9
    //   266: ldc_w 1446
    //   269: invokeinterface 1440 2 0
    //   274: invokeinterface 703 2 0
    //   279: istore_2
    //   280: aload 9
    //   282: astore 10
    //   284: aload 9
    //   286: aload 9
    //   288: ldc_w 926
    //   291: invokeinterface 1440 2 0
    //   296: invokeinterface 703 2 0
    //   301: istore_3
    //   302: lload 6
    //   304: lstore 4
    //   306: aload 9
    //   308: astore 10
    //   310: iload_2
    //   311: invokestatic 471	com/tencent/mobileqq/app/message/MsgProxy:a	(I)Z
    //   314: ifne +20 -> 334
    //   317: lload 6
    //   319: lstore 4
    //   321: iload_3
    //   322: iconst_1
    //   323: if_icmpne +11 -> 334
    //   326: lload 6
    //   328: ldc2_w 1447
    //   331: ladd
    //   332: lstore 4
    //   334: aload 9
    //   336: astore 10
    //   338: aload_0
    //   339: getfield 40	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   342: invokevirtual 1131	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   345: aload 16
    //   347: iload_2
    //   348: lload 4
    //   350: invokevirtual 1450	com/tencent/mobileqq/service/message/MessageCache:a	(Ljava/lang/String;IJ)V
    //   353: aload 8
    //   355: astore 11
    //   357: aload 9
    //   359: astore 10
    //   361: getstatic 1454	com/tencent/mobileqq/app/proxy/FTSDBManager:a	Z
    //   364: ifeq +110 -> 474
    //   367: aload 8
    //   369: astore 11
    //   371: aload 9
    //   373: astore 10
    //   375: aload_0
    //   376: getfield 40	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   379: invokestatic 1459	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;)Z
    //   382: ifeq +92 -> 474
    //   385: aload 8
    //   387: astore 11
    //   389: aload 9
    //   391: astore 10
    //   393: aload_0
    //   394: getfield 40	com/tencent/mobileqq/app/message/MsgProxy:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   397: invokestatic 1461	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:b	(Lcom/tencent/mobileqq/app/QQAppInterface;)Z
    //   400: ifeq +74 -> 474
    //   403: aload 9
    //   405: astore 10
    //   407: new 1463	com/tencent/mobileqq/data/fts/FTSMessage
    //   410: dup
    //   411: invokespecial 1464	com/tencent/mobileqq/data/fts/FTSMessage:<init>	()V
    //   414: astore 11
    //   416: aload 9
    //   418: astore 10
    //   420: aload 11
    //   422: iconst_1
    //   423: putfield 1467	com/tencent/mobileqq/data/fts/FTSMessage:mType	I
    //   426: aload 9
    //   428: astore 10
    //   430: aload 11
    //   432: ldc_w 1469
    //   435: putfield 1472	com/tencent/mobileqq/data/fts/FTSMessage:mContent	Ljava/lang/String;
    //   438: aload 9
    //   440: astore 10
    //   442: aload 11
    //   444: ldc2_w 1473
    //   447: putfield 1477	com/tencent/mobileqq/data/fts/FTSMessage:mOId	J
    //   450: aload 9
    //   452: astore 10
    //   454: aload 11
    //   456: aload 16
    //   458: invokestatic 1481	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   461: putfield 1484	com/tencent/mobileqq/data/fts/FTSMessage:uin	J
    //   464: aload 9
    //   466: astore 10
    //   468: aload 11
    //   470: iload_2
    //   471: putfield 1485	com/tencent/mobileqq/data/fts/FTSMessage:istroop	I
    //   474: aload 11
    //   476: astore 8
    //   478: aload 9
    //   480: ifnull +14 -> 494
    //   483: aload 9
    //   485: invokeinterface 519 1 0
    //   490: aload 11
    //   492: astore 8
    //   494: aload 12
    //   496: ifnull +8 -> 504
    //   499: aload 12
    //   501: invokevirtual 1488	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   504: aload 13
    //   506: aload 15
    //   508: aconst_null
    //   509: aconst_null
    //   510: invokevirtual 1491	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   513: pop
    //   514: aload 8
    //   516: ifnull +24 -> 540
    //   519: aload 8
    //   521: invokevirtual 1494	com/tencent/mobileqq/data/fts/FTSMessage:deleteOpt	()V
    //   524: aload 8
    //   526: invokestatic 1499	com/tencent/mobileqq/utils/fts/FTSMessageCodec:a	(Lcom/tencent/mobileqq/data/fts/FTSMessage;)Lcom/tencent/mobileqq/data/FTSMessageSync;
    //   529: astore 9
    //   531: aload_0
    //   532: invokevirtual 183	com/tencent/mobileqq/app/message/MsgProxy:a	()Lcom/tencent/mobileqq/persistence/MessageRecordEntityManager;
    //   535: aload 9
    //   537: invokevirtual 1502	com/tencent/mobileqq/persistence/MessageRecordEntityManager:b	(Lcom/tencent/mobileqq/persistence/Entity;)V
    //   540: aload 12
    //   542: ifnull +8 -> 550
    //   545: aload 12
    //   547: invokevirtual 1503	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   550: aload 8
    //   552: astore 10
    //   554: aload 12
    //   556: ifnull +12 -> 568
    //   559: aload 12
    //   561: invokevirtual 1505	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   564: aload 8
    //   566: astore 10
    //   568: iload_1
    //   569: iconst_1
    //   570: iadd
    //   571: istore_1
    //   572: aload 10
    //   574: astore 8
    //   576: goto -526 -> 50
    //   579: astore 10
    //   581: aload 11
    //   583: astore 8
    //   585: aload 10
    //   587: invokevirtual 700	java/lang/Exception:printStackTrace	()V
    //   590: aload 9
    //   592: ifnull +112 -> 704
    //   595: aload 9
    //   597: invokeinterface 519 1 0
    //   602: goto -108 -> 494
    //   605: astore 8
    //   607: aload 10
    //   609: ifnull +10 -> 619
    //   612: aload 10
    //   614: invokeinterface 519 1 0
    //   619: aload 8
    //   621: athrow
    //   622: astore 9
    //   624: aload 9
    //   626: invokevirtual 700	java/lang/Exception:printStackTrace	()V
    //   629: invokestatic 257	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   632: ifeq +14 -> 646
    //   635: ldc 10
    //   637: iconst_2
    //   638: ldc_w 1507
    //   641: aload 9
    //   643: invokestatic 320	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   646: aload 8
    //   648: astore 10
    //   650: aload 12
    //   652: ifnull -84 -> 568
    //   655: aload 12
    //   657: invokevirtual 1505	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   660: aload 8
    //   662: astore 10
    //   664: goto -96 -> 568
    //   667: astore 8
    //   669: aload 12
    //   671: ifnull +8 -> 679
    //   674: aload 12
    //   676: invokevirtual 1505	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   679: aload 8
    //   681: athrow
    //   682: astore 8
    //   684: aload 9
    //   686: astore 10
    //   688: goto -81 -> 607
    //   691: astore 10
    //   693: aconst_null
    //   694: astore 9
    //   696: goto -111 -> 585
    //   699: astore 10
    //   701: goto -116 -> 585
    //   704: goto -210 -> 494
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	707	0	this	MsgProxy
    //   49	523	1	i	int
    //   279	192	2	j	int
    //   301	23	3	k	int
    //   304	45	4	l1	long
    //   233	94	6	l2	long
    //   46	538	8	localObject1	Object
    //   605	56	8	localObject2	Object
    //   667	13	8	localObject3	Object
    //   682	1	8	localObject4	Object
    //   64	532	9	localObject5	Object
    //   622	63	9	localException1	Exception
    //   694	1	9	localObject6	Object
    //   119	454	10	localObject7	Object
    //   579	34	10	localException2	Exception
    //   648	39	10	localObject8	Object
    //   691	1	10	localException3	Exception
    //   699	1	10	localException4	Exception
    //   175	407	11	localObject9	Object
    //   21	654	12	localEntityTransaction	com.tencent.mobileqq.persistence.EntityTransaction
    //   30	475	13	localSQLiteDatabase	com.tencent.mobileqq.app.SQLiteDatabase
    //   37	21	14	arrayOfString	String[]
    //   61	446	15	str1	String
    //   256	201	16	str2	String
    // Exception table:
    //   from	to	target	type
    //   420	426	579	java/lang/Exception
    //   430	438	579	java/lang/Exception
    //   442	450	579	java/lang/Exception
    //   454	464	579	java/lang/Exception
    //   468	474	579	java/lang/Exception
    //   163	173	605	finally
    //   190	200	605	finally
    //   204	212	605	finally
    //   216	235	605	finally
    //   239	258	605	finally
    //   262	280	605	finally
    //   284	302	605	finally
    //   310	317	605	finally
    //   338	353	605	finally
    //   361	367	605	finally
    //   375	385	605	finally
    //   393	403	605	finally
    //   407	416	605	finally
    //   420	426	605	finally
    //   430	438	605	finally
    //   442	450	605	finally
    //   454	464	605	finally
    //   468	474	605	finally
    //   499	504	622	java/lang/Exception
    //   504	514	622	java/lang/Exception
    //   519	540	622	java/lang/Exception
    //   545	550	622	java/lang/Exception
    //   499	504	667	finally
    //   504	514	667	finally
    //   519	540	667	finally
    //   545	550	667	finally
    //   624	646	667	finally
    //   585	590	682	finally
    //   163	173	691	java/lang/Exception
    //   190	200	699	java/lang/Exception
    //   204	212	699	java/lang/Exception
    //   216	235	699	java/lang/Exception
    //   239	258	699	java/lang/Exception
    //   262	280	699	java/lang/Exception
    //   284	302	699	java/lang/Exception
    //   310	317	699	java/lang/Exception
    //   338	353	699	java/lang/Exception
    //   361	367	699	java/lang/Exception
    //   375	385	699	java/lang/Exception
    //   393	403	699	java/lang/Exception
    //   407	416	699	java/lang/Exception
  }
  
  protected MessageRecord f(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, "queryMessagesByShmsgseqFromDB4Troop, peerUin[" + FileManagerUtil.e(paramString) + "] type[" + paramInt + "] shmsgseq[" + paramLong + "]");
    }
    if ((paramLong == 0L) && (QLog.isColorLevel())) {
      QLog.e("Q.msg.MsgProxy", 2, "queryMessagesByShmsgseqFromDB4Troop Warning! shmsgseq == 0");
    }
    if (a(paramString, paramInt, true)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(a());
    }
    paramString = "select * from " + MessageRecord.getTableName(paramString, paramInt) + " where shmsgseq=? and msgtype " + MsgProxyUtils.c();
    MessageRecordEntityManager localMessageRecordEntityManager = a();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    paramString = localMessageRecordEntityManager.a(paramString, new String[] { String.valueOf(paramLong) }, localQQAppInterface);
    if ((paramString != null) && (paramString.size() > 0)) {
      return (MessageRecord)paramString.get(0);
    }
    return null;
  }
  
  protected List f(String paramString, int paramInt)
  {
    return a(paramString, paramInt, false, false);
  }
  
  protected void f()
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a() != null) && (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a().size() > 0)) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(jdField_a_of_type_ComTencentMobileqqPersistenceMessageRecordEntityManager);
    }
  }
  
  List g(String paramString, int paramInt)
  {
    Object localObject1;
    long l;
    String str;
    boolean bool;
    synchronized (MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a(paramString, paramInt))
    {
      localObject1 = (List)MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().get(a(paramString, paramInt));
      if (localObject1 != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.MsgProxy", 2, "init from cache, uin=" + paramString);
        }
        return localObject1;
      }
      l = System.currentTimeMillis();
      str = b(paramString, paramInt);
      bool = a(paramString, paramInt, false);
      if (bool) {
        jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.c();
      }
      List localList = h(paramString, paramInt);
      System.nanoTime();
      Object localObject2 = a().a(str, null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (localObject2 != null)
      {
        int j = ((List)localObject2).size() / 2;
        paramInt = ((List)localObject2).size();
        int i = 0;
        paramInt -= 1;
        for (;;)
        {
          localObject1 = localObject2;
          if (i >= j) {
            break;
          }
          localObject1 = (MessageRecord)((List)localObject2).get(i);
          ((List)localObject2).set(i, ((List)localObject2).get(paramInt));
          ((List)localObject2).set(paramInt, localObject1);
          i += 1;
          paramInt -= 1;
        }
      }
      localObject1 = new ArrayList();
      localObject2 = MsgProxyUtils.a((List)localObject1, localList).iterator();
      if (((Iterator)localObject2).hasNext()) {
        MsgProxyUtils.a((List)localObject1, (MessageRecord)((Iterator)localObject2).next(), true);
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, new Object[] { "init from db, uin=", paramString, ", isSaveToDatabase=", Boolean.valueOf(bool), ", cost=", Long.valueOf(System.currentTimeMillis() - l), " sqlStr = ", str, " size =", Integer.valueOf(((List)localObject1).size()) });
    }
    return localObject1;
  }
  
  protected List h(String paramString, int paramInt)
  {
    ArrayList localArrayList;
    synchronized (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a())
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a();
      localArrayList = new ArrayList();
      localObject = ((Vector)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        MsgQueueItem localMsgQueueItem = (MsgQueueItem)((Iterator)localObject).next();
        if ((jdField_a_of_type_ComTencentMobileqqPersistenceEntity instanceof MessageRecord))
        {
          MessageRecord localMessageRecord = (MessageRecord)jdField_a_of_type_ComTencentMobileqqPersistenceEntity;
          if ((MsgProxyUtils.a(frienduin, paramString, istroop, paramInt)) && (i == 0)) {
            localArrayList.add(localMessageRecord);
          }
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.MsgProxy", 2, new Object[] { "getMsgListFromQueue uin=", paramString, ", type=", Integer.valueOf(paramInt), ", size=", Integer.valueOf(localArrayList.size()) });
    }
    return localArrayList;
  }
}
