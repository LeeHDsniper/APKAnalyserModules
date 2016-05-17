import android.content.Context;
import android.content.IntentFilter;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.qphone.base.util.QLog;

public class mtd
  implements Runnable
{
  public mtd(BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (SettingCloneUtil.readValue(a, null, a.getString(2131367557), "qqsetting_screenshot_key", false)) {
      a.turnOnShake();
    }
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    localIntentFilter.addAction("android.intent.action.SCREEN_ON");
    BaseActivity.access$102(new mtg(null));
    try
    {
      a.getApplicationContext().registerReceiver(BaseActivity.access$100(), localIntentFilter);
      return;
    }
    catch (Exception localException)
    {
      QLog.e("qqBaseActivity", 1, "", localException);
    }
  }
}
