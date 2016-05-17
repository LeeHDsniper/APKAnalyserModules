import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.BaseMessageManagerForTroopAndDisc;
import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.qphone.base.util.QLog;

public class njd
  implements Runnable
{
  public njd(BaseMessageManagerForTroopAndDisc paramBaseMessageManagerForTroopAndDisc, MessageRecord paramMessageRecord, boolean paramBoolean, long paramLong)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeRequest " + jdField_a_of_type_ComTencentMobileqqDataMessageRecord.getLogColorContent() + " holdFlag: " + jdField_a_of_type_Boolean);
    }
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord, 15000L);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a().e(jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a();
    long l1 = System.currentTimeMillis();
    long l2 = jdField_a_of_type_Long;
    if (jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a().d(jdField_a_of_type_ComTencentMobileqqDataMessageRecord)) {
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord, 15000L - (l1 - l2));
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a().e(null);
      return;
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a().a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop, UncommonMessageProcessor.h, UncommonMessageProcessor.p);
    }
  }
}
