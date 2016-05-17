import android.net.Uri;
import android.text.TextUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinEngine;
import java.io.File;

public class nde
  implements Runnable
{
  public nde(QQAppInterface paramQQAppInterface, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d();
    boolean bool2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.g();
    if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.h()) && (bool2) && (!bool1) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.k()) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.l()) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.m()) && (QQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)))
    {
      Object localObject = SkinEngine.getInstances().getSkinRootPath();
      if (!TextUtils.isEmpty((CharSequence)localObject))
      {
        localObject = new StringBuilder((String)localObject);
        ((StringBuilder)localObject).append(File.separatorChar).append("voice").append(File.separatorChar).append("tab").append(jdField_a_of_type_Int).append(".mp3");
        File localFile = new File(((StringBuilder)localObject).toString());
        if (QLog.isColorLevel()) {
          QLog.d("playThemeVoice", 2, "Uri:" + ((StringBuilder)localObject).toString());
        }
        if (localFile.exists()) {
          AudioUtil.a(Uri.fromFile(localFile), false, false);
        }
      }
    }
  }
}
