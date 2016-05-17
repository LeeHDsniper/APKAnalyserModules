package com.tencent.mobileqq.activity;

import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import com.tencent.biz.thridappshare.ThridAppShareHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.fling.TopGestureLayout;
import com.tencent.mobileqq.activity.main.MainUtils;
import com.tencent.mobileqq.activity.recent.DrawerFrame;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FrameHelperActivity;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.fpsreport.FPSSwipListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.RedTypeInfo;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.immersive.SystemBarCompact;
import java.lang.ref.WeakReference;
import kaz;
import kbb;
import kbc;
import mqq.app.Constants.LogoutReason;
import mqq.os.MqqHandler;

public class SplashActivity
  extends FragmentActivity
{
  public static final int a = 1;
  private static volatile SplashActivity jdField_a_of_type_ComTencentMobileqqActivitySplashActivity;
  public static final String a = "SplashActivity";
  public static boolean a = false;
  public static final int b = 2;
  public static int c = 0;
  public static final String c = "tab_index";
  public static final String d = "fragment_id";
  public static final String e = "switch_anim";
  private long jdField_a_of_type_Long;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = null;
  public View a;
  public View[] a;
  public View b;
  public String b;
  public boolean b;
  private boolean c;
  private String f = null;
  private String g = null;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity = null;
    jdField_c_of_type_Int = 1;
    if (!"Success".equals(BaseApplicationImpl.sInjectResult))
    {
      String str = "sInjectResult:" + BaseApplicationImpl.sInjectResult;
      try
      {
        throw new IllegalAccessError("SplashActivity escapes!");
      }
      catch (Throwable localThrowable)
      {
        BaseApplicationImpl.jdField_b_of_type_JavaLangString = str + "\n" + Log.getStackTraceString(localThrowable);
        return;
      }
    }
    BaseApplicationImpl.jdField_b_of_type_JavaLangString = "";
  }
  
  public SplashActivity()
  {
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
  }
  
  private boolean a(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("uin");
    int i = paramIntent.getIntExtra("uintype", -1);
    if (str == null) {
      return false;
    }
    if (i == -1)
    {
      QQToast.a(this, getString(2131367236), 0).b(getTitleBarHeight());
      return false;
    }
    if (paramIntent.hasExtra("account"))
    {
      ReportController.b((QQAppInterface)mRuntime, "CliOper", "", "", "Fast_launch", "Fast_launch_msg", 0, 0, "1", "", "", "");
      if (!((FriendsManager)app.getManager(50)).b(str))
      {
        paramIntent.removeExtra("account");
        paramIntent.putExtra("shotcut_forward", ChatActivity.class.getName());
        paramIntent.setClassName(this, ShortcutRouterActivity.class.getName());
        super.startActivity(paramIntent);
        return false;
      }
    }
    if ((paramIntent.getBooleanExtra("shortcut", false)) && (!((FriendsManager)app.getManager(50)).b(str)))
    {
      QQToast.a(getApplicationContext(), getString(2131367044), 0).b(getTitleBarHeight());
      return false;
    }
    return true;
  }
  
  private boolean a(boolean paramBoolean, Intent paramIntent)
  {
    StartupTracker.a(null, "AIO_doOnCreate_BeforeEnterCost");
    if (!app.isLogin())
    {
      paramIntent = new Intent();
      paramIntent.setClass(this, LoginActivity.class);
      paramIntent.addFlags(262144);
      super.startActivity(paramIntent);
      finish();
    }
    do
    {
      do
      {
        do
        {
          return true;
          if (paramBoolean)
          {
            if (a(paramIntent)) {
              break label176;
            }
            finish();
            return true;
          }
          if (!isFinishing()) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d("SplashActivity", 2, "onNewIntent isFinishing");
        return true;
        if (!ThridAppShareHelper.a().a(paramIntent, this, app)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("Q.aio.SplashActivity", 2, "onNewIntent ThridApp to chatactivity");
      return true;
      Bundle localBundle = paramIntent.getExtras();
      if ((localBundle == null) || (!localBundle.getBoolean("back_from_emojimall", false))) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.aio.SplashActivity", 2, "onNewIntent KEY_EMOJIMALL_CLOSE_BACK to chatactivity");
    return true;
    if (!a(paramIntent))
    {
      finish();
      return true;
    }
    label176:
    StartupTracker.a("AIO_doOnCreate_BeforeEnterCost", null);
    return false;
  }
  
  private void c()
  {
    if (AIOUtils.jdField_a_of_type_Boolean) {}
    do
    {
      return;
      AIOUtils.jdField_b_of_type_Boolean = getIntent().getBooleanExtra("traceviewSwitch", false);
      AIOUtils.jdField_c_of_type_Boolean = getIntent().getBooleanExtra("forbidChatFont", false);
      AIOUtils.d = getIntent().getBooleanExtra("forbidHeadPendant", false);
      AIOUtils.f = getIntent().getBooleanExtra("forbidChatBubble", false);
      AIOUtils.g = getIntent().getBooleanExtra("logDBOperation", false);
      ThreadManager.jdField_b_of_type_Boolean = getIntent().getBooleanExtra("logBgTaskMonitor", false);
      AIOUtils.jdField_a_of_type_Boolean = true;
    } while (!QLog.isColorLevel());
    QLog.d("SplashActivity", 2, "traceviewSwitch: " + AIOUtils.jdField_b_of_type_Boolean + " isForbidChatFontFun: " + AIOUtils.jdField_c_of_type_Boolean + " isForbidHeadPendantFun: " + AIOUtils.d + " isForbidChatBubbleFun: " + AIOUtils.f + " logcatDBOperation: " + AIOUtils.g + " isEnableAutoDumpLeak: " + AppSetting.j);
  }
  
  private void c(Intent paramIntent)
  {
    switch (paramIntent.getIntExtra("forward", -1))
    {
    }
    for (;;)
    {
      getIntent().removeExtra("forward");
      return;
      Intent localIntent = AIOUtils.a(new Intent(this, SplashActivity.class), null);
      localIntent.putExtra("uin", paramIntent.getStringExtra("uin"));
      localIntent.putExtra("uintype", paramIntent.getIntExtra("uintype", 0));
      localIntent.putExtra("yuyin", paramIntent.getBooleanExtra("yuyin", false));
      localIntent.putExtra("uinname", paramIntent.getStringExtra("uinname"));
      localIntent.putExtra("enterchatwin", true);
      startActivity(localIntent);
      getIntent().removeExtra("fromMsgBox");
      continue;
      paramIntent = paramIntent.getParcelableExtra("AllInOne");
      if ((paramIntent instanceof ProfileActivity.AllInOne))
      {
        paramIntent = (ProfileActivity.AllInOne)paramIntent;
        f = 100;
        g = 6;
        ProfileActivity.b(this, paramIntent);
      }
    }
  }
  
  public int a()
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      return ((MainFragment)localFragment).a();
    }
    return 0;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.SplashActivity", 4, "clearAIO");
    }
    Object localObject = getSupportFragmentManager();
    Fragment localFragment1 = ((FragmentManager)localObject).findFragmentByTag(MainFragment.class.getName());
    Fragment localFragment2 = ((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
    if (localFragment2 != null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("ChatActivity", 2, "clearAIO");
      }
      localObject = ((FragmentManager)localObject).beginTransaction();
      if (localFragment2.isVisible())
      {
        jdField_c_of_type_Int = 1;
        ((FragmentTransaction)localObject).hide(localFragment2);
        ((FragmentTransaction)localObject).show(localFragment1);
      }
      ((FragmentTransaction)localObject).remove(localFragment2).commitAllowingStateLoss();
    }
  }
  
  public void a(int paramInt1, int paramInt2, Object paramObject)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      ((MainFragment)localFragment).a(paramInt1, paramInt2, paramObject);
    }
  }
  
  public void a(int paramInt, BusinessInfoCheckUpdate.RedTypeInfo paramRedTypeInfo)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      ((MainFragment)localFragment).a(paramInt, paramRedTypeInfo);
    }
  }
  
  public void a(Intent paramIntent)
  {
    Object localObject2 = null;
    int i = paramIntent.getIntExtra("extra_pull_active_push_type", 0);
    if (i == 0) {
      return;
    }
    Object localObject1;
    if (i == 2)
    {
      paramIntent = paramIntent.getStringExtra("extra_pull_active_push_url");
      localObject1 = new Intent(app.a(), QQBrowserActivity.class);
      ((Intent)localObject1).putExtra("url", paramIntent);
    }
    for (;;)
    {
      if (localObject1 != null) {
        startActivity((Intent)localObject1);
      }
      ReportController.b(app, "CliOper", "", "", "0X8006593", "0X8006593", 0, 0, app.a(), "", "", "");
      return;
      localObject1 = localObject2;
      if (i == 1) {
        switch (paramIntent.getIntExtra("extra_pull_active_push_subtype", 0))
        {
        default: 
          localObject1 = localObject2;
          break;
        case 1: 
          new JumpAction(app, this).e();
          localObject1 = localObject2;
          break;
        case 2: 
          new JumpAction(app, this).f();
          localObject1 = localObject2;
          break;
        case 3: 
          localObject1 = new Intent(app.a(), ActivateFriendActivity.class);
          ((Intent)localObject1).putExtra("af_key_from", 4);
          break;
        case 4: 
          localObject1 = new Intent(app.a(), NearbyBaseActivity.class);
          ((Intent)localObject1).putExtra("ENTER_TIME", System.currentTimeMillis());
          break;
        case 5: 
          localObject1 = new Intent(app.a(), NearbyBaseActivity.class);
          ((Intent)localObject1).putExtra("ENTER_TIME", System.currentTimeMillis());
          ((Intent)localObject1).putExtra("TAB", 2);
        }
      }
    }
  }
  
  public void a(boolean paramBoolean)
  {
    StartupTracker.b(null, "AIO_Start_cost");
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.SplashActivity", 2, "openAIO");
    }
    if (a(paramBoolean, getIntent())) {}
    label394:
    for (;;)
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.e("Q.aio.SplashActivity", 2, "openAIO type = " + getIntent().getIntExtra("uintype", -1));
      }
      paramBoolean = getIntent().getBooleanExtra("open_chatfragment_withanim", false);
      Object localObject2 = getSupportFragmentManager();
      FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject2).beginTransaction();
      Object localObject1 = ((FragmentManager)localObject2).findFragmentByTag(ChatFragment.class.getName());
      localObject2 = ((FragmentManager)localObject2).findFragmentByTag(MainFragment.class.getName());
      if (localObject2 != null)
      {
        ((MainFragment)localObject2).i();
        if (((MainFragment)localObject2).a() != MainFragment.a) {
          ((MainFragment)localObject2).a(MainFragment.a);
        }
      }
      if (localObject1 != null)
      {
        if (QLog.isColorLevel()) {
          QLog.i("Q.aio.SplashActivity", 2, "openAIO f != null ");
        }
        ((ChatFragment)localObject1).b();
        if (!((Fragment)localObject1).isVisible())
        {
          if (paramBoolean) {
            localFragmentTransaction.setCustomAnimations(2130968624, 2130968629);
          }
          jdField_c_of_type_Int = 2;
          localFragmentTransaction.show((Fragment)localObject1);
          localFragmentTransaction.hide((Fragment)localObject2);
          localFragmentTransaction.commitAllowingStateLoss();
        }
      }
      for (;;)
      {
        if (!getIntent().getBooleanExtra("activepull_push_flag", false)) {
          break label394;
        }
        ReportController.b(app, "CliOper", "", "", "0X8006593", "0X8006593", 0, 0, app.a(), "", "", "");
        return;
        if (Math.abs(SystemClock.uptimeMillis() - jdField_a_of_type_Long) < 1000L)
        {
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.i("Q.aio.SplashActivity", 2, "openAIO hasOpenedAIO true, renturn ");
          return;
        }
        jdField_a_of_type_Long = SystemClock.uptimeMillis();
        if (paramBoolean) {
          localFragmentTransaction.setCustomAnimations(2130968624, 2130968629);
        }
        localObject1 = ChatFragment.a();
        jdField_c_of_type_Int = 2;
        localFragmentTransaction.add(16908290, (Fragment)localObject1, ChatFragment.class.getName());
        localFragmentTransaction.hide((Fragment)localObject2);
        localFragmentTransaction.commitAllowingStateLoss();
        if (QLog.isColorLevel()) {
          QLog.i("Q.aio.SplashActivity", 2, "openAIO f == null ");
        }
      }
    }
  }
  
  public void b()
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      ((MainFragment)localFragment).h();
    }
  }
  
  public void b(Intent paramIntent)
  {
    if (QLog.isColorLevel()) {
      QLog.i("SplashActivity", 2, "openMainFragment");
    }
    Object localObject = getSupportFragmentManager();
    MainFragment localMainFragment = (MainFragment)((FragmentManager)localObject).findFragmentByTag(MainFragment.class.getName());
    if (localMainFragment == null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("SplashActivity", 2, "openMainFragment mainfragment is null");
      }
      return;
    }
    if (jdField_c_of_type_Int != 1)
    {
      FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject).beginTransaction();
      localObject = (ChatFragment)((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
      if (paramIntent.getBooleanExtra("switch_anim", false)) {
        localFragmentTransaction.setCustomAnimations(2130968628, 2130968625);
      }
      jdField_c_of_type_Int = 1;
      localFragmentTransaction.show(localMainFragment);
      localFragmentTransaction.hide((Fragment)localObject);
      localFragmentTransaction.commitAllowingStateLoss();
      if ((localObject != null) && (a != null)) {
        a.a(false, 450);
      }
    }
    localMainFragment.a(paramIntent);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    Object localObject = getSupportFragmentManager();
    Fragment localFragment = ((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
    if ((localFragment != null) && (localFragment.isVisible())) {
      ((ChatFragment)localFragment).onActivityResult(paramInt1, paramInt2, paramIntent);
    }
    do
    {
      return;
      localObject = ((FragmentManager)localObject).findFragmentByTag(MainFragment.class.getName());
    } while (localObject == null);
    ((MainFragment)localObject).a(paramInt1, paramInt2, paramIntent);
  }
  
  public void doOnBackPressed() {}
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    int i;
    if ((BaseApplicationImpl.jdField_b_of_type_JavaLangString != null) && (BaseApplicationImpl.jdField_b_of_type_JavaLangString.length() > 0)) {
      i = 1;
    }
    for (;;)
    {
      if (i != 0)
      {
        Intent localIntent = new Intent(getIntent());
        localIntent.addFlags(603979776);
        super.finish();
        super.superStartActivityForResult(localIntent, -1, null);
      }
      try
      {
        Thread.sleep(50L);
        System.exit(-1);
        mActNeedImmersive = false;
        StartupTracker.a(null, "Main_Start");
        StartupTracker.a(null, "Main_OnCreat");
        StartupTracker.a(null, "Main_super_create");
        super.doOnCreate(paramBundle);
        StartupTracker.a("Main_super_create", null);
        if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity != null) && (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity != this))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.aio.SplashActivity", 2, "duplicate SplashActivity: " + jdField_a_of_type_ComTencentMobileqqActivitySplashActivity + ", " + this);
          }
          finish();
          return false;
          i = 0;
          continue;
        }
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity = this;
        jdField_a_of_type_Boolean = true;
        if (paramBundle != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.aio.SplashActivity", 2, "doOnCreate killedRestore: ");
          }
          jdField_b_of_type_Boolean = true;
        }
        app.isClearTaskBySystem = false;
        if ((UserguideActivity.a(this)) || (MainUtils.a(app, this)))
        {
          finish();
          StartupTracker.a("Main_OnCreat", null);
          return false;
        }
        jdField_b_of_type_JavaLangString = app.getAccount();
        if (getIntent().getExtras() != null) {
          if (getIntent().getExtras().containsKey("forward")) {
            mCanLock = false;
          }
        }
      }
      catch (Exception localException)
      {
        try
        {
          f = getIntent().getStringExtra("jump_action_from_h5");
          g = getIntent().getStringExtra("package_from_h5");
          paramBundle = getSupportFragmentManager();
          jdField_c_of_type_Int = 1;
          paramBundle.beginTransaction().add(16908290, MainFragment.a(), MainFragment.class.getName()).commitAllowingStateLoss();
          ThreadManager.b().postDelayed(new kaz(this), 1000L);
          StartupTracker.a("Main_OnCreat", null);
          return true;
          localException = localException;
        }
        catch (Exception paramBundle)
        {
          for (;;) {}
        }
      }
    }
  }
  
  protected void doOnDestroy()
  {
    if (QLog.isColorLevel()) {
      QLog.d("SplashActivity", 2, "doOnDestroy");
    }
    super.doOnDestroy();
    if (jdField_a_of_type_AndroidContentBroadcastReceiver != null)
    {
      if (jdField_c_of_type_Boolean) {
        unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      }
      jdField_a_of_type_AndroidContentBroadcastReceiver = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == this) {
      jdField_a_of_type_ComTencentMobileqqActivitySplashActivity = null;
    }
  }
  
  protected boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    Object localObject;
    Fragment localFragment;
    if (paramInt == 4)
    {
      localObject = getSupportFragmentManager();
      localFragment = ((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
      if ((localFragment == null) || (!localFragment.isVisible()))
      {
        localObject = (MainFragment)((FragmentManager)localObject).findFragmentByTag(MainFragment.class.getName());
        if (localObject != null) {
          return ((MainFragment)localObject).a(paramInt, paramKeyEvent);
        }
      }
      else
      {
        ((ChatFragment)localFragment).a();
        return true;
      }
    }
    if (paramInt == 82)
    {
      localObject = getSupportFragmentManager();
      localFragment = ((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
      if ((localFragment == null) || (!localFragment.isVisible()))
      {
        localObject = (MainFragment)((FragmentManager)localObject).findFragmentByTag(MainFragment.class.getName());
        if (localObject != null) {
          return ((MainFragment)localObject).a(paramInt, paramKeyEvent);
        }
      }
    }
    return super.doOnKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.SplashActivity", 2, "doOnNewIntent");
    }
    Object localObject = paramIntent.getExtras();
    if (localObject != null) {
      if (((Bundle)localObject).getBoolean("open_chatfragment"))
      {
        paramIntent.putExtra("isBack2Root", true);
        setIntent(paramIntent);
        a(false);
      }
    }
    do
    {
      do
      {
        return;
        if (Boolean.valueOf(((Bundle)localObject).getBoolean("EXIT", false)).booleanValue()) {
          finish();
        }
        if (((Bundle)localObject).getBoolean("activepull_push_flag"))
        {
          setIntent(paramIntent);
          a(paramIntent);
          return;
        }
        if ((((Bundle)localObject).getInt("fragment_id") == 1) && (jdField_c_of_type_Int != 1))
        {
          setIntent(paramIntent);
          b(paramIntent);
          return;
        }
      } while (jdField_c_of_type_Int != 1);
      localObject = (MainFragment)getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    } while (localObject == null);
    ((MainFragment)localObject).a(paramIntent);
  }
  
  protected void doOnPause()
  {
    if (QLog.isColorLevel()) {
      QLog.d("SplashActivity", 2, "doOnPause");
    }
    if ((app == null) || (isFinishing())) {
      return;
    }
    super.doOnPause();
  }
  
  protected void doOnResume()
  {
    if ((app == null) || (isFinishing())) {}
    do
    {
      return;
      MainUtils.a(this);
      super.doOnResume();
      localObject1 = getWindow();
      if ((getAttributesflags & 0x400) != 0) {
        ((Window)localObject1).clearFlags(1024);
      }
      if (app.getKickIntent() != null)
      {
        startActivity(app.getKickIntent());
        return;
      }
      c(getIntent());
      if (app.getDevLockIntent() != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SplashActivity", 2, "onResume start push");
        }
        new MqqHandler().postDelayed(new kbb(this), 800L);
      }
      if ((!app.isLogin()) || (!app.getAccount().equals(BaseApplicationImpl.a().a()))) {
        break;
      }
      if (QLog.isColorLevel()) {
        QLog.d("PCActive_SplashActivity", 2, "onResume start push");
      }
    } while (!isResume());
    Object localObject1 = BaseApplicationImpl.a().a();
    if (localObject1 == null) {
      if (QLog.isColorLevel()) {
        QLog.i("PCActive_SplashActivity", 2, "Intent is null");
      }
    }
    for (;;)
    {
      StartupTracker.a(null, "Main_Resume_PCActive");
      if ((!TextUtils.isEmpty(app.getAccount())) && (!"0".equals(app.getAccount())))
      {
        boolean bool = SettingCloneUtil.readValue(app.a(), app.getAccount(), null, "pcactive_notice_key", false);
        if ((!SettingCloneUtil.readValue(app.a(), app.getAccount(), null, "pcactive_has_notice", false)) && (bool))
        {
          SettingCloneUtil.writeValue(app.a(), app.getAccount(), null, "pcactive_has_notice", true);
          new MqqHandler().postDelayed(new kbc(this), 800L);
        }
      }
      StartupTracker.a("Main_Resume_PCActive", null);
      return;
      try
      {
        if ((NotifyPCActiveActivity.a == null) && ((BaseActivity.sTopActivity instanceof SplashActivity))) {
          startActivity((Intent)localObject1);
        }
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.i("PCActive_SplashActivity", 2, "Unknown Exception Occured");
      }
      catch (ActivityNotFoundException localActivityNotFoundException)
      {
        if (QLog.isColorLevel()) {
          QLog.i("PCActive_SplashActivity", 2, "Activity Not Found");
        }
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.i("PCActive_SplashActivity", 2, "Unknown Exception Occured");
      }
      finally
      {
        if (QLog.isColorLevel()) {
          QLog.i("PCActive_SplashActivity", 2, "Unknown Exception Occured");
        }
      }
    }
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    if (QLog.isColorLevel()) {
      QLog.d("SplashActivity", 2, "doOnStart");
    }
    if ((f != null) && (f.length() > 0) && ("pakage_from_h5".equalsIgnoreCase(g)))
    {
      JumpAction localJumpAction = JumpParser.a(app, this, f);
      localJumpAction.b(g);
      localJumpAction.b();
      f = null;
      g = null;
    }
  }
  
  protected void doOnStop()
  {
    if (QLog.isColorLevel()) {
      QLog.d("SplashActivity", 2, "doOnStop");
    }
    if ((app == null) || (isFinishing())) {
      return;
    }
    super.doOnStop();
  }
  
  protected void doOnWindowFocusChanged(boolean paramBoolean)
  {
    super.doOnWindowFocusChanged(paramBoolean);
    if (QLog.isColorLevel()) {
      QLog.d("SplashActivity", 2, "doOnWindowFocusChanged");
    }
    if ((jdField_a_of_type_Boolean) && (paramBoolean))
    {
      ViewGroup localViewGroup = (ViewGroup)getWindow().getDecorView();
      View localView = localViewGroup.getChildAt(0);
      localObject = localViewGroup;
      if (localView != null)
      {
        localObject = localViewGroup;
        if ((localView instanceof DragFrameLayout)) {
          localObject = (ViewGroup)localView;
        }
      }
      localObject = ((ViewGroup)localObject).getChildAt(0);
      if (!(localObject instanceof TopGestureLayout)) {
        break label163;
      }
    }
    label163:
    for (Object localObject = (TopGestureLayout)localObject;; localObject = null)
    {
      if (localObject != null) {
        ((TopGestureLayout)localObject).setInterceptTouchFlag(false);
      }
      jdField_a_of_type_Boolean = false;
      if ((getIntent().getBooleanExtra("open_chatfragment", false)) && (!jdField_b_of_type_Boolean))
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.SplashActivity", 2, "splashActivity call openAIO in doOnWindowFocusChanged");
        }
        getIntent().putExtra("isBack2Root", true);
        a(true);
        return;
      }
      jdField_b_of_type_Boolean = false;
      return;
    }
  }
  
  public void finish()
  {
    if (QLog.isColorLevel()) {
      QLog.d("SplashActivity", 2, "finish()");
    }
    FragmentManager localFragmentManager = getSupportFragmentManager();
    Fragment localFragment = localFragmentManager.findFragmentByTag(ChatFragment.class.getName());
    if (localFragment != null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("SplashActivity", 2, "finish clearAIO");
      }
      localFragmentManager.beginTransaction().remove(localFragment).commitAllowingStateLoss();
    }
    super.finish();
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == this) {
      jdField_a_of_type_ComTencentMobileqqActivitySplashActivity = null;
    }
  }
  
  protected String getPreProcess()
  {
    return "com.tencent.mobileqq:peak";
  }
  
  protected void onAccountChanged()
  {
    super.onAccountChanged();
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      ((MainFragment)localFragment).b();
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (FrameHelperActivity.a != null)
    {
      DrawerFrame localDrawerFrame = (DrawerFrame)FrameHelperActivity.a.get();
      if (localDrawerFrame != null) {
        localDrawerFrame.onConfigurationChanged(paramConfiguration);
      }
    }
    super.onConfigurationChanged(paramConfiguration);
  }
  
  protected Dialog onCreateDialog(int paramInt)
  {
    ChatFragment localChatFragment = (ChatFragment)getSupportFragmentManager().findFragmentByTag(ChatFragment.class.getName());
    if (localChatFragment != null) {
      return localChatFragment.a(paramInt);
    }
    return null;
  }
  
  protected void onLogout(Constants.LogoutReason paramLogoutReason)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      ((MainFragment)localFragment).a(paramLogoutReason);
    }
    a();
  }
  
  public void onPostThemeChanged()
  {
    super.onPostThemeChanged();
    Object localObject = getSupportFragmentManager();
    Fragment localFragment = ((FragmentManager)localObject).findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      ((MainFragment)localFragment).g();
    }
    localObject = ((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
    if (localObject != null) {
      ((ChatFragment)localObject).e();
    }
  }
  
  protected void onPrepareDialog(int paramInt, Dialog paramDialog)
  {
    ChatFragment localChatFragment = (ChatFragment)getSupportFragmentManager().findFragmentByTag(ChatFragment.class.getName());
    if (localChatFragment != null) {
      localChatFragment.a(paramInt, paramDialog);
    }
  }
  
  public void preloadUi()
  {
    try
    {
      LayoutInflater localLayoutInflater = LayoutInflater.from(BaseApplicationImpl.a);
      jdField_a_of_type_ArrayOfAndroidViewView = MainFragment.a(this, localLayoutInflater);
      jdField_a_of_type_AndroidViewView = localLayoutInflater.inflate(2130903215, null);
      FPSSwipListView localFPSSwipListView = (FPSSwipListView)jdField_a_of_type_AndroidViewView.findViewById(2131297687);
      if (localFPSSwipListView != null) {
        jdField_b_of_type_AndroidViewView = localLayoutInflater.inflate(2130904751, localFPSSwipListView, false);
      }
      return;
    }
    catch (Throwable localThrowable)
    {
      QLog.e("SplashActivity", 1, "", localThrowable);
    }
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    super.requestWindowFeature(paramIntent);
    super.getWindow().setFormat(-3);
  }
  
  protected String setLastActivityName()
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(MainFragment.class.getName());
    if (localFragment != null) {
      return ((MainFragment)localFragment).a();
    }
    return super.setLastActivityName();
  }
}
