import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.securemodule.service.CloudScanListener;
import java.util.List;

public class ndf
  implements CloudScanListener
{
  public ndf(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onFinish(int paramInt)
  {
    if (paramInt == 0) {
      PreferenceManager.getDefaultSharedPreferences(QQAppInterface.h(a)).edit().putLong("security_scan_last_time", System.currentTimeMillis()).putBoolean("security_scan_last_result", false).commit();
    }
  }
  
  public void onRiskFoud(List paramList) {}
  
  public void onRiskFound()
  {
    if (QLog.isColorLevel()) {
      QLog.d("security_scan", 2, "Find Risk");
    }
    PreferenceManager.getDefaultSharedPreferences(QQAppInterface.g(a)).edit().putBoolean("security_scan_last_result", true).commit();
  }
}
