import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundActivity;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager.CallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.List;

public class mqb
  implements QvipSpecialSoundManager.CallBack
{
  public mqb(QvipSpecialSoundActivity paramQvipSpecialSoundActivity, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (;;)
    {
      try
      {
        jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity.a = ((List)QvipSpecialSoundManager.a.get(jdField_a_of_type_JavaLangString));
        QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
      finally
      {
        jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity.stopTitleProgress();
      }
      if (QLog.isColorLevel()) {
        QLog.i("SpecialSoundActivity", 2, "special sound cofing is empty.");
      }
      QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity, jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity.getString(2131370671));
    }
  }
}
