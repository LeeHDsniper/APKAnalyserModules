import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager.CallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mql
  implements Runnable
{
  public mql(QvipSpecialSoundManager paramQvipSpecialSoundManager, QvipSpecialSoundManager.CallBack paramCallBack, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager$CallBack.a(jdField_a_of_type_Boolean);
  }
}
