package mqq.app;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.qphone.base.util.QLog;

public class BaseActivity
  extends Activity
{
  protected static int sResumeCount = 0;
  private AppRuntime app;
  private boolean isResume;
  protected boolean mIsShadow;
  private MobileQQ mqq;
  
  public BaseActivity() {}
  
  protected void finalize()
    throws Throwable
  {
    super.finalize();
    if (QLog.isColorLevel()) {
      QLog.i("mqq", 2, "[Free Activity]" + getClass().getSimpleName());
    }
  }
  
  public final AppRuntime getAppRuntime()
  {
    return app;
  }
  
  public SharedPreferences getSharedPreferences(String paramString, int paramInt)
  {
    return SharedPreferencesProxyManager.getInstance().getProxy(paramString, paramInt);
  }
  
  protected boolean isLatecyWaitRuntime()
  {
    return false;
  }
  
  public final boolean isResume()
  {
    return isResume;
  }
  
  protected boolean isShadow()
  {
    return false;
  }
  
  protected void onAccountChanged() {}
  
  protected void onAccoutChangeFailed() {}
  
  protected void onCreate(Bundle paramBundle)
  {
    onCreateNoRuntime(paramBundle);
    if (QLog.isColorLevel()) {
      QLog.i("mqq", 2, "[Activity]" + getClass().getSimpleName() + " onCreate");
    }
    if (!isLatecyWaitRuntime()) {
      waitAppRuntime();
    }
  }
  
  protected void onCreateNoRuntime(Bundle paramBundle)
  {
    mIsShadow = isShadow();
    if (!mIsShadow) {
      super.onCreate(paramBundle);
    }
    if (QLog.isColorLevel()) {
      QLog.i("mqq", 2, "[Activity]" + getClass().getSimpleName() + " onCreateNoRuntime");
    }
    mqq = MobileQQ.getMobileQQ();
    mqq.addActivity(this);
  }
  
  protected void onDestroy()
  {
    if (!mIsShadow) {
      super.onDestroy();
    }
    if (QLog.isColorLevel()) {
      QLog.i("mqq", 2, "[Activity]" + getClass().getSimpleName() + " onDestroy");
    }
    mqq.removeActivity(this);
    mqq = null;
  }
  
  protected void onLogout(Constants.LogoutReason paramLogoutReason)
  {
    finish();
  }
  
  protected void onPause()
  {
    if (!mIsShadow) {
      super.onPause();
    }
    int i = sResumeCount - 1;
    sResumeCount = i;
    if ((i <= 0) && (app != null)) {
      app.isBackground_Pause = true;
    }
    isResume = false;
  }
  
  protected void onResume()
  {
    if (!mIsShadow) {
      super.onResume();
    }
    int i = sResumeCount + 1;
    sResumeCount = i;
    if ((i > 0) && (app != null)) {
      app.isBackground_Pause = false;
    }
    isResume = true;
  }
  
  protected void onStart()
  {
    if (!mIsShadow) {
      super.onStart();
    }
    Foreground.onStart(app);
  }
  
  protected void onStop()
  {
    if (!mIsShadow) {
      super.onStop();
    }
    Foreground.onStop(app);
  }
  
  void setAppRuntime(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
  }
  
  public final void superFinish()
  {
    super.finish();
  }
  
  public AppRuntime waitAppRuntime()
  {
    app = mqq.waitAppRuntime(this);
    return app;
  }
}
