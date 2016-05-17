package com.tencent.mobileqq.msf.core.auth;

import com.qq.jce.wup.UniPacket;
import com.qq.jce.wup.WupHexUtil;
import com.qq.taf.jce.HexUtil;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.msf.service.protocol.security.CustomSigContent;
import com.tencent.msf.service.protocol.security.RespondCustomSig;
import com.tencent.msf.service.protocol.security.i;
import com.tencent.msf.service.protocol.security.j;
import com.tencent.msf.service.protocol.security.k;
import com.tencent.msf.service.protocol.security.l;
import com.tencent.msf.service.protocol.security.o;
import com.tencent.msf.service.protocol.security.p;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.Cryptor;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class g
{
  public static final String a = "MSF.C.AccountRespHandler";
  b b;
  
  public g(b paramB)
  {
    b = paramB;
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    k localK;
    label161:
    Object localObject2;
    if ((paramFromServiceMsg.isSuccess()) && (paramFromServiceMsg.getWupBuffer() != null) && (paramFromServiceMsg.getWupBuffer().length > 0))
    {
      localObject1 = new UniPacket(true);
      ((UniPacket)localObject1).setEncodeName("UTF-8");
      ((UniPacket)localObject1).decode(paramFromServiceMsg.getWupBuffer());
      localK = (k)((UniPacket)localObject1).getByClass("RespondHeader", new k());
      a localA;
      if (localK != null)
      {
        if (!b.b.containsKey(d)) {
          b.b(d);
        }
        localA = (a)b.b.get(d);
        if (f != 101) {
          break label161;
        }
        b.e.a(paramToServiceMsg, paramFromServiceMsg, (UniPacket)localObject1, localK);
        b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
      }
      do
      {
        return;
        if ((f != 0) && (f != 10)) {
          break;
        }
        switch (b)
        {
        case 17: 
        case 2: 
        case 3: 
        case 4: 
        case 5: 
        case 7: 
        case 8: 
        case 10: 
        case 11: 
        case 12: 
        case 16: 
        default: 
          b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          return;
        case 0: 
          b.e.a(paramToServiceMsg, paramFromServiceMsg, localK);
          return;
        case 14: 
          localObject2 = (o)((UniPacket)localObject1).getByClass("ResponseAuthWlogin", new o());
          if (localObject2 != null)
          {
            localObject2 = d;
            if ((localObject2 == null) || (localObject2.length <= 0)) {}
          }
          b.e.a((UniPacket)localObject1, localA);
          b.e.a(paramToServiceMsg, paramFromServiceMsg, localK);
          return;
        case 1: 
          try
          {
            if (((UniPacket)localObject1).getServantName().equals("Login.Register"))
            {
              b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
              return;
            }
          }
          catch (Exception paramToServiceMsg)
          {
            QLog.d("MSF.C.AccountRespHandler", 2, "handle _CMD_ID_VERIFY_PIC failed.", paramToServiceMsg);
            return;
          }
          localObject2 = (o)((UniPacket)localObject1).getByClass("ResponseAuthWlogin", new o());
          if (localObject2 != null)
          {
            localObject2 = d;
            if ((localObject2 == null) || (localObject2.length <= 0)) {}
          }
          b.e.a((UniPacket)localObject1, localA);
          b.e.a(paramToServiceMsg, paramFromServiceMsg, localK);
          return;
        case 6: 
          localObject1 = (l)((UniPacket)localObject1).getByClass("RespondReFetchSid", new l());
          b.a(paramFromServiceMsg.getUin(), new String(b), System.currentTimeMillis());
          paramFromServiceMsg.addAttribute(paramFromServiceMsg.getServiceCmd(), b);
          if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_refreToken)
          {
            b.g.a(paramToServiceMsg, paramFromServiceMsg);
            return;
          }
          b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          return;
        case 9: 
          RespondCustomSig localRespondCustomSig = (RespondCustomSig)((UniPacket)localObject1).getByClass("RespondCustomSig", new RespondCustomSig());
          ArrayList localArrayList = new ArrayList();
          int j = 0;
          int i = 0;
          if (i < SigList.size())
          {
            localObject1 = (CustomSigContent)SigList.get(i);
            int k;
            Object localObject3;
            byte[] arrayOfByte;
            Object localObject4;
            if (ulSigType == 13L)
            {
              k = 1;
              localObject3 = new Cryptor();
              arrayOfByte = SigContent;
              localObject2 = localA.f();
              if (localObject2 != null)
              {
                localObject1 = localObject2;
                if (localObject2.length != 0) {}
              }
              else
              {
                localObject4 = b.n(d);
                localObject1 = localObject2;
                if (localObject4 != null) {
                  localObject1 = ((a)localObject4).f();
                }
              }
              if ((localObject1 == null) || (localObject1.length == 0)) {
                QLog.d("MSF.C.AccountRespHandler", 2, "A2 is null!");
              }
            }
            for (;;)
            {
              i += 1;
              j = k;
              break;
              localObject1 = MD5.toMD5Byte((byte[])localObject1);
              if ((localObject1 == null) || (localObject1.length == 0))
              {
                QLog.d("MSF.C.AccountRespHandler", 2, "dekey A2 is null!");
              }
              else
              {
                localObject1 = ((Cryptor)localObject3).decrypt(arrayOfByte, (byte[])localObject1);
                if ((localObject1 == null) || (localObject1.length == 0))
                {
                  QLog.d("MSF.C.AccountRespHandler", 2, "D3 decrypt by A2 failed, D3 is " + HexUtil.bytes2HexStr(arrayOfByte));
                }
                else
                {
                  localObject2 = new byte[4];
                  localObject3 = new byte[16];
                  arrayOfByte = new byte[2];
                  f.a((byte[])localObject2, 0, (byte[])localObject1, 4);
                  f.a((byte[])localObject3, 0, (byte[])localObject1, 4, 16);
                  f.a(arrayOfByte, 0, (byte[])localObject1, 20, 2);
                  localObject4 = new int[2];
                  localObject4[0] = arrayOfByte[0];
                  localObject4[0] <<= 8;
                  localObject4[1] = arrayOfByte[1];
                  j = localObject4[0] + localObject4[1];
                  if (localObject1.length != j + 22)
                  {
                    QLog.d("MSF.C.AccountRespHandler", 2, "D3.length is " + localObject1.length + ", but expected to be " + (j + 22));
                  }
                  else
                  {
                    arrayOfByte = new byte[j];
                    f.a(arrayOfByte, 0, (byte[])localObject1, 22, j);
                    localArrayList.add(WupHexUtil.bytes2HexStr((byte[])localObject2) + "," + WupHexUtil.bytes2HexStr((byte[])localObject3) + "," + WupHexUtil.bytes2HexStr(arrayOfByte));
                    continue;
                    localArrayList.add(((CustomSigContent)localObject1).toString());
                    k = j;
                    if (ulSigType == 3L)
                    {
                      paramFromServiceMsg.addAttribute("A8", localObject1);
                      k = j;
                    }
                  }
                }
              }
            }
          }
          if (j != 0) {
            paramFromServiceMsg.addAttribute(paramFromServiceMsg.getServiceCmd(), localArrayList);
          }
          while (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_refreToken)
          {
            b.g.a(paramToServiceMsg, paramFromServiceMsg);
            return;
            paramFromServiceMsg.addAttribute(paramFromServiceMsg.getServiceCmd(), localRespondCustomSig);
          }
          b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          return;
        case 13: 
          b.a(paramToServiceMsg.getUin(), localK);
          localA.d(e);
          paramFromServiceMsg.addAttribute(paramFromServiceMsg.getServiceCmd(), d);
          localObject1 = (p)((UniPacket)localObject1).getByClass("ResponseNameExchangeUin", new p());
          if (localObject1 != null)
          {
            localObject2 = d;
            if ((localObject2 != null) && (localObject2.length > 0)) {}
            paramFromServiceMsg.addAttribute("__base_tag_sigSession", e);
          }
          b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          return;
        }
        paramToServiceMsg = (j)((UniPacket)localObject1).getByClass("RespondGetServerTime", new j());
      } while (paramToServiceMsg == null);
      NetConnInfoCenter.handleGetServerTimeResp(b);
      return;
      if (f == 203)
      {
        localObject1 = (i)((UniPacket)localObject1).getByClass("RespondAuth", new i());
        if ((localObject1 == null) || (b == null)) {
          break label2038;
        }
      }
    }
    label2038:
    for (Object localObject1 = b;; localObject1 = "password error")
    {
      paramFromServiceMsg.setBusinessFail(2005, (String)localObject1);
      b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
      return;
      if (f == 235)
      {
        localObject1 = (j)((UniPacket)localObject1).getByClass("RespondGetServerTime", new j());
        if (localObject1 != null)
        {
          b.a((int)(b - System.currentTimeMillis() / 1000L));
          if ((paramToServiceMsg.getMsfCommand() == MsfCommand.loginAuth) || (paramToServiceMsg.getMsfCommand() == MsfCommand.changeUinLogin) || (paramToServiceMsg.getMsfCommand() == MsfCommand.wt_GetStViaSMSVerifyLogin))
          {
            if (paramToServiceMsg.getAttribute("to_login_alsoCheckTime") != null) {
              break;
            }
            paramToServiceMsg.addAttribute("to_login_alsoCheckTime", Integer.valueOf(1));
            if (paramToServiceMsg.getMsfCommand() == MsfCommand.loginAuth)
            {
              b.a.login(paramToServiceMsg);
              return;
            }
            if (paramToServiceMsg.getMsfCommand() == MsfCommand.changeUinLogin)
            {
              b.a.ChangeUinLogin(paramToServiceMsg);
              return;
            }
            if (paramToServiceMsg.getMsfCommand() == MsfCommand.wt_GetStViaSMSVerifyLogin)
            {
              b.a.wt_GetStViaSMSVerifyLogin(paramToServiceMsg);
              return;
            }
            QLog.d("AuthRespHandler", 2, "HandlerLoginResp authResp.result == com.tencent.msf.service.protocol.security.Const.RESULT_A1Overtime and go else?? what happen?");
            return;
          }
        }
        paramFromServiceMsg.setBusinessFail(1012, "client time error");
        b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        return;
      }
      localObject1 = (i)((UniPacket)localObject1).getByClass("RespondAuth", new i());
      if ((localObject1 != null) && (b != null)) {}
      for (localObject1 = b;; localObject1 = "loginFailed.")
      {
        if ((b == 14) || (b == 0)) {
          b.m(paramFromServiceMsg.getUin());
        }
        paramFromServiceMsg.setBusinessFail(f, (String)localObject1);
        if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_refreToken)
        {
          b.g.a(paramToServiceMsg, paramFromServiceMsg);
          return;
        }
        b.a.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
        return;
        if ((paramToServiceMsg.getMsfCommand() != MsfCommand.changeUinLogin) && (paramToServiceMsg.getMsfCommand() != MsfCommand.loginAuth) && (paramToServiceMsg.getMsfCommand() != MsfCommand.wt_GetStViaSMSVerifyLogin)) {
          break;
        }
        boolean bool = paramFromServiceMsg.getServiceCmd().equals("login.chguin");
        long l2 = ((Long)paramFromServiceMsg.getAttribute("__timestamp_net2msf")).longValue() - ((Long)paramToServiceMsg.getAttribute("__timestamp_addSendQueue")).longValue();
        long l3 = m.a(paramToServiceMsg, paramFromServiceMsg);
        localObject1 = "0";
        localObject2 = "0";
        if (paramToServiceMsg.getAttributes().containsKey("_tag_socket")) {
          localObject1 = (String)paramToServiceMsg.getAttribute("_tag_socket");
        }
        if (paramToServiceMsg.getAttributes().containsKey("_tag_localsocket")) {
          localObject2 = (String)paramToServiceMsg.getAttribute("_tag_localsocket");
        }
        if (paramFromServiceMsg.getBusinessFailCode() == 1002)
        {
          long l1 = 0L;
          if (paramToServiceMsg.getAttributes().containsKey("__timestamp_msf2net"))
          {
            if (paramToServiceMsg.getAttributes().containsKey("__timestamp_addSendQueue")) {
              l1 = ((Long)paramToServiceMsg.getAttribute("__timestamp_msf2net")).longValue() - ((Long)paramToServiceMsg.getAttribute("__timestamp_addSendQueue")).longValue();
            }
            b.a.getStatReporter().a(false, l2, 1014, l3, (String)localObject1, (String)localObject2, bool, l1);
            return;
          }
          b.a.getStatReporter().a(false, l2, paramFromServiceMsg.getBusinessFailCode(), l3, (String)localObject1, (String)localObject2, bool, 0L);
          return;
        }
        if (paramFromServiceMsg.getBusinessFailCode() == 2008)
        {
          b.a.getStatReporter().a(paramToServiceMsg.getUin(), false, l2, paramFromServiceMsg.getBusinessFailCode(), l3);
          return;
        }
        b.a.getStatReporter().a(true, l2, paramFromServiceMsg.getBusinessFailCode(), l3, (String)localObject1, (String)localObject2, bool, 0L);
        return;
      }
    }
  }
}
