package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.AIOInputTypeHelper;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MsgAutoMonitorUtil;
import java.util.HashMap;
import java.util.Random;
import nih;
import nii;
import nij;

public class RegisterProxy
  extends AsyncStep
{
  private static final long d = 3000L;
  public static final int j = 100;
  private static final int k = 0;
  private static final int l = 1;
  private static final int m = 2;
  Handler jdField_a_of_type_AndroidOsHandler;
  MessageObserver jdField_a_of_type_ComTencentMobileqqAppMessageObserver;
  private nih jdField_a_of_type_Nih;
  private boolean b;
  public long c;
  private int n;
  private int o;
  private int p;
  private int q;
  private int r;
  private int s;
  
  public RegisterProxy()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    n = 0;
    o = 0;
    p = 0;
    q = 0;
    r = 0;
    s = 0;
    jdField_c_of_type_Long = 0L;
    jdField_b_of_type_Boolean = false;
  }
  
  private void a(boolean paramBoolean)
  {
    if (!jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().c())
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, jdField_b_of_type_JavaLangString + "[ReSendProxy] needSetReconnnect isAllRegisterProxyTroopResponseDone = false,waitingThreadDone = " + paramBoolean);
      }
      if (paramBoolean)
      {
        jdField_a_of_type_AndroidOsHandler = new nij(this, ThreadManager.b());
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(100, 3000L);
      }
      return;
    }
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = true;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, jdField_b_of_type_JavaLangString + "[ReSendProxy] RESULT_NET_CONNECT resend request!");
    }
    super.a(4);
  }
  
  private boolean b()
  {
    return (o == 2) && (p == 2) && (q == 2) && (r == 2);
  }
  
  private void c()
  {
    long l1 = SystemClock.uptimeMillis();
    long l2;
    long l3;
    HashMap localHashMap;
    String str;
    if ((BaseApplicationImpl.jdField_a_of_type_Long < 0L) && (BaseApplicationImpl.b < 0L))
    {
      MsgAutoMonitorUtil.a().k();
      l2 = l1 + BaseApplicationImpl.jdField_a_of_type_Long;
      l3 = l1 + BaseApplicationImpl.b;
      if (QLog.isColorLevel())
      {
        QLog.i("AutoMonitor", 2, "ActionLoginB, cost=" + l2 + ", totalFailCount=" + jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e);
        QLog.i("AutoMonitor", 2, "ActionLoginR, cost=" + l3 + ", totalFailCount=" + jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e);
        localHashMap = new HashMap();
        if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e <= 9) {
          break label457;
        }
        str = ">9";
        label151:
        localHashMap.put("param_FailCount", str);
        if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e <= 0) {
          break label472;
        }
        str = "CLIENT_TIMEOUT";
        label175:
        localHashMap.put("param_FailCode", str);
        localHashMap.put("param_TimeoutCode", String.valueOf(jdField_c_of_type_Long));
        StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a()).a(null, "actLoginB", true, l2, 0L, localHashMap, null);
        StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a()).a(null, "actLoginR", true, l3, 0L, localHashMap, null);
      }
    }
    else
    {
      BaseApplicationImpl.b = 0L;
      BaseApplicationImpl.jdField_a_of_type_Long = 0L;
      if (BaseApplicationImpl.jdField_c_of_type_Long > 0L)
      {
        l1 -= BaseApplicationImpl.jdField_c_of_type_Long;
        if ((!BaseApplicationImpl.jdField_c_of_type_Boolean) || (!BaseApplicationImpl.d)) {
          break label479;
        }
        str = "1";
      }
    }
    for (;;)
    {
      Log.i("AutoMonitor", "ActionLoginT, cost=" + l1 + ", actLoginType=" + str);
      localHashMap = new HashMap();
      localHashMap.put("actLoginType", str);
      StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a()).a(null, "actLoginT", true, l1, 0L, localHashMap, null);
      BaseApplicationImpl.jdField_c_of_type_Long = 0L;
      return;
      Log.i("AutoMonitor", "ActionLoginB, cost=" + l2 + ", totalFailCount=" + jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e);
      Log.i("AutoMonitor", "ActionLoginR, cost=" + l3 + ", totalFailCount=" + jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e);
      break;
      label457:
      str = String.valueOf(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e);
      break label151;
      label472:
      str = "";
      break label175;
      label479:
      if ((BaseApplicationImpl.jdField_c_of_type_Boolean) && (!BaseApplicationImpl.d)) {
        str = "2";
      } else if ((!BaseApplicationImpl.jdField_c_of_type_Boolean) && (BaseApplicationImpl.d)) {
        str = "3";
      } else {
        str = "4";
      }
    }
  }
  
  protected int a()
  {
    boolean bool2 = true;
    long l1 = System.currentTimeMillis();
    Object localObject;
    int i;
    long l2;
    if (jdField_b_of_type_Boolean)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
      if (h == 18)
      {
        i = 2;
        ((MessageHandler)localObject).a(i);
        jdField_b_of_type_Boolean = false;
      }
    }
    else
    {
      l2 = (int)(System.currentTimeMillis() / 1000L) << 32 | Math.abs(new Random().nextInt());
      if (h != 18) {
        break label252;
      }
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().a(2, true, l2, false);
      if (QLog.isColorLevel())
      {
        localObject = new StringBuilder().append("doStep , mStepId = ").append(h).append(" , isGetPassword = ");
        if (h != 17) {
          break label339;
        }
      }
    }
    label252:
    label339:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      QLog.d("RegisterProxy", 2, bool1 + " ,isUseNewRegisterProxy = " + MessageHandler.jdField_a_of_type_Boolean);
      Log.i("AutoMonitor", "STEP_SEND_REGISTER_PACKAGE, cost=" + (System.currentTimeMillis() - l1));
      if (QLog.isColorLevel()) {
        QLog.i("AutoMonitor", 2, "STEP_SEND_REGISTER_PACKAGE, cost=" + (System.currentTimeMillis() - l1));
      }
      return 2;
      i = 1;
      break;
      if (MessageHandler.jdField_a_of_type_Boolean)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
        if (h == 17) {}
        for (bool1 = true;; bool1 = false)
        {
          ((MessageHandler)localObject).a(1, l2, bool1);
          break;
        }
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
      if (h == 17) {}
      for (bool1 = true;; bool1 = false)
      {
        ((MessageHandler)localObject).a(1, true, l2, bool1);
        break;
      }
    }
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new nii(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.c(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
      jdField_a_of_type_Nih = new nih(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_Nih);
    }
    if ((h == 17) || (h == 19)) {
      MsgAutoMonitorUtil.a().a(Thread.currentThread().getThreadGroup().activeCount());
    }
    i = 3;
    jdField_b_of_type_Boolean = false;
    MessageHandler.jdField_a_of_type_Boolean = BaseApplication.getContext().getSharedPreferences("mobileQQ", 0).getBoolean("new_regprxy_switch", true);
  }
  
  public void a(int paramInt)
  {
    if (!jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.c())
    {
      if (paramInt != 4) {
        break label26;
      }
      a(true);
    }
    for (;;)
    {
      super.a(paramInt);
      return;
      label26:
      if (jdField_a_of_type_AndroidOsHandler != null) {
        jdField_a_of_type_AndroidOsHandler.removeMessages(100);
      }
    }
  }
  
  public boolean a()
  {
    return ((n == 2) || (n == 1)) && ((o == 2) || (o == 1)) && ((r == 2) || (r == 1)) && ((p == 2) || (p == 1)) && ((q == 2) || (q == 1));
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
      jdField_a_of_type_ComTencentMobileqqAppMessageObserver = null;
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_Nih);
      jdField_a_of_type_Nih = null;
    }
    MsgAutoMonitorUtil.a().b(Thread.currentThread().getThreadGroup().activeCount());
    c();
    if (h == 17) {
      AIOInputTypeHelper.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b);
    }
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().a(b());
    if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.jdField_a_of_type_Long > 0L)
    {
      long l1 = System.currentTimeMillis() - jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.jdField_a_of_type_Long;
      Log.i("AutoMonitor", "SyncData, cost=" + l1);
      if (NetworkUtil.g(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a()))
      {
        if (!jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.jdField_a_of_type_AndroidContentSharedPreferences.getBoolean("isFirstQQInit", true)) {
          break label282;
        }
        localObject = "actSyncMsgFirst";
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.jdField_a_of_type_AndroidContentSharedPreferences.edit().putBoolean("isFirstQQInit", false).commit();
        StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a()).a(null, (String)localObject, b(), l1, jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e, null, null);
      }
    }
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator;
    if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().b()) {}
    for (int i = 2;; i = 1)
    {
      d = i;
      return;
      label282:
      localObject = "actSyncMsgSecond";
      break;
    }
  }
}
