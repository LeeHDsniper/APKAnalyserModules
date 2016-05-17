package com.tencent.mobileqq.msf.core.quicksend;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.service.MsfService;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class d
{
  private static final int b = 1000;
  private static final long c = 1800000L;
  private final ConcurrentHashMap a = new ConcurrentHashMap(1000);
  private Handler d = new e(this, Looper.getMainLooper());
  
  public d()
  {
    d.sendEmptyMessageDelayed(1000, 1800000L);
  }
  
  private void a()
  {
    if ((a != null) && (a.size() > 0))
    {
      Iterator localIterator = a.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        a localA = (a)localEntry.getValue();
        if (SystemClock.elapsedRealtime() - d >= 1800000L)
        {
          if (f > 0L) {
            if (g <= 0L) {
              break label121;
            }
          }
          label121:
          for (boolean bool = true;; bool = false)
          {
            a(localA, bool);
            a.remove(localEntry.getKey());
            break;
          }
        }
      }
    }
  }
  
  private static void a(a paramA, boolean paramBoolean)
  {
    if (paramA != null)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("uin", a);
      localHashMap.put("ssoSeq", "" + b);
      localHashMap.put("cmd", "" + c);
      localHashMap.put("normalCost", "" + (e - d));
      localHashMap.put("quickCostTime", "" + (g - f));
      MsfService.core.getStatReporter().a("dim.Msf.QuickSendEffect", paramBoolean, 0L, 0L, localHashMap, false, false);
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg != null)
    {
      a localA = new a();
      a = paramToServiceMsg.getUin();
      b = paramToServiceMsg.getRequestSsoSeq();
      c = paramToServiceMsg.getServiceCmd();
      d = SystemClock.elapsedRealtime();
      a.put(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()), localA);
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    long l = SystemClock.elapsedRealtime();
    if ((paramToServiceMsg != null) && (a.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))))
    {
      paramFromServiceMsg = (a)a.get(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
      if (f > 0L)
      {
        e = l;
        if ((g <= 0L) || (g > d)) {
          break label103;
        }
      }
    }
    label103:
    for (boolean bool = true;; bool = false)
    {
      a(paramFromServiceMsg, bool);
      a.remove(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
      return;
    }
  }
  
  public void b(ToServiceMsg paramToServiceMsg)
  {
    if ((paramToServiceMsg != null) && (a.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq())))) {
      a.get(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))).f = SystemClock.elapsedRealtime();
    }
  }
  
  public void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    long l = SystemClock.elapsedRealtime();
    if ((paramToServiceMsg != null) && (a.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))))
    {
      paramFromServiceMsg = (a)a.get(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
      if (f > 0L)
      {
        g = l;
        if ((e > 0L) && (e <= g)) {
          break label103;
        }
      }
    }
    label103:
    for (boolean bool = true;; bool = false)
    {
      a(paramFromServiceMsg, bool);
      a.remove(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
      return;
    }
  }
  
  static class a
  {
    public String a;
    public int b;
    public String c;
    public long d;
    public long e;
    public long f;
    public long g;
    
    a() {}
  }
}
