package com.tencent.mobileqq.msf.core.auth;

import android.text.TextUtils;
import com.qq.jce.wup.UniPacket;
import com.qq.taf.jce.HexUtil;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.n;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.service.g;
import com.tencent.msf.service.protocol.security.CustomSigContent;
import com.tencent.msf.service.protocol.security.RespondCustomSig;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import oicq.wlogin_sdk.devicelock.DevlockInfo;
import oicq.wlogin_sdk.request.Ticket;
import oicq.wlogin_sdk.request.WFastLoginInfo;
import oicq.wlogin_sdk.request.WUserSigInfo;
import oicq.wlogin_sdk.request.WtloginHelper;
import oicq.wlogin_sdk.request.WtloginMsfListener;
import oicq.wlogin_sdk.tools.ErrMsg;

class k
{
  boolean a = false;
  boolean b = true;
  WtloginMsfListener c;
  ToServiceMsg d;
  MsfCore e;
  long f;
  boolean g = false;
  
  public k(MsfCore paramMsfCore, ToServiceMsg paramToServiceMsg)
  {
    e = paramMsfCore;
    d = paramToServiceMsg;
  }
  
  private String a(int paramInt)
  {
    if ((paramInt & 0x1A1020) == 1708064) {
      return "WebTicket";
    }
    if ((paramInt & 0x40040) == 262208) {
      return "BasicTicket";
    }
    return "OtherTicket";
  }
  
  private String a(ToServiceMsg paramToServiceMsg)
  {
    if ((d != null) && (d.getAttributes().get("refresh_token_src") != null)) {
      return (String)d.getAttributes().get("refresh_token_src");
    }
    return "OtherSrc";
  }
  
  private void a()
  {
    FromServiceMsg localFromServiceMsg = new FromServiceMsg();
    localFromServiceMsg.setUin("0");
    localFromServiceMsg.setMsfCommand(MsfCommand.onTicketChanged);
    localFromServiceMsg.setAppId(e.getMsfAppid());
    localFromServiceMsg.setMsgSuccess();
    localFromServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
    MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
    e.addRespToQuque(null, localFromServiceMsg);
  }
  
