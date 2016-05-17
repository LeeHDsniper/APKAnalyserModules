import com.tencent.mobileqq.activity.specialcare.QQSpecialFriendSettingActivity;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager.CallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpx
  implements QvipSpecialSoundManager.CallBack
{
  public mpx(QQSpecialFriendSettingActivity paramQQSpecialFriendSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "loadSpecialSoundConfig onResult: " + paramBoolean);
    }
    if (paramBoolean) {}
    for (;;)
    {
      try
      {
        QQSpecialFriendSettingActivity.a(a);
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
        QLog.i("QQSpecialFriendSettingActivity", 2, "loadSpecialSoundConfig fail.");
      }
    }
  }
}
