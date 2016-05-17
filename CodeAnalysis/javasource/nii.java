import android.content.SharedPreferences;
import android.os.SystemClock;
import android.util.Log;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.RegisterProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MsgAutoMonitorUtil;
import java.util.HashMap;

public class nii
  extends MessageObserver
{
  private nii(RegisterProxy paramRegisterProxy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void f()
  {
    long l1;
    long l2;
    Object localObject;
    if ((RegisterProxy.a(a) == 2) && (RegisterProxy.c(a) == 2))
    {
      l1 = SystemClock.uptimeMillis();
      ca).b.a().b = true;
      da).b.a().a(true);
      if ((BaseApplicationImpl.jdField_a_of_type_Long < 0L) && (BaseApplicationImpl.b < 0L))
      {
        l2 = BaseApplicationImpl.jdField_a_of_type_Long + l1;
        if (!QLog.isColorLevel()) {
          break label384;
        }
        QLog.i("AutoMonitor", 2, "registerB, cost=" + l2);
        StatisticCollector.a(ea).b.a()).a(null, "prxyRegisterB", true, l2, 0L, null, null);
      }
      if (BaseApplicationImpl.jdField_c_of_type_Long > 0L)
      {
        l2 = BaseApplicationImpl.jdField_c_of_type_Long;
        if ((!BaseApplicationImpl.jdField_c_of_type_Boolean) || (!BaseApplicationImpl.d)) {
          break label412;
        }
        localObject = "1";
      }
    }
    for (;;)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("actLoginType", localObject);
      StatisticCollector.a(fa).b.a()).a(null, "prxyRegisterT", true, l1 - l2, 0L, localHashMap, null);
      if (ga).jdField_a_of_type_Long > 0L)
      {
        l1 = System.currentTimeMillis() - ha).jdField_a_of_type_Long;
        if (NetworkUtil.g(ia).b.a()))
        {
          boolean bool = ja).jdField_a_of_type_AndroidContentSharedPreferences.getBoolean("isFirstQQInit", true);
          localObject = new HashMap();
          ((HashMap)localObject).put("param_isFirstInit", String.valueOf(bool));
          StatisticCollector.a(ka).b.a()).a(null, "prxyRegisterM", RegisterProxy.a(a), l1, 0L, (HashMap)localObject, null);
          if (QLog.isColorLevel()) {
            QLog.i("AutoMonitor", 2, "machineStartToStopCircle, cost=" + l1 + ", isfirstQQInit=" + bool);
          }
        }
      }
      return;
      label384:
      Log.i("AutoMonitor", "registerB, cost=" + l2);
      break;
      label412:
      if ((BaseApplicationImpl.jdField_c_of_type_Boolean) && (!BaseApplicationImpl.d)) {
        localObject = "2";
      } else if ((!BaseApplicationImpl.jdField_c_of_type_Boolean) && (BaseApplicationImpl.d)) {
        localObject = "3";
      } else {
        localObject = "4";
      }
    }
  }
  
  private void g()
  {
    if (a.a()) {
      a.a(7);
    }
  }
  
  protected void a(boolean paramBoolean, long paramLong1, long paramLong2)
  {
    int j = 2;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, RegisterProxy.d(a) + " onGetAllProxyMsgFin:" + paramBoolean + ", timeoutFlag=" + paramLong1 + ", type=" + paramLong2);
    }
    RegisterProxy localRegisterProxy;
    if (paramLong2 == 0L)
    {
      localRegisterProxy = a;
      if ((!paramBoolean) || (paramLong1 == 8L) || (paramLong1 == 4L)) {
        break label166;
      }
      i = 2;
      RegisterProxy.d(localRegisterProxy, i);
      localRegisterProxy = a;
      if ((!paramBoolean) || (paramLong1 == 128L) || (paramLong1 == 64L) || (paramLong1 == 32L)) {
        break label172;
      }
    }
    label166:
    label172:
    for (int i = j;; i = 1)
    {
      RegisterProxy.c(localRegisterProxy, i);
      a.jdField_c_of_type_Long = paramLong1;
      g();
      return;
      i = 1;
      break;
    }
  }
  
  protected void a(boolean paramBoolean, String[] paramArrayOfString)
  {
    int i = 2;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, RegisterProxy.c(a) + " on GetTroopMsg Fin:" + paramBoolean);
    }
    MsgAutoMonitorUtil.a().h();
    paramArrayOfString = a;
    if (paramBoolean) {}
    for (;;)
    {
      RegisterProxy.d(paramArrayOfString, i);
      g();
      return;
      i = 1;
    }
  }
  
  protected void e(boolean paramBoolean)
  {
    boolean bool = true;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, RegisterProxy.a(a) + " on GetC2CMsg Fin:" + paramBoolean);
    }
    MsgAutoMonitorUtil.a().f();
    Object localObject = a;
    int i;
    if (paramBoolean)
    {
      i = 2;
      RegisterProxy.b((RegisterProxy)localObject, i);
      localObject = RegisterProxy.a(a);
      if (RegisterProxy.a(a) != 2) {
        break label116;
      }
    }
    label116:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      f = paramBoolean;
      if (MessageHandler.a) {
        f();
      }
      g();
      return;
      i = 1;
      break;
    }
  }
  
  protected void f(boolean paramBoolean)
  {
    int i = 2;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "on RegisterProxy Fin:" + paramBoolean);
    }
    RegisterProxy localRegisterProxy = a;
    if (paramBoolean) {}
    for (;;)
    {
      RegisterProxy.a(localRegisterProxy, i);
      if (!paramBoolean) {
        break;
      }
      g();
      return;
      i = 1;
    }
    a.a(6);
  }
  
  protected void g(boolean paramBoolean)
  {
    int i = 2;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, RegisterProxy.b(a) + " on GetDiscussionMsg Fin:" + paramBoolean);
    }
    MsgAutoMonitorUtil.a().j();
    RegisterProxy localRegisterProxy = a;
    if (paramBoolean) {}
    for (;;)
    {
      RegisterProxy.c(localRegisterProxy, i);
      g();
      return;
      i = 1;
    }
  }
  
  protected void h(boolean paramBoolean)
  {
    boolean bool = true;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, RegisterProxy.e(a) + " on GetPAMsg Fin:" + paramBoolean);
    }
    Object localObject = a;
    int i;
    if (paramBoolean)
    {
      i = 2;
      RegisterProxy.e((RegisterProxy)localObject, i);
      localObject = RegisterProxy.b(a);
      if (RegisterProxy.b(a) != 2) {
        break label101;
      }
    }
    label101:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      g = paramBoolean;
      g();
      return;
      i = 1;
      break;
    }
  }
  
  protected void i(boolean paramBoolean)
  {
    int i = 2;
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, RegisterProxy.f(a) + " on GetFirstGroup Fin:" + paramBoolean);
    }
    RegisterProxy localRegisterProxy = a;
    if (paramBoolean) {}
    for (;;)
    {
      RegisterProxy.f(localRegisterProxy, i);
      f();
      return;
      i = 1;
    }
  }
}
