import android.os.Bundle;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AvatarPendantUtil;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.vip.DownloaderInterface;
import com.tencent.qphone.base.util.QLog;
import java.io.File;

public class lwp
  implements Runnable
{
  public lwp(AvatarPendantActivity paramAvatarPendantActivity, DownloaderInterface paramDownloaderInterface, File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AvatarPendantActivity", 2, "checkAvatarPendantMarketIcon start...");
    }
    if (jdField_a_of_type_ComTencentMobileqqVipDownloaderInterface.a(AvatarPendantUtil.a) == null)
    {
      DownloadTask localDownloadTask = new DownloadTask(AvatarPendantUtil.a, jdField_a_of_type_JavaIoFile);
      m = false;
      Bundle localBundle = new Bundle();
      jdField_a_of_type_ComTencentMobileqqVipDownloaderInterface.a(localDownloadTask, jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.a, localBundle);
    }
  }
}
