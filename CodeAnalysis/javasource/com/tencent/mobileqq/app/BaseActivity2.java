package com.tencent.mobileqq.app;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.hardware.SensorManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Process;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.GesturePWDUnlockActivity;
import com.tencent.mobileqq.activity.fling.FlingGestureHandler;
import com.tencent.mobileqq.activity.fling.FlingHandler;
import com.tencent.mobileqq.activity.fling.FlingTrackerHandler;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.startup.step.InitSkin;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableActivityProcesser;
import com.tencent.theme.SkinnableActivityProcesser.Callback;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import mqq.app.BaseActivity;
import mtj;
import mtk;

public class BaseActivity2
  extends BaseActivity
  implements SkinnableActivityProcesser.Callback
{
  public static boolean F = true;
  private static final int jdField_a_of_type_Int = 2;
  public static BaseActivity2 a;
  private static ShakeListener jdField_a_of_type_ComTencentMobileqqAppShakeListener;
  private static boolean jdField_a_of_type_Boolean;
  protected static final String v;
  public boolean D = true;
  protected boolean E = true;
  public boolean G = true;
  public boolean H = true;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  private FlingHandler jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler;
  public ScreenShot a;
  SkinnableActivityProcesser jdField_a_of_type_ComTencentThemeSkinnableActivityProcesser;
  public SystemBarCompact a;
  private String jdField_a_of_type_JavaLangString = getClass().getSimpleName();
  protected int t = 0;
  protected String w;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    v = BaseActivity2.class.getSimpleName();
  }
  
  public BaseActivity2() {}
  
  private void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppScreenShot != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppScreenShot.a();
      jdField_a_of_type_ComTencentMobileqqAppScreenShot = null;
    }
  }
  
  private void a(boolean paramBoolean)
  {
    if (paramBoolean) {
      if (jdField_a_of_type_ComTencentMobileqqAppShakeListener == null) {
        ThreadManager.a(new mtj(this), 5, null, true);
      }
    }
    while (jdField_a_of_type_ComTencentMobileqqAppShakeListener == null) {
      return;
    }
    ((SensorManager)getSystemService("sensor")).unregisterListener(jdField_a_of_type_ComTencentMobileqqAppShakeListener);
    jdField_a_of_type_ComTencentMobileqqAppShakeListener = null;
  }
  
  private boolean a(Intent paramIntent)
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
  
  protected void A()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(v, 4, "startUnlockActivity..." + jdField_a_of_type_JavaLangString);
    }
    startActivity(new Intent(this, GesturePWDUnlockActivity.class));
  }
  
  protected void B()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(v, 4, "checkUnlockForSpecial. flag=,AbsAppInter.visibleActCnt=?,stopflag" + t);
    }
  }
  
  public View a(int paramInt)
  {
    return findViewById(paramInt);
  }
  
  public View a(View paramView, int paramInt)
  {
    return paramView.findViewById(paramInt);
  }
  
  public ViewGroup.LayoutParams a(View paramView)
  {
    return paramView.getLayoutParams();
  }
  
  protected boolean a()
  {
    return true;
  }
  
  protected boolean c()
  {
    return false;
  }
  
  public int e()
  {
    return getResources().getDimensionPixelSize(2131492908);
  }
  
  public void onBackPressed()
  {
    if (c()) {
      return;
    }
    try
    {
      super.onBackPressed();
      return;
    }
    catch (Throwable localThrowable)
    {
      if (QLog.isColorLevel()) {
        QLog.d(v, 2, "", localThrowable);
      }
      finish();
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if ((a()) && (jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler.onConfigurationChanged(paramConfiguration);
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (QLog.isColorLevel()) {
      QLog.i(v, 2, "[" + hashCode() + "]" + jdField_a_of_type_JavaLangString + " process id =" + Process.myPid() + " onCreate task : " + getTaskId());
    }
    try
    {
      paramBundle = BaseApplicationImpl.a;
      if (Build.VERSION.SDK_INT <= 10) {
        break label348;
      }
      i = 4;
    }
    catch (IllegalStateException paramBundle)
    {
      try
      {
        for (;;)
        {
          registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramBundle);
          if ((G) && (ImmersiveUtils.isSupporImmersive() == 1))
          {
            getWindow().addFlags(67108864);
            if (H) {
              jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact = new SystemBarCompact(this, true, getResources().getColor(2131428205));
            }
          }
          return;
          int i = 0;
          continue;
          paramBundle = paramBundle;
          w = null;
          if (QLog.isColorLevel()) {
            QLog.e(v, 2, "Get lastLoginUin error", paramBundle);
          }
        }
        jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler = new FlingGestureHandler(this);
      }
      catch (Exception paramBundle)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e(v, 2, "registerReceiver error", paramBundle);
          }
        }
      }
    }
    w = paramBundle.getSharedPreferences("Last_Login", i).getString("uin", null);
    if ((w == null) && (QLog.isColorLevel())) {
      QLog.d(v, 1, "last uin is null.. has porblem?");
    }
    StatisticCollector.a(this).a(this);
    if (InitSkin.jdField_a_of_type_Boolean) {
      jdField_a_of_type_ComTencentThemeSkinnableActivityProcesser = new SkinnableActivityProcesser(this, this);
    }
    paramBundle = getIntent().getExtras();
    if (paramBundle != null)
    {
      i = paramBundle.getInt("fling_action_key");
      if ((i != 0) && (a()))
      {
        if (1 == i) {
          jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler = new FlingTrackerHandler(this);
        }
      }
      else {
        E = paramBundle.getBoolean("PhotoConst.ALLOW_LOCK", true);
      }
    }
    else
    {
      if (!jdField_a_of_type_Boolean)
      {
        if (SettingCloneUtil.readValue(this, null, getString(2131367557), "qqsetting_screenshot_key", false)) {
          a(true);
        }
        jdField_a_of_type_Boolean = true;
      }
      paramBundle = new IntentFilter();
      paramBundle.addAction("android.intent.action.SCREEN_OFF");
      jdField_a_of_type_AndroidContentBroadcastReceiver = new mtk(this, null);
    }
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    if (QLog.isColorLevel()) {
      QLog.i(v, 2, "[" + hashCode() + "]" + jdField_a_of_type_JavaLangString + " process id =" + Process.myPid() + " onDestroy task : " + getTaskId());
    }
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity2 = null;
    StatisticCollector.a(this).d(this);
    if (jdField_a_of_type_AndroidContentBroadcastReceiver != null) {}
    try
    {
      unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      if (jdField_a_of_type_ComTencentThemeSkinnableActivityProcesser != null) {
        jdField_a_of_type_ComTencentThemeSkinnableActivityProcesser.destory();
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public void onPause()
  {
    super.onPause();
    if (QLog.isColorLevel()) {
      QLog.d(v, 2, "[" + hashCode() + "]" + jdField_a_of_type_JavaLangString + " onPause");
    }
    D = true;
    StatisticCollector.a(this).c(this);
    a();
  }
  
  public void onPostThemeChanged() {}
  
  public void onPreThemeChanged() {}
  
  public void onResume()
  {
    super.onResume();
    if (QLog.isColorLevel()) {
      QLog.d(v, 2, "[" + hashCode() + "]" + jdField_a_of_type_JavaLangString + " onResume ");
    }
    D = false;
    StatisticCollector.a(this).b(this);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity2 = this;
    int i;
    SharedPreferences.Editor localEditor;
    if (Build.VERSION.SDK_INT > 10)
    {
      i = 4;
      localEditor = getSharedPreferences("screen_shot", i).edit();
      localEditor.putString("currentactivity", getClass().getName());
      if (Build.VERSION.SDK_INT <= 8) {
        break label273;
      }
      localEditor.apply();
      label129:
      F = GesturePWDUtils.getAppForground(this);
      if (QLog.isDevelopLevel()) {
        QLog.d(v, 4, "onResume.mAppForground = " + F + ",mCanLock=" + E);
      }
      if ((F) || (!E) || (w == null) || (!GesturePWDUtils.getJumpLock(this, w))) {
        break label283;
      }
      A();
    }
    for (;;)
    {
      if (!F)
      {
        F = true;
        GesturePWDUtils.setAppForground(this, F);
      }
      t = 0;
      E = true;
      if ((jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact != null) && (H)) {
        jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact.init();
      }
      return;
      i = 0;
      break;
      label273:
      localEditor.commit();
      break label129;
      label283:
      if ((!F) && (E)) {
        B();
      }
    }
  }
  
  public void onStart()
  {
    super.onStart();
    if (QLog.isColorLevel()) {
      QLog.d(v, 2, "[" + hashCode() + "]" + jdField_a_of_type_JavaLangString + " onStart");
    }
    if ((a()) && (jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityFlingFlingHandler.onStart();
    }
  }
  
  public void onStop()
  {
    super.onStop();
    if (QLog.isColorLevel()) {
      QLog.d(v, 2, "[" + hashCode() + "]" + jdField_a_of_type_JavaLangString + " onStop");
    }
    t = 1;
    F = GesturePWDUtils.isAppOnForeground(this);
    if (!F) {
      GesturePWDUtils.setAppForground(this, F);
    }
    if (QLog.isColorLevel()) {
      QLog.d(v, 2, "zsw subaccount onStop stop get sub msg AbsAppInter.visibleActCnt = ?");
    }
  }
  
  public void startActivityForResult(Intent paramIntent, int paramInt)
  {
    t = 2;
    if (a(paramIntent)) {
      E = false;
    }
    switch (2)
    {
    }
    try
    {
      super.startActivityForResult(paramIntent, paramInt);
      return;
    }
    catch (Exception paramIntent)
    {
      if (!QLog.isColorLevel()) {
        return;
      }
      QLog.d(v, 2, "startActivity failed with: ", paramIntent);
      return;
      paramIntent.putExtra("fling_action_key", 2);
      paramIntent.putExtra("fling_code_key", hashCode());
      super.startActivityForResult(paramIntent, paramInt);
    }
    super.startActivityForResult(paramIntent, paramInt);
    return;
  }
}
