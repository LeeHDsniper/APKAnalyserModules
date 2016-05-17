import android.graphics.Bitmap;
import com.tencent.mobileqq.app.LebaHelper;
import com.tencent.mobileqq.config.DownloadIconsListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.HttpDownloadUtil;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.net.URL;
import java.util.List;
import java.util.Set;

public class mzd
  implements Runnable
{
  public mzd(LebaHelper paramLebaHelper, URL paramURL, File paramFile, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      if (HttpDownloadUtil.a(jdField_a_of_type_ComTencentMobileqqAppLebaHelper.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_JavaNetURL, jdField_a_of_type_JavaIoFile))
      {
        if (QLog.isColorLevel()) {
          QLog.d("LebaHelper", 2, "Download icon key = " + jdField_a_of_type_JavaLangString + "suc--------");
        }
        Bitmap localBitmap = LebaHelper.a(jdField_a_of_type_ComTencentMobileqqAppLebaHelper, jdField_a_of_type_JavaIoFile);
        List localList;
        int i;
        if (localBitmap != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("LebaHelper", 2, "Download icon key = " + jdField_a_of_type_JavaLangString + "notify UI++++++++");
          }
          localList = jdField_a_of_type_ComTencentMobileqqAppLebaHelper.d;
          i = 0;
        }
        try
        {
          while (i < jdField_a_of_type_ComTencentMobileqqAppLebaHelper.d.size())
          {
            ((DownloadIconsListener)jdField_a_of_type_ComTencentMobileqqAppLebaHelper.d.get(i)).a(jdField_a_of_type_JavaLangString, localBitmap);
            i += 1;
          }
          LebaHelper.a(jdField_a_of_type_ComTencentMobileqqAppLebaHelper, jdField_a_of_type_JavaLangString);
          return;
        }
        finally {}
      }
      jdField_a_of_type_ComTencentMobileqqAppLebaHelper.jdField_a_of_type_JavaUtilSet.remove(jdField_a_of_type_JavaLangString);
    }
    catch (Exception localException)
    {
      jdField_a_of_type_ComTencentMobileqqAppLebaHelper.jdField_a_of_type_JavaUtilSet.remove(jdField_a_of_type_JavaLangString);
      LebaHelper.b(jdField_a_of_type_ComTencentMobileqqAppLebaHelper, jdField_a_of_type_JavaLangString);
      return;
    }
    LebaHelper.b(jdField_a_of_type_ComTencentMobileqqAppLebaHelper, jdField_a_of_type_JavaLangString);
  }
}
