import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundActivity;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.util.HashMap;

public class mqd
  implements Runnable
{
  public mqd(QvipSpecialSoundActivity paramQvipSpecialSoundActivity, String paramString, File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool = QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity).a(jdField_a_of_type_JavaLangString);
    Object localObject;
    if (QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity) != null)
    {
      localObject = Message.obtain(QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity), 0);
      obj = Boolean.valueOf(bool);
      QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity).sendMessage((Message)localObject);
    }
    if (bool)
    {
      jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity.a(jdField_a_of_type_JavaIoFile.getAbsolutePath());
      localObject = new File(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity.getFilesDir(), jdField_a_of_type_JavaLangString);
      if (localObject == null) {
        break label136;
      }
    }
    label136:
    for (long l = ((File)localObject).length();; l = 0L)
    {
      QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity).a(l);
      QvipSpecialSoundActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity).remove(jdField_a_of_type_JavaLangString);
      return;
    }
  }
}
