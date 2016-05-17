import android.content.Context;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.utils.HttpDownloadUtil;
import java.io.File;

public class ndc
  implements Runnable
{
  public ndc(QQAppInterface paramQQAppInterface, String paramString, File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    File localFile;
    if (HttpDownloadUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, MsfSdkUtils.insertMtype("lingyin", jdField_a_of_type_JavaLangString), jdField_a_of_type_JavaIoFile))
    {
      localFile = new File(QQAppInterface.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).getApplicationContext().getFilesDir(), jdField_a_of_type_JavaLangString);
      if (localFile == null) {
        break label69;
      }
    }
    label69:
    for (long l = localFile.length();; l = 0L)
    {
      QQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(l);
      return;
    }
  }
}
