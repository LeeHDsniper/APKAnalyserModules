import com.tencent.mobileqq.activity.specialcare.QQSpecialCareSettingActivity;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager.CallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mps
  implements QvipSpecialSoundManager.CallBack
{
  public mps(QQSpecialCareSettingActivity paramQQSpecialCareSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "loadSpecialSoundConfig onResult: " + paramBoolean);
    }
    if (paramBoolean) {}
    for (;;)
    {
      try
      {
        QQSpecialCareSettingActivity.a(a);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
      finally
      {
        a.stopTitleProgress();
      }
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialCareSettingActivity", 2, "loadSpecialSoundConfig fail.");
      }
    }
  }
}
