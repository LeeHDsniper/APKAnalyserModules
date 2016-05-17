package com.tencent.mobileqq.msf.core.c;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.PowerManager;
import android.os.SystemClock;
import android.text.TextUtils;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.net.h;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.net.InetSocketAddress;
import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public class a
  extends BroadcastReceiver
{
  public static final String a = "storeflow";
  public static final String b = "key_storeflow";
  private static final String c = "StandbyModeManager";
  private static final int h = 10001;
  private static final String n = "standbyMode";
  private static final String o = "enterTime";
  private static final String p = "enterTimeSys";
  private static final String q = "contiousTime";
  private static final String r = "disconnCount";
  private AtomicBoolean d = new AtomicBoolean(false);
  private AtomicBoolean e = new AtomicBoolean(false);
  private AtomicInteger f = new AtomicInteger(0);
  private HashSet g = new HashSet();
  private MsfCore i;
  private d j;
  private long k = 0L;
  private long l = 0L;
  private String m = "0";
  private Handler s = new c(this);
  
  public a(MsfCore paramMsfCore)
  {
    i = paramMsfCore;
    i();
    j = new d(paramMsfCore);
    new b(this, "StandbyModeInit").start();
  }
  
  private void c(String paramString)
  {
    if (d.get())
    {
      QLog.d("StandbyModeManager", 1, "exitStandbyMode");
      long l1 = SystemClock.elapsedRealtime();
      long l2 = System.currentTimeMillis();
      HashMap localHashMap = new HashMap();
      localHashMap.put("account", h());
      localHashMap.put("contious", String.valueOf(l1 - k));
      localHashMap.put("disconnCount", String.valueOf(f.get()));
      localHashMap.put("notifyReconnect", String.valueOf(e.get()));
      localHashMap.put("exitReason", paramString);
      localHashMap.put("start", String.valueOf(l));
      localHashMap.put("end", String.valueOf(l2));
      i.getStatReporter().a("dim.Msf.StandbyModeExit", true, 0L, 0L, localHashMap, false, false);
      j.a();
      BaseApplication.getContext().getSharedPreferences("standbyMode", 0).edit().putLong("enterTime", 0L).putLong("enterTimeSys", 0L).putLong("enterTimeSys", 0L).putInt("disconnCount", 0).commit();
      k = 0L;
      m = "0";
      f.set(0);
      d.set(false);
      if ((i.sender.a.b()) && (e.get()))
      {
        QLog.d("StandbyModeManager", 1, "notifyConnOpened when exitStandbyMode");
        NetConnInfoCenter.onConnOpened(i.sender.a.s().toString(), i.nowSocketConnAdd);
        if (i.sender.a.t())
        {
          QLog.d("StandbyModeManager", 1, "notifyFirestMsgRecved when exitStandbyMode");
          NetConnInfoCenter.onRecvFirstResp();
        }
      }
      e.set(false);
    }
  }
  
  private void i()
  {
    g.add("GrayUinPro.Check");
    g.add("cmd_openConn");
    g.add("StatSvc.register");
    g.add("StatSvc.SimpleGet");
    g.add("wtlogin.");
    g.add("login.");
    g.add("Heartbeat.Alive");
    g.add("ConfigPushSvc.PushResp");
    g.add("SSO.HelloPush");
    g.add("MessageSvc.");
    g.add("OnlinePush.");
    g.add("PbMessageSvc.");
    g.add("ImgStore.GroupPicUp");
    g.add("ImgStore.GroupPicDown");
    g.add("PttStore.GroupPttUp");
    g.add("PttStore.GroupPttDown");
    g.add("LongConn.OffPicUp");
    g.add("LongConn.OffPicDown");
    g.add("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_UPLOAD-500");
    g.add("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_DOWNLOAD-1200");
    g.add("OfflineFilleHandleSvr.pb_ftnPtt_CMD_REQ_APPLY_DOWNLOAD-1200");
    g.add("MultiMsg.ApplyUp");
    g.add("MultiMsg.ApplyDown");
    g.add("PttCenterSvr.ShortVideoUpReq");
    g.add("PttCenterSvr.ShortVideoDownReq");
    g.add("PttCenterSvr.GroupShortVideoUpReq");
    g.add("PttCenterSvr.GroupShortVideoDownReq");
    g.add("EqqAccountSvc.get_eqq_detail");
    g.add("hrtxformqq.getUsrSimpleInfo");
    g.add("PubAccountSvc.get_detail_info");
    g.add("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD_V2-1600");
    g.add("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD_V3-1700");
    g.add("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD_HIT_V2-1800");
    g.add("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_DOWNLOAD-1200");
    g.add("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_FILE_QUERY-1400");
    g.add("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_COPY_TO-60100");
    g.add("VideoCCSvc.PutInfo");
    g.add("SharpSvr.s2cack");
    g.add("SharpSvr.c2s");
    g.add("MultiVideo.s2cack");
    g.add("SharpSvr.s2cackMSF");
    g.add("VideoSvc.Ack");
    g.add("QQWifiSvc.AvailQQWiFi");
    g.add("QQWifiSvc.QQWiFiJarInfo");
    g.add("QQWifiSvc.wifiReport");
    g.add("QQWifiSvc.getAccount");
    g.add("QQWifiSvc.ReportWiFiStatus");
    g.add("QQWifiSvc.getNearWiFi");
    g.add("QQWifiSvc.getNearbyAvailWiFiInfo");
    a(com.tencent.mobileqq.msf.core.a.a.am());
  }
  
  private void j()
  {
    SharedPreferences localSharedPreferences = BaseApplication.getContext().getSharedPreferences("standbyMode", 0);
    long l1 = localSharedPreferences.getLong("enterTime", 0L);
    long l2 = localSharedPreferences.getLong("enterTimeSys", 0L);
    long l3 = localSharedPreferences.getLong("contiousTime", 0L);
    int i1 = localSharedPreferences.getInt("disconnCount", 0);
    if ((l1 > 0L) && (l2 > 0L))
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("account", h());
      localHashMap.put("contious", String.valueOf(l3));
      localHashMap.put("disconnCount", String.valueOf(i1));
      localHashMap.put("notifyReconnect", String.valueOf(false));
      localHashMap.put("exitReason", "crashed");
      localHashMap.put("start", String.valueOf(l));
      localHashMap.put("end", String.valueOf(l2 + l3));
      i.getStatReporter().a("dim.Msf.StandbyModeExit", true, 0L, 0L, localHashMap, false, false);
    }
    localSharedPreferences.edit().putLong("enterTime", 0L).putLong("enterTimeSys", 0L).putLong("enterTimeSys", 0L).putInt("disconnCount", 0).commit();
  }
  
  private void k()
  {
    s.removeMessages(10001);
    c("screeOn");
  }
  
  private void l()
  {
    if (!d.get())
    {
      if (o())
      {
        s.removeMessages(10001);
        if (!p())
        {
          s.sendEmptyMessageDelayed(10001, com.tencent.mobileqq.msf.core.a.a.n());
          return;
        }
        QLog.d("StandbyModeManager", 1, "stop try start standby by lockScreenMsg ON when screenoff");
        return;
      }
      QLog.d("StandbyModeManager", 1, "stop try start standby by mobileOff ON when screenoff");
      return;
    }
    QLog.d("StandbyModeManager", 1, "stop try start standby by alreadyActive ON when screenoff");
  }
  
  private void m()
  {
    if (d.compareAndSet(false, true))
    {
      QLog.d("StandbyModeManager", 1, "enterStandbyMode");
      m = h();
      k = SystemClock.elapsedRealtime();
      l = System.currentTimeMillis();
      HashMap localHashMap = new HashMap();
      localHashMap.put("account", m);
      i.getStatReporter().a("dim.Msf.StandbyModeEnter", true, 0L, 0L, localHashMap, false, false);
      BaseApplication.getContext().getSharedPreferences("standbyMode", 0).edit().putLong("enterTime", k).putLong("enterTimeSys", l).putLong("enterTimeSys", 0L).putInt("disconnCount", 0).commit();
    }
  }
  
  private boolean n()
  {
    return ((PowerManager)BaseApplication.getContext().getSystemService("power")).isScreenOn();
  }
  
  private boolean o()
  {
    return NetConnInfoCenterImpl.isMobileConn();
  }
  
  private boolean p()
  {
    String str = i.getAccountCenter().i();
    if ((TextUtils.isEmpty(str)) || ("0".equals(str)))
    {
      QLog.d("StandbyModeManager", 1, "can't know current main account");
      return true;
    }
    return SettingCloneUtil.readValue(BaseApplication.getContext(), str, "锁屏显示消息弹框", "qqsetting_lock_screen_whenexit_key", true);
  }
  
  public void a()
  {
    if (d.get()) {
      BaseApplication.getContext().getSharedPreferences("standbyMode", 0).edit().putLong("contiousTime", k - SystemClock.elapsedRealtime()).putInt("disconnCount", f.get()).commit();
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    j.a(paramToServiceMsg);
  }
  
  public void a(String[] paramArrayOfString)
  {
    if ((g != null) && (paramArrayOfString != null))
    {
      int i2 = paramArrayOfString.length;
      int i1 = 0;
      while (i1 < i2)
      {
        String str = paramArrayOfString[i1];
        g.add(str);
        i1 += 1;
      }
    }
  }
  
  public boolean a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    do
    {
      int i1;
      do
      {
        return false;
        if (g.contains(paramString)) {
          return true;
        }
        i1 = paramString.indexOf(".");
      } while (i1 <= 0);
      paramString = paramString.substring(0, i1) + ".";
    } while (!g.contains(paramString));
    return true;
  }
  
  public void b(ToServiceMsg paramToServiceMsg)
  {
    j.b(paramToServiceMsg);
  }
  
  public boolean b()
  {
    return (com.tencent.mobileqq.msf.core.a.a.an()) && (d.get());
  }
  
  public boolean b(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || ("0".equals(paramString)))
    {
      QLog.d("StandbyModeManager", 1, "can't know current main account");
      return true;
    }
    return SettingCloneUtil.readValue(BaseApplication.getContext(), paramString, "锁屏显示消息弹框", "qqsetting_lock_screen_whenexit_key", true);
  }
  
  public HashSet c()
  {
    return g;
  }
  
  public void d()
  {
    QLog.d("StandbyModeManager", 1, "onMobileOn");
    if (!d.get())
    {
      if (!n())
      {
        s.removeMessages(10001);
        if (!p())
        {
          s.obtainMessage().obj = i.getAccountCenter().i();
          s.sendEmptyMessageDelayed(10001, com.tencent.mobileqq.msf.core.a.a.n());
          return;
        }
        QLog.d("StandbyModeManager", 1, "stop try start standby by lockScreenMsg ON when mobileOn");
        return;
      }
      QLog.d("StandbyModeManager", 1, "stop try start standby by screenOn ON when mobileOn");
      return;
    }
    QLog.d("StandbyModeManager", 1, "stop try start standby by alreadyActive ON when mobileOn");
  }
  
  public void e()
  {
    QLog.d("StandbyModeManager", 1, "onWifiOn");
    s.removeMessages(10001);
    c("wifiOn");
  }
  
  public void f()
  {
    if (d.get())
    {
      QLog.d("StandbyModeManager", 1, "onConnClosed");
      f.incrementAndGet();
    }
  }
  
  public void g()
  {
    if (d.get())
    {
      QLog.d("StandbyModeManager", 1, "onConnOpened");
      e.compareAndSet(false, true);
    }
  }
  
  public String h()
  {
    if ((i.getAccountCenter() != null) && (i.getAccountCenter().i() != null) && (i.getAccountCenter().i().length() >= 4)) {
      return i.getAccountCenter().i();
    }
    return "0";
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent == null) {
      QLog.d("StandbyModeManager", 1, "onReceive intent==null");
    }
    do
    {
      return;
      paramContext = paramIntent.getAction();
      QLog.d("StandbyModeManager", 1, "onReceive action: " + paramContext);
      if ("android.intent.action.SCREEN_ON".equals(paramContext))
      {
        k();
        return;
      }
    } while (!"android.intent.action.SCREEN_OFF".equals(paramContext));
    l();
  }
}
