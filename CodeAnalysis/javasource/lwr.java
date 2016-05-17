import android.os.Handler;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AvatarPendantUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.vas.ClubContentJsonTask;
import com.tencent.mobileqq.vas.ClubContentJsonTask.TaskInfo;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.vip.DownloaderFactory;
import com.tencent.qphone.base.util.QLog;
import java.io.File;

public class lwr
  extends DownloadListener
{
  public lwr(AvatarPendantActivity paramAvatarPendantActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDone(DownloadTask paramDownloadTask)
  {
    super.onDone(paramDownloadTask);
    if (QLog.isColorLevel()) {
      QLog.d("AvatarPendantActivity", 2, "download onDone status=" + paramDownloadTask.a() + ",errCode=" + z);
    }
    int i = a.indexOf("?");
    String str;
    if (i == -1)
    {
      str = a;
      if (!AvatarPendantUtil.a.equals(str)) {
        break label290;
      }
      if ((z != 0) || (D != 200)) {
        break label237;
      }
      str = AvatarPendantUtil.b + "/icon.zip";
      File localFile = new File(AvatarPendantUtil.c);
      if (DownloaderFactory.a(new File(str), localFile, false)) {
        break label215;
      }
      if (QLog.isColorLevel()) {
        QLog.d("AvatarPendantActivity", 2, "unzip avatarPendantMarketIcon fail: " + D + ", url: " + a);
      }
      FileUtils.a(AvatarPendantUtil.b);
    }
    label215:
    label237:
    label290:
    do
    {
      return;
      str = a.substring(0, i);
      break;
      AvatarPendantActivity.a(a);
      a.a.sendEmptyMessage(1000);
      return;
      if (QLog.isColorLevel()) {
        QLog.d("AvatarPendantActivity", 2, "download avatarPendantMarketIcon fail: " + D + ", url: " + a);
      }
      FileUtils.a(AvatarPendantUtil.b);
      return;
      if ((lb.equals(str)) && (z == 0) && (D == 200))
      {
        AvatarPendantActivity.a(a, false);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("AvatarPendantActivity", 2, "onDone unkonw url: " + a + ",errCode:" + z + ",httpCode:" + D);
  }
}
