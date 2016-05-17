package com.tencent.mobileqq.msf.core;

import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import com.qq.jce.wup.UniPacket;
import com.tencent.mobileqq.msf.core.b.e.a;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.VerifyCodeInfo;
import com.tencent.msf.service.protocol.push.RequestMSFForceOffline;
import com.tencent.msf.service.protocol.security.k;
import com.tencent.msf.service.protocol.security.n;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public class y
{
  public static ConcurrentHashMap a = new ConcurrentHashMap();
  public static final int b = 210;
  public static final int c = -12003;
  public static final int d = -10001;
  public static final int e = -10003;
  public static final int f = -10004;
  public static final int g = -10005;
  public static final int h = -10006;
  public static final int i = -10000;
  public static final int j = -10007;
  public static final int k = -10009;
  public static final int l = -10101;
  public static final int m = -10102;
  public static final int n = -10103;
  public static final int o = -10104;
  public static final int p = -10105;
  public static final int q = -10106;
  static final String r = "OverLoadPush.notify";
  private static final String v = "MSF.C.SSORespHandler";
  private static final int w = 1000;
  MsfCore s;
  long t = -1L;
  long u = -1L;
  private Handler x = new z(this);
  
  public y(MsfCore paramMsfCore)
  {
    s = paramMsfCore;
  }
  
  public static void a(FromServiceMsg paramFromServiceMsg)
  {
    paramFromServiceMsg.setBusinessFail(2002, "verifyCode");
    paramFromServiceMsg.setMsfCommand(MsfCommand.onRecvVerifyCode);
  }
  
  protected boolean a(int paramInt)
  {
    return (paramInt == 53533) || (paramInt == 210) || (paramInt == 55535) || (paramInt == 55533) || (paramInt == 55532) || (paramInt == 55530) || (paramInt == 55430);
  }
  
  protected boolean a(FromServiceMsg paramFromServiceMsg, ToServiceMsg paramToServiceMsg)
  {
    int i2 = paramFromServiceMsg.getBusinessFailCode();
    boolean bool2 = a(i2);
    Object localObject1;
    int i1;
    if (55430 == i2)
    {
      localObject1 = new HashMap();
      ((HashMap)localObject1).put("uin", paramFromServiceMsg.getUin());
      ((HashMap)localObject1).put("time", new Date().toString());
      com.tencent.mobileqq.msf.core.b.m localM = s.statReporter;
      if (true == bool2)
      {
        i1 = 1;
        localM.a("dim.Msf.ForceQuitParseFail", true, i1, 0L, (Map)localObject1, false, false);
      }
    }
    else
    {
      bool1 = bool2;
      if (!bool2)
      {
        bool1 = bool2;
        if (i2 == 55531)
        {
          if (t == -1L) {
            t = System.currentTimeMillis();
          }
          if (s.sender.V.get()) {
            break label373;
          }
          if (s.getAccountCenter().a(paramFromServiceMsg.getUin())) {
            break label1486;
          }
          QLog.d("MSF.C.SSORespHandler", 1, "reload D2 failed");
          s.sender.U = 1;
        }
      }
    }
    label201:
    label373:
    label1486:
    for (boolean bool1 = true;; bool1 = bool2)
    {
      s.sender.V.set(true);
      if (bool1)
      {
        s.getAccountCenter().m(paramFromServiceMsg.getUin());
        if ((!com.tencent.mobileqq.msf.service.g.b()) && ((u == -1L) || (System.currentTimeMillis() - u > 10000L))) {}
        try
        {
          localObject1 = com.tencent.mobileqq.msf.service.g.c();
          i1 = s.getUinPushStatus(paramFromServiceMsg.getUin());
          com.tencent.mobileqq.msf.service.g.a(BaseApplication.getContext(), BaseApplication.getContext().getPackageName(), paramFromServiceMsg.getUin(), (String)localObject1, i1);
          QLog.d("MSF.C.SSORespHandler", 1, "sendBootAction for mainProcess for " + MD5.toMD5(paramFromServiceMsg.getUin()));
          u = System.currentTimeMillis();
          paramFromServiceMsg.setBusinessFail(2001, paramFromServiceMsg.getBusinessFailMsg());
          MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
          s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          s.getStatReporter().a(0L, i2, 0L);
          return true;
          i1 = 0;
          break;
          if ((paramToServiceMsg != null) && (s.sender.U != -1) && (paramToServiceMsg.getRequestSsoSeq() >= s.sender.U))
          {
            bool2 = true;
            bool1 = bool2;
            if (!QLog.isColorLevel()) {
              break label201;
            }
            QLog.d("MSF.C.SSORespHandler", 2, "set userTokenExpired. afterReloadD2SendSeq is " + s.sender.U);
            bool1 = bool2;
            break label201;
          }
          bool1 = bool2;
          if (t == -1L) {
            break label201;
          }
          bool1 = bool2;
          if (System.currentTimeMillis() - t <= 60000L) {
            break label201;
          }
          bool2 = true;
          bool1 = bool2;
          if (!QLog.isColorLevel()) {
            break label201;
          }
          QLog.d("MSF.C.SSORespHandler", 2, "set userTokenExpired after so long wait. ");
          bool1 = bool2;
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            QLog.d("MSF.C.SSORespHandler", 1, "sendBootAction for mainProcess error " + localException1, localException1);
          }
        }
      }
      if (i2 == 55435)
      {
        paramFromServiceMsg.setBusinessFail(2011, paramFromServiceMsg.getBusinessFailMsg());
        MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
        s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        return true;
      }
      if (i2 == 55434)
      {
        s.suspend();
        paramFromServiceMsg.setBusinessFail(2009, paramFromServiceMsg.getBusinessFailMsg());
        MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
        s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        return true;
      }
      if (i2 == 55433)
      {
        s.getAccountCenter().m(paramFromServiceMsg.getUin());
        paramFromServiceMsg.setBusinessFail(2012, paramFromServiceMsg.getBusinessFailMsg());
        MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
        s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        return true;
      }
      if (i2 == 55527)
      {
        paramFromServiceMsg.setBusinessFail(2015, paramFromServiceMsg.getBusinessFailMsg());
        MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
        s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        s.sender.a(com.tencent.qphone.base.a.m);
        return true;
      }
      if (i2 == 55432)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.SSORespHandler", 2, "get CODE_SSO_FORCEQUIT kill " + BaseApplication.getContext().getPackageName() + ":qq now");
        }
        MsfSdkUtils.killProcess(BaseApplication.getContext(), BaseApplication.getContext().getPackageName());
        return true;
      }
      if (i2 == 55431)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.SSORespHandler", 2, "get CODE_SSO_FORCEQUITSDK kill " + BaseApplication.getContext().getPackageName() + ":msf now");
        }
        MsfSdkUtils.killProcess(BaseApplication.getContext(), BaseApplication.getContext().getPackageName() + ":MSF");
        return true;
      }
      Object localObject2 = null;
      if (paramToServiceMsg != null) {
        localObject2 = (com.tencent.msf.service.protocol.e.d)a.get(paramToServiceMsg.getUin());
      }
      if ((localObject2 != null) && (!paramFromServiceMsg.getServiceCmd().startsWith("login.")) && (!paramToServiceMsg.getServiceCmd().startsWith("wtlogin.login")) && (!paramToServiceMsg.getServiceCmd().equals("GrayUinPro.Check")))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.SSORespHandler", 2, "error, " + paramFromServiceMsg.getUin() + " not in gray list");
        }
        if (paramToServiceMsg != null) {}
        try
        {
          paramFromServiceMsg.setBusinessFail(2008, new String(c, "UTF-8"));
          paramFromServiceMsg.addAttribute(paramFromServiceMsg.getServiceCmd(), String.valueOf(b));
          MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
          s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          return true;
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            paramFromServiceMsg.setBusinessFail(2008, paramToServiceMsg.getUin() + " not in gray list");
          }
        }
      }
      if (paramFromServiceMsg.getServiceCmd().equals("MessageSvc.PushForceOffline")) {
        try
        {
          s.pushManager.b(paramFromServiceMsg.getUin());
          paramFromServiceMsg.addAttribute("_attr_sameDevice", Boolean.valueOf(false));
          paramFromServiceMsg.setBusinessFail(2013, paramFromServiceMsg.getBusinessFailMsg());
          MsfSdkUtils.addFromMsgProcessName("*", paramFromServiceMsg);
          s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          com.tencent.mobileqq.msf.core.net.a.a.a("kicked");
          return true;
        }
        catch (Exception paramFromServiceMsg)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("MSF.C.SSORespHandler", 2, "handle forceLogout error " + paramFromServiceMsg);
            }
          }
        }
      }
      if (paramFromServiceMsg.getServiceCmd().equals("StatSvc.ReqMSFOffline")) {
        try
        {
          s.pushManager.b(paramFromServiceMsg.getUin());
          paramToServiceMsg = new UniPacket(true);
          paramToServiceMsg.setEncodeName("utf-8");
          paramToServiceMsg.decode(paramFromServiceMsg.getWupBuffer());
          paramToServiceMsg = (RequestMSFForceOffline)paramToServiceMsg.getByClass("RequestMSFForceOffline", new RequestMSFForceOffline());
          paramToServiceMsg = new com.tencent.msf.service.protocol.push.a(lUin, iSeqno, (byte)0);
          localObject2 = new ToServiceMsg("", paramFromServiceMsg.getUin(), "StatSvc.RspMSFForceOffline");
          ((ToServiceMsg)localObject2).addAttribute("_attr_sameDevice", Boolean.valueOf(false));
          UniPacket localUniPacket = new UniPacket(true);
          localUniPacket.setEncodeName("utf-8");
          localUniPacket.setServantName("StatSvc");
          localUniPacket.setFuncName("RspMSFForceOffline");
          localUniPacket.put("RspMSFForceOffline", paramToServiceMsg);
          ((ToServiceMsg)localObject2).setMsfCommand(MsfCommand._msf_kickedAndCleanTokenResp);
          ((ToServiceMsg)localObject2).setNeedCallback(false);
          ((ToServiceMsg)localObject2).putWupBuffer(localUniPacket.encode());
          ((ToServiceMsg)localObject2).setRequestSsoSeq(MsfCore.getNextSeq());
          ((ToServiceMsg)localObject2).setAppId(s.getMsfAppid());
          ((ToServiceMsg)localObject2).setTimeout(30000L);
          ((ToServiceMsg)localObject2).addAttribute(((ToServiceMsg)localObject2).getServiceCmd(), paramFromServiceMsg);
          s.sender.b((ToServiceMsg)localObject2);
          com.tencent.mobileqq.msf.core.net.a.a.a("kicked");
          return true;
        }
        catch (Exception paramFromServiceMsg)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("MSF.C.SSORespHandler", 2, "send offlineResp error " + paramFromServiceMsg);
            }
          }
        }
      }
      return false;
    }
  }
  
  public boolean a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if ((paramToServiceMsg == null) && (paramFromServiceMsg == null))
    {
      QLog.d("MSF.C.SSORespHandler", 1, "handleHttpSsoResp msg is empty");
      return false;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("ConfigPushSvc.PushReq"))
    {
      paramToServiceMsg = new UniPacket(true);
      paramToServiceMsg.setEncodeName("utf-8");
      paramToServiceMsg.decode(paramFromServiceMsg.getWupBuffer());
      paramFromServiceMsg.getUin();
      paramToServiceMsg = (com.tencent.msf.service.protocol.serverconfig.f)paramToServiceMsg.getByClass("PushReq", new com.tencent.msf.service.protocol.serverconfig.f());
      s.ssoListManager.a(paramToServiceMsg);
      return false;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("MessageSvc.QueryPullUp"))
    {
      s.pushManager.p().a(paramToServiceMsg, paramFromServiceMsg);
      return true;
    }
    if (paramToServiceMsg.getAttributes().containsKey("attr_quick_send"))
    {
      s.quicksender.a(paramToServiceMsg, paramFromServiceMsg);
      return true;
    }
    return false;
  }
  
  public void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if ((paramToServiceMsg == null) && (paramFromServiceMsg == null)) {
      QLog.d("MSF.C.SSORespHandler", 1, "handleHttpSsoFailResp msg is empty");
    }
    do
    {
      return;
      if (paramToServiceMsg.getServiceCmd().equals("MessageSvc.QueryPullUp"))
      {
        s.pushManager.p().a(paramToServiceMsg, paramFromServiceMsg);
        return;
      }
    } while (!paramToServiceMsg.getAttributes().containsKey("attr_quick_send"));
    s.quicksender.a(paramToServiceMsg, paramFromServiceMsg);
  }
  
  public void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if (paramToServiceMsg != null)
    {
      paramToServiceMsg.getAttributes().remove("to_timeoutCallbacker");
      if ((s.getMsfAppid() == -1) && (paramToServiceMsg.getAppId() != 100) && (!paramToServiceMsg.getUin().equals("0"))) {
        s.setMsfAppid(paramToServiceMsg.getAppId());
      }
    }
    if ((w.p) && (com.tencent.mobileqq.msf.core.net.a.f.a())) {}
    label465:
    label510:
    int i1;
    label710:
    do
    {
      try
      {
        QLog.d("MSF.C.NetConnTag", 1, "recv data in socket adaptor way");
        if (s.sender.F != null) {
          s.sender.F.b().a(paramFromServiceMsg.getRequestSsoSeq(), false);
        }
        if (paramFromServiceMsg.getServiceCmd().equals("RegPrxySvc.PbSyncMsg")) {
          paramFromServiceMsg.addAttribute("infoSync_timestamp", Long.valueOf(SystemClock.elapsedRealtime()));
        }
        if (("LongConn.OffPicUp".equals(paramFromServiceMsg.getServiceCmd())) || ("ImgStore.GroupPicUp".equals(paramFromServiceMsg.getServiceCmd())))
        {
          StringBuilder localStringBuilder = new StringBuilder().append("SsoRespHandler handleSsoResp resp:").append(paramFromServiceMsg.getStringForLog()).append(" ToServiceMsg:");
          if (paramToServiceMsg != null)
          {
            bool = true;
            QLog.d("MSF.C.SSORespHandler", 1, bool);
          }
        }
        else if ((paramToServiceMsg != null) && (s.quicksender != null))
        {
          s.quicksender.b(paramToServiceMsg, paramFromServiceMsg);
        }
        try
        {
          if (!"MessageSvc.PbSendMsg".equals(paramFromServiceMsg.getServiceCmd())) {
            break label465;
          }
          aa.a(paramToServiceMsg, paramFromServiceMsg, false);
          if ((paramFromServiceMsg.getServiceCmd() != null) && (paramFromServiceMsg.getServiceCmd().startsWith("RegPrxySvc"))) {
            s.sender.b(paramFromServiceMsg);
          }
          if ((paramToServiceMsg != null) && (s.quicksender != null) && (s.quicksender.b(paramToServiceMsg)) && (paramFromServiceMsg.isSuccess())) {
            s.quicksender.c.a(paramToServiceMsg, paramFromServiceMsg);
          }
        }
        catch (Throwable localThrowable)
        {
          do
          {
            for (;;)
            {
              localThrowable.printStackTrace();
              continue;
              paramFromServiceMsg.addAttribute("__timestamp_msf2net_boot_sharp_c2s", Integer.valueOf(-1));
            }
            if ((com.tencent.mobileqq.msf.core.a.a.t) && (paramToServiceMsg != null) && (paramToServiceMsg.getMsfCommand() != MsfCommand._msf_RegPush) && (paramToServiceMsg.getMsfCommand() != MsfCommand._msf_queryPush) && (s.pushManager != null)) {
              s.pushManager.c(System.currentTimeMillis());
            }
            if ((paramToServiceMsg != null) && (paramToServiceMsg.getAttribute("to_wtlogin_oldcmd") != null)) {}
            for (i1 = 1;; i1 = 0)
            {
              if ((!paramFromServiceMsg.getServiceCmd().startsWith("login.")) || (i1 != 0)) {
                break label710;
              }
              if (paramToServiceMsg == null) {
                break;
              }
              s.getAccountCenter().f.a(paramToServiceMsg, paramFromServiceMsg);
              return;
            }
            if (((paramFromServiceMsg.getServiceCmd().equals("login.auth")) || (paramFromServiceMsg.getServiceCmd().equals("login.chguin"))) && (paramFromServiceMsg.getResultCode() == 1000)) {
              s.getStatReporter().a(paramFromServiceMsg.getServiceCmd().equals("login.chguin"));
            }
          } while (!QLog.isColorLevel());
          QLog.d("MSF.C.SSORespHandler", 2, "found timeoutResp " + paramFromServiceMsg);
          return;
        }
        if (paramFromServiceMsg.getServiceCmd().startsWith("SharpSvr."))
        {
          l1 = SystemClock.elapsedRealtime();
          if ((w.G > 0L) && (l1 - w.G > 0L) && (l1 - w.G <= 30000L)) {
            paramFromServiceMsg.addAttribute("__timestamp_msf2net_boot_sharp_c2s", Long.valueOf(w.G));
          }
        }
        else
        {
          if (!a(paramFromServiceMsg, paramToServiceMsg)) {
            break label510;
          }
          if ((paramFromServiceMsg.getServiceCmd().startsWith("wtlogin.")) && (paramToServiceMsg != null)) {
            com.tencent.mobileqq.msf.core.auth.i.a(paramToServiceMsg, paramFromServiceMsg);
          }
          return;
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          QLog.d("MSF.C.SSORespHandler", 1, "adaptor recv failed", localException);
          continue;
          boolean bool = false;
          continue;
          bool = "RegPrxySvc.NoticeEnd".equals(paramFromServiceMsg.getServiceCmd());
          if (!bool) {}
        }
      }
      if ((!paramFromServiceMsg.getServiceCmd().startsWith("wtlogin.")) || (i1 == 0)) {
        break;
      }
      if (paramToServiceMsg != null)
      {
        com.tencent.mobileqq.msf.core.auth.i.a(paramToServiceMsg, paramFromServiceMsg);
        return;
      }
      if ((paramFromServiceMsg.getServiceCmd().equals("wtlogin.login")) && (paramFromServiceMsg.getResultCode() == 1000)) {
        s.getStatReporter().a(false);
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.SSORespHandler", 2, "found timeoutResp " + paramFromServiceMsg);
    return;
    if (paramFromServiceMsg.getServiceCmd().equals("wtlogin.PushChangeToken"))
    {
      s.getAccountCenter().g.b();
      return;
    }
    Object localObject;
    if (paramFromServiceMsg.getServiceCmd().equals("OnlinePush.SidTicketExpired"))
    {
      localObject = new ToServiceMsg("", paramFromServiceMsg.getUin(), paramFromServiceMsg.getServiceCmd());
      ((ToServiceMsg)localObject).setRequestSsoSeq(paramFromServiceMsg.getRequestSsoSeq());
      ((ToServiceMsg)localObject).setAppId(s.getMsfAppid());
      ((ToServiceMsg)localObject).setNeedCallback(false);
      ((ToServiceMsg)localObject).setTimeout(30000L);
      s.sendSsoMsg((ToServiceMsg)localObject);
      localObject = x.obtainMessage();
      what = 1000;
      obj = paramFromServiceMsg.getUin();
      if (x.hasMessages(1000)) {
        x.removeMessages(1000);
      }
      x.sendMessageDelayed((Message)localObject, 3000L);
    }
    if (paramFromServiceMsg.getServiceCmd().equals("ConfigPushSvc.PushReq"))
    {
      s.ssoListManager.a(paramFromServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("SSO.HelloPush"))
    {
      s.ssoListManager.b(paramFromServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("QualityTest.PushList"))
    {
      com.tencent.mobileqq.msf.core.net.c.c.d = s;
      com.tencent.mobileqq.msf.core.net.c.c.a(paramFromServiceMsg);
      paramToServiceMsg = new ToServiceMsg("", "0", paramFromServiceMsg.getServiceCmd());
      paramToServiceMsg.setMsfCommand(MsfCommand._msf_QualityTest);
      paramToServiceMsg.setRequestSsoSeq(paramFromServiceMsg.getRequestSsoSeq());
      paramToServiceMsg.setAppId(s.getMsfAppid());
      paramToServiceMsg.setNeedCallback(false);
      paramToServiceMsg.setTimeout(30000L);
      s.sendSsoMsg(paramToServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("OnlinePush.PbPushOffMsg"))
    {
      s.pushManager.c(paramFromServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("OnlinePush.PushOffReadedNotify"))
    {
      s.pushManager.b(paramFromServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("MessageSvc.PullUnreadMsgCount"))
    {
      s.pushManager.a(paramFromServiceMsg, paramToServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("RegPrxySvc.infoLogin")) {
      s.mbIsInfoLoginGetted.set(true);
    }
    if ((paramToServiceMsg != null) && (paramFromServiceMsg.getServiceCmd().equals("ConfigService.ClientReq")))
    {
      if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_getConfig)
      {
        s.configManager.a(paramFromServiceMsg, paramToServiceMsg);
        return;
      }
      s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    if (paramFromServiceMsg.getServiceCmd().equals("SharpSvr.s2c"))
    {
      localObject = new ToServiceMsg("", paramFromServiceMsg.getUin(), "SharpSvr.s2cackMSF");
      ((ToServiceMsg)localObject).setAppId(s.getMsfAppid());
      ((ToServiceMsg)localObject).setRequestSsoSeq(paramFromServiceMsg.getRequestSsoSeq());
      ((ToServiceMsg)localObject).setNeedCallback(false);
      ((ToServiceMsg)localObject).setTimeout(30000L);
      ((ToServiceMsg)localObject).putWupBuffer(paramFromServiceMsg.getWupBuffer());
      s.sender.b((ToServiceMsg)localObject);
      if (paramToServiceMsg != null) {
        break label1414;
      }
      com.tencent.mobileqq.msf.core.b.e.a().a(e.a.b, paramFromServiceMsg.getWupBuffer(), 0);
    }
    while ((paramFromServiceMsg.getServiceCmd().equals("QQWifiSvc.AvailQQWiFiForMSF")) && (paramToServiceMsg != null) && (((Boolean)paramToServiceMsg.getAttribute("isformsf", Boolean.valueOf(false))).booleanValue()))
    {
      o.a().a(paramToServiceMsg, paramFromServiceMsg);
      return;
      label1414:
      com.tencent.mobileqq.msf.core.b.e.a().a(e.a.b, paramFromServiceMsg.getWupBuffer(), 2);
    }
    if (paramToServiceMsg == null)
    {
      if (paramFromServiceMsg.getServiceCmd().equals("OverLoadPush.notify"))
      {
        s.configManager.a(paramFromServiceMsg);
        return;
      }
      s.pushManager.a(paramFromServiceMsg);
      return;
    }
    switch (1.a[paramToServiceMsg.getMsfCommand().ordinal()])
    {
    default: 
      paramFromServiceMsg.setAppId(paramToServiceMsg.getAppId());
      paramFromServiceMsg.setAppSeq(paramToServiceMsg.getAppSeq());
      paramFromServiceMsg.setMsfCommand(paramToServiceMsg.getMsfCommand());
      s.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 1: 
      s.pushManager.a(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 2: 
      s.pushManager.a(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 3: 
      s.pushManager.b(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 4: 
      s.sender.a(paramFromServiceMsg);
      return;
    case 5: 
      s.getAccountCenter().c.a(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    l2 = System.currentTimeMillis() / 1000L;
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.SSORespHandler", 2, "CorrectTime get current time:" + l2);
    }
    l1 = l2;
    try
    {
      if (paramFromServiceMsg.isSuccess())
      {
        i1 = MsfSdkUtils.convertBytes2Int(paramFromServiceMsg.getWupBuffer(), 4);
        l1 = i1;
      }
    }
    catch (Exception paramToServiceMsg)
    {
      for (;;)
      {
        l1 = l2;
        if (QLog.isDevelopLevel())
        {
          QLog.d("MSF.C.SSORespHandler", 4, "handle serverTime error " + paramToServiceMsg);
          l1 = l2;
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.SSORespHandler", 2, "CorrectTime get server time:" + l1);
    }
    NetConnInfoCenter.handleGetServerTimeResp(l1);
  }
  
  public void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    a(paramFromServiceMsg);
    Object localObject = new UniPacket(true);
    ((UniPacket)localObject).setEncodeName("UTF-8");
    ((UniPacket)localObject).decode(paramFromServiceMsg.getWupBuffer());
    paramToServiceMsg = (k)((UniPacket)localObject).getByClass("RespondHeader", new k());
    VerifyCodeInfo localVerifyCodeInfo = new VerifyCodeInfo();
    ssoSeq = paramFromServiceMsg.getRequestSsoSeq();
    wupSeq = c;
    switch (b)
    {
    }
    for (;;)
    {
      VerifyCodeInfo.putVerifyCodeInfo(paramFromServiceMsg, localVerifyCodeInfo);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.SSORespHandler", 2, "rece businessVerifyCode from:" + paramFromServiceMsg + " svrseqNo:" + svrSeqNo + " vipsid:" + vpicSid + " wupSeq:" + wupSeq);
      }
      return;
      localObject = (com.tencent.msf.service.protocol.security.i)((UniPacket)localObject).getByClass("RespondAuth", new com.tencent.msf.service.protocol.security.i());
      vpicSid = c;
      svrSeqNo = e;
      verifyimage = a;
      verifyNote = b;
      continue;
      localObject = (n)((UniPacket)localObject).getByClass("RespondVerifyPic", new n());
      vpicSid = b;
      svrSeqNo = e;
      verifyimage = a;
      verifyNote = "";
      continue;
      localObject = (com.tencent.msf.service.protocol.security.m)((UniPacket)localObject).getByClass("RespondRefreshVPic", new com.tencent.msf.service.protocol.security.m());
      vpicSid = c;
      svrSeqNo = e;
      verifyimage = a;
      verifyNote = b;
    }
  }
}
