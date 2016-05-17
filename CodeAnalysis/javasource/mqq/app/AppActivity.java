package mqq.app;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.view.KeyEvent;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import mqq.util.WeakReference;

@TargetApi(16)
public class AppActivity
  extends Activity
{
  protected static int sResumeCount = 0;
  private boolean mIsFinishingInOnCreate = false;
  private boolean mIsResultWaiting;
  protected boolean mIsResume = false;
  private boolean mIsSplashing = false;
  private boolean mIsStartSkipped = false;
  private Intent mNewIntent;
  private Bundle mOnCreateBundle = null;
  private Bundle mOnRestoreBundle;
  private Bundle mPostCreateBundle = null;
  private int mRequestCode;
  private int mResultCode;
  private Intent mResultData;
  protected AppRuntime mRuntime = null;
  private int mWindowFocusState = -1;
  
  public AppActivity() {}
  
  @Deprecated
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    if (mIsSplashing) {
      return false;
    }
    return doDispatchKeyEvent(paramKeyEvent);
  }
  
  protected boolean doDispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    return super.dispatchKeyEvent(paramKeyEvent);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  protected void doOnBackPressed()
  {
    try
    {
      super.onBackPressed();
      return;
    }
    catch (Throwable localThrowable)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("qqBaseActivity", 2, "", localThrowable);
    }
  }
  
  protected void doOnConfigurationChanged(Configuration paramConfiguration) {}
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    sMobileQQappActivities.add(new WeakReference(this));
    mOnCreateBundle = null;
    mRuntime = MobileQQ.sMobileQQ.waitAppRuntime(null);
    return true;
  }
  
  protected void doOnDestroy()
  {
    sMobileQQappActivities.remove(new WeakReference(this));
  }
  
  protected boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void doOnNewIntent(Intent paramIntent) {}
  
  protected void doOnPause() {}
  
  protected void doOnPostCreate(Bundle paramBundle)
  {
    mPostCreateBundle = null;
  }
  
  protected void doOnPostResume() {}
  
  protected void doOnRestoreInstanceState(Bundle paramBundle) {}
  
  protected void doOnResume() {}
  
  protected void doOnSaveInstanceState(Bundle paramBundle) {}
  
  protected void doOnStart() {}
  
  protected void doOnStop() {}
  
  protected void doOnUserLeaveHint() {}
  
  protected void doOnWindowFocusChanged(boolean paramBoolean) {}
  
  public final AppRuntime getAppRuntime()
  {
    return mRuntime;
  }
  
  public SharedPreferences getSharedPreferences(String paramString, int paramInt)
  {
    return SharedPreferencesProxyManager.getInstance().getProxy(paramString, paramInt);
  }
  
  public final boolean isResume()
  {
    return mIsResume;
  }
  
  protected void onAccountChanged() {}
  
  protected void onAccoutChangeFailed() {}
  
  @Deprecated
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (!mIsSplashing) {
      doOnActivityResult(paramInt1, paramInt2, paramIntent);
    }
    for (;;)
    {
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
      mIsResultWaiting = true;
      mRequestCode = paramInt1;
      mResultCode = paramInt2;
      mResultData = paramIntent;
    }
  }
  
  @Deprecated
  public void onBackPressed()
  {
    if (mIsSplashing) {
      return;
    }
    doOnBackPressed();
  }
  
  @Deprecated
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (!mIsSplashing) {
      doOnConfigurationChanged(paramConfiguration);
    }
    super.onConfigurationChanged(paramConfiguration);
  }
  
  @Deprecated
  protected void onCreate(Bundle paramBundle)
  {
    Intent localIntent = getIntent();
    requestWindowFeature(localIntent);
    mIsSplashing = MobileQQ.sMobileQQ.onActivityCreate(this, localIntent);
    super.onCreate(paramBundle);
    if (mIsSplashing)
    {
      mOnCreateBundle = paramBundle;
      return;
    }
    doOnCreate(paramBundle);
  }
  
  @Deprecated
  protected void onDestroy()
  {
    if ((!mIsSplashing) || (mIsFinishingInOnCreate)) {
      doOnDestroy();
    }
    super.onDestroy();
  }
  
  @Deprecated
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (mIsSplashing) {
      return false;
    }
    return doOnKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void onLogout(Constants.LogoutReason paramLogoutReason)
  {
    finish();
  }
  
  @Deprecated
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    if (!mIsSplashing)
    {
      doOnNewIntent(paramIntent);
      return;
    }
    mNewIntent = paramIntent;
  }
  
  @Deprecated
  protected void onPause()
  {
    if (!mIsSplashing) {
      doOnPause();
    }
    int i = sResumeCount - 1;
    sResumeCount = i;
    if ((i <= 0) && (mRuntime != null)) {
      mRuntime.isBackground_Pause = true;
    }
    mIsResume = false;
    super.onPause();
  }
  
  @Deprecated
  protected void onPostCreate(Bundle paramBundle)
  {
    super.onPostCreate(paramBundle);
    if (!mIsSplashing)
    {
      doOnPostCreate(paramBundle);
      return;
    }
    mPostCreateBundle = paramBundle;
  }
  
  @Deprecated
  protected void onPostResume()
  {
    super.onPostResume();
    if (!mIsSplashing) {
      doOnPostResume();
    }
  }
  
  @Deprecated
  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
    if (!mIsSplashing)
    {
      doOnRestoreInstanceState(paramBundle);
      return;
    }
    mOnRestoreBundle = paramBundle;
  }
  
  @Deprecated
  protected void onResume()
  {
    super.onResume();
    mIsResume = true;
    int i = sResumeCount + 1;
    sResumeCount = i;
    if ((i > 0) && (mRuntime != null)) {
      mRuntime.isBackground_Pause = false;
    }
    if (!mIsSplashing) {
      doOnResume();
    }
  }
  
  @Deprecated
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (!mIsSplashing) {
      doOnSaveInstanceState(paramBundle);
    }
  }
  
  @Deprecated
  protected void onStart()
  {
    super.onStart();
    Foreground.onStart(mRuntime);
    if (!mIsSplashing)
    {
      doOnStart();
      return;
    }
    mIsStartSkipped = true;
  }
  
  @Deprecated
  protected void onStop()
  {
    Foreground.onStop(mRuntime);
    if (!mIsSplashing) {
      doOnStop();
    }
    for (;;)
    {
      super.onStop();
      return;
      mIsStartSkipped = false;
    }
  }
  
  @Deprecated
  protected void onUserLeaveHint()
  {
    if (!mIsSplashing) {
      doOnUserLeaveHint();
    }
    super.onUserLeaveHint();
  }
  
  @Deprecated
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    MobileQQ.sMobileQQ.onActivityFocusChanged(this, paramBoolean);
    super.onWindowFocusChanged(paramBoolean);
    if (!mIsSplashing)
    {
      doOnWindowFocusChanged(paramBoolean);
      return;
    }
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      mWindowFocusState = i;
      return;
    }
  }
  
  public boolean preloadData(AppRuntime paramAppRuntime, boolean paramBoolean)
  {
    return false;
  }
  
  public void preloadUi() {}
  
  public void realOnCreate()
  {
    boolean bool2 = true;
    if (mIsSplashing)
    {
      mIsSplashing = false;
      if ((!doOnCreate(mOnCreateBundle)) || (isFinishing())) {
        break label225;
      }
      localAppRuntime = mRuntime;
      if ((sResumeCount > 0) || (BaseActivity.sResumeCount > 0)) {
        break label210;
      }
      bool1 = true;
      isBackground_Pause = bool1;
      localAppRuntime = mRuntime;
      if (Foreground.sCountActivity > 0) {
        break label215;
      }
      bool1 = true;
      isBackground_Stop = bool1;
      if (mIsStartSkipped)
      {
        doOnStart();
        mIsStartSkipped = false;
        if (mOnRestoreBundle != null)
        {
          doOnRestoreInstanceState(mOnRestoreBundle);
          mOnRestoreBundle = null;
        }
        doOnPostCreate(mPostCreateBundle);
        if (mIsResultWaiting)
        {
          doOnActivityResult(mRequestCode, mResultCode, mResultData);
          mIsResultWaiting = false;
          mResultData = null;
        }
        if (mNewIntent != null)
        {
          doOnNewIntent(mNewIntent);
          mNewIntent = null;
        }
        if (isResume())
        {
          doOnResume();
          doOnPostResume();
        }
        if (mWindowFocusState != -1)
        {
          if (mWindowFocusState != 1) {
            break label220;
          }
          bool1 = bool2;
          doOnWindowFocusChanged(bool1);
        }
      }
    }
    label210:
    label215:
    label220:
    label225:
    while (!isFinishing()) {
      for (;;)
      {
        AppRuntime localAppRuntime;
        return;
        boolean bool1 = false;
        continue;
        bool1 = false;
        continue;
        bool1 = false;
      }
    }
    mIsSplashing = true;
    mIsFinishingInOnCreate = true;
  }
  
  protected void requestWindowFeature(Intent paramIntent) {}
  
  void setAppRuntime(AppRuntime paramAppRuntime)
  {
    mRuntime = paramAppRuntime;
  }
  
  public boolean showPreview()
  {
    return false;
  }
  
  public void superFinish()
  {
    super.finish();
  }
  
  public final void superStartActivityForResult(Intent paramIntent, int paramInt, Bundle paramBundle)
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      super.startActivityForResult(paramIntent, -1, paramBundle);
      return;
    }
    super.startActivityForResult(paramIntent, -1);
  }
}
