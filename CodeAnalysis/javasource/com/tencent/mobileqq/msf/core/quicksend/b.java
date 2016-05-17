package com.tencent.mobileqq.msf.core.quicksend;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.aa;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.e;
import com.tencent.mobileqq.msf.core.net.h;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public class b
{
  public static final String a = "attr_quick_send";
  public static final String b = "attr_quick_send_resend_time";
  public d c = new d();
  Handler d = new c(this);
  private String e = "QuickSendManager";
  private MsfCore f;
  private final int g = 1;
  private HashSet h = new HashSet();
  private ConcurrentHashMap i = new ConcurrentHashMap();
  private AtomicBoolean j = new AtomicBoolean();
  private long k = 0L;
  private volatile Handler l;
  
  public b(MsfCore paramMsfCore)
  {
    f = paramMsfCore;
    i.clear();
    paramMsfCore = new HandlerThread("MsfCoreHttpTimeoutChecker", 5);
    paramMsfCore.start();
    l = new Handler(paramMsfCore.getLooper());
    a();
  }
  
  private void f(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg == null) {}
    do
    {
      return;
      if (com.tencent.mobileqq.msf.core.a.a.ay())
      {
        if (!g(paramToServiceMsg))
        {
          h(paramToServiceMsg);
          return;
        }
        f.lightSender.a(paramToServiceMsg);
        return;
      }
    } while ((f.lightSender.a(paramToServiceMsg)) || (g(paramToServiceMsg)));
    h(paramToServiceMsg);
  }
  
  private boolean g(ToServiceMsg paramToServiceMsg)
  {
    if (TextUtils.isEmpty(paramToServiceMsg.getServiceCmd()))
    {
      QLog.d(e, 1, "tryResendMsg fail, cmd is null ");
      return false;
    }
    if (!paramToServiceMsg.isNeedCallback())
    {
      QLog.d(e, 1, "tryResendMsg fail, request don't need callback ");
      return false;
    }
    if (h.contains(paramToServiceMsg.getServiceCmd()))
    {
      QLog.d(e, 1, "tryResendMsg fail, refuse quick send cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq() + " by blacklist");
      return false;
    }
    if ((!paramToServiceMsg.isQuickSendEnable()) || (QuickSendStrategy.getStragegyArgs(paramToServiceMsg.getQuickSendStrategy()) == null))
    {
      QLog.d(e, 1, "tryResendMsg fail, refuse quick send cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq() + " by quickSendStrategy error");
      return false;
    }
    if (!i.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq())))
    {
      QLog.d(e, 1, "tryResendMsg fail, sendQueue don't contain msg, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
      return false;
    }
    if (paramToServiceMsg.getAttributes().containsKey("attr_quick_send_resend_time")) {}
    for (int m = ((Integer)paramToServiceMsg.getAttributes().get("attr_quick_send_resend_time")).intValue();; m = 0)
    {
      a localA = QuickSendStrategy.getStragegyArgs(paramToServiceMsg.getQuickSendStrategy());
      if ((m < 0) || (m > c))
      {
        QLog.d(e, 1, "tryResendMsg fail, msg has resend " + m + " times, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + m);
        return false;
      }
      paramToServiceMsg.getAttributes().put("attr_quick_send_resend_time", Integer.valueOf(m + 1));
      long l2 = b;
      long l1 = l2;
      if (com.tencent.mobileqq.msf.core.a.a.ay())
      {
        l1 = l2;
        if (m < com.tencent.mobileqq.msf.core.a.a.ax()) {
          l1 = com.tencent.mobileqq.msf.core.a.a.aw();
        }
      }
      Message localMessage = d.obtainMessage();
      what = 1;
      arg1 = paramToServiceMsg.getRequestSsoSeq();
      d.sendMessageDelayed(localMessage, l1);
      if (QLog.isColorLevel()) {
        QLog.d(e, 2, "tryResendMsg cmd:" + paramToServiceMsg.getServiceCmd() + " ssoSeq:" + paramToServiceMsg.getRequestSsoSeq() + " resendIndex: " + (m + 1) + " delayed: " + b);
      }
      return true;
    }
  }
  
  private void h(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg != null) {}
    try
    {
      d(paramToServiceMsg);
      if (i.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))) {
        i.remove(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
      }
      return;
    }
    finally
    {
      paramToServiceMsg = finally;
      throw paramToServiceMsg;
    }
  }
  
  public void a()
  {
    String[] arrayOfString = com.tencent.mobileqq.msf.core.a.a.Y();
    if (arrayOfString == null) {}
    for (;;)
    {
      return;
      int n = arrayOfString.length;
      int m = 0;
      while (m < n)
      {
        String str = arrayOfString[m];
        h.add(str);
        m += 1;
      }
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    if (TextUtils.isEmpty(paramToServiceMsg.getServiceCmd()))
    {
      QLog.d(e, 1, "addQuickSendQueue fail, cmd is null ");
      return;
    }
    if (!paramToServiceMsg.isNeedCallback())
    {
      QLog.d(e, 1, "addQuickSendQueue fail, request don't need callback ");
      return;
    }
    if (h.contains(paramToServiceMsg.getServiceCmd()))
    {
      QLog.d(e, 1, "addQuickSendQueue fail, refuse quick send cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq() + " by blacklist");
      return;
    }
    if ((!paramToServiceMsg.isQuickSendEnable()) || (QuickSendStrategy.getStragegyArgs(paramToServiceMsg.getQuickSendStrategy()) == null))
    {
      QLog.d(e, 1, "addQuickSendQueue fail, refuse quick send cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq() + " by quickSendStrategy error");
      return;
    }
    if (i.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq())))
    {
      QLog.d(e, 1, "addQuickSendQueue fail, msg has quick send, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
      return;
    }
    paramToServiceMsg.getAttributes().put("attr_quick_send", Boolean.valueOf(true));
    paramToServiceMsg.getAttributes().put("light_sender_type", Integer.valueOf(1));
    paramToServiceMsg.getAttributes().put("attr_quick_send_resend_time", Integer.valueOf(0));
    i.put(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()), paramToServiceMsg);
    f(paramToServiceMsg);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if (paramToServiceMsg == null) {
      QLog.d(e, 1, "onRecvResp toMsg is null");
    }
    do
    {
      do
      {
        return;
        if (paramFromServiceMsg != null) {
          break;
        }
        QLog.d(e, 1, "onRecvResp quicksend fail, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq() + " fromMsg is null");
      } while ((com.tencent.mobileqq.msf.core.a.a.ay()) || (g(paramToServiceMsg)));
      h(paramToServiceMsg);
      return;
      if (paramFromServiceMsg.isSuccess()) {
        break;
      }
      QLog.d(e, 1, "onRecvResp quicksend fail, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq() + " code: " + paramFromServiceMsg.getBusinessFailCode() + " failmsg: " + paramFromServiceMsg.getBusinessFailMsg());
      if (paramFromServiceMsg.getBusinessFailCode() == 2901)
      {
        h(paramToServiceMsg);
        return;
      }
    } while ((com.tencent.mobileqq.msf.core.a.a.ay()) || (g(paramToServiceMsg)));
    h(paramToServiceMsg);
    return;
    if (com.tencent.mobileqq.msf.core.a.a.az())
    {
      if (i.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))) {
        QLog.d(e, 1, "onRecvResp quicksend succ, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
      }
      try
      {
        for (;;)
        {
          aa.a(paramToServiceMsg, paramFromServiceMsg, true);
          if ((f.quicksender != null) && (f.quicksender.b(paramToServiceMsg))) {
            f.quicksender.c.b(paramToServiceMsg, paramFromServiceMsg);
          }
          h(paramToServiceMsg);
          paramFromServiceMsg.getAttributes().put("_attr_send_by_quickHttp", Boolean.valueOf(true));
          paramFromServiceMsg.setAppId(paramToServiceMsg.getAppId());
          paramFromServiceMsg.setAppSeq(paramToServiceMsg.getAppSeq());
          paramFromServiceMsg.setMsfCommand(paramToServiceMsg.getMsfCommand());
          f.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          return;
          QLog.d(e, 1, "onRecvResp quicksend succ occurred 2901, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
        }
      }
      catch (Exception localException1)
      {
        for (;;)
        {
          localException1.printStackTrace();
        }
      }
    }
    if (i.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq())))
    {
      QLog.d(e, 1, "onRecvResp quicksend succ, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
      try
      {
        aa.a(paramToServiceMsg, paramFromServiceMsg, true);
        if ((f.quicksender != null) && (f.quicksender.b(paramToServiceMsg))) {
          f.quicksender.c.b(paramToServiceMsg, paramFromServiceMsg);
        }
        h(paramToServiceMsg);
        paramFromServiceMsg.getAttributes().put("_attr_send_by_quickHttp", Boolean.valueOf(true));
        paramFromServiceMsg.setAppId(paramToServiceMsg.getAppId());
        paramFromServiceMsg.setAppSeq(paramToServiceMsg.getAppSeq());
        paramFromServiceMsg.setMsfCommand(paramToServiceMsg.getMsfCommand());
        f.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        return;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          localException2.printStackTrace();
        }
      }
    }
    QLog.d(e, 1, "onRecvResp quicksend result not notice, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, boolean paramBoolean)
  {
    long l2 = 0L;
    boolean bool = false;
    long l1 = l2;
    if (paramToServiceMsg != null)
    {
      l1 = l2;
      if (paramToServiceMsg.getAttributes().containsKey("quickSendDetectTime"))
      {
        long l3 = ((Long)paramToServiceMsg.getAttributes().get("quickSendDetectTime")).longValue();
        l1 = l2;
        if (l3 > 0L) {
          l1 = SystemClock.elapsedRealtime() - l3;
        }
      }
    }
    int m;
    if (paramFromServiceMsg.getBusinessFailCode() == 1002)
    {
      if (QLog.isColorLevel()) {
        QLog.d(e, 2, "handleQuickHeartbeat wait " + paramToServiceMsg + " timeout.");
      }
      if (paramBoolean)
      {
        if (QLog.isColorLevel()) {
          QLog.d(e, 2, "new conn has created, stop quick detectind");
        }
        j.set(false);
        m = 3;
        paramBoolean = bool;
        if (f.statReporter != null)
        {
          paramToServiceMsg = new HashMap();
          if (f.getAccountCenter() == null) {
            break label494;
          }
          paramToServiceMsg.put("account", f.getAccountCenter().i());
        }
      }
    }
    for (;;)
    {
      paramToServiceMsg.put("closeType", "" + m);
      f.statReporter.a("dim.Msf.QuickSendDetect", paramBoolean, l1, 0L, paramToServiceMsg, false, false);
      return;
      if (!f.sender.a.b())
      {
        if (QLog.isColorLevel()) {
          QLog.d(e, 2, "conn is also closed, stop quick detecting");
        }
        j.set(false);
        m = 1;
        paramBoolean = bool;
        break;
      }
      l2 = SystemClock.elapsedRealtime();
      if (l2 > k + com.tencent.mobileqq.msf.core.a.a.D())
      {
        k = l2;
        try
        {
          QLog.d(e, 1, "handleQuickHeartbeat disconn: " + System.currentTimeMillis() + " mLastDetectDisconnTime:" + l2);
          f.sender.a.a(com.tencent.qphone.base.a.A);
          m = 2;
          j.set(false);
          paramBoolean = bool;
          break;
        }
        catch (Exception paramToServiceMsg)
        {
          QLog.d(e, 1, "handleQuickHeartbeat disconn error", paramToServiceMsg);
          j.set(false);
          m = 0;
          paramBoolean = bool;
          break;
        }
        finally
        {
          j.set(false);
        }
      }
      j.set(false);
      QLog.d(e, 1, "handleQuickHeartbeat stop disconn by too frequency.");
      m = 0;
      paramBoolean = bool;
      break;
      QLog.d(e, 1, "recv Quick heart resp.now conn is alive.");
      j.set(false);
      paramBoolean = true;
      m = 0;
      break;
      label494:
      paramToServiceMsg.put("account", f.sender.e());
    }
  }
  
  public boolean a(int paramInt)
  {
    return i.contains(Integer.valueOf(paramInt));
  }
  
  public void b()
  {
    if (j.get())
    {
      QLog.d(e, 1, "quick heart beat has sending, return.");
      return;
    }
    if (f.sender.a.b())
    {
      j.set(true);
      ToServiceMsg localToServiceMsg = new ToServiceMsg("", "0", "Heartbeat.Ping");
      localToServiceMsg.setMsfCommand(MsfCommand._msf_QuickHeartBeat);
      localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localToServiceMsg.setAppId(f.getMsfAppid());
      localToServiceMsg.putWupBuffer(new byte[] { 0, 0, 0, 4 });
      localToServiceMsg.setTimeout(com.tencent.mobileqq.msf.core.a.a.C());
      localToServiceMsg.getAttributes().put("quickSendDetectTime", Long.valueOf(SystemClock.elapsedRealtime()));
      f.sender.a(localToServiceMsg);
      return;
    }
    j.set(false);
  }
  
  public void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if (paramToServiceMsg.isQuickSendEnable())
    {
      QLog.d(e, 1, "onRecvNormalResp, cmd: " + paramToServiceMsg.getServiceCmd() + " ssoSeq: " + paramToServiceMsg.getRequestSsoSeq());
      h(paramToServiceMsg);
    }
  }
  
  public boolean b(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg == null) {}
    do
    {
      return false;
      if (e(paramToServiceMsg)) {
        paramToServiceMsg.setQuickSend(true, 1);
      }
    } while ((h.contains(paramToServiceMsg.getServiceCmd())) || (!paramToServiceMsg.isQuickSendEnable()) || (QuickSendStrategy.getStragegyArgs(paramToServiceMsg.getQuickSendStrategy()) == null));
    return true;
  }
  
  public void c(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg != null)
    {
      a localA = QuickSendStrategy.getStragegyArgs(paramToServiceMsg.getQuickSendStrategy());
      if ((localA != null) && (a >= 5000L))
      {
        a localA1 = new a(paramToServiceMsg);
        l.postDelayed(localA1, a);
        paramToServiceMsg.getAttributes().put("to_msgtimeoutCallbacker", localA1);
      }
    }
  }
  
  public void d(ToServiceMsg paramToServiceMsg)
  {
    if ((paramToServiceMsg != null) && (paramToServiceMsg.getAttributes().containsKey("to_msgtimeoutCallbacker")))
    {
      QLog.d(e, 1, "remove timoutchecker for msg");
      Runnable localRunnable = (Runnable)paramToServiceMsg.getAttributes().get("to_msgtimeoutCallbacker");
      l.removeCallbacks(localRunnable);
      paramToServiceMsg.getAttributes().remove("to_msgtimeoutCallbacker");
    }
  }
  
  public boolean e(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg == null) {}
    do
    {
      Object localObject;
      do
      {
        do
        {
          return false;
          localObject = paramToServiceMsg.getServiceCmd();
        } while ((!"MessageSvc.PbSendMsg".equals(localObject)) && (!"ImgStore.GroupPicUp".equals(localObject)) && (!"ImgStore.GroupPicDown".equals(localObject)) && (!"LongConn.OffPicUp".equals(localObject)) && (!"LongConn.OffPicDown".equals(localObject)));
        localObject = QuickSendStrategy.getStragegyArgs(1);
      } while (localObject == null);
      if (a >= paramToServiceMsg.getTimeout()) {
        break;
      }
    } while (("MessageSvc.PbSendMsg".equals(paramToServiceMsg.getServiceCmd())) && (!paramToServiceMsg.getAttributes().containsKey("normal_msg")));
    return true;
    QLog.d(e, 1, "no try quicksend request ssoseq: " + paramToServiceMsg.getRequestSsoSeq() + " by timeout error");
    return false;
  }
  
  class a
    implements Runnable
  {
    private ToServiceMsg b;
    
    public a(ToServiceMsg paramToServiceMsg)
    {
      b = paramToServiceMsg;
    }
    
    public void run()
    {
      if (b == null) {
        QLog.d(b.b(b.this), 1, "req null, return.");
      }
      for (;;)
      {
        return;
        try
        {
          if ((cquicksender != null) && (cquicksender.b(b))) {
            cquicksender.c.b(b);
          }
          a(b);
          a localA = QuickSendStrategy.getStragegyArgs(b.getQuickSendStrategy());
          if ((localA == null) || (!d)) {
            continue;
          }
          b();
          return;
        }
        catch (Throwable localThrowable)
        {
          for (;;)
          {
            localThrowable.printStackTrace();
          }
        }
      }
    }
  }
}
