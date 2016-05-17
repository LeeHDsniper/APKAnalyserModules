package com.tencent.mobileqq.app;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.hardware.SensorManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Process;
import android.os.SystemClock;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.util.MQLruCache;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnSystemUiVisibilityChangeListener;
import android.view.Window;
import com.tencent.common.app.AppInterface;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.GesturePWDUnlockActivity;
import com.tencent.mobileqq.activity.InstallActivity;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.activity.UserguideActivity;
import com.tencent.mobileqq.activity.fling.FlingAllowProvider;
import com.tencent.mobileqq.activity.fling.FlingGestureHandler;
import com.tencent.mobileqq.activity.fling.FlingHandler;
import com.tencent.mobileqq.activity.fling.FlingTrackerHandler;
import com.tencent.mobileqq.activity.fling.ScreenCapture;
import com.tencent.mobileqq.activity.qfileJumpActivity;
import com.tencent.mobileqq.activity.recent.RecentDataListManager;
import com.tencent.mobileqq.app.memory.MemoryReporter;
import com.tencent.mobileqq.equipmentlock.EquipmentLockImpl;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.statistics.UnifiedMonitor;
import com.tencent.mobileqq.statistics.ViewExposeUtil;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinEngine;
import com.tencent.theme.SkinnableActivityProcesser;
import com.tencent.theme.SkinnableActivityProcesser.Callback;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import cooperation.qlink.QlinkBridgeActivity;
import cooperation.qlink.QlinkShareJumpActivity;
import cooperation.qqfav.widget.QfavJumpActivity;
import java.io.File;
import java.lang.reflect.Field;
import mqq.app.AppActivity;
import mqq.app.AppRuntime;
import mqq.app.Foreground;
import mqq.os.MqqHandler;
import mqq.os.MqqInterceptHandler;
import mtd;
import mte;
import mtf;
import mth;

