import android.content.Context;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;

public class mqj
  implements Runnable
{
  public mqj(QvipSpecialSoundManager paramQvipSpecialSoundManager, mqi paramMqi)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(jdField_a_of_type_Mqi.c))
    {
      File localFile = new File(QvipSpecialSoundManager.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager).getFilesDir(), jdField_a_of_type_Mqi.c);
      if (localFile != null) {}
      for (long l = localFile.length();; l = 0L)
      {
        jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(l);
        return;
      }
    }
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.b("updateSpecialSound down fial, id=" + jdField_a_of_type_Mqi.a);
  }
}
