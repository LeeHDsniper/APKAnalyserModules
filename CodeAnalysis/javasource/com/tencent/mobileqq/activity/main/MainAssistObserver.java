package com.tencent.mobileqq.activity.main;

import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import com.tencent.biz.TroopRedpoint.TroopRedTouchHandler;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.CallTabUnreadListener;
import com.tencent.mobileqq.app.ConfigObserver;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.MsgTabUnreadListener;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyManager;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyObserver;
import com.tencent.mobileqq.app.upgrade.UpgradeController;
import com.tencent.mobileqq.app.upgrade.UpgradeDetailWrapper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.nearby.NearbyProxy;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.nearby.ipc.NearbyProxyObserver;
import com.tencent.mobileqq.observer.GameCenterObserver;
import com.tencent.mobileqq.observer.GetRedPointExObserver;
import com.tencent.mobileqq.observer.QZoneObserver;
import com.tencent.mobileqq.observer.SdCardChangeListener;
import com.tencent.mobileqq.observer.VipGifObserver;
import com.tencent.mobileqq.pb.PBBoolField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.mobileqq.servlet.QZoneManagerImp;
import com.tencent.mobileqq.statistics.MainAcitivityReportHelper;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.AppSetting;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.RedTypeInfo;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.util.QZoneLogTags;
import cooperation.readinjoy.storage.ReadInJoyNotifyRedTouchInfo;
import java.io.PrintStream;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import luo;
import lup;
import luq;
import lut;
import luu;
import luv;
import luw;
import lux;
import luy;
import luz;
import lvb;
import lvf;
import lvg;
import lvh;
import lvi;
import lvj;
import lvk;
import lvl;
import lvn;
import lvo;
import mqq.os.MqqHandler;

public class MainAssistObserver
{
  public int a;
  public Handler a;
  public SplashActivity a;
  private CallTabUnreadListener jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener;
  private ConfigObserver jdField_a_of_type_ComTencentMobileqqAppConfigObserver;
  private MessageObserver jdField_a_of_type_ComTencentMobileqqAppMessageObserver;
  private MsgTabUnreadListener jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener;
  private ReadInJoyObserver jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyObserver;
  private UpgradeDetailWrapper jdField_a_of_type_ComTencentMobileqqAppUpgradeUpgradeDetailWrapper;
  private PhoneContactManager.IPhoneContactListener jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener;
  private NearbyProxyObserver jdField_a_of_type_ComTencentMobileqqNearbyIpcNearbyProxyObserver;
  private GameCenterObserver jdField_a_of_type_ComTencentMobileqqObserverGameCenterObserver;
  private GetRedPointExObserver jdField_a_of_type_ComTencentMobileqqObserverGetRedPointExObserver;
  private QZoneObserver jdField_a_of_type_ComTencentMobileqqObserverQZoneObserver;
  public SdCardChangeListener a;
  private VipGifObserver jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver;
  public MainAcitivityReportHelper a;
  public QQCustomDialog a;
  public volatile boolean a;
  public final int b;
  public final int c;
  public final int d;
  
