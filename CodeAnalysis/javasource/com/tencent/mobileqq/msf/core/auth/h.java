package com.tencent.mobileqq.msf.core.auth;

import android.text.TextUtils;
import com.qq.taf.jce.HexUtil;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.MsfStore;
import com.tencent.mobileqq.msf.core.n;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.service.g;
import com.tencent.msf.boot.config.NativeConfigStore;
import com.tencent.msf.service.protocol.security.RequestCustomSig;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import oicq.wlogin_sdk.request.Ticket;
import oicq.wlogin_sdk.request.WFastLoginInfo;
import oicq.wlogin_sdk.request.WUserSigInfo;
import oicq.wlogin_sdk.request.WtloginHelper;

public class h
{
  static final String a = "MSF.C.WTLoginCenter";
  public static final long b = 16L;
  public static final HashSet c = new HashSet();
  public static MsfCore d;
  public static WtloginHelper e;
  public static final byte f = 1;
  private static final String g = "_wtlastchecklocaltokentime_";
  private static final int h = 43200000;
  private static final long i = 9L;
  private static final long j = 8L;
  private final int k = 100;
  
  public h() {}
  
  private int a(ToServiceMsg paramToServiceMsg, boolean paramBoolean1, a paramA, boolean paramBoolean2)
  {
    for (;;)
    {
      try
      {
        k localK = i.a(d, paramToServiceMsg);
        long[] arrayOfLong = new long[0];
        if (com.tencent.mobileqq.msf.core.a.a.aQ())
        {
          arrayOfLong = new long[1];
          arrayOfLong[0] = 1600000226L;
        }
        long l1 = 16L;
        long l2 = paramToServiceMsg.getAppId();
        if (paramToServiceMsg.getServiceCmd().equals("login.chgTok_A2D2"))
        {
          n = 262208;
          m = 1;
          n |= 0x2000000;
          if ((!com.tencent.mobileqq.msf.core.a.a.j()) || (m == 0)) {
            continue;
          }
          a = true;
          e.SetTimeOut((int)paramToServiceMsg.getTimeout());
          i.a(paramToServiceMsg);
          if ((0x100000 & n) == 1048576)
          {
            localObject = i.c(paramToServiceMsg.getRequestSsoSeq());
            if (paramBoolean1) {
              continue;
            }
            paramA = new byte[1][];
            paramA[0] = new byte[1];
            paramA[0][0] = 1;
            m = e.GetStWithoutPasswd(paramToServiceMsg.getUin(), 16L, l1, -1L, n, l2, arrayOfLong, (WUserSigInfo)localObject, new byte[0][], paramA);
            a(paramToServiceMsg, localK, m, "sendChangeTokenMsg");
            return m;
          }
        }
        else
        {
          if (paramToServiceMsg.getServiceCmd().equals("login.chgTok_WEBVIEW_KEY"))
          {
            n = 1708064;
            m = 1;
            continue;
          }
          localObject = (HashMap)paramToServiceMsg.getAttributes().get("to_login_token_map");
          if ((get"RequestCustomSig"ulCustumFlag & 0x2000) != 8192L) {
            break label382;
          }
          n = 16384;
          l1 = 715019303L;
          l2 = Long.parseLong((String)((HashMap)localObject).get("OpenAppid"));
          m = 1;
          continue;
        }
        Object localObject = i.b(paramToServiceMsg.getRequestSsoSeq());
        continue;
        if (paramA == null)
        {
          QLog.e("MSF.C.WTLoginCenter", 1, "changeTokenAfterLogin error account is null.");
          return -1;
        }
        m = e.GetStWithoutPasswd(paramA.d(), 16L, 16L, paramToServiceMsg.getAppId(), n, paramA.f(), paramA.i(), paramA.k(), (WUserSigInfo)localObject);
        continue;
        return 1;
      }
      catch (Exception paramToServiceMsg)
      {
        QLog.e("MSF.C.WTLoginCenter", 1, "changeTokenAfterLogin error " + paramToServiceMsg.toString(), paramToServiceMsg);
        return 0;
      }
      label382:
      int m = 0;
      int n = 0;
    }
  }
  
