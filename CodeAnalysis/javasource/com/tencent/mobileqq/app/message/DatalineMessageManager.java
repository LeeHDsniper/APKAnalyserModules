package com.tencent.mobileqq.app.message;

import android.os.Handler;
import android.os.Looper;
import com.dataline.activities.LiteActivity;
import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.DataLineHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.data.DataLineMsgSet;
import com.tencent.mobileqq.data.DataLineMsgSetList;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Map;
import njr;
import njs;
import njt;

public class DatalineMessageManager
  implements IMessageManager
{
  public static final String a = "Q.msg.DatalineMessageManager";
  public int a;
  public QQAppInterface a;
  public QQMessageFacade a;
  public String b;
  
  public DatalineMessageManager(QQAppInterface paramQQAppInterface, QQMessageFacade paramQQMessageFacade)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = AppConstants.ai;
    jdField_a_of_type_Int = 6000;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade = paramQQMessageFacade;
  }
  
  private void a(DataLineMsgRecord paramDataLineMsgRecord, EntityManager paramEntityManager)
  {
    a().b(paramDataLineMsgRecord);
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(paramDataLineMsgRecord.getTableName(), jdField_a_of_type_Int);
    paramEntityManager = a().a(groupId);
    QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(String.valueOf(b), jdField_a_of_type_Int);
    selfuin = String.valueOf(b);
    senderuin = String.valueOf(b);
    msgtype = msgtype;
    if (msgtype == 63527) {
      msgtype = 63531;
    }
    msg = msg;
    emoRecentMsg = null;
    if (time > time)
    {
      QLog.d("DatalineMessageManager", 2, "updateLastMsg mr msg time[" + time + "] to time[" + time + "]");
      time = time;
    }
    msgseq = msgseq;
    isread = isread;
    issend = issend;
    frienduin = String.valueOf(b);
    istroop = jdField_a_of_type_Int;
    fileType = -1;
    msgId = msgId;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localMessage);
    if (!paramDataLineMsgRecord.isSend()) {
      hasReply = true;
    }
    if ((!paramDataLineMsgRecord.isSendFromLocal()) && (!isread))
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(localMessage);
      if (!DataLineMsgSet.isSingle(paramDataLineMsgRecord)) {
        break label305;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(frienduin, istroop, 1);
    }
    label305:
    while ((paramEntityManager != null) && (paramEntityManager.getComeCount() != 1)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(frienduin, istroop, 1);
  }
  
  public int a()
  {
    Object localObject = Looper.getMainLooper();
    if (Thread.currentThread() != ((Looper)localObject).getThread()) {
      throw new RuntimeException("clearHistory in no-main thread");
    }
    localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(String.valueOf(b), jdField_a_of_type_Int);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0;
    }
    int i = a().a();
    if (i > 0)
    {
      msg = null;
      emoRecentMsg = null;
      fileType = -1;
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localObject);
    return i;
  }
  
  public int a(int paramInt)
  {
    return a().a(paramInt);
  }
  
  public int a(long paramLong)
  {
    DataLineMsgSet localDataLineMsgSet = a().a(paramLong);
    if (localDataLineMsgSet == null) {
      return -1;
    }
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() == localLooper.getThread()) {
      return a(localDataLineMsgSet);
    }
    new Handler(localLooper).post(new njs(this, localDataLineMsgSet));
    return 0;
  }
  
  public int a(DataLineMsgSet paramDataLineMsgSet)
  {
    boolean bool = false;
    Object localObject = Looper.getMainLooper();
    if (Thread.currentThread() == ((Looper)localObject).getThread())
    {
      int i = a().a(paramDataLineMsgSet);
      if (i > 0)
      {
        paramDataLineMsgSet = MsgProxyUtils.a(String.valueOf(b), jdField_a_of_type_Int);
        if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.containsKey(paramDataLineMsgSet))
        {
          bool = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(paramDataLineMsgSet)).hasReply;
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.remove(paramDataLineMsgSet);
        }
        long l = a().a().size();
        if (l > 0L)
        {
          localObject = a().a();
          paramDataLineMsgSet = (DataLineMsgSet)localObject;
          if (msgtype == 60536)
          {
            paramDataLineMsgSet = (DataLineMsgSet)localObject;
            if (l > 1L) {
              paramDataLineMsgSet = a().a().get((int)(l - 2L)).getLastItem();
            }
          }
          localObject = new QQMessageFacade.Message();
          if (paramDataLineMsgSet != null)
          {
            MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject, paramDataLineMsgSet);
            emoRecentMsg = null;
            hasReply = bool;
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a((QQMessageFacade.Message)localObject);
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.put(MsgProxyUtils.a(String.valueOf(b), jdField_a_of_type_Int), localObject);
          }
        }
        paramDataLineMsgSet = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(String.valueOf(b), jdField_a_of_type_Int);
        paramDataLineMsgSet.a();
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localObject);
        }
      }
      return i;
    }
    new Handler((Looper)localObject).post(new njt(this, paramDataLineMsgSet));
    return 0;
  }
  
  public long a(DataLineMsgRecord paramDataLineMsgRecord, boolean paramBoolean)
  {
    long l2 = -1L;
    long l1;
    if (paramDataLineMsgRecord == null)
    {
      l1 = l2;
      if (QLog.isColorLevel())
      {
        QLog.w("Q.msg.DatalineMessageManager", 2, "mr is null");
        l1 = l2;
      }
    }
    Object localObject1;
    Object localObject2;
    for (;;)
    {
      return l1;
      a();
      localObject1 = new WaitEvent(false, false);
      localObject2 = Looper.getMainLooper();
      if (Thread.currentThread() == ((Looper)localObject2).getThread())
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
        try
        {
          if (time == 0L) {
            time = MessageCache.a();
          }
          if (msgseq == 0L) {
            msgseq = ((int)time);
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
          RecentUser localRecentUser = ((RecentUserProxy)localObject2).a(String.valueOf(b), jdField_a_of_type_Int);
          type = jdField_a_of_type_Int;
          lastmsgtime = time;
          ((RecentUserProxy)localObject2).a(localRecentUser);
          a(paramDataLineMsgRecord, (EntityManager)localObject1);
          l2 = msgId;
          if (paramBoolean) {
            issuc = true;
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramDataLineMsgRecord);
          ((EntityManager)localObject1).a();
          l1 = l2;
          if (QLog.isColorLevel())
          {
            QLog.d("Q.msg.DatalineMessageManager", 2, "mr.msgId: " + l2);
            return l2;
          }
        }
        finally
        {
          ((EntityManager)localObject1).a();
        }
      }
    }
    new Handler((Looper)localObject2).post(new njr(this, paramDataLineMsgRecord, (WaitEvent)localObject1));
    ((WaitEvent)localObject1).a(-1L);
    return 0L;
  }
  
  public DataLineMsgProxy a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0);
  }
  
  public DataLineMsgRecord a(long paramLong)
  {
    return a().a(paramLong);
  }
  
  public DataLineMsgSet a(long paramLong)
  {
    return a().b(paramLong);
  }
  
  protected void a()
  {
    ((DataLineHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(8)).a(false);
  }
  
  public void a(long paramLong)
  {
    a().b(paramLong);
  }
  
  public void a(long paramLong, String paramString, byte[] paramArrayOfByte)
  {
    a().a(paramLong, paramString, paramArrayOfByte);
  }
  
  public DataLineMsgRecord b(long paramLong)
  {
    return a().b(paramLong);
  }
  
  public void b()
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    try
    {
      RecentUserProxy localRecentUserProxy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      RecentUser localRecentUser = localRecentUserProxy.a(String.valueOf(b), jdField_a_of_type_Int);
      type = jdField_a_of_type_Int;
      lastmsgtime = MessageCache.a();
      localRecentUserProxy.a(localRecentUser);
      ((EntityManager)localObject1).a();
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(String.valueOf(b), jdField_a_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localObject1);
      return;
    }
    finally
    {
      ((EntityManager)localObject1).a();
    }
  }
  
  public void b(long paramLong)
  {
    a().c(paramLong);
  }
  
  public void c()
  {
    a().d();
  }
  
  public void c(long paramLong)
  {
    a().a(paramLong);
  }
  
  public void d()
  {
    a().c();
  }
  
  public void d(long paramLong)
  {
    QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(String.valueOf(b), jdField_a_of_type_Int);
    if (paramLong > time)
    {
      QLog.d("DatalineMessageManager", 2, "updateLastMsg msg time[" + time + "] to time[" + paramLong + "]");
      time = paramLong;
    }
  }
  
  public void e()
  {
    if (!LiteActivity.class.getName().equals(ConfigHandler.a(BaseApplication.getContext()))) {}
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.DatalineMessageManager", 2, "setDataLineMsgReaded,unread=" + jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().a(b, jdField_a_of_type_Int));
      }
    } while (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().a(b, jdField_a_of_type_Int) <= 0);
    a().e();
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().a(b, jdField_a_of_type_Int, true);
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(b, jdField_a_of_type_Int));
  }
}
