import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;

public class lie
  implements Runnable
{
  public lie(NearbyChatPie paramNearbyChatPie, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isDevelopLevel()) {
      QLog.i(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildNearbyChatPie.ae, 4, "0X80052C5, " + jdField_a_of_type_JavaLangString);
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildNearbyChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80052C5", "0X80052C5", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildNearbyChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", jdField_a_of_type_JavaLangString, "");
  }
}
