import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager.CallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;

public class mqk
  implements Runnable
{
  public mqk(QvipSpecialSoundManager paramQvipSpecialSoundManager, QvipSpecialSoundManager.CallBack paramCallBack)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    String str = QvipSpecialSoundManager.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(str);
    boolean bool = QvipSpecialSoundManager.a.containsKey("key_special_sound_list" + QvipSpecialSoundManager.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager).a());
    QvipSpecialSoundManager.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager, jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager$CallBack, bool);
  }
}
