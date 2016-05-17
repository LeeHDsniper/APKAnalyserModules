import android.os.Bundle;
import com.tencent.mobileqq.activity.qwallet.PreloadImgManager;
import com.tencent.mobileqq.app.ThreadExcutor.IThreadListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.vip.DownloaderInterface;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class mda
  implements ThreadExcutor.IThreadListener
{
  public mda(PreloadImgManager paramPreloadImgManager, List paramList, Map paramMap, Bundle paramBundle)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a() {}
  
  public void b() {}
  
  public void c()
  {
    if (!jdField_a_of_type_JavaUtilList.isEmpty())
    {
      DownloadTask localDownloadTask = new DownloadTask(jdField_a_of_type_JavaUtilList, jdField_a_of_type_JavaUtilMap, UUID.randomUUID().toString());
      localDownloadTask.a(jdField_a_of_type_AndroidOsBundle);
      if (jdField_a_of_type_ComTencentMobileqqActivityQwalletPreloadImgManager.a != null) {
        jdField_a_of_type_ComTencentMobileqqActivityQwalletPreloadImgManager.a.a(localDownloadTask, PreloadImgManager.a(jdField_a_of_type_ComTencentMobileqqActivityQwalletPreloadImgManager), null);
      }
    }
  }
}