  public MainAssistObserver(SplashActivity paramSplashActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = 0;
    c = 1;
    d = 3;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqObserverSdCardChangeListener = null;
    jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver = new lvh(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lvk(this);
    jdField_a_of_type_ComTencentMobileqqObserverQZoneObserver = new lvl(this);
    jdField_a_of_type_ComTencentMobileqqNearbyIpcNearbyProxyObserver = new lvn(this);
    jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyObserver = new lvo(this);
    jdField_a_of_type_ComTencentMobileqqObserverGameCenterObserver = new lup(this);
    jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener = new luq(this);
    jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener = new lut(this);
    jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener = new luu(this);
    jdField_a_of_type_ComTencentMobileqqAppConfigObserver = new luv(this);
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    jdField_a_of_type_AndroidOsHandler = new lvb(this, Looper.getMainLooper());
    jdField_a_of_type_ComTencentMobileqqObserverGetRedPointExObserver = new lvg(this);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity = paramSplashActivity;
  }
  
  private ReadInJoyNotifyRedTouchInfo a()
  {
    if (!b()) {
      return null;
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return null;
    }
    ReadInJoyManager localReadInJoyManager = (ReadInJoyManager)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(95);
    if (localReadInJoyManager == null) {
      return null;
    }
    return localReadInJoyManager.a();
  }
  
  private boolean a()
  {
    boolean bool3 = false;
    boolean bool4 = false;
    boolean bool1 = false;
    boolean bool2 = bool1;
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app != null) {
        break label30;
      }
      bool2 = bool1;
    }
    label30:
    do
    {
      return bool2;
      QZoneManagerImp localQZoneManagerImp = (QZoneManagerImp)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(9);
      bool1 = bool4;
      if (localQZoneManagerImp != null)
      {
        bool2 = bool3;
        if (localQZoneManagerImp.a(2) > 0) {
          bool2 = true;
        }
        bool1 = bool2;
        if (QLog.isColorLevel())
        {
          QLog.d(QZoneLogTags.b + "MainAssistObserver", 2, "isNewQzoneMsgExist TYPE_ACTIVE_FEED: " + localQZoneManagerImp.a(2) + " TYPE_ZEBRA_ALBUM:" + localQZoneManagerImp.a(17));
          bool1 = bool2;
        }
      }
      bool2 = bool1;
    } while (!QLog.isColorLevel());
    QLog.d(QZoneLogTags.b + "MainAssistObserver", 2, "isNewQzoneMsgExist: " + bool1);
    return bool1;
  }
  
  private boolean b()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return false;
    }
    Iterator localIterator = ((RedTouchManager)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(35)).d().iterator();
    while (localIterator.hasNext())
    {
      BusinessInfoCheckUpdate.AppSetting localAppSetting = (BusinessInfoCheckUpdate.AppSetting)localIterator.next();
      if (appid.get() == 1130L) {
        return setting.get();
      }
    }
    return true;
  }
  
  private void k()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.b();
  }
  
  public int a()
  {
    int i = 0;
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return 0;
    }
    QZoneManagerImp localQZoneManagerImp = (QZoneManagerImp)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(9);
    if (localQZoneManagerImp != null)
    {
      int j = localQZoneManagerImp.a(1);
      i = j;
      if (QLog.isColorLevel())
      {
        QLog.d(QZoneLogTags.b + "MainAssistObserver", 2, "getQZoneMsgCount TYPE_PASSIVE_FEED: " + localQZoneManagerImp.a(1));
        i = j;
      }
    }
    return i;
  }
  
  public UpgradeDetailWrapper a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppUpgradeUpgradeDetailWrapper == null) {
      jdField_a_of_type_ComTencentMobileqqAppUpgradeUpgradeDetailWrapper = UpgradeController.a().a();
    }
    return jdField_a_of_type_ComTencentMobileqqAppUpgradeUpgradeDetailWrapper;
  }
  
  public void a()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {}
    while (jdField_a_of_type_Boolean) {
      return;
    }
    for (;;)
    {
      try
      {
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.registObserver(jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.registObserver(jdField_a_of_type_ComTencentMobileqqObserverQZoneObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.registObserver(jdField_a_of_type_ComTencentMobileqqObserverGameCenterObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(jdField_a_of_type_ComTencentMobileqqAppConfigObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(jdField_a_of_type_ComTencentMobileqqObserverGetRedPointExObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyObserver);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a().a(jdField_a_of_type_ComTencentMobileqqNearbyIpcNearbyProxyObserver, true);
        if (Looper.getMainLooper() != Looper.myLooper()) {
          continue;
        }
        ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(10)).a(jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener);
        ((TroopRedTouchHandler)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(43)).b();
        RedTouchManager localRedTouchManager = (RedTouchManager)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(35);
        jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(localRedTouchManager.a());
      }
      catch (NullPointerException localNullPointerException)
      {
        localNullPointerException.printStackTrace();
        continue;
      }
      ThreadManager.b().postDelayed(new lvf(this), 1000L);
      jdField_a_of_type_Boolean = true;
      return;
      jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.runOnUiThread(new luo(this));
    }
  }
  
  public void a(int paramInt1, int paramInt2, Object paramObject)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.a(paramInt1, paramInt2, paramObject);
  }
  
  public void a(int paramInt, BusinessInfoCheckUpdate.RedTypeInfo paramRedTypeInfo)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.a(paramInt, paramRedTypeInfo);
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) {}
    while ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null) || (!jdField_a_of_type_Boolean)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqObserverQZoneObserver);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.b(jdField_a_of_type_ComTencentMobileqqObserverGetRedPointExObserver);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqObserverGameCenterObserver);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(null);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(null);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.b(jdField_a_of_type_ComTencentMobileqqAppConfigObserver);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.b(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyObserver);
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a().b(jdField_a_of_type_ComTencentMobileqqNearbyIpcNearbyProxyObserver);
    try
    {
      jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.unregisterReceiver(jdField_a_of_type_ComTencentMobileqqObserverSdCardChangeListener);
      jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver);
      ((TroopRedTouchHandler)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.a(43)).c();
      RedTouchManager localRedTouchManager = (RedTouchManager)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(35);
      jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.b(localRedTouchManager.a());
      jdField_a_of_type_Boolean = false;
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
  
  public void c()
  {
    ThreadManager.b().postDelayed(new lvi(this), 500L);
  }
  
  public void d()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper != null) {
      jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper.c(jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app);
    }
    jdField_a_of_type_ComTencentMobileqqActivitySplashActivity = null;
  }
  
  public void e()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    new Timer().schedule(new lvj(this), 500L);
  }
  
  public void f()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    ThreadManager.a(new luw(this, jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app), 8, null, false);
  }
  
  public void g()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    ThreadManager.a(new lux(this, jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app), 8, null, false);
  }
  
  public void h()
  {
    if (QLog.isColorLevel()) {
      NearbyUtils.a(2, "NearbyUtils", "updateTabLebaNotify", new Object[0]);
    }
    ThreadManager.a(new luy(this), 8, null, false);
  }
  
  public void i()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app;
    f();
    Object localObject = localQQAppInterface.a();
    if (localObject != null) {
      ThreadManager.a(new luz(this, (QQMessageFacade)localObject, localQQAppInterface), 8, null, false);
    }
    localObject = (QCallFacade)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(37);
    if (localObject != null)
    {
      a(36, 16, Integer.valueOf(((QCallFacade)localObject).a()));
      localObject = new Intent("com.tencent.qq.syncQQMessage");
      localQQAppInterface.a().sendBroadcast((Intent)localObject);
    }
    boolean bool = SettingCloneUtil.readValue(jdField_a_of_type_ComTencentMobileqqActivitySplashActivity, localQQAppInterface.a(), null, "qqsetting_all_contacts_key", false);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "updateTab = " + bool);
    }
    if (bool)
    {
      a(33, 16, Integer.valueOf(0));
      localObject = new Intent("com.tencent.qq.syncQQMessage");
      localQQAppInterface.a().sendBroadcast((Intent)localObject);
    }
    for (;;)
    {
      h();
      g();
      return;
      localObject = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(10);
      if (localObject != null)
      {
        a(33, 16, Integer.valueOf(((PhoneContactManagerImp)localObject).b()));
        localObject = new Intent("com.tencent.qq.syncQQMessage");
        localQQAppInterface.a().sendBroadcast((Intent)localObject);
      }
    }
  }
  
  public void j()
  {
    System.out.println("consolidateMethod");
  }
}