  public void a(int paramInt, long paramLong, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("userAccount", Long.valueOf(paramLong));
      localFromServiceMsg.addAttribute("supersig", paramArrayOfByte1);
      localFromServiceMsg.addAttribute("contactssig", paramArrayOfByte2);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("msg", paramArrayOfByte3);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramArrayOfByte1)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnRegGetSMSVerifyLoginAccount error " + paramArrayOfByte1, paramArrayOfByte1);
    }
  }
  
  public void a(long paramLong1, long paramLong2, String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2, int paramInt3, ErrMsg paramErrMsg)
  {
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("appid", Long.valueOf(paramLong1));
      localFromServiceMsg.addAttribute("subAppid", Long.valueOf(paramLong2));
      localFromServiceMsg.addAttribute("countryCode", paramString1);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt3));
      localFromServiceMsg.addAttribute("mobile", paramString2);
      localFromServiceMsg.addAttribute("errMsg", paramErrMsg);
      localFromServiceMsg.addAttribute("msg", paramString3);
      localFromServiceMsg.addAttribute("msgCnt", Integer.valueOf(paramInt1));
      localFromServiceMsg.addAttribute("timeLimit", Integer.valueOf(paramInt2));
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramString1)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSVerifyLoginAccount error " + paramString1, paramString1);
    }
  }
  
  public void a(String paramString, int paramInt, WUserSigInfo paramWUserSigInfo)
  {
    QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnException " + paramString);
    if (g) {
      try
      {
        paramWUserSigInfo = g.a(d);
        paramWUserSigInfo.setBusinessFail(3002, paramString);
        paramWUserSigInfo.addAttribute("error", paramString);
        paramWUserSigInfo.addAttribute("cmd", Integer.valueOf(paramInt));
        e.addRespToQuque(d, paramWUserSigInfo);
        return;
      }
      catch (Exception paramString)
      {
        QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnException error " + paramString, paramString);
        return;
      }
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setBusinessFail(3001, paramString);
    MsfSdkUtils.addFromMsgProcessName("*", paramWUserSigInfo);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void a(String paramString, long paramLong1, int paramInt1, long paramLong2, int paramInt2, ErrMsg paramErrMsg)
  {
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("userAccount", paramString);
      localFromServiceMsg.addAttribute("dwAppid", Long.valueOf(paramLong1));
      localFromServiceMsg.addAttribute("dwMainSigMap", Integer.valueOf(paramInt1));
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt2));
      localFromServiceMsg.addAttribute("dwSubDstAppid", Long.valueOf(paramLong2));
      localFromServiceMsg.addAttribute("errMsg", paramErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramString)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStViaSMSVerifyLogin error " + paramString, paramString);
    }
  }
  
  public void a(String paramString1, long paramLong1, int paramInt1, long paramLong2, String paramString2, WUserSigInfo paramWUserSigInfo, int paramInt2, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, d.getRequestSsoSeq() + " OnGetStWithPasswd " + paramErrMsg.getMessage() + " " + paramString1 + ", ret=" + paramInt2 + " " + d);
    }
    if (g) {}
    for (;;)
    {
      Object localObject2;
      Object localObject1;
      try
      {
        localObject2 = new byte[0];
        localObject1 = localObject2;
        switch (paramInt2)
        {
        case 1: 
          localObject2 = g.a(d);
          ((FromServiceMsg)localObject2).setMsgSuccess();
          ((FromServiceMsg)localObject2).addAttribute("userAccount", paramString1);
          ((FromServiceMsg)localObject2).addAttribute("dwAppid", Long.valueOf(paramLong1));
          ((FromServiceMsg)localObject2).addAttribute("dwMainSigMap", Integer.valueOf(paramInt1));
          ((FromServiceMsg)localObject2).addAttribute("dwSubDstAppid", Long.valueOf(paramLong2));
          ((FromServiceMsg)localObject2).addAttribute("userPasswd", paramString2);
          ((FromServiceMsg)localObject2).addAttribute("pictureData", localObject1);
          ((FromServiceMsg)localObject2).addAttribute("userSigInfo", paramWUserSigInfo);
          ((FromServiceMsg)localObject2).addAttribute("wtTicket", a(paramWUserSigInfo));
          ((FromServiceMsg)localObject2).addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
          ((FromServiceMsg)localObject2).addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
          ((FromServiceMsg)localObject2).addAttribute("ret", Integer.valueOf(paramInt2));
          ((FromServiceMsg)localObject2).addAttribute("lastError", paramErrMsg);
          e.addRespToQuque(d, (FromServiceMsg)localObject2);
          return;
        }
      }
      catch (Exception paramString1)
      {
        QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithPasswd error " + paramString1, paramString1);
        return;
      }
      if (TextUtils.isEmpty(paramErrMsg.getOtherinfo()))
      {
        localObject1 = h.e.GetPictureData(paramString1);
      }
      else
      {
        localObject1 = localObject2;
        if (QLog.isColorLevel())
        {
          QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "puzzle CAPTCHA " + paramErrMsg.getOtherinfo());
          localObject1 = localObject2;
          continue;
          h.d.getAccountCenter().a(false);
          localObject1 = localObject2;
          continue;
          localObject1 = n.a(d);
          ((FromServiceMsg)localObject1).setMsgSuccess();
          ((FromServiceMsg)localObject1).addAttribute("userAccount", paramString1);
          ((FromServiceMsg)localObject1).addAttribute("dwAppid", Long.valueOf(paramLong1));
          ((FromServiceMsg)localObject1).addAttribute("dwMainSigMap", Integer.valueOf(paramInt1));
          ((FromServiceMsg)localObject1).addAttribute("dwSubDstAppid", Long.valueOf(paramLong2));
          ((FromServiceMsg)localObject1).addAttribute("userPasswd", paramString2);
          ((FromServiceMsg)localObject1).addAttribute("userSigInfo", paramWUserSigInfo);
          ((FromServiceMsg)localObject1).addAttribute("wtTicket", a(paramWUserSigInfo));
          ((FromServiceMsg)localObject1).addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
          for (;;)
          {
            try
            {
              ((FromServiceMsg)localObject1).addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
              ((FromServiceMsg)localObject1).addAttribute("ret", Integer.valueOf(paramInt2));
              ((FromServiceMsg)localObject1).addAttribute("lastError", paramErrMsg);
              ((FromServiceMsg)localObject1).setUin(uin);
              switch (paramInt2)
              {
              default: 
                QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithPasswd fail, " + paramErrMsg.getMessage());
                ((FromServiceMsg)localObject1).setBusinessFail(1001, paramErrMsg.getMessage());
                if (paramInt2 != 0)
                {
                  if (paramErrMsg.getType() == 1) {
                    ((FromServiceMsg)localObject1).addAttribute("resp_login_url", paramErrMsg.getOtherinfo());
                  }
                  if ((paramInt2 == 116) || (paramInt2 == 41))
                  {
                    paramString1 = WtloginHelper.GetUserSigInfoTicket(paramWUserSigInfo, 4194304);
                    if (paramString1 != null)
                    {
                      paramString1 = _sig;
                      if (paramString1 == null) {
                        break label1097;
                      }
                      ((FromServiceMsg)localObject1).addAttribute("resp_login_lhsig", paramString1);
                    }
                  }
                }
                ((FromServiceMsg)localObject1).addAttribute("resp_logini_ret", Integer.valueOf(paramInt2));
                e.addRespToQuque(d, (FromServiceMsg)localObject1);
                return;
              }
            }
            catch (Exception paramString2)
            {
              paramString2.printStackTrace();
              continue;
              i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
              f = _seqence;
              if (TextUtils.isEmpty(paramErrMsg.getOtherinfo()))
              {
                i.b(paramString1, e, f, d, (FromServiceMsg)localObject1, paramErrMsg.getMessage());
                return;
              }
              if (QLog.isColorLevel()) {
                QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "appUseWt = false; puzzle CAPTCHA " + paramErrMsg.getOtherinfo());
              }
              i.a(e, f, d, (FromServiceMsg)localObject1, paramErrMsg.getOtherinfo());
              return;
            }
            i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
            f = _seqence;
            i.a(paramString1, e, f, d, (FromServiceMsg)localObject1, paramErrMsg.getMessage());
            return;
            a();
            if ((paramWUserSigInfo != null) && (_login_bitmap == 0)) {
              try
              {
                i.a(e, h.e, d, (FromServiceMsg)localObject1, paramString1, paramWUserSigInfo);
                if (!a) {
                  break;
                }
                h.a(paramString1);
                return;
              }
              catch (Exception paramString1)
              {
                QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithPasswd succ exception " + paramString1.toString(), paramString1);
                return;
              }
            }
            ((FromServiceMsg)localObject1).setMsgSuccess();
            ((FromServiceMsg)localObject1).addAttribute("__attribute_tag_servertimediff", Long.valueOf(h.e.GetTimeDifference() * 1000L));
            continue;
            ((FromServiceMsg)localObject1).setBusinessFail(2005, paramErrMsg.getMessage());
            continue;
            QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithPasswd timeout");
            ((FromServiceMsg)localObject1).setBusinessFail(1002);
            continue;
            label1097:
            QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithPasswd ret: " + paramInt2 + " , t is null.");
          }
          localObject1 = localObject2;
        }
      }
    }
  }
  
  public void a(String paramString, long paramLong1, int paramInt1, long paramLong2, byte[] paramArrayOfByte1, long paramLong3, long paramLong4, long paramLong5, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, WUserSigInfo paramWUserSigInfo, WFastLoginInfo paramWFastLoginInfo, int paramInt2, ErrMsg paramErrMsg)
  {
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("userAccount", paramString);
      localFromServiceMsg.addAttribute("dwSrcAppid", Long.valueOf(paramLong1));
      localFromServiceMsg.addAttribute("dwMainSigMap", Integer.valueOf(paramInt1));
      localFromServiceMsg.addAttribute("dwSubSrcAppid", Long.valueOf(paramLong2));
      localFromServiceMsg.addAttribute("dstAppName", paramArrayOfByte1);
      localFromServiceMsg.addAttribute("dwDstSsoVer", Long.valueOf(paramLong3));
      localFromServiceMsg.addAttribute("dwDstAppid", Long.valueOf(paramLong4));
      localFromServiceMsg.addAttribute("dwSubDstAppid", Long.valueOf(paramLong5));
      localFromServiceMsg.addAttribute("dstAppVer", paramArrayOfByte2);
      localFromServiceMsg.addAttribute("dstAppSign", paramArrayOfByte3);
      localFromServiceMsg.addAttribute("userSigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("fastLoginInfo", paramWFastLoginInfo);
      localFromServiceMsg.addAttribute("wtTicket", _outA1.clone());
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt2));
      localFromServiceMsg.addAttribute("errMsg", paramErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramString)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "onGetA1WithA1 error " + paramString, paramString);
    }
  }
  
  public void a(String paramString, long paramLong1, long paramLong2, int paramInt1, long paramLong3, WUserSigInfo paramWUserSigInfo, int paramInt2, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, d.getRequestSsoSeq() + " found not need continue handle msg OnGetStWithoutPasswd.");
    }
  }
  
  public void a(String paramString, long paramLong1, long paramLong2, int paramInt1, long paramLong3, long[] paramArrayOfLong, WUserSigInfo paramWUserSigInfo, byte[][] paramArrayOfByte, int paramInt2, ErrMsg paramErrMsg)
  {
    if (g) {}
    label620:
    label938:
    label946:
    label954:
    do
    {
      try
      {
        paramArrayOfLong = g.a(d);
        paramArrayOfLong.setMsgSuccess();
        paramArrayOfLong.addAttribute("userAccount", paramString);
        paramArrayOfLong.addAttribute("dwSrcAppid", Long.valueOf(paramLong1));
        paramArrayOfLong.addAttribute("dwDstAppid", Long.valueOf(paramLong2));
        paramArrayOfLong.addAttribute("dwMainSigMap", Integer.valueOf(paramInt1));
        paramArrayOfLong.addAttribute("dwSubDstAppid", Long.valueOf(paramLong3));
        paramArrayOfLong.addAttribute("userSigInfo", paramWUserSigInfo);
        paramArrayOfLong.addAttribute("wtTicket", a(paramWUserSigInfo));
        paramArrayOfLong.addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
        paramArrayOfLong.addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
        paramArrayOfLong.addAttribute("ret", Integer.valueOf(paramInt2));
        paramArrayOfLong.addAttribute("lastError", paramErrMsg);
        e.addRespToQuque(d, paramArrayOfLong);
        return;
      }
      catch (Exception paramString)
      {
        QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithoutPasswd error " + paramString, paramString);
        return;
      }
      FromServiceMsg localFromServiceMsg = n.a(d);
      localFromServiceMsg.addAttribute("wtTicket", a(paramWUserSigInfo));
      localFromServiceMsg.addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
      try
      {
        localFromServiceMsg.addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
        paramLong2 = 0L;
        paramLong1 = paramLong2;
        if (localFromServiceMsg.getAttributes().containsKey("__timestamp_net2msf"))
        {
          paramLong1 = paramLong2;
          if (localFromServiceMsg.getAttributes().containsKey("__timestamp_app2msf")) {
            paramLong1 = ((Long)localFromServiceMsg.getAttribute("__timestamp_net2msf")).longValue() - ((Long)d.getAttribute("__timestamp_app2msf")).longValue();
          }
        }
        paramLong2 = m.a(d, localFromServiceMsg);
        i = 0;
        int j = 0;
        switch (paramInt2)
        {
        default: 
          paramArrayOfLong = paramErrMsg.getMessage();
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithoutPasswd2 fail, " + paramInt2 + " " + paramArrayOfLong);
          if (paramInt2 != 1)
          {
            i = j;
            if (paramInt2 != 192) {}
          }
          else
          {
            e.getAccountCenter().m(localFromServiceMsg.getUin());
            localFromServiceMsg.setBusinessFail(2001, paramArrayOfLong);
            MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
            i = 1;
          }
          e.getStatReporter().a(false, paramString, paramLong1, paramInt2, paramLong2, a(paramInt1), a(d));
          paramInt1 = i;
          if (paramInt2 == 15)
          {
            e.getStatReporter().a(paramLong1, localFromServiceMsg.getBusinessFailCode(), paramLong2);
            paramInt1 = i;
          }
          if (b) {
            if (paramInt1 != 0)
            {
              e.addRespToQuque(null, localFromServiceMsg);
              return;
            }
          }
          break;
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          int i;
          localException.printStackTrace();
          continue;
          if (QLog.isColorLevel())
          {
            paramErrMsg = new StringBuilder().append(d.getRequestSsoSeq()).append(" OnGetStWithoutPasswd2 succ, dwMainSigMap=").append(paramInt1).append(", dwDstSubAppid.length=");
            if (paramArrayOfLong != null) {
              break label938;
            }
            paramInt2 = 0;
            paramArrayOfLong = paramErrMsg.append(paramInt2).append(", st.length=");
            if (paramArrayOfByte != null) {
              break label946;
            }
          }
          CustomSigContent localCustomSigContent;
          for (paramInt2 = 0;; paramInt2 = paramArrayOfByte.length)
          {
            QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, paramInt2);
            try
            {
              a();
              localFromServiceMsg.setMsgSuccess();
              paramArrayOfByte = new RespondCustomSig();
              reserved = new byte[0];
              SigList = new ArrayList();
              localCustomSigContent = new CustomSigContent();
              sResult = 0;
              SigContent = new byte[0];
              if (!d.getServiceCmd().equals("login.chgTok_WEBVIEW_KEY")) {
                break label954;
              }
              paramArrayOfLong = WtloginHelper.GetTicketSig(paramWUserSigInfo, 32);
              paramArrayOfByte = WtloginHelper.GetTicketSig(paramWUserSigInfo, 524288);
              paramErrMsg = WtloginHelper.GetTicketSig(paramWUserSigInfo, 131072);
              paramWUserSigInfo = WtloginHelper.GetTicketSig(paramWUserSigInfo, 4096);
              e.getAccountCenter().b(paramString, paramArrayOfLong);
              e.getAccountCenter().a(paramString, new String(paramArrayOfByte), System.currentTimeMillis());
              e.getAccountCenter().a(paramString, paramErrMsg);
              e.getAccountCenter().a(paramString, paramWUserSigInfo, System.currentTimeMillis());
              e.getAccountCenter().a(paramString, System.currentTimeMillis());
              e.getAccountCenter().g.a(d, localFromServiceMsg);
              e.getStatReporter().a(true, paramString, paramLong1, 0, paramLong2, "WebTicket", a(d));
              return;
            }
            catch (Exception paramString)
            {
              QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithPasswd2 error " + paramString.toString(), paramString);
              paramInt1 = i;
            }
            break;
            paramInt2 = paramArrayOfLong.length;
            break label620;
          }
          if (d.getServiceCmd().equals("login.chgTok_A2D2"))
          {
            byte[] arrayOfByte1 = WtloginHelper.GetTicketSig(paramWUserSigInfo, 262144);
            byte[] arrayOfByte2 = WtloginHelper.GetTicketSig(paramWUserSigInfo, 64);
            paramErrMsg = new byte[16];
            paramArrayOfLong = new byte[0];
            try
            {
              paramWUserSigInfo = WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 262144);
              paramArrayOfLong = paramWUserSigInfo;
            }
            catch (Exception paramWUserSigInfo)
            {
              for (;;)
              {
                QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "readD2Key error " + paramWUserSigInfo);
              }
            }
            f.a(paramErrMsg, 0, paramArrayOfLong, paramArrayOfLong.length);
            paramArrayOfLong = new CustomSigContent();
            sResult = 0;
            SigContent = new byte[0];
            ulSigType = 18L;
            SigContent = arrayOfByte1;
            SigList.add(paramArrayOfLong);
            ulSigType = 0L;
            SigContent = arrayOfByte2;
            SigList.add(localCustomSigContent);
            paramArrayOfLong = new CustomSigContent();
            ulSigType = 20L;
            SigContent = paramErrMsg;
            SigList.add(paramArrayOfLong);
            localFromServiceMsg.addAttribute(localFromServiceMsg.getServiceCmd(), paramArrayOfByte);
            e.getAccountCenter().g.a(d, localFromServiceMsg);
            e.getStatReporter().a(true, paramString, paramLong1, 0, paramLong2, "BasicTicket", a(d));
            return;
          }
          if (d.getServiceCmd().equals("login.chgTok_DA2"))
          {
            paramArrayOfLong = WtloginHelper.GetTicketSig(paramWUserSigInfo, 33554432);
            localFromServiceMsg.getAttributes().put("da2", paramArrayOfLong);
            e.getStatReporter().a(true, paramString, paramLong1, 0, paramLong2, "BusTicket", a(d));
            MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
            e.addRespToQuque(d, localFromServiceMsg);
            return;
          }
          if ((paramInt1 & 0x4000) == 16384)
          {
            ulSigType = 16L;
            SigContent = WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 16384);
            SigList.add(localCustomSigContent);
          }
          paramArrayOfLong = new UniPacket(true);
          paramArrayOfLong.setEncodeName("UTF-8");
          paramArrayOfLong.put("RespondCustomSig", paramArrayOfByte);
          localFromServiceMsg.putWupBuffer(paramArrayOfLong.encode());
          localFromServiceMsg.addAttribute(localFromServiceMsg.getServiceCmd(), paramArrayOfByte);
          if (a) {
            h.a(paramString);
          }
          e.getStatReporter().a(true, paramString, paramLong1, 0, paramLong2, "OtherTicket", a(d));
          paramInt1 = i;
          continue;
          localFromServiceMsg.setBusinessFail(1002);
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnGetStWithoutPasswd timeout");
          e.getStatReporter().a(false, paramString, paramLong1, 64536, paramLong2, a(paramInt1), a(d));
          paramInt1 = i;
        }
        e.addRespToQuque(d, localFromServiceMsg);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnGetStWithoutPasswd2 found not need contine handle msg.");
  }
  
  public void a(String paramString, long paramLong, WUserSigInfo paramWUserSigInfo, int paramInt1, int paramInt2, int paramInt3, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnRefreshSMSData ret:" + paramInt3);
    }
    if (g) {
      try
      {
        FromServiceMsg localFromServiceMsg = g.a(d);
        localFromServiceMsg.setMsfCommand(MsfCommand.wt_RefreshSMSData);
        localFromServiceMsg.setMsgSuccess();
        localFromServiceMsg.addAttribute("userAccount", paramString);
        localFromServiceMsg.addAttribute("smsAppid", Long.valueOf(paramLong));
        localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
        localFromServiceMsg.addAttribute("remainMsgCnt", Integer.valueOf(paramInt1));
        localFromServiceMsg.addAttribute("timeLimit", Integer.valueOf(paramInt2));
        localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt3));
        localFromServiceMsg.addAttribute("lastError", paramErrMsg);
        if (paramInt3 == 0)
        {
          i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
          f = _seqence;
          i.a(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
          return;
        }
        localFromServiceMsg.setBusinessFail(1001, paramErrMsg.getMessage());
        e.addRespToQuque(d, localFromServiceMsg);
        return;
      }
      catch (Exception paramString)
      {
        QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnRefreshSMSData error " + paramString, paramString);
      }
    }
  }
  
  public void a(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, ErrMsg paramErrMsg)
  {
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt3));
      localFromServiceMsg.addAttribute("mobile", paramString1);
      localFromServiceMsg.addAttribute("errMsg", paramErrMsg);
      localFromServiceMsg.addAttribute("msg", paramString2);
      localFromServiceMsg.addAttribute("msgCnt", Integer.valueOf(paramInt1));
      localFromServiceMsg.addAttribute("timeLimit", Integer.valueOf(paramInt2));
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramString1)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnRefreshSMSVerifyLoginAccount error " + paramString1, paramString1);
    }
  }
  
  public void a(String paramString1, String paramString2, int paramInt, ErrMsg paramErrMsg)
  {
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("mobile", paramString1);
      localFromServiceMsg.addAttribute("errMsg", paramErrMsg);
      localFromServiceMsg.addAttribute("msgCode", paramString2);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramString1)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnVerifySMSVerifyLoginAccount error " + paramString1, paramString1);
    }
  }
  
  public void a(String paramString, WUserSigInfo paramWUserSigInfo, byte[] paramArrayOfByte, int paramInt, ErrMsg paramErrMsg)
  {
    if (g) {
      try
      {
        paramWUserSigInfo = g.a(d);
        paramWUserSigInfo.setMsgSuccess();
        paramWUserSigInfo.addAttribute("userAccount", paramString);
        paramWUserSigInfo.addAttribute("pictureData", paramArrayOfByte);
        paramWUserSigInfo.addAttribute("ret", Integer.valueOf(paramInt));
        paramWUserSigInfo.addAttribute("lastError", paramErrMsg);
        e.addRespToQuque(d, paramWUserSigInfo);
        return;
      }
      catch (Exception paramString)
      {
        QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnRefreshPictureData error " + paramString, paramString);
        return;
      }
    }
    paramArrayOfByte = n.a(d);
    if (paramInt == 0)
    {
      i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
      f = _seqence;
      i.b(paramString, e, f, d, paramArrayOfByte, paramErrMsg.getMessage());
      return;
    }
    paramArrayOfByte.setBusinessFail(1001, paramErrMsg.getMessage());
    e.addRespToQuque(d, paramArrayOfByte);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte1, long paramLong, List paramList, WUserSigInfo paramWUserSigInfo, byte[] paramArrayOfByte2, int paramInt)
  {
    FromServiceMsg localFromServiceMsg;
    if (g) {
      try
      {
        paramWUserSigInfo = new ErrMsg();
        paramWUserSigInfo.setMessage(new String(paramArrayOfByte2, "utf-8"));
        localFromServiceMsg = g.a(d);
        localFromServiceMsg.setMsgSuccess();
        localFromServiceMsg.addAttribute("userAccount", paramString);
        localFromServiceMsg.addAttribute("appName", paramArrayOfByte1);
        localFromServiceMsg.addAttribute("time", Long.valueOf(paramLong));
        paramString = new ArrayList();
        if (paramList != null)
        {
          paramArrayOfByte1 = ((ArrayList)paramList).iterator();
          while (paramArrayOfByte1.hasNext())
          {
            paramString.add(HexUtil.bytes2HexStr((byte[])paramArrayOfByte1.next()));
            continue;
            return;
          }
        }
      }
      catch (Exception paramString)
      {
        QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnVerifyCode error " + paramString, paramString);
      }
    }
    localFromServiceMsg.addAttribute("data", paramString);
    localFromServiceMsg.addAttribute("errMsg", paramArrayOfByte2);
    localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
    localFromServiceMsg.addAttribute("msg", paramWUserSigInfo);
    e.addRespToQuque(d, localFromServiceMsg);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte1, long paramLong, WUserSigInfo paramWUserSigInfo, byte[] paramArrayOfByte2, int paramInt)
  {
    if (g) {}
    try
    {
      ErrMsg localErrMsg = new ErrMsg();
      localErrMsg.setMessage(new String(paramArrayOfByte2, "utf-8"));
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("userAccount", paramString);
      localFromServiceMsg.addAttribute("appName", paramArrayOfByte1);
      localFromServiceMsg.addAttribute("time", Long.valueOf(paramLong));
      localFromServiceMsg.addAttribute("userSigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("errMsg", paramArrayOfByte2);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("msg", localErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramString)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCloseCode error " + paramString, paramString);
    }
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, WUserSigInfo paramWUserSigInfo, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnCheckWebsigAndGetSt ret" + paramInt);
    }
    if (g)
    {
      if (paramInt == 0) {
        h.d.getAccountCenter().a(false);
      }
      localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsfCommand(MsfCommand.submitPuzzleVerifyCodeTicket);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("userAccount", paramString);
      localFromServiceMsg.addAttribute("userInput", paramArrayOfByte);
      localFromServiceMsg.addAttribute("userSigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("lastError", paramErrMsg);
      localFromServiceMsg.addAttribute("wtTicket", a(paramWUserSigInfo));
      localFromServiceMsg.addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
      try
      {
        localFromServiceMsg.addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
        e.addRespToQuque(d, localFromServiceMsg);
        return;
      }
      catch (Exception paramString)
      {
        for (;;)
        {
          paramString.printStackTrace();
        }
      }
    }
    FromServiceMsg localFromServiceMsg = n.a(d);
    localFromServiceMsg.setMsfCommand(MsfCommand.submitPuzzleVerifyCodeTicket);
    localFromServiceMsg.setMsgSuccess();
    localFromServiceMsg.addAttribute("userAccount", paramString);
    localFromServiceMsg.addAttribute("userInput", paramArrayOfByte);
    localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
    localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
    localFromServiceMsg.addAttribute("lastError", paramErrMsg);
    localFromServiceMsg.addAttribute("wtTicket", a(paramWUserSigInfo));
    localFromServiceMsg.addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
    localFromServiceMsg.setUin(uin);
    for (;;)
    {
      try
      {
        localFromServiceMsg.addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
        switch (paramInt)
        {
        default: 
          localFromServiceMsg.setBusinessFail(1001, paramErrMsg.getMessage());
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckWebsigAndGetSt failed");
          if (paramInt != 0)
          {
            if (paramErrMsg.getType() == 1) {
              localFromServiceMsg.addAttribute("resp_login_url", paramErrMsg.getOtherinfo());
            }
            if ((paramInt == 116) || (paramInt == 41))
            {
              paramString = WtloginHelper.GetUserSigInfoTicket(paramWUserSigInfo, 4194304);
              if (paramString != null)
              {
                paramString = _sig;
                if (paramString == null) {
                  break label677;
                }
                localFromServiceMsg.addAttribute("resp_login_lhsig", paramString);
              }
            }
          }
          localFromServiceMsg.addAttribute("resp_logini_ret", Integer.valueOf(paramInt));
          e.addRespToQuque(d, localFromServiceMsg);
          return;
        }
      }
      catch (Exception paramArrayOfByte)
      {
        paramArrayOfByte.printStackTrace();
        continue;
        i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
        f = _seqence;
        i.b(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
        return;
      }
      i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
      f = _seqence;
      i.a(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
      return;
      try
      {
        i.a(e, h.e, d, localFromServiceMsg, paramString, paramWUserSigInfo);
        if (!a) {
          break;
        }
        h.a(paramString);
        return;
      }
      catch (Exception paramString)
      {
        QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckWebsigAndGetSt succ exception " + paramString.toString(), paramString);
        return;
      }
      localFromServiceMsg.setBusinessFail(1002);
      QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckWebsigAndGetSt timeout");
      continue;
      label677:
      if (QLog.isColorLevel()) {
        QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckWebsigAndGetSt ret: " + paramInt + " , t is null.");
      }
    }
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, WUserSigInfo paramWUserSigInfo, byte[][] paramArrayOfByte1, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnRefreshSMSData ret:" + paramInt);
    }
    if (g) {
      for (;;)
      {
        FromServiceMsg localFromServiceMsg;
        try
        {
          localFromServiceMsg = g.a(d);
          localFromServiceMsg.setMsfCommand(MsfCommand.wt_CheckSMSAndGetStExt);
          localFromServiceMsg.setMsgSuccess();
          localFromServiceMsg.addAttribute("userAccount", paramString);
          localFromServiceMsg.addAttribute("userInput", paramArrayOfByte);
          localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
          localFromServiceMsg.addAttribute("st", paramArrayOfByte1);
          localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
          localFromServiceMsg.addAttribute("lastError", paramErrMsg);
          switch (paramInt)
          {
          case 2: 
            localFromServiceMsg.setBusinessFail(1001, paramErrMsg.getMessage());
            QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetStExt failed");
          }
        }
        catch (Exception paramString)
        {
          QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetSt error " + paramString, paramString);
          return;
        }
        paramString = WtloginHelper.GetUserSigInfoTicket(paramWUserSigInfo, 4194304);
        if (paramString != null)
        {
          paramString = _sig;
          if (paramString != null) {
            localFromServiceMsg.addAttribute("resp_login_lhsig", paramString);
          }
        }
        else
        {
          e.addRespToQuque(d, localFromServiceMsg);
          return;
          i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
          f = _seqence;
          i.b(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
          return;
          i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
          f = _seqence;
          i.a(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
          return;
          try
          {
            i.a(e, h.e, d, localFromServiceMsg, paramString, paramWUserSigInfo);
            if (!a) {
              break;
            }
            h.a(paramString);
            return;
          }
          catch (Exception paramString)
          {
            QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckPictureAndGetSt succ exception " + paramString.toString(), paramString);
            return;
          }
          localFromServiceMsg.setBusinessFail(1002);
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetStExt timeout");
          break label498;
        }
        if (QLog.isColorLevel())
        {
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetStExt ret: " + paramInt + " , t is null.");
          continue;
          continue;
          label498:
          if (paramInt != 116) {
            if (paramInt != 41) {}
          }
        }
      }
    }
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, int paramInt1, int paramInt2, int paramInt3)
  {
    if (g) {}
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(paramInt1));
    attributes.put("resp_register_shNextResendTime", Integer.valueOf(paramInt2));
    attributes.put("resp_register_shTotalTimeOver", Integer.valueOf(paramInt3));
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(paramInt1));
    attributes.put("resp_register_shNextResendTime", Integer.valueOf(paramInt2));
    attributes.put("resp_register_shTotalTimeOver", Integer.valueOf(paramInt3));
    attributes.put("res_register_errmsg", paramString);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, int paramInt, long paramLong, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(paramInt));
    attributes.put("resp_register_uin", String.valueOf(paramLong));
    attributes.put("resp_register_contactssig", paramArrayOfByte2);
    attributes.put("resp_register_promptinfo", paramArrayOfByte3);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnCheckDevLockSms ret:" + paramInt);
    }
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsfCommand(MsfCommand.wt_CheckDevLockSms);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("lastError", paramErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramWUserSigInfo)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckDevLockSms error " + paramWUserSigInfo, paramWUserSigInfo);
    }
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, int paramInt, byte[] paramArrayOfByte)
  {
    if (g)
    {
      paramWUserSigInfo = n.a(d);
      paramWUserSigInfo.setBusinessFail(3001, String.valueOf(paramInt));
      attributes.put("msg", paramArrayOfByte);
      MsfSdkUtils.addFromMsgProcessName("*", paramWUserSigInfo);
      e.addRespToQuque(d, paramWUserSigInfo);
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "found RegError " + paramInt + " on call " + d.getServiceCmd());
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setBusinessFail(3001, String.valueOf(paramInt));
    attributes.put("resp_register_promptinfo", paramArrayOfByte);
    MsfSdkUtils.addFromMsgProcessName("*", paramWUserSigInfo);
    e.addRespToQuque(d, paramWUserSigInfo);
    QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "found RegError " + paramInt + " on call " + d.getServiceCmd());
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, String paramString)
  {
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(2));
    attributes.put("resp_register_promptinfo", paramString.getBytes());
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, String paramString1, String paramString2)
  {
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    attributes.put("resp_register_resultcode", Integer.valueOf(4));
    if ((TextUtils.isEmpty(paramString1)) && (!TextUtils.isEmpty(paramString2))) {
      attributes.put("resp_register_promptinfo", paramString2.getBytes());
    }
    for (;;)
    {
      e.addRespToQuque(d, paramWUserSigInfo);
      return;
      paramWUserSigInfo.setMsgSuccess();
      attributes.put("resp_register_promptinfo", paramString1.getBytes());
    }
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, DevlockInfo paramDevlockInfo, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnCheckDevLockStatus ret:" + paramInt);
    }
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsfCommand(MsfCommand.wt_CheckDevLockStatus);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("devLockInfo", paramDevlockInfo);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("lastError", paramErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramWUserSigInfo)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckDevLockStatus error " + paramWUserSigInfo, paramWUserSigInfo);
    }
  }
  
  public void a(WUserSigInfo paramWUserSigInfo, byte[] paramArrayOfByte)
  {
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(3));
    attributes.put("resp_register_promptinfo", paramArrayOfByte);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  byte[] a(WUserSigInfo paramWUserSigInfo)
  {
    Object localObject = d.getAttribute("targetTicket");
    if ((localObject != null) && ((localObject instanceof Integer))) {}
    for (int i = ((Integer)localObject).intValue();; i = 4096) {
      return WtloginHelper.GetTicketSig(paramWUserSigInfo, i);
    }
  }
  
  /* Error */
  public void b(String paramString, byte[] paramArrayOfByte, WUserSigInfo paramWUserSigInfo, int paramInt, ErrMsg paramErrMsg)
  {
    // Byte code:
    //   0: invokestatic 216	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +30 -> 33
    //   6: ldc -111
    //   8: iconst_2
    //   9: new 147	java/lang/StringBuilder
    //   12: dup
    //   13: invokespecial 148	java/lang/StringBuilder:<init>	()V
    //   16: ldc_w 749
    //   19: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   22: iload 4
    //   24: invokevirtual 222	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   27: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   30: invokestatic 189	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   33: aload_0
    //   34: getfield 27	com/tencent/mobileqq/msf/core/auth/k:g	Z
    //   37: ifeq +247 -> 284
    //   40: iconst_0
    //   41: newarray byte
    //   43: astore 7
    //   45: aload 7
    //   47: astore 6
    //   49: iload 4
    //   51: tableswitch	default:+760->811, 0:+179->230, 1:+25->76, 2:+167->218
    //   76: aload_0
    //   77: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   80: invokestatic 118	com/tencent/mobileqq/msf/service/g:a	(Lcom/tencent/qphone/base/remote/ToServiceMsg;)Lcom/tencent/qphone/base/remote/FromServiceMsg;
    //   83: astore 7
    //   85: aload 7
    //   87: getstatic 752	com/tencent/mobileqq/msf/sdk/MsfCommand:wt_CheckPictureAndGetSt	Lcom/tencent/mobileqq/msf/sdk/MsfCommand;
    //   90: invokevirtual 79	com/tencent/qphone/base/remote/FromServiceMsg:setMsfCommand	(Lcom/tencent/mobileqq/msf/sdk/MsfCommand;)V
    //   93: aload 7
    //   95: invokevirtual 92	com/tencent/qphone/base/remote/FromServiceMsg:setMsgSuccess	()V
    //   98: aload 7
    //   100: ldc 120
    //   102: aload_1
    //   103: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   106: pop
    //   107: aload 7
    //   109: ldc_w 663
    //   112: aload_2
    //   113: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   116: pop
    //   117: aload 7
    //   119: ldc_w 754
    //   122: aload 6
    //   124: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   127: pop
    //   128: aload 7
    //   130: ldc -17
    //   132: aload_3
    //   133: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   136: pop
    //   137: aload 7
    //   139: ldc -120
    //   141: iload 4
    //   143: invokestatic 141	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   146: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   149: pop
    //   150: aload 7
    //   152: ldc_w 259
    //   155: aload 5
    //   157: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   160: pop
    //   161: aload 7
    //   163: ldc -15
    //   165: aload_0
    //   166: aload_3
    //   167: invokevirtual 244	com/tencent/mobileqq/msf/core/auth/k:a	(Loicq/wlogin_sdk/request/WUserSigInfo;)[B
    //   170: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   173: pop
    //   174: aload 7
    //   176: ldc -10
    //   178: aload_3
    //   179: sipush 128
    //   182: invokestatic 252	oicq/wlogin_sdk/request/WtloginHelper:GetTicketSig	(Loicq/wlogin_sdk/request/WUserSigInfo;I)[B
    //   185: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   188: pop
    //   189: aload 7
    //   191: ldc -2
    //   193: aload_3
    //   194: sipush 128
    //   197: invokestatic 257	oicq/wlogin_sdk/request/WtloginHelper:GetTicketSigKey	(Loicq/wlogin_sdk/request/WUserSigInfo;I)[B
    //   200: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   203: pop
    //   204: aload_0
    //   205: getfield 29	com/tencent/mobileqq/msf/core/auth/k:e	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   208: aload_0
    //   209: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   212: aload 7
    //   214: invokevirtual 110	com/tencent/mobileqq/msf/core/MsfCore:addRespToQuque	(Lcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;)V
    //   217: return
    //   218: getstatic 273	com/tencent/mobileqq/msf/core/auth/h:e	Loicq/wlogin_sdk/request/WtloginHelper;
    //   221: aload_1
    //   222: invokevirtual 277	oicq/wlogin_sdk/request/WtloginHelper:GetPictureData	(Ljava/lang/String;)[B
    //   225: astore 6
    //   227: goto -151 -> 76
    //   230: getstatic 283	com/tencent/mobileqq/msf/core/auth/h:d	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   233: invokevirtual 287	com/tencent/mobileqq/msf/core/MsfCore:getAccountCenter	()Lcom/tencent/mobileqq/msf/core/auth/b;
    //   236: iconst_0
    //   237: invokevirtual 292	com/tencent/mobileqq/msf/core/auth/b:a	(Z)V
    //   240: aload 7
    //   242: astore 6
    //   244: goto -168 -> 76
    //   247: astore_1
    //   248: ldc -111
    //   250: iconst_1
    //   251: new 147	java/lang/StringBuilder
    //   254: dup
    //   255: invokespecial 148	java/lang/StringBuilder:<init>	()V
    //   258: ldc_w 756
    //   261: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   264: aload_1
    //   265: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   268: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   271: aload_1
    //   272: invokestatic 166	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   275: return
    //   276: astore_1
    //   277: aload_1
    //   278: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   281: goto -77 -> 204
    //   284: aload_0
    //   285: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   288: invokestatic 202	com/tencent/mobileqq/msf/core/n:a	(Lcom/tencent/qphone/base/remote/ToServiceMsg;)Lcom/tencent/qphone/base/remote/FromServiceMsg;
    //   291: astore 6
    //   293: aload 6
    //   295: getstatic 752	com/tencent/mobileqq/msf/sdk/MsfCommand:wt_CheckPictureAndGetSt	Lcom/tencent/mobileqq/msf/sdk/MsfCommand;
    //   298: invokevirtual 79	com/tencent/qphone/base/remote/FromServiceMsg:setMsfCommand	(Lcom/tencent/mobileqq/msf/sdk/MsfCommand;)V
    //   301: aload 6
    //   303: invokevirtual 92	com/tencent/qphone/base/remote/FromServiceMsg:setMsgSuccess	()V
    //   306: aload 6
    //   308: ldc 120
    //   310: aload_1
    //   311: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   314: pop
    //   315: aload 6
    //   317: ldc_w 663
    //   320: aload_2
    //   321: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   324: pop
    //   325: aload 6
    //   327: ldc_w 601
    //   330: aload_3
    //   331: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   334: pop
    //   335: aload 6
    //   337: ldc -120
    //   339: iload 4
    //   341: invokestatic 141	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   344: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   347: pop
    //   348: aload 6
    //   350: ldc_w 259
    //   353: aload 5
    //   355: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   358: pop
    //   359: aload 6
    //   361: ldc -15
    //   363: aload_0
    //   364: aload_3
    //   365: invokevirtual 244	com/tencent/mobileqq/msf/core/auth/k:a	(Loicq/wlogin_sdk/request/WUserSigInfo;)[B
    //   368: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   371: pop
    //   372: aload 6
    //   374: ldc -10
    //   376: aload_3
    //   377: sipush 128
    //   380: invokestatic 252	oicq/wlogin_sdk/request/WtloginHelper:GetTicketSig	(Loicq/wlogin_sdk/request/WUserSigInfo;I)[B
    //   383: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   386: pop
    //   387: aload 6
    //   389: aload_3
    //   390: getfield 298	oicq/wlogin_sdk/request/WUserSigInfo:uin	Ljava/lang/String;
    //   393: invokevirtual 69	com/tencent/qphone/base/remote/FromServiceMsg:setUin	(Ljava/lang/String;)V
    //   396: aload 6
    //   398: ldc -2
    //   400: aload_3
    //   401: sipush 128
    //   404: invokestatic 257	oicq/wlogin_sdk/request/WtloginHelper:GetTicketSigKey	(Loicq/wlogin_sdk/request/WUserSigInfo;I)[B
    //   407: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   410: pop
    //   411: iload 4
    //   413: lookupswitch	default:+43->456, -1000:+336->749, 0:+274->687, 2:+174->587, 160:+224->637
    //   456: aload 6
    //   458: sipush 1001
    //   461: aload 5
    //   463: invokevirtual 229	oicq/wlogin_sdk/tools/ErrMsg:getMessage	()Ljava/lang/String;
    //   466: invokevirtual 193	com/tencent/qphone/base/remote/FromServiceMsg:setBusinessFail	(ILjava/lang/String;)V
    //   469: ldc -111
    //   471: iconst_1
    //   472: ldc_w 758
    //   475: invokestatic 302	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   478: iload 4
    //   480: ifeq +71 -> 551
    //   483: aload 5
    //   485: invokevirtual 305	oicq/wlogin_sdk/tools/ErrMsg:getType	()I
    //   488: iconst_1
    //   489: if_icmpne +17 -> 506
    //   492: aload 6
    //   494: ldc_w 307
    //   497: aload 5
    //   499: invokevirtual 262	oicq/wlogin_sdk/tools/ErrMsg:getOtherinfo	()Ljava/lang/String;
    //   502: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   505: pop
    //   506: iload 4
    //   508: bipush 116
    //   510: if_icmpeq +10 -> 520
    //   513: iload 4
    //   515: bipush 41
    //   517: if_icmpne +34 -> 551
    //   520: aload_3
    //   521: ldc_w 308
    //   524: invokestatic 312	oicq/wlogin_sdk/request/WtloginHelper:GetUserSigInfoTicket	(Loicq/wlogin_sdk/request/WUserSigInfo;I)Loicq/wlogin_sdk/request/Ticket;
    //   527: astore_1
    //   528: aload_1
    //   529: ifnull +22 -> 551
    //   532: aload_1
    //   533: getfield 318	oicq/wlogin_sdk/request/Ticket:_sig	[B
    //   536: astore_1
    //   537: aload_1
    //   538: ifnull +231 -> 769
    //   541: aload 6
    //   543: ldc_w 320
    //   546: aload_1
    //   547: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   550: pop
    //   551: aload 6
    //   553: ldc_w 322
    //   556: iload 4
    //   558: invokestatic 141	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   561: invokevirtual 130	com/tencent/qphone/base/remote/FromServiceMsg:addAttribute	(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    //   564: pop
    //   565: aload_0
    //   566: getfield 29	com/tencent/mobileqq/msf/core/auth/k:e	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   569: aload_0
    //   570: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   573: aload 6
    //   575: invokevirtual 110	com/tencent/mobileqq/msf/core/MsfCore:addRespToQuque	(Lcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;)V
    //   578: return
    //   579: astore_2
    //   580: aload_2
    //   581: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   584: goto -173 -> 411
    //   587: getstatic 330	com/tencent/mobileqq/msf/core/auth/i:b	Ljava/util/concurrent/ConcurrentHashMap;
    //   590: aload_0
    //   591: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   594: invokevirtual 219	com/tencent/qphone/base/remote/ToServiceMsg:getRequestSsoSeq	()I
    //   597: invokestatic 141	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   600: aload_0
    //   601: invokevirtual 336	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   604: pop
    //   605: aload_0
    //   606: aload_3
    //   607: getfield 339	oicq/wlogin_sdk/request/WUserSigInfo:_seqence	J
    //   610: putfield 341	com/tencent/mobileqq/msf/core/auth/k:f	J
    //   613: aload_1
    //   614: aload_0
    //   615: getfield 29	com/tencent/mobileqq/msf/core/auth/k:e	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   618: aload_0
    //   619: getfield 341	com/tencent/mobileqq/msf/core/auth/k:f	J
    //   622: aload_0
    //   623: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   626: aload 6
    //   628: aload 5
    //   630: invokevirtual 229	oicq/wlogin_sdk/tools/ErrMsg:getMessage	()Ljava/lang/String;
    //   633: invokestatic 344	com/tencent/mobileqq/msf/core/auth/i:b	(Ljava/lang/String;Lcom/tencent/mobileqq/msf/core/MsfCore;JLcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;Ljava/lang/String;)V
    //   636: return
    //   637: getstatic 330	com/tencent/mobileqq/msf/core/auth/i:b	Ljava/util/concurrent/ConcurrentHashMap;
    //   640: aload_0
    //   641: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   644: invokevirtual 219	com/tencent/qphone/base/remote/ToServiceMsg:getRequestSsoSeq	()I
    //   647: invokestatic 141	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   650: aload_0
    //   651: invokevirtual 336	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   654: pop
    //   655: aload_0
    //   656: aload_3
    //   657: getfield 339	oicq/wlogin_sdk/request/WUserSigInfo:_seqence	J
    //   660: putfield 341	com/tencent/mobileqq/msf/core/auth/k:f	J
    //   663: aload_1
    //   664: aload_0
    //   665: getfield 29	com/tencent/mobileqq/msf/core/auth/k:e	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   668: aload_0
    //   669: getfield 341	com/tencent/mobileqq/msf/core/auth/k:f	J
    //   672: aload_0
    //   673: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   676: aload 6
    //   678: aload 5
    //   680: invokevirtual 229	oicq/wlogin_sdk/tools/ErrMsg:getMessage	()Ljava/lang/String;
    //   683: invokestatic 351	com/tencent/mobileqq/msf/core/auth/i:a	(Ljava/lang/String;Lcom/tencent/mobileqq/msf/core/MsfCore;JLcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;Ljava/lang/String;)V
    //   686: return
    //   687: aload_0
    //   688: getfield 29	com/tencent/mobileqq/msf/core/auth/k:e	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   691: getstatic 273	com/tencent/mobileqq/msf/core/auth/h:e	Loicq/wlogin_sdk/request/WtloginHelper;
    //   694: aload_0
    //   695: getfield 31	com/tencent/mobileqq/msf/core/auth/k:d	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   698: aload 6
    //   700: aload_1
    //   701: aload_3
    //   702: invokestatic 360	com/tencent/mobileqq/msf/core/auth/i:a	(Lcom/tencent/mobileqq/msf/core/MsfCore;Loicq/wlogin_sdk/request/WtloginHelper;Lcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;Ljava/lang/String;Loicq/wlogin_sdk/request/WUserSigInfo;)V
    //   705: aload_0
    //   706: getfield 23	com/tencent/mobileqq/msf/core/auth/k:a	Z
    //   709: ifeq +109 -> 818
    //   712: aload_1
    //   713: invokestatic 362	com/tencent/mobileqq/msf/core/auth/h:a	(Ljava/lang/String;)V
    //   716: return
    //   717: astore_1
    //   718: ldc -111
    //   720: iconst_1
    //   721: new 147	java/lang/StringBuilder
    //   724: dup
    //   725: invokespecial 148	java/lang/StringBuilder:<init>	()V
    //   728: ldc_w 683
    //   731: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   734: aload_1
    //   735: invokevirtual 365	java/lang/Exception:toString	()Ljava/lang/String;
    //   738: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   741: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   744: aload_1
    //   745: invokestatic 367	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   748: return
    //   749: aload 6
    //   751: sipush 1002
    //   754: invokevirtual 379	com/tencent/qphone/base/remote/FromServiceMsg:setBusinessFail	(I)V
    //   757: ldc -111
    //   759: iconst_1
    //   760: ldc_w 760
    //   763: invokestatic 302	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   766: goto -288 -> 478
    //   769: invokestatic 216	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   772: ifeq -221 -> 551
    //   775: ldc -111
    //   777: iconst_1
    //   778: new 147	java/lang/StringBuilder
    //   781: dup
    //   782: invokespecial 148	java/lang/StringBuilder:<init>	()V
    //   785: ldc_w 762
    //   788: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   791: iload 4
    //   793: invokevirtual 222	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   796: ldc_w 383
    //   799: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   802: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   805: invokestatic 302	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   808: goto -257 -> 551
    //   811: aload 7
    //   813: astore 6
    //   815: goto -739 -> 76
    //   818: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	819	0	this	k
    //   0	819	1	paramString	String
    //   0	819	2	paramArrayOfByte	byte[]
    //   0	819	3	paramWUserSigInfo	WUserSigInfo
    //   0	819	4	paramInt	int
    //   0	819	5	paramErrMsg	ErrMsg
    //   47	767	6	localObject1	Object
    //   43	769	7	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   40	45	247	java/lang/Exception
    //   76	189	247	java/lang/Exception
    //   204	217	247	java/lang/Exception
    //   218	227	247	java/lang/Exception
    //   230	240	247	java/lang/Exception
    //   277	281	247	java/lang/Exception
    //   189	204	276	java/lang/Exception
    //   396	411	579	java/lang/Exception
    //   687	716	717	java/lang/Exception
  }
  
  public void b(WUserSigInfo paramWUserSigInfo, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnCloseDevLock ret:" + paramInt);
    }
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsfCommand(MsfCommand.wt_CloseDevLock);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("lastError", paramErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramWUserSigInfo)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCloseDevLock error " + paramWUserSigInfo, paramWUserSigInfo);
    }
  }
  
  public void b(WUserSigInfo paramWUserSigInfo, int paramInt, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("queryMobile", 2, "WtProviderImpl.OnRegQueryAccount ret = " + paramInt + " appUseWt=" + g);
    }
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(paramInt));
    attributes.put("resp_register_promptinfo", paramArrayOfByte);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void b(WUserSigInfo paramWUserSigInfo, DevlockInfo paramDevlockInfo, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnAskDevLockSms ret:" + paramInt);
    }
    if (g) {}
    try
    {
      FromServiceMsg localFromServiceMsg = g.a(d);
      localFromServiceMsg.setMsfCommand(MsfCommand.wt_AskDevLockSms);
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
      localFromServiceMsg.addAttribute("devLockInfo", paramDevlockInfo);
      localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
      localFromServiceMsg.addAttribute("lastError", paramErrMsg);
      e.addRespToQuque(d, localFromServiceMsg);
      return;
    }
    catch (Exception paramWUserSigInfo)
    {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnAskDevLockSms error " + paramWUserSigInfo, paramWUserSigInfo);
    }
  }
  
  public void c(String paramString, byte[] paramArrayOfByte, WUserSigInfo paramWUserSigInfo, int paramInt, ErrMsg paramErrMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.WTLoginCenter.MsfProvider", 2, "OnRefreshSMSData ret:" + paramInt);
    }
    if (g) {
      for (;;)
      {
        FromServiceMsg localFromServiceMsg;
        try
        {
          localFromServiceMsg = g.a(d);
          localFromServiceMsg.setMsfCommand(MsfCommand.wt_CheckSMSAndGetSt);
          localFromServiceMsg.setMsgSuccess();
          localFromServiceMsg.addAttribute("userAccount", paramString);
          localFromServiceMsg.addAttribute("userInput", paramArrayOfByte);
          localFromServiceMsg.addAttribute("sigInfo", paramWUserSigInfo);
          localFromServiceMsg.addAttribute("ret", Integer.valueOf(paramInt));
          localFromServiceMsg.addAttribute("lastError", paramErrMsg);
          localFromServiceMsg.addAttribute("userSigInfo", paramWUserSigInfo);
          localFromServiceMsg.addAttribute("wtTicket", a(paramWUserSigInfo));
          localFromServiceMsg.addAttribute("st_temp", WtloginHelper.GetTicketSig(paramWUserSigInfo, 128));
          try
          {
            localFromServiceMsg.addAttribute("st_temp_key", WtloginHelper.GetTicketSigKey(paramWUserSigInfo, 128));
            switch (paramInt)
            {
            default: 
              localFromServiceMsg.setBusinessFail(1001, paramErrMsg.getMessage());
              QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetSt failed");
              break label543;
              paramString = WtloginHelper.GetUserSigInfoTicket(paramWUserSigInfo, 4194304);
              if (paramString != null)
              {
                paramString = _sig;
                if (paramString == null) {
                  break label501;
                }
                localFromServiceMsg.addAttribute("resp_login_lhsig", paramString);
              }
              e.addRespToQuque(d, localFromServiceMsg);
              return;
            }
          }
          catch (Exception paramArrayOfByte)
          {
            paramArrayOfByte.printStackTrace();
            continue;
          }
          i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
        }
        catch (Exception paramString)
        {
          QLog.d("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetSt error " + paramString, paramString);
          return;
        }
        f = _seqence;
        i.b(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
        return;
        i.b.put(Integer.valueOf(d.getRequestSsoSeq()), this);
        f = _seqence;
        i.a(paramString, e, f, d, localFromServiceMsg, paramErrMsg.getMessage());
        return;
        try
        {
          i.a(e, h.e, d, localFromServiceMsg, paramString, paramWUserSigInfo);
          if (!a) {
            break;
          }
          h.a(paramString);
          return;
        }
        catch (Exception paramString)
        {
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckPictureAndGetSt succ exception " + paramString.toString(), paramString);
          return;
        }
        localFromServiceMsg.setBusinessFail(1002);
        QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetSt timeout");
        label501:
        if (QLog.isColorLevel())
        {
          QLog.e("MSF.C.WTLoginCenter.MsfProvider", 1, "OnCheckSMSAndGetSt ret: " + paramInt + " , t is null.");
          continue;
          label543:
          if (paramInt != 116) {
            if (paramInt != 41) {}
          }
        }
      }
    }
  }
  
  public void c(WUserSigInfo paramWUserSigInfo, int paramInt, byte[] paramArrayOfByte)
  {
    if (g) {
      return;
    }
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(1));
    attributes.put("resp_register_promptinfo", paramArrayOfByte);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
  
  public void d(WUserSigInfo paramWUserSigInfo, int paramInt, byte[] paramArrayOfByte)
  {
    if (g) {}
    paramWUserSigInfo = n.a(d);
    paramWUserSigInfo.setMsgSuccess();
    attributes.put("resp_register_resultcode", Integer.valueOf(paramInt));
    attributes.put("resp_register_promptinfo", paramArrayOfByte);
    e.addRespToQuque(d, paramWUserSigInfo);
  }
}
