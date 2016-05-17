import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.DatalineMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.qphone.base.util.QLog;

public class njr
  implements Runnable
{
  public njr(DatalineMessageManager paramDatalineMessageManager, DataLineMsgRecord paramDataLineMsgRecord, WaitEvent paramWaitEvent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.time == 0L) {
        jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.time = MessageCache.a();
      }
      if (jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.msgseq == 0L) {
        jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.msgseq = ((int)jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.time);
      }
      RecentUserProxy localRecentUserProxy = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      RecentUser localRecentUser = localRecentUserProxy.a(String.valueOf(jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.b), jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_Int);
      type = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_Int;
      lastmsgtime = jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.time;
      localRecentUserProxy.a(localRecentUser);
      DatalineMessageManager.a(jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager, jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord, localEntityManager);
      long l = jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord.msgId;
      jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord);
      jdField_a_of_type_ComDatalineUtilWaitEvent.a();
      localEntityManager.a();
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.DatalineMessageManager", 2, "mr.msgId: " + l);
      }
      return;
    }
    finally
    {
      localEntityManager.a();
    }
  }
}