  private void a(ToServiceMsg paramToServiceMsg, k paramK, int paramInt, String paramString)
  {
    if (paramInt != 64535)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.WTLoginCenter", 2, "call " + paramString + " ret  " + paramInt);
      }
      paramK.a(paramString, 0, i.b(paramToServiceMsg.getRequestSsoSeq()));
    }
  }
  
  private void a(ToServiceMsg paramToServiceMsg, String paramString)
  {
    FromServiceMsg localFromServiceMsg = n.a(paramToServiceMsg);
    d.getAccountCenter().m(localFromServiceMsg.getUin());
    localFromServiceMsg.setBusinessFail(2001, localFromServiceMsg.getBusinessFailMsg());
    MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
    d.addRespToQuque(paramToServiceMsg, localFromServiceMsg);
    QLog.d("MSF.C.WTLoginCenter", 1, "found accountToken " + localFromServiceMsg.getUin() + " is expired on call " + paramString);
  }
  
  static void a(String paramString)
  {
    QLog.d("MSF.C.WTLoginCenter", 2, "updateCheckTime " + paramString);
    long l = System.currentTimeMillis();
    MsfStore.getNativeConfigStore().setConfig("_wtlastchecklocaltokentime_" + paramString, String.valueOf(l));
  }
  
  public static byte[] a()
  {
    return e.GetGuid();
  }
  
  private void b()
  {
    c.add("game.qq.com");
    c.add("mail.qq.com");
    c.add("qzone.qq.com");
    c.add("qzone.com");
    c.add("qun.qq.com");
  }
  
  private boolean d(String paramString)
  {
    long l1;
    if (com.tencent.mobileqq.msf.core.a.a.j())
    {
      l1 = System.currentTimeMillis();
      paramString = MsfStore.getNativeConfigStore().getConfig("_wtlastchecklocaltokentime_" + paramString);
      if (paramString != null) {
        break label42;
      }
    }
    label42:
    long l2;
    do
    {
      return false;
      l2 = Long.parseLong(paramString);
    } while ((l1 <= l2) || (l1 - l2 > 43200000L));
    return true;
  }
  
  public void A(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.RegGetSMSVerifyLoginAccount((byte[])paramToServiceMsg.getAttribute("msgchk"), "qqpassport".getBytes(), (byte[])paramToServiceMsg.getAttribute("nick"), localWUserSigInfo), "wt_RegGetSMSVerifyLoginAccount");
  }
  
  public void B(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    String str2 = (String)paramToServiceMsg.getAttribute("countryCode");
    String str1 = (String)paramToServiceMsg.getAttribute("userAccount");
    if (!str2.startsWith("86")) {
      str1 = "00" + str2 + str1;
    }
    for (;;)
    {
      a(paramToServiceMsg, localK, e.CheckSMSVerifyLoginAccount(16L, paramToServiceMsg.getAppId(), str1, localWUserSigInfo), "wt_CheckSMSVerifyLoginAccount");
      return;
    }
  }
  
  public void C(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    String str3 = (String)paramToServiceMsg.getAttribute("countryCode");
    String str2 = (String)paramToServiceMsg.getAttribute("userAccount");
    String str1 = str2;
    if (!str3.startsWith("86")) {
      str1 = "00" + str3 + str2;
    }
    a(paramToServiceMsg, localK, e.RefreshSMSVerifyLoginCode(str1, localWUserSigInfo), "wt_RefreshSMSVerifyLoginCode");
  }
  
  public void D(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    String str3 = (String)paramToServiceMsg.getAttribute("countryCode");
    String str2 = (String)paramToServiceMsg.getAttribute("userAccount");
    String str1 = str2;
    if (!str3.startsWith("86")) {
      str1 = "00" + str3 + str2;
    }
    a(paramToServiceMsg, localK, e.VerifySMSVerifyLoginCode(str1, (String)paramToServiceMsg.getAttribute("code"), localWUserSigInfo), "wt_VerifySMSVerifyLoginCode");
  }
  
  public void E(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    long l = paramToServiceMsg.getAppId();
    Object localObject = (String)paramToServiceMsg.getAttribute("from_where", null);
    if ((localObject != null) && (((String)localObject).equalsIgnoreCase("ssoAccountAction")))
    {
      _login_bitmap = 2;
      l = 2L;
    }
    for (;;)
    {
      String str2 = (String)paramToServiceMsg.getAttribute("countryCode");
      String str1 = (String)paramToServiceMsg.getAttribute("userAccount");
      localObject = str1;
      if (!str2.startsWith("86")) {
        localObject = "00" + str2 + str1;
      }
      a(paramToServiceMsg, localK, e.GetStViaSMSVerifyLogin((String)localObject, 16L, l, 35524704, localWUserSigInfo), "wt_GetStViaSMSVerifyLogin");
      return;
      _login_bitmap = 0;
    }
  }
  
  public int a(a paramA, int paramInt, boolean paramBoolean)
  {
    if (!paramBoolean) {}
    try
    {
      if (d(paramA.d()))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.WTLoginCenter", 2, paramA.d() + " setKeyToWtlogin not reach time limit, return ...");
        }
      }
      else
      {
        byte[] arrayOfByte = paramA.k();
        int m = MsfCore.getNextSeq();
        ToServiceMsg localToServiceMsg = new ToServiceMsg("", paramA.d(), "login.getSid");
        localToServiceMsg.setMsfCommand(MsfCommand._msf_refreToken);
        localToServiceMsg.setRequestSsoSeq(m);
        localToServiceMsg.setAppId(100);
        localToServiceMsg.setTimeout(30000L);
        k localK = i.a(d, localToServiceMsg);
        b = false;
        i.a(localToServiceMsg);
        a = true;
        m = e.GetStWithoutPasswd(paramA.d(), 16L, 16L, localToServiceMsg.getAppId(), paramInt, paramA.f(), paramA.i(), arrayOfByte, i.b(m));
        a(localToServiceMsg, localK, m, "setWt");
        paramInt = m;
        if (!QLog.isColorLevel()) {
          return paramInt;
        }
        QLog.d("MSF.C.WTLoginCenter", 2, "call setWt for " + paramA.d());
        return m;
      }
    }
    catch (Exception paramA)
    {
      QLog.d("MSF.C.WTLoginCenter", 1, "call setWt error " + paramA, paramA);
      return -1;
    }
    paramInt = 1;
    return paramInt;
  }
  
  public int a(a paramA, boolean paramBoolean)
  {
    return a(paramA, 35524704, paramBoolean);
  }
  
  public int a(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.RefreshPictureData(paramToServiceMsg.getUin(), localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "refreVerifycode");
    return m;
  }
  
  int a(ToServiceMsg paramToServiceMsg, WtloginHelper paramWtloginHelper)
  {
    if (!paramWtloginHelper.IsNeedLoginWithPasswd(paramToServiceMsg.getUin(), 16L).booleanValue()) {
      return 1;
    }
    paramWtloginHelper = d.getAccountCenter().n(paramToServiceMsg.getUin());
    if ((paramWtloginHelper != null) && (paramWtloginHelper.o())) {
      return 0;
    }
    QLog.d("MSF.C.WTLoginCenter", 1, "checkIsNeedLoginWithPasswd " + MD5.toMD5(paramToServiceMsg.getUin()) + " IsNeedLoginWithPasswd");
    paramWtloginHelper = n.a(paramToServiceMsg);
    paramWtloginHelper.setBusinessFail(2001, paramToServiceMsg.getUin() + " not login");
    MsfSdkUtils.addFromMsgProcessName("*", paramWtloginHelper);
    d.addRespToQuque(paramToServiceMsg, paramWtloginHelper);
    return -1;
  }
  
  public int a(ToServiceMsg paramToServiceMsg, boolean paramBoolean)
  {
    Object localObject1 = (byte[])paramToServiceMsg.getAttributes().get("to_login_pwd");
    try
    {
      localObject1 = new String((byte[])localObject1, "ISO-8859-1");
      if (paramBoolean)
      {
        localObject2 = (String)paramToServiceMsg.getAttribute("to_login_changeuin");
        localObject3 = paramToServiceMsg.getUin();
        paramToServiceMsg.setUin((String)localObject2);
        paramToServiceMsg.addAttribute("to_login_changeuin", localObject3);
      }
      Object localObject3 = i.a(d, paramToServiceMsg);
      a = true;
      i.a(paramToServiceMsg);
      localWUserSigInfo = i.c(paramToServiceMsg.getRequestSsoSeq());
      Object localObject2 = (String)paramToServiceMsg.getAttribute("from_where", null);
      long l = paramToServiceMsg.getAppId();
      if ((localObject2 != null) && (((String)localObject2).equalsIgnoreCase("ssoAccountAction")))
      {
        _login_bitmap = 2;
        l = 2L;
        localObject2 = (String)paramToServiceMsg.getAttribute("process", null);
        if ((TextUtils.isEmpty((CharSequence)localObject2)) || (!((String)localObject2).equals("com.tencent.mobileqq:openSdk"))) {
          break label276;
        }
        paramBoolean = false;
        e.SetCanWebVerify(paramBoolean);
        localObject2 = new long[0];
        if (com.tencent.mobileqq.msf.core.a.a.aQ())
        {
          localObject2 = new long[1];
          localObject2[0] = 1600000226L;
        }
        int m = e.GetStWithPasswd(paramToServiceMsg.getUin(), 16L, 35524704, l, (long[])localObject2, true, (String)localObject1, localWUserSigInfo, new byte[0][]);
        a(paramToServiceMsg, (k)localObject3, m, "login");
        return m;
      }
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;)
      {
        WUserSigInfo localWUserSigInfo;
        localUnsupportedEncodingException.printStackTrace();
        String str = "";
        continue;
        _login_bitmap = 0;
        continue;
        label276:
        paramBoolean = true;
      }
    }
  }
  
  public long a(String paramString, int paramInt)
  {
    paramString = e.GetLocalTicket(paramString, 16L, paramInt);
    if (paramString == null) {
      return 0L;
    }
    return _create_time * 1000L;
  }
  
  public void a(MsfCore paramMsfCore)
  {
    d = paramMsfCore;
    oicq.wlogin_sdk.tools.util.LOGCAT_OUT = false;
    b();
    e = new WtloginHelper(BaseApplication.getContext());
    e.SetTimeOut(40000);
    e.SetMsfTransportFlag(1);
    paramMsfCore = new j(paramMsfCore);
    e.SetListener(paramMsfCore);
    com.tencent.mobileqq.msf.core.NetConnInfoCenter.GUID = e.GetGuid();
  }
  
  public int b(ToServiceMsg paramToServiceMsg)
  {
    String str = (String)paramToServiceMsg.getAttributes().get("to_verify_code");
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.CheckPictureAndGetSt(paramToServiceMsg.getUin(), str.getBytes(), localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "submitVerifycode");
    return m;
  }
  
  public int b(ToServiceMsg paramToServiceMsg, boolean paramBoolean)
  {
    try
    {
      i.a(d, paramToServiceMsg);
      m = a(paramToServiceMsg, e);
      QLog.d("MSF.C.WTLoginCenter", 1, "changeTokenAfterLogin checkIsNeedLoginWithPasswd " + m + " process:" + g.b(paramToServiceMsg) + " cmd:" + paramToServiceMsg.getServiceCmd());
      switch (m)
      {
      case -1: 
        a(paramToServiceMsg, "changeTokenAfterLogin");
        return -1;
      }
    }
    catch (Exception paramToServiceMsg)
    {
      int m;
      QLog.e("MSF.C.WTLoginCenter", 1, "changeTokenAfterLogin error " + paramToServiceMsg.toString(), paramToServiceMsg);
      return 0;
    }
    return a(paramToServiceMsg, true, d.getAccountCenter().n(paramToServiceMsg.getUin()), paramBoolean);
    m = a(paramToServiceMsg, false, null, paramBoolean);
    return m;
    return 0;
  }
  
  public boolean b(String paramString)
  {
    try
    {
      if (TextUtils.isEmpty(paramString))
      {
        QLog.d("MSF.C.WTLoginCenter", 1, "check ps, uin is empty!");
        return false;
      }
      paramString = e.GetLocalTicket(paramString, 16L, 1048576);
      if ((paramString == null) && (_pskey_map == null))
      {
        QLog.d("MSF.C.WTLoginCenter", 1, "check ps, local store is empty!");
        return false;
      }
      Object localObject = com.tencent.mobileqq.msf.core.a.a.aY();
      if (localObject == null)
      {
        QLog.d("MSF.C.WTLoginCenter", 1, "check ps, dons is empty!");
        return false;
      }
      localObject = ((HashSet)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        String str = (String)((Iterator)localObject).next();
        byte[] arrayOfByte = (byte[])_pskey_map.get(str);
        if ((arrayOfByte == null) || (arrayOfByte.length == 0))
        {
          QLog.d("MSF.C.WTLoginCenter", 1, "check ps, " + str + " is empty!");
          return true;
        }
      }
      return false;
    }
    catch (Exception paramString)
    {
      QLog.d("MSF.C.WTLoginCenter", 1, "get ticket failed, PSKEY, exception: " + paramString.toString());
    }
    return false;
  }
  
  public int c(ToServiceMsg paramToServiceMsg)
  {
    String str = (String)paramToServiceMsg.getAttributes().get("to_puzzle_verify_code_sig");
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.CheckWebsigAndGetSt(paramToServiceMsg.getUin(), str, localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "submitPuzzleVerifyCodeTicket");
    return m;
  }
  
  public HashMap c(String paramString)
  {
    for (;;)
    {
      try
      {
        localObject1 = e.GetLocalTicket(paramString, 16L, 64);
        if (localObject1 == null) {
          continue;
        }
        localObject1 = _sig;
        if (localObject1 == null) {
          continue;
        }
        localObject1 = HexUtil.bytes2HexStr((byte[])localObject1);
      }
      catch (Exception localException1)
      {
        Object localObject5;
        Object localObject2 = null;
        Object localObject3 = null;
        Object localObject4 = null;
        Object localObject1 = null;
        localException1.printStackTrace();
        Object localObject8 = localObject4;
        Object localObject10 = localObject3;
        Object localObject6 = null;
        localObject4 = localObject1;
        localObject3 = localObject2;
        localObject2 = localObject10;
        localObject1 = localObject8;
        continue;
        Object localObject7;
        Object localObject9;
        localObject1 = null;
        continue;
      }
      try
      {
        localObject2 = e.GetLocalTicket(paramString, 16L, 524288);
        if (localObject2 == null) {
          continue;
        }
        localObject2 = _sig;
        if (localObject2 == null) {
          continue;
        }
        localObject2 = new String((byte[])localObject2);
      }
      catch (Exception localException2)
      {
        localObject2 = null;
        localObject3 = null;
        localObject4 = localObject1;
        localObject1 = null;
        continue;
        localObject2 = null;
        continue;
      }
      try
      {
        localObject3 = e.GetLocalTicket(paramString, 16L, 131072);
        if (localObject3 == null) {
          continue;
        }
        localObject3 = _sig;
        if (localObject3 == null) {
          continue;
        }
        localObject3 = new String((byte[])localObject3);
      }
      catch (Exception localException3)
      {
        localObject8 = null;
        localObject3 = localObject2;
        localObject4 = localObject1;
        localObject1 = null;
        localObject2 = localObject8;
        continue;
        localObject3 = null;
        continue;
      }
      try
      {
        localObject4 = e.GetLocalTicket(paramString, 16L, 4096);
        if (localObject4 == null) {
          continue;
        }
        localObject4 = _sig;
        if (localObject4 == null) {
          continue;
        }
        localObject4 = new String((byte[])localObject4);
      }
      catch (Exception localException4)
      {
        localObject4 = localObject2;
        localObject7 = localObject1;
        localObject1 = null;
        localObject2 = localObject3;
        localObject3 = localObject4;
        localObject4 = localObject7;
        localObject7 = localException4;
        continue;
        localObject4 = null;
        continue;
      }
      try
      {
        localObject5 = e.GetLocalTicket(paramString, 16L, 32);
        if (localObject5 == null) {
          continue;
        }
        localObject5 = _sig;
        if (localObject5 == null) {
          continue;
        }
        localObject5 = HexUtil.bytes2HexStr((byte[])localObject5);
      }
      catch (Exception localException5)
      {
        localObject7 = localObject2;
        localObject9 = localObject1;
        localObject1 = localObject4;
        localObject2 = localObject3;
        localObject3 = localObject7;
        localObject4 = localObject9;
        localObject7 = localException5;
        continue;
        localObject7 = null;
      }
    }
    localObject8 = new HashMap();
    ((HashMap)localObject8).put("uin", paramString);
    ((HashMap)localObject8).put("A2", localObject1);
    ((HashMap)localObject8).put("sid", localObject2);
    ((HashMap)localObject8).put("vkey", localObject3);
    ((HashMap)localObject8).put("skey", localObject4);
    ((HashMap)localObject8).put("pskey", null);
    ((HashMap)localObject8).put("stweb", localObject5);
    ((HashMap)localObject8).put("superkey", null);
    return localObject8;
  }
  
  public int d(ToServiceMsg paramToServiceMsg)
  {
    String str = (String)paramToServiceMsg.getAttributes().get("to_register_cr_mobile");
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    if (QLog.isColorLevel()) {
      QLog.d("queryMobile", 2, "WTLoginCenter.RegQueryAccount");
    }
    int m = e.RegQueryAccount(1, str.getBytes(), 16L, localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "RegQueryAccount");
    return m;
  }
  
  public int e(ToServiceMsg paramToServiceMsg)
  {
    Byte localByte1 = (Byte)paramToServiceMsg.getAttributes().get("to_register_cr_country");
    Byte localByte2 = (Byte)paramToServiceMsg.getAttributes().get("to_register_cr_language");
    Byte localByte3 = (Byte)paramToServiceMsg.getAttributes().get("to_register_cr_pigType");
    String str1 = (String)paramToServiceMsg.getAttributes().get("to_register_cr_appName");
    str1 = (String)paramToServiceMsg.getAttributes().get("to_register_cr_appVersion");
    String str2 = (String)paramToServiceMsg.getAttributes().get("to_register_cr_mobile");
    long l = ((Long)paramToServiceMsg.getAttributes().get("appid")).longValue();
    String str3 = (String)paramToServiceMsg.getAttribute("To_register_captcha_sig", null);
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.RegSubmitMobile(str3, str2.getBytes(), str1.getBytes(), localByte1.byteValue(), localByte2.byteValue(), localByte3.byteValue(), 16L, l, localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "RegSubmitMobile");
    return m;
  }
  
  public int f(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.RegRequestServerResendMsg(localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "RegRequestServerResendMsg");
    return m;
  }
  
  public int g(ToServiceMsg paramToServiceMsg)
  {
    String str = (String)paramToServiceMsg.getAttributes().get("To_register_smsCode");
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.RegSubmitMsgChk(str.getBytes(), localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "RegSubmitMsgChk");
    return m;
  }
  
  public int h(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    int m = e.RegQueryClientSentMsgStatus(localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "RegQueryClientSentMsgStatus");
    return m;
  }
  
  public int i(ToServiceMsg paramToServiceMsg)
  {
    String str1 = (String)paramToServiceMsg.getAttributes().get("To_register_smsCode");
    String str2 = (String)paramToServiceMsg.getAttributes().get("To_register_pass");
    String str3 = (String)paramToServiceMsg.getAttributes().get("To_register_nick");
    int n = 1;
    int m = n;
    if (paramToServiceMsg.getAttributes().containsKey("To_register_type"))
    {
      m = n;
      if (!((Boolean)paramToServiceMsg.getAttributes().get("To_register_type")).booleanValue()) {
        m = 5;
      }
    }
    k localK = i.a(d, paramToServiceMsg);
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    m = e.RegGetAccount(str1.getBytes(), "qqpassport".getBytes(), str2.getBytes(), str3.getBytes(), m, localWUserSigInfo);
    a(paramToServiceMsg, localK, m, "RegGetAccount");
    return m;
  }
  
  public void j(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.GetStWithPasswd(paramToServiceMsg.getUin(), ((Long)paramToServiceMsg.getAttribute("appid")).longValue(), (String)paramToServiceMsg.getAttribute("passwd"), localWUserSigInfo), "wt_GetStWithPasswd");
  }
  
  public void k(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    String str = (String)paramToServiceMsg.getAttribute("from_where", null);
    long l2 = paramToServiceMsg.getAppId();
    long l1 = l2;
    if (str != null)
    {
      l1 = l2;
      if (str.equalsIgnoreCase("ssoAccountAction"))
      {
        l2 = 2L;
        l1 = l2;
        if (QLog.isColorLevel())
        {
          QLog.d("wtlogin_center", 2, "wt_GetStWithoutPasswd localappid = 2");
          l1 = l2;
        }
      }
    }
    a(paramToServiceMsg, localK, e.GetStWithoutPasswd(paramToServiceMsg.getUin(), ((Long)paramToServiceMsg.getAttribute("dwSrcAppid")).longValue(), ((Long)paramToServiceMsg.getAttribute("dwDstAppid")).longValue(), l1, 35524704, localWUserSigInfo), "wt_GetStWithoutPasswd");
  }
  
  public void l(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = false;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.GetStWithoutPasswd(paramToServiceMsg.getUin(), 16L, 16L, -1L, 33554432, localWUserSigInfo), "refreshDA2");
  }
  
  public void m(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.CheckPictureAndGetSt(paramToServiceMsg.getUin(), (byte[])paramToServiceMsg.getAttribute("userInput"), localWUserSigInfo), "wt_CheckPictureAndGetSt");
  }
  
  public void n(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.RefreshPictureData(paramToServiceMsg.getUin(), localWUserSigInfo), "wt_RefreshPictureData");
  }
  
  public void o(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.VerifyCode(paramToServiceMsg.getUin(), ((Long)paramToServiceMsg.getAttribute("appid")).longValue(), ((Boolean)paramToServiceMsg.getAttribute("close")).booleanValue(), (byte[])paramToServiceMsg.getAttribute("code"), (int[])paramToServiceMsg.getAttribute("tlv"), ((Integer)paramToServiceMsg.getAttribute("version")).intValue(), localWUserSigInfo), "wt_VerifyCode");
  }
  
  public void p(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    Object localObject = (ArrayList)paramToServiceMsg.getAttribute("data");
    ArrayList localArrayList = new ArrayList();
    localObject = ((ArrayList)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      localArrayList.add(HexUtil.hexStr2Bytes((String)((Iterator)localObject).next()));
    }
    a(paramToServiceMsg, localK, e.CloseCode(paramToServiceMsg.getUin(), ((Long)paramToServiceMsg.getAttribute("appid")).longValue(), (byte[])paramToServiceMsg.getAttribute("code"), ((Integer)paramToServiceMsg.getAttribute("version")).intValue(), localArrayList, localWUserSigInfo), "wt_CloseCode");
  }
  
  public void q(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.GetA1WithA1(paramToServiceMsg.getUin(), ((Long)paramToServiceMsg.getAttribute("dwSrcAppid")).longValue(), ((Long)paramToServiceMsg.getAttribute("dwSubSrcAppid")).longValue(), (byte[])paramToServiceMsg.getAttribute("dstAppName"), ((Long)paramToServiceMsg.getAttribute("dwDstSsoVer")).longValue(), ((Long)paramToServiceMsg.getAttribute("dwDstAppid")).longValue(), ((Long)paramToServiceMsg.getAttribute("dwSubDstAppid")).longValue(), (byte[])paramToServiceMsg.getAttribute("dstAppVer"), (byte[])paramToServiceMsg.getAttribute("dstAppSign"), localWUserSigInfo, (WFastLoginInfo)paramToServiceMsg.getAttribute("fastLoginInfo")), "wt_GetA1WithA1");
  }
  
  public void r(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.CheckDevLockStatus(paramToServiceMsg.getUin(), 16L, ((Long)paramToServiceMsg.getAttribute("subAppid")).longValue(), localWUserSigInfo), "wt_CheckDevLockStatus");
  }
  
  public void s(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.AskDevLockSms(paramToServiceMsg.getUin(), 16L, 8L, localWUserSigInfo), "wt_AskDevLockSms");
  }
  
  public void t(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.CheckDevLockSms(paramToServiceMsg.getUin(), 16L, ((Long)paramToServiceMsg.getAttribute("subAppid")).longValue(), (String)paramToServiceMsg.getAttribute("smdCode"), (byte[])paramToServiceMsg.getAttribute("sppKey"), localWUserSigInfo), "wt_CheckDevLockSms");
  }
  
  public void u(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.CloseDevLock(paramToServiceMsg.getUin(), 16L, ((Long)paramToServiceMsg.getAttribute("subAppid")).longValue(), localWUserSigInfo), "wt_CloseDevLock");
  }
  
  public void v(ToServiceMsg paramToServiceMsg)
  {
    int m = ((Integer)paramToServiceMsg.getAttribute("flag")).intValue();
    e.SetRegDevLockFlag(m);
  }
  
  public void w(ToServiceMsg paramToServiceMsg)
  {
    int m = ((Integer)paramToServiceMsg.getAttribute("mobile_type")).intValue();
    e.SetDevlockMobileType(m);
  }
  
  public void x(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.RefreshSMSData(paramToServiceMsg.getUin(), 9L, localWUserSigInfo), "wt_RefreshSMSData");
  }
  
  public void y(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.CheckSMSAndGetSt(paramToServiceMsg.getUin(), (byte[])paramToServiceMsg.getAttribute("userInput"), localWUserSigInfo), "wt_CheckSMSAndGetSt");
  }
  
  public void z(ToServiceMsg paramToServiceMsg)
  {
    k localK = i.a(d, paramToServiceMsg);
    g = true;
    i.a(paramToServiceMsg);
    WUserSigInfo localWUserSigInfo = i.b(paramToServiceMsg.getRequestSsoSeq());
    _seqence = f;
    a(paramToServiceMsg, localK, e.CheckSMSAndGetSt(paramToServiceMsg.getUin(), (byte[])paramToServiceMsg.getAttribute("userInput"), localWUserSigInfo, (byte[][])null), "wt_CheckSMSAndGetSt");
  }
}
