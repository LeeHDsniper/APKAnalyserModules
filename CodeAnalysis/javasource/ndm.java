import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.qphone.base.util.QLog;

public class ndm
  implements Runnable
{
  public ndm(QQAppInterface paramQQAppInterface, StringBuilder paramStringBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.i(QQAppInterface.a, 2, "isCallTabShow needupdate,result=" + jdField_a_of_type_JavaLangStringBuilder);
    }
    SettingCloneUtil.writeValue(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), null, "qqsetting_calltab_show_key", jdField_a_of_type_JavaLangStringBuilder.toString());
  }
}