public class BaseActivity
  extends AppActivity
  implements SkinnableActivityProcesser.Callback
{
  public static final String TAG = "qqBaseActivity";
  public static boolean isUnLockSuccess = false;
  public static long mAppBackgroundTime = 0L;
  public static boolean mAppForground;
  public static boolean mIsInMultiScreen;
  private static BroadcastReceiver mScreenReceiver;
  protected static long mShowGesture = 0L;
  public static Drawable sAIOBgCache;
  private static boolean sSensorReady;
  public static BaseActivity sTopActivity;
  private static ShakeListener shakeListener;
  public QQAppInterface app;
  private String className = getClass().getSimpleName();
  private long currentActivityStayTime;
  public boolean mActNeedImmersive = true;
  public boolean mCanLock = true;
  private FlingHandler mFlingHandler;
  public boolean mNeedStatusTrans = true;
  public int mStopFlag = 0;
  public SystemBarCompact mSystemBarComp;
  SkinnableActivityProcesser processer;
  public ScreenShot screenShot;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    mAppForground = true;
  }
  
  public BaseActivity() {}
  
  private void cleanScreenShot()
  {
    if (screenShot != null)
    {
      screenShot.a();
      screenShot = null;
    }
  }
  
  public static boolean isMoveTaskToBack(Context paramContext, Intent paramIntent)
  {
    if (paramIntent.getComponent() == null) {}
    while (!paramIntent.getComponent().getPackageName().equals(paramContext.getPackageName())) {
      return true;
    }
    return false;
  }
  
  private boolean isStartQQ3rdApp(Intent paramIntent)
  {
    String str = paramIntent.getAction();
    if ((!TextUtils.isEmpty(str)) && (str.equals("android.media.action.IMAGE_CAPTURE"))) {}
    do
    {
      do
      {
        do
        {
          return true;
        } while (((!TextUtils.isEmpty(str)) && (str.equals("android.intent.action.GET_CONTENT"))) || ((!TextUtils.isEmpty(str)) && (str.equals("android.intent.action.PICK"))));
        paramIntent = paramIntent.getComponent();
        if (paramIntent == null) {
          break;
        }
        str = paramIntent.getPackageName();
      } while ((!TextUtils.isEmpty(str)) && (str.equals("com.qzone")));
      paramIntent = paramIntent.getClassName();
    } while ((!TextUtils.isEmpty(paramIntent)) && (paramIntent.equals("com.tencent.mobileqq.activity.QQBrowserDelegationActivity")));
    return false;
  }
  
  private void replaceActivityHandler()
  {
    try
    {
      Field localField = Activity.class.getDeclaredField("mHandler");
      localField.setAccessible(true);
      Handler localHandler = MqqInterceptHandler.createMqqHandler((Handler)localField.get(this));
      if (localHandler != null) {
        localField.set(this, localHandler);
      }
      return;
    }
    catch (Exception localException)
    {
      QLog.e("qqBaseActivity", 1, "", localException);
    }
  }
  
  private void startActivityForResult(Intent paramIntent, int paramInt1, int paramInt2)
  {
    if (Math.abs(mShowGesture - SystemClock.uptimeMillis()) < 1000L)
    {
      QLog.d("qqBaseActivity", 1, "startActivityForResult" + mShowGesture);
      label44:
      return;
    }
    QLog.d("Hyim", 4, "startActivityForResult: " + paramIntent.getComponent());
    mStopFlag = 2;
    if (isStartQQ3rdApp(paramIntent)) {
      mCanLock = false;
    }
    if (!isMoveTaskToBack(this, paramIntent)) {
      paramIntent.addFlags(262144);
    }
    String str = paramIntent.getStringExtra("selfSet_leftViewText");
    if (TextUtils.isEmpty(str)) {
      paramIntent.putExtra("leftViewText", setLastActivityName());
    }
    for (;;)
    {
      switch (paramInt2)
      {
      default: 
        try
        {
          super.startActivityForResult(paramIntent, paramInt1);
          return;
        }
        catch (Exception paramIntent) {}
        if (!QLog.isColorLevel()) {
          break label44;
        }
        QLog.d("qqBaseActivity", 2, "startActivity failed with: ", paramIntent);
        return;
        paramIntent.putExtra("leftViewText", str);
        paramIntent.removeExtra("selfSet_leftViewText");
      }
    }
    super.startActivityForResult(paramIntent, paramInt1);
    return;
    if ((app != null) && (FlingAllowProvider.contain(getCurrentAccountUin())))
    {
      paramInt2 = hashCode();
      str = ScreenCapture.getSnapPath(this, paramInt2);
      if (str != null)
      {
        ScreenCapture.captureViewToFile(str, getWindow().getDecorView());
        paramIntent.putExtra("fling_action_key", 1);
        paramIntent.putExtra("fling_code_key", paramInt2);
      }
    }
    super.startActivityForResult(paramIntent, paramInt1);
    return;
    paramInt2 = hashCode();
    paramIntent.putExtra("fling_action_key", 2);
    paramIntent.putExtra("fling_code_key", paramInt2);
    super.startActivityForResult(paramIntent, paramInt1);
  }
  
  public void addObserver(BusinessObserver paramBusinessObserver)
  {
    AppInterface localAppInterface = getAppInterface();
    if (localAppInterface != null) {
      localAppInterface.a(paramBusinessObserver);
    }
  }
  
  protected void checkUnlockForSpecial()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("qqBaseActivity", 4, "checkUnlockForSpecial. flag=,AbsAppInter.visibleActCnt=" + Foreground.sCountActivity + ",stopflag" + mStopFlag);
    }
  }
  
  public boolean doDispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent.getAction() == 1)
    {
      if ((paramKeyEvent.getKeyCode() != 24) || (!new File("/mnt/sdcard/skin/res/").isDirectory())) {
        break label71;
      }
      if (SkinEngine.getInstances().getSkinRootPath() == null) {
        break label57;
      }
      SkinEngine.getInstances().setSkinRootPath(this, null);
    }
    for (;;)
    {
      return super.doDispatchKeyEvent(paramKeyEvent);
      label57:
      SkinEngine.getInstances().setSkinRootPath(this, "/mnt/sdcard/skin/res/");
      continue;
      label71:
      if ((paramKeyEvent.getKeyCode() == 25) && (new File("/mnt/sdcard/skin2/res/").isDirectory())) {
        if (SkinEngine.getInstances().getSkinRootPath() != null) {
          SkinEngine.getInstances().setSkinRootPath(this, null);
        } else {
          SkinEngine.getInstances().setSkinRootPath(this, "/mnt/sdcard/skin2/res/", false);
        }
      }
    }
  }
  
  public void doOnBackPressed()
  {
    if (!onBackEvent()) {}
    try
    {
      super.doOnBackPressed();
      if (((this instanceof FragmentActivity)) && (!((FragmentActivity)this).getThisFragmentManager().popBackStackImmediate())) {
        finish();
      }
      return;
    }
    catch (Throwable localThrowable)
    {
      if (QLog.isColorLevel()) {
        QLog.d("qqBaseActivity", 2, "", localThrowable);
      }
      finish();
    }
  }
  
  public void doOnConfigurationChanged(Configuration paramConfiguration)
  {
    super.doOnConfigurationChanged(paramConfiguration);
    if ((isWrapContent()) && (mFlingHandler != null)) {
      mFlingHandler.onConfigurationChanged(paramConfiguration);
    }
  }
  
  public boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    int i = Build.VERSION.SDK_INT;
    StatisticCollector.a(this).a(this);
    setImmersiveStatus();
    replaceActivityHandler();
    processer = new SkinnableActivityProcesser(this, this);
    if (QLog.isColorLevel()) {
      QLog.i("qqBaseActivity", 2, "[" + hashCode() + "]" + className + " process id =" + Process.myPid() + " onCreate task : " + getTaskId());
    }
    updateAppRuntime();
    if (getAppRuntime() != null) {
      setVolumeControlStream(3);
    }
    if (!sSensorReady)
    {
      ThreadManager.b().postDelayed(new mtd(this), 300L);
      sSensorReady = true;
    }
    paramBundle = getIntent().getExtras();
    if (paramBundle != null) {}
    try
    {
      i = paramBundle.getInt("fling_action_key");
      if ((i != 0) && (isWrapContent()))
      {
        if ((1 == i) && (getAppRuntime() != null) && (FlingAllowProvider.contain(getCurrentAccountUin()))) {
          mFlingHandler = new FlingTrackerHandler(this);
        }
      }
      else
      {
        setOnMultiScreenChangeListener();
        return false;
      }
    }
    catch (Exception paramBundle)
    {
      for (;;)
      {
        i = 0;
        continue;
        mFlingHandler = new FlingGestureHandler(this);
      }
    }
  }
  
  public void doOnDestroy()
  {
    super.doOnDestroy();
    StatisticCollector.a(this).d(this);
    if (processer != null) {
      processer.destory();
    }
    if (QLog.isColorLevel()) {
      QLog.i("qqBaseActivity", 2, "[" + hashCode() + "]" + className + " process id =" + Process.myPid() + " onDestroy task : " + getTaskId());
    }
    AppInterface localAppInterface = getAppInterface();
    if (localAppInterface != null) {
      localAppInterface.a(getClass());
    }
    if ((aa > 0.0F) && (BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null)) {
      BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache.releaseLargeCache();
    }
    if (sTopActivity == this) {
      sTopActivity = null;
    }
    if ((1 == BaseApplicationImpl.i) && ((ac) || (aa))) {
      ThreadManager.c().post(new mte(this));
    }
  }
  
  public void doOnPause()
  {
    super.doOnPause();
    StatisticCollector.a(this).c(this);
    BaseActivity localBaseActivity = sTopActivity;
    if ((currentActivityStayTime != 0L) && (localBaseActivity != null) && (UnifiedMonitor.a().whetherReportThisTime(8))) {
      UnifiedMonitor.a().addEvent(8, localBaseActivity.getClass().getName(), (int)(SystemClock.uptimeMillis() - currentActivityStayTime), 0, null);
    }
    cleanScreenShot();
    if (QLog.isColorLevel()) {
      QLog.d("qqBaseActivity", 2, "[" + hashCode() + "]" + className + " onPause");
    }
  }
  
  public void doOnResume()
  {
    super.doOnResume();
    sTopActivity = this;
    StatisticCollector.a(this).b(this);
    currentActivityStayTime = SystemClock.uptimeMillis();
    if (mSystemBarComp != null) {
      mSystemBarComp.init();
    }
    Object localObject;
    if ((this instanceof NotificationActivity))
    {
      EquipmentLockImpl.a().b();
      localObject = getSharedPreferences("screen_shot", 4).edit();
      ((SharedPreferences.Editor)localObject).putString("currentactivity", getClass().getName());
      if (Build.VERSION.SDK_INT <= 8) {
        break label409;
      }
      ((SharedPreferences.Editor)localObject).apply();
      label95:
      mAppForground = GesturePWDUtils.getAppForground(getActivity());
      if (QLog.isColorLevel()) {
        QLog.d("qqBaseActivity", 2, "[" + hashCode() + "]" + className + " onResume.mAppForground = " + mAppForground + ",mCanLock=" + mCanLock);
      }
      if (mAppBackgroundTime > 0L) {
        ViewExposeUtil.a(SystemClock.elapsedRealtime() - mAppBackgroundTime);
      }
      mAppBackgroundTime = 0L;
      localObject = getCurrentAccountUin();
      if (((mAppForground) && ((!"com.tencent.mobileqq".equals(BaseApplicationImpl.processName)) || (isUnLockSuccess))) || (!mCanLock) || (localObject == null) || (!GesturePWDUtils.getJumpLock(getActivity(), (String)localObject)) || ((getActivity() instanceof GesturePWDUnlockActivity)) || ((getActivity() instanceof InstallActivity)) || ((getActivity() instanceof UserguideActivity)) || ((getActivity() instanceof JumpActivity)) || ((getActivity() instanceof qfileJumpActivity)) || ((getActivity() instanceof QfavJumpActivity)) || ((getActivity() instanceof LoginActivity)) || ((getActivity() instanceof QlinkBridgeActivity)) || ((getActivity() instanceof QlinkShareJumpActivity))) {
        break label419;
      }
      startUnlockActivity();
    }
    for (;;)
    {
      if ((!mAppForground) && (!(this instanceof JumpActivity)))
      {
        mAppForground = true;
        GesturePWDUtils.setAppForground(getActivity(), mAppForground);
      }
      mStopFlag = 0;
      mCanLock = true;
      if (GuardManager.a != null) {
        GuardManager.a.b(1, getPreProcess());
      }
      return;
      EquipmentLockImpl.a().a();
      break;
      label409:
      ((SharedPreferences.Editor)localObject).commit();
      break label95;
      label419:
      if ((!mAppForground) && (mCanLock)) {
        checkUnlockForSpecial();
      } else if ((!mAppForground) && (!mCanLock)) {
        isUnLockSuccess = true;
      }
    }
  }
  
  public void doOnStart()
  {
    super.doOnStart();
    cleanScreenShot();
    if (QLog.isColorLevel()) {
      QLog.d("qqBaseActivity", 2, "[" + hashCode() + "]" + className + " onStart " + Foreground.sCountActivity);
    }
    if ((isWrapContent()) && (mFlingHandler != null)) {
      mFlingHandler.onStart();
    }
  }
  
  public void doOnStop()
  {
    super.doOnStop();
    if (QLog.isColorLevel()) {
      QLog.d("qqBaseActivity", 2, "[" + hashCode() + "]" + className + " onStop " + Foreground.sCountActivity);
    }
    cleanScreenShot();
    mStopFlag = 1;
    mAppForground = GesturePWDUtils.isAppOnForeground(this);
    if (!mAppForground)
    {
      GesturePWDUtils.setAppForground(this, mAppForground);
      isUnLockSuccess = false;
      mAppBackgroundTime = SystemClock.elapsedRealtime();
    }
  }
  
  public void doOnWindowFocusChanged(boolean paramBoolean)
  {
    super.doOnWindowFocusChanged(paramBoolean);
    if ((app != null) && (paramBoolean)) {
      app.i();
    }
  }
  
  public void finish()
  {
    try
    {
      super.finish();
      return;
    }
    catch (Exception localException) {}
  }
  
  @Deprecated
  public Activity getActivity()
  {
    return this;
  }
  
  public AppInterface getAppInterface()
  {
    AppRuntime localAppRuntime = getAppRuntime();
    if ((localAppRuntime instanceof AppInterface)) {
      return (AppInterface)localAppRuntime;
    }
    return null;
  }
  
  public String getCurrentAccountUin()
  {
    AppRuntime localAppRuntime = getAppRuntime();
    if (localAppRuntime == null) {
      return "";
    }
    if ((localAppRuntime instanceof AppInterface)) {
      return ((AppInterface)localAppRuntime).a();
    }
    return localAppRuntime.getAccount();
  }
  
  protected String getPreProcess()
  {
    return null;
  }
  
  public SharedPreferences getSharedPreferences(String paramString, int paramInt)
  {
    return SharedPreferencesProxyManager.getInstance().getProxy(paramString, paramInt);
  }
  
  public int getTitleBarHeight()
  {
    return getResources().getDimensionPixelSize(2131492908);
  }
  
  public boolean isSupportScreenShot()
  {
    return true;
  }
  
  protected boolean isWrapContent()
  {
    return true;
  }
  
  public void onAccountChanged()
  {
    super.onAccountChanged();
    StringBuilder localStringBuilder;
    if (QLog.isColorLevel())
    {
      localStringBuilder = new StringBuilder().append("onAccountChanged ");
      if (getAppRuntime() != null) {
        break label67;
      }
    }
    label67:
    for (boolean bool = true;; bool = false)
    {
      QLog.d("qqBaseActivity", 2, bool);
      if (app != null) {
        app.a(0L);
      }
      updateAppRuntime();
      return;
    }
  }
  
  public boolean onBackEvent()
  {
    return false;
  }
  
  public void onPostThemeChanged() {}
  
  public void onPreThemeChanged() {}
  
  public boolean preloadData(AppRuntime paramAppRuntime, boolean paramBoolean)
  {
    if ((paramAppRuntime != null) && ((paramAppRuntime instanceof QQAppInterface)) && (paramAppRuntime.isLogin()))
    {
      paramAppRuntime = (QQAppInterface)paramAppRuntime;
      return RecentDataListManager.a().a(paramAppRuntime, BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, paramBoolean);
    }
    return false;
  }
  
  public void receiveScreenOff() {}
  
  public void removeObserver(BusinessObserver paramBusinessObserver)
  {
    AppInterface localAppInterface = getAppInterface();
    if (localAppInterface != null) {
      localAppInterface.b(paramBusinessObserver);
    }
  }
  
  public void setCanLock(boolean paramBoolean)
  {
    mCanLock = paramBoolean;
  }
  
  public void setContentBackgroundResource(int paramInt)
  {
    findViewById(16908290).setBackgroundResource(paramInt);
  }
  
  public void setImmersiveStatus()
  {
    if ((mNeedStatusTrans) && (ImmersiveUtils.isSupporImmersive() == 1))
    {
      getWindow().addFlags(67108864);
      if (mActNeedImmersive)
      {
        int i = getResources().getColor(2131428205);
        if (mSystemBarComp == null) {
          mSystemBarComp = new SystemBarCompact(this, true, i);
        }
      }
    }
  }
  
  public String setLastActivityName()
  {
    return getString(2131367694);
  }
  
  public void setOnMultiScreenChangeListener()
  {
    if (Build.VERSION.SDK_INT >= 21)
    {
      mtf localMtf = new mtf(this);
      View localView = getWindow().getDecorView();
      localView.setOnSystemUiVisibilityChangeListener(localMtf);
      if (localView.getSystemUiVisibility() != 0) {
        localMtf.onSystemUiVisibilityChange(localView.getSystemUiVisibility());
      }
      if (QLog.isDevelopLevel()) {
        QLog.d("qqBaseActivity", 4, "setOnMultiScreenChangeListener:" + localView.getSystemUiVisibility() + ",Activity name:" + getClass().getName());
      }
    }
  }
  
  public void startActivity(Intent paramIntent)
  {
    JumpActivity.a(paramIntent);
    super.startActivity(paramIntent);
  }
  
  public void startActivity(Intent paramIntent, Bundle paramBundle)
  {
    JumpActivity.a(paramIntent);
    super.startActivity(paramIntent, paramBundle);
  }
  
  public void startActivityForResult(Intent paramIntent, int paramInt)
  {
    JumpActivity.a(paramIntent);
    startActivityForResult(paramIntent, paramInt, 2);
  }
  
  public void startActivityForResult(Intent paramIntent, int paramInt, Bundle paramBundle)
  {
    JumpActivity.a(paramIntent);
    super.startActivityForResult(paramIntent, paramInt, paramBundle);
  }
  
  public void startUnlockActivity()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("qqBaseActivity", 4, "startUnlockActivity..." + className);
    }
    startActivity(new Intent(this, GesturePWDUnlockActivity.class));
    mShowGesture = SystemClock.uptimeMillis();
  }
  
  public void turnOffShake()
  {
    if (shakeListener != null)
    {
      ((SensorManager)getSystemService("sensor")).unregisterListener(shakeListener);
      shakeListener = null;
    }
  }
  
  public void turnOnShake()
  {
    if (shakeListener == null)
    {
      mth localMth = new mth(null);
      SensorManager localSensorManager = (SensorManager)getSystemService("sensor");
      localSensorManager.registerListener(localMth, localSensorManager.getDefaultSensor(1), 0);
      shakeListener = localMth;
    }
  }
  
  public void updateAppRuntime()
  {
    AppRuntime localAppRuntime = getAppRuntime();
    if ((localAppRuntime instanceof QQAppInterface)) {
      app = ((QQAppInterface)localAppRuntime);
    }
    if (QLog.isColorLevel()) {
      QLog.i("qqBaseActivity", 4, "updateAppRuntime, " + localAppRuntime);
    }
  }
}
