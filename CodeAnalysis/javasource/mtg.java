import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.activity.GesturePWDUnlockActivity;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.qphone.base.util.QLog;

public class mtg
  extends BroadcastReceiver
{
  private mtg()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    BaseActivity localBaseActivity = BaseActivity.sTopActivity;
    if (localBaseActivity == null) {
      if (QLog.isColorLevel()) {
        QLog.d("qqBaseActivity", 2, paramIntent.getAction());
      }
    }
    do
    {
      return;
      if (paramIntent.getAction().equals("android.intent.action.SCREEN_OFF"))
      {
        if ((mStopFlag == 0) && (mCanLock) && (GesturePWDUtils.getGesturePWDState(localBaseActivity, localBaseActivity.getCurrentAccountUin()) == 2) && (GesturePWDUtils.getGesturePWDMode(localBaseActivity, localBaseActivity.getCurrentAccountUin()) == 21) && (!(localBaseActivity instanceof GesturePWDUnlockActivity)) && (!(localBaseActivity instanceof LoginActivity)) && (!GesturePWDUtils.getGestureLocking(localBaseActivity))) {
          localBaseActivity.startUnlockActivity();
        }
        for (;;)
        {
          BaseActivity.isUnLockSuccess = false;
          if ((BaseActivity.access$400() == null) || (!SettingCloneUtil.readValue(paramContext, null, paramContext.getString(2131367557), "qqsetting_screenshot_key", false))) {
            break;
          }
          localBaseActivity.turnOffShake();
          return;
          localBaseActivity.receiveScreenOff();
        }
      }
    } while ((!paramIntent.getAction().equals("android.intent.action.SCREEN_ON")) || (BaseActivity.access$400() != null) || (!SettingCloneUtil.readValue(paramContext, null, paramContext.getString(2131367557), "qqsetting_screenshot_key", false)));
    localBaseActivity.turnOnShake();
  }
}
