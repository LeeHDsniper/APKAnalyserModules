import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.BaseMessageManagerForTroopAndDisc;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopMessageManager;
import com.tencent.qphone.base.util.QLog;

public class njc
  implements Runnable
{
  public njc(BaseMessageManagerForTroopAndDisc paramBaseMessageManagerForTroopAndDisc, Bundle paramBundle, long paramLong1, long paramLong2, int paramInt, long paramLong3, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_AndroidOsBundle.putBoolean("success", false);
    long l = Math.min(jdField_a_of_type_Long, b);
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager.trooptroop_pull_msg.troop_parallel_pull_msg.trooptroop_pull_msg", 2, "--->>pkgIndex : " + jdField_a_of_type_Int + " beginSeq:" + c + " fixEndSeq:" + l);
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().a(jdField_a_of_type_JavaLangString, c, l);
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_JavaLangString, c, l, true, jdField_a_of_type_AndroidOsBundle, 0);
  }
}
