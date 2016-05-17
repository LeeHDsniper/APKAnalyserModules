package com.tencent.mobileqq.msf.service;

import android.text.TextUtils;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.push.d;
import com.tencent.mobileqq.msf.core.push.f;
import com.tencent.mobileqq.msf.sdk.MsfMessagePair;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.IMsfServiceCallbacker;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.ConcurrentLinkedQueue;

public class b
{
  private static final String i = "MSF.S.AppProcessInfo";
  volatile boolean a = true;
  volatile long b = 0L;
  volatile boolean c = false;
  volatile long d = 0L;
  String e;
  String f;
  ConcurrentLinkedQueue g = new ConcurrentLinkedQueue();
  public h h = null;
  private IMsfServiceCallbacker j;
  
  public b() {}
  
  public String a()
  {
    return e + "," + b() + "," + a;
  }
  
  public void a(int paramInt, long paramLong1, long paramLong2)
  {
    if (h != null) {
      h.a(paramInt, paramLong1, paramLong2);
    }
  }
  
  public void a(int paramInt, String paramString)
  {
    if (h != null) {
      h.a(paramInt);
    }
    while ((paramInt != 0) || (TextUtils.isEmpty(f))) {
      return;
    }
    paramInt = c.e.getUinPushStatus(paramString);
    g.a(BaseApplication.getContext(), e, paramString, f, paramInt);
    getCorepushManager.i.a();
  }
  
  public void a(IMsfServiceCallbacker paramIMsfServiceCallbacker)
  {
    j = paramIMsfServiceCallbacker;
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    g.add(new MsfMessagePair(paramToServiceMsg, paramFromServiceMsg));
    c.d.a();
  }
  
  public void a(String paramString)
  {
    f = paramString;
  }
  
  public void a(String paramString1, String paramString2, IMsfServiceCallbacker paramIMsfServiceCallbacker)
  {
    e = paramString1;
    a(paramString2);
    if (paramIMsfServiceCallbacker != null)
    {
      a(paramIMsfServiceCallbacker);
      a = true;
    }
    for (;;)
    {
      d = 0L;
      c = false;
      if (QLog.isColorLevel()) {
        QLog.d("MSF.S.AppProcessInfo", 2, paramString1 + " onAppBind, isAppConnected " + a);
      }
      if (h != null) {
        h.a(paramIMsfServiceCallbacker);
      }
      return;
      if (c() == null) {
        a = false;
      } else {
        a = true;
      }
    }
  }
  
  public String b()
  {
    return f;
  }
  
  public IMsfServiceCallbacker c()
  {
    return j;
  }
  
  public void d()
  {
    a(null);
    a = false;
    c = false;
    if (QLog.isColorLevel()) {
      QLog.d("MSF.S.AppProcessInfo", 2, e + " setAppDisConnected, isAppConnected " + a);
    }
  }
}
