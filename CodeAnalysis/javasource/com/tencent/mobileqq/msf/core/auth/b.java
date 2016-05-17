package com.tencent.mobileqq.msf.core.auth;

import android.text.TextUtils;
import com.qq.taf.jce.HexUtil;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.MsfStore;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.VerifyCodeInfo;
import com.tencent.msf.boot.config.NativeConfigStore;
import com.tencent.msf.service.protocol.security.e;
import com.tencent.msf.service.protocol.security.k;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.CodecWarpper;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import oicq.wlogin_sdk.request.Ticket;
import oicq.wlogin_sdk.request.WUserSigInfo;
import oicq.wlogin_sdk.request.WtloginHelper;
import oicq.wlogin_sdk.sharemem.WloginLoginInfo;
import oicq.wlogin_sdk.sharemem.WloginSimpleInfo;
import oicq.wlogin_sdk.tools.util;

public class b
{
  public static final String d = "grayCheck";
  private static final String i = "QQ";
  private static final String j = "MSF.C.AccountCenter";
  private static final String k = "key_account_head_";
  private static final String l = "__loginSdk_uinMapping";
  MsfCore a;
  ConcurrentHashMap b = new ConcurrentHashMap();
  public c c;
  public f e;
  public g f;
  public d g;
  int h = 0;
  private ConcurrentHashMap m = new ConcurrentHashMap();
  private ConcurrentHashMap n = new ConcurrentHashMap();
  private String o = "0";
  private String p = "key_main_account";
  
  public b(MsfCore paramMsfCore)
  {
    a = paramMsfCore;
    paramMsfCore = MsfStore.getNativeConfigStore().getConfig(p);
    if (!TextUtils.isEmpty(paramMsfCore)) {
      o = paramMsfCore;
    }
    e = new f(this);
    f = new g(this);
    g = new d(this);
    c = new c(this);
  }
  
  private long a(String paramString, int paramInt)
  {
    paramString = h.e.GetLocalTicket(paramString, 16L, paramInt);
    if (paramString != null)
    {
      long l1 = _create_time * 1000L;
      if (l1 > 0L) {
        return l1;
      }
    }
    if ((paramInt == 64) || (paramInt == 262144) || (paramInt == 524288)) {
      return System.currentTimeMillis() - 604800000L;
    }
    return System.currentTimeMillis() - 21600000L;
  }
  
  private void a(ArrayList paramArrayList)
  {
    b(paramArrayList);
    if (paramArrayList.size() == 0)
    {
      String[] arrayOfString = MsfStore.getNativeConfigStore().n_getConfigList("key_account_head_");
      if ((arrayOfString != null) && (arrayOfString.length > 0))
      {
        QLog.d("MSF.C.AccountCenter", 1, "try load accounts " + arrayOfString.length);
        int i2 = arrayOfString.length;
        int i1 = 0;
        for (;;)
        {
          if (i1 < i2)
          {
            Object localObject = arrayOfString[i1];
            try
            {
              localObject = a.c((String)localObject);
              ((a)localObject).d("QQ");
              paramArrayList.add(localObject);
              if (QLog.isColorLevel()) {
                QLog.d("MSF.C.AccountCenter", 2, "load account " + ((a)localObject).d() + " logined:" + ((a)localObject).o());
              }
              i1 += 1;
            }
            catch (Throwable localThrowable)
            {
              for (;;)
              {
                QLog.w("MSF.C.AccountCenter", 1, "parse account error " + localThrowable.toString(), localThrowable);
              }
            }
          }
        }
      }
    }
  }
  
  private void b(ArrayList paramArrayList)
  {
    Iterator localIterator = h.e.GetAllLoginInfo().iterator();
    while (localIterator.hasNext())
    {
      WloginLoginInfo localWloginLoginInfo = (WloginLoginInfo)localIterator.next();
      String str;
      Object localObject;
      byte[] arrayOfByte2;
      byte[] arrayOfByte3;
      byte[] arrayOfByte1;
      try
      {
        str = String.valueOf(mUin);
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.AccountCenter", 4, "loadAccountInfoFromWt uin: " + str);
        }
        if (h.e.IsNeedLoginWithPasswd(str, 16L).booleanValue()) {
          continue;
        }
        localObject = h.e.GetLocalSig(str, 16L);
        arrayOfByte2 = WtloginHelper.GetTicketSig((WUserSigInfo)localObject, 64);
        arrayOfByte3 = WtloginHelper.GetTicketSig((WUserSigInfo)localObject, 262144);
        arrayOfByte1 = WtloginHelper.GetTicketSigKey((WUserSigInfo)localObject, 262144);
        if ((localObject != null) && (arrayOfByte2 != null) && (arrayOfByte2.length != 0) && (arrayOfByte3 != null) && (arrayOfByte3.length != 0) && (arrayOfByte1 != null) && (arrayOfByte1.length != 0)) {
          break label251;
        }
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.w("MSF.C.AccountCenter", 2, "load account from wt failed, because of invalid token " + str);
      }
      catch (Throwable localThrowable) {}
      if (QLog.isColorLevel())
      {
        QLog.w("MSF.C.AccountCenter", 2, "parse account from wt error " + localThrowable.toString(), localThrowable);
        continue;
        label251:
        a localA = new a(str);
        localA.e(arrayOfByte2);
        localA.h(arrayOfByte3);
        arrayOfByte2 = new byte[16];
        f.a(arrayOfByte2, 0, arrayOfByte1, arrayOfByte1.length);
        localA.j(arrayOfByte2);
        localA.a(WtloginHelper.GetTicketSig((WUserSigInfo)localObject, 131072));
        localA.b(WtloginHelper.GetTicketSig((WUserSigInfo)localObject, 4096));
        localA.c(WtloginHelper.GetTicketSig((WUserSigInfo)localObject, 32));
        localA.b(new String(WtloginHelper.GetTicketSig((WUserSigInfo)localObject, 524288)));
        localA.a(true);
        localA.a(System.currentTimeMillis());
        long l1 = a(str, 64);
        long l2 = a(str, 262144);
        if (l1 > l2)
        {
          l1 = l2;
          label400:
          localA.b(l1);
          localA.c(a(str, 524288));
          l1 = a(str, 4096);
          l2 = a(str, 32);
          localA.d(l1);
          if (l1 <= l2) {
            break label632;
          }
          l1 = l2;
          label455:
          localA.e(l1);
          if (mLoginBitmap == 0) {
            localA.d("QQ");
          }
          localObject = new WloginSimpleInfo();
          if (h.e.GetBasicUserInfo(str, (WloginSimpleInfo)localObject).booleanValue())
          {
            localA.b(_age[0]);
            localA.n(_nick);
            if (_gender[0] != 1) {
              break label635;
            }
          }
        }
        label632:
        label635:
        for (int i1 = 1;; i1 = 2)
        {
          localA.c(i1);
          localA.a(util.buf_to_int16(_face, 0));
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.AccountCenter", 2, "load account from wt " + localA.d() + " logined:" + localA.o() + " mLoginBitmap:" + mLoginBitmap);
          }
          paramArrayList.add(localA);
          break;
          break label400;
          break label455;
        }
      }
    }
  }
  
  private void d(a paramA)
  {
    try
    {
      a(paramA);
      CodecWarpper.setAccountKey(paramA.d(), paramA.e(), paramA.f(), paramA.g(), paramA.h(), paramA.i(), paramA.j(), paramA.k(), paramA.m(), paramA.l());
      w.a(paramA.d(), false);
      String str = MsfStore.getNativeConfigStore().getConfig("__loginSdk_uinMapping_" + paramA.d());
      if ((str != null) && (str.length() > 0)) {
        m.put(paramA.d(), str);
      }
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.AccountCenter", 2, "handle account " + paramA.d() + " logined:" + paramA.o() + " len:" + paramA.k().length);
      }
      return;
    }
    catch (Throwable paramA)
    {
      QLog.w("MSF.C.AccountCenter", 1, "parse account error " + paramA.toString(), paramA);
    }
  }
  
  private void j()
  {
    try
    {
      if (!MsfSdkUtils.getNewAppUinStoreFile().exists())
      {
        Iterator localIterator = n.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          if (((a)localEntry.getValue()).z().equals("QQ"))
          {
            MsfSdkUtils.addSimpleAccount(((a)localEntry.getValue()).d());
            if (((a)localEntry.getValue()).o()) {
              MsfSdkUtils.updateSimpleAccount(((a)localEntry.getValue()).d(), true);
            }
          }
        }
      }
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.AccountCenter", 2, "add simpleAccount store error " + localException, localException);
      }
    }
  }
  
  private void r(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      n.remove(paramString);
      MsfStore.getNativeConfigStore().n_removeConfig("key_account_head_" + paramString);
      MsfStore.getNativeConfigStore().n_removeConfig("__loginSdk_uinMapping_" + paramString);
    }
    try
    {
      new WtloginHelper(BaseApplication.getContext()).ClearUserLoginData(paramString, 16L);
      return;
    }
    catch (Throwable paramString)
    {
      QLog.d("MSF.C.AccountCenter", 1, "del wttoken error " + paramString);
    }
  }
  
  public int a(ToServiceMsg paramToServiceMsg)
  {
    VerifyCodeInfo localVerifyCodeInfo = VerifyCodeInfo.getVerifyCodeInfo(paramToServiceMsg);
    String str = (String)paramToServiceMsg.getAttributes().get("to_verify_code");
    paramToServiceMsg.putWupBuffer(e.a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), str, localVerifyCodeInfo));
    return a.sendSsoMsg(paramToServiceMsg);
  }
  
  public int a(ToServiceMsg paramToServiceMsg, int paramInt1, int paramInt2, byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = (byte[])paramToServiceMsg.getAttributes().get("to_login_pwd");
    paramToServiceMsg.putWupBuffer(e.a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), arrayOfByte, paramInt1, paramInt2, paramArrayOfByte));
    paramToServiceMsg.getAttributes().put("grayCheck", Boolean.valueOf(true));
    return a.sendSsoMsg(paramToServiceMsg);
  }
  
  public int a(ToServiceMsg paramToServiceMsg, boolean paramBoolean)
  {
    Object localObject = (HashMap)paramToServiceMsg.getAttributes().get("to_login_token_map");
    int i1 = ((Integer)paramToServiceMsg.getAttributes().get("to_login_token_cmdhead")).intValue();
    localObject = e.a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), i1, (HashMap)localObject);
    paramToServiceMsg.setServiceCmd("login.chgTok");
    paramToServiceMsg.putWupBuffer((byte[])localObject);
    a.sendSsoMsg(paramToServiceMsg);
    return paramToServiceMsg.getRequestSsoSeq();
  }
  
  public void a()
  {
    if (n.size() > 0)
    {
      Iterator localIterator = n.keySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (String)localIterator.next();
        localObject = (a)n.get(localObject);
        if ((localObject != null) && (localObject != null) && (((a)localObject).o()) && (((a)localObject).z().equals("QQ"))) {
          try
          {
            a.getWtLoginCenter().a((a)localObject, false);
          }
          catch (Throwable localThrowable)
          {
            QLog.d("MSF.C.AccountCenter", 1, "load " + MD5.toMD5(((a)localObject).d()) + " set key to wt error " + localThrowable, localThrowable);
          }
        }
      }
    }
  }
  
  void a(int paramInt)
  {
    h = paramInt;
    QLog.d("MSF.C.AccountCenter", 1, "set time interv is " + paramInt);
  }
  
  void a(a paramA)
  {
    n.put(paramA.d(), paramA);
  }
  
  public void a(String paramString, long paramLong)
  {
    a localA = n(paramString);
    if (localA == null) {
      return;
    }
    localA.e(paramLong);
    o(paramString);
  }
  
  void a(String paramString, k paramK)
  {
    a(paramString, d);
  }
  
  void a(String paramString1, String paramString2)
  {
    if ((paramString1 != null) && (!paramString1.equals(paramString2)))
    {
      m.put(paramString2, paramString1);
      MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_uinMapping_" + paramString2, paramString1);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.AccountCenter", 2, "saveUinMapping src:" + paramString1 + " real:" + paramString2);
      }
    }
  }
  
  public void a(String paramString1, String paramString2, long paramLong)
  {
    a localA = n(paramString1);
    if (localA == null) {
      return;
    }
    localA.b(paramString2);
    localA.c(paramLong);
    o(paramString1);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte)
  {
    a localA = n(paramString);
    if (localA == null) {}
    while (Arrays.equals(localA.a(), paramArrayOfByte)) {
      return;
    }
    localA.a(paramArrayOfByte);
    o(paramString);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, long paramLong)
  {
    a localA = n(paramString);
    if (localA == null) {}
    while (Arrays.equals(localA.b(), paramArrayOfByte)) {
      return;
    }
    localA.b(paramArrayOfByte);
    localA.d(paramLong);
    o(paramString);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, long paramLong)
  {
    a localA = n(paramString);
    if (localA == null) {
      return;
    }
    localA.e(paramArrayOfByte1);
    localA.h(paramArrayOfByte2);
    localA.j(paramArrayOfByte3);
    localA.b(paramLong);
    o(paramString);
  }
  
  public void a(boolean paramBoolean)
  {
    Object localObject = new ArrayList();
    a((ArrayList)localObject);
    localObject = ((ArrayList)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      d((a)((Iterator)localObject).next());
    }
    if (paramBoolean) {
      j();
    }
  }
  
  public boolean a(String paramString)
  {
    Object localObject = new ArrayList();
    b((ArrayList)localObject);
    localObject = ((ArrayList)localObject).iterator();
    boolean bool2;
    for (boolean bool1 = false; ((Iterator)localObject).hasNext(); bool1 = bool2)
    {
      a localA = (a)((Iterator)localObject).next();
      bool2 = bool1;
      if (localA.d().equals(paramString))
      {
        bool2 = bool1;
        if (localA.o()) {
          bool2 = true;
        }
      }
      d(localA);
    }
    return bool1;
  }
  
  public int b(ToServiceMsg paramToServiceMsg)
  {
    VerifyCodeInfo localVerifyCodeInfo = VerifyCodeInfo.getVerifyCodeInfo(paramToServiceMsg);
    paramToServiceMsg.putWupBuffer(e.a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), localVerifyCodeInfo));
    return a.sendSsoMsg(paramToServiceMsg);
  }
  
  public int b(ToServiceMsg paramToServiceMsg, boolean paramBoolean)
  {
    HashMap localHashMap = new HashMap();
    com.tencent.msf.service.protocol.security.f localF = new com.tencent.msf.service.protocol.security.f();
    a = n(paramToServiceMsg.getUin()).g();
    b = "00".getBytes();
    localHashMap.put("RequestReFetchSid", localF);
    paramToServiceMsg.putWupBuffer(e.a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), 6, localHashMap));
    a.sendSsoMsg(paramToServiceMsg);
    return paramToServiceMsg.getRequestSsoSeq();
  }
  
  public String b()
  {
    Object localObject2 = d();
    Object localObject1 = new StringBuffer();
    localObject2 = ((ArrayList)localObject2).iterator();
    while (((Iterator)localObject2).hasNext())
    {
      SimpleAccount localSimpleAccount = (SimpleAccount)((Iterator)localObject2).next();
      ((StringBuffer)localObject1).append(localSimpleAccount.toStoreString() + ";");
    }
    localObject2 = ((StringBuffer)localObject1).toString();
    localObject1 = localObject2;
    if (((String)localObject2).endsWith(";")) {
      localObject1 = ((String)localObject2).substring(0, ((String)localObject2).length() - 1);
    }
    return localObject1;
  }
  
  void b(a paramA)
  {
    long l1 = System.currentTimeMillis();
    paramA.a(true);
    paramA.a(l1);
    String str1 = paramA.d();
    byte[] arrayOfByte1 = paramA.f();
    byte[] arrayOfByte2 = paramA.g();
    byte[] arrayOfByte3 = paramA.h();
    byte[] arrayOfByte4 = paramA.i();
    byte[] arrayOfByte5 = paramA.j();
    byte[] arrayOfByte6 = paramA.k();
    String str2 = paramA.l();
    CodecWarpper.setAccountKey(str1, new byte[0], arrayOfByte1, arrayOfByte2, arrayOfByte3, arrayOfByte4, arrayOfByte5, arrayOfByte6, new byte[0], str2);
    CodecWarpper.setUseSimpleHead(paramA.d(), false);
    a(paramA);
    o(paramA.d());
    w.a(paramA.d(), false);
  }
  
  public void b(String paramString)
  {
    try
    {
      if (!b.containsKey(paramString))
      {
        a localA = new a(paramString);
        b.put(paramString, localA);
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void b(String paramString1, String paramString2)
  {
    if ((!TextUtils.isEmpty(paramString1)) && (!o.equals(paramString1)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "setMainAccount: " + MsfSdkUtils.getShortUin(paramString1) + " src: " + paramString2);
      }
      o = paramString1;
      MsfStore.getNativeConfigStore().setConfig(p, o);
      if ((a != null) && (a.getSsoListManager() != null)) {
        a.getSsoListManager().b(paramString1);
      }
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.d("mqq", 2, "setMainAccount: failed " + MsfSdkUtils.getShortUin(paramString1));
  }
  
  public void b(String paramString, byte[] paramArrayOfByte)
  {
    a localA = n(paramString);
    if (localA == null) {}
    while (Arrays.equals(localA.c(), paramArrayOfByte)) {
      return;
    }
    localA.c(paramArrayOfByte);
    o(paramString);
  }
  
  public int c(ToServiceMsg paramToServiceMsg)
  {
    Object localObject1 = (String)paramToServiceMsg.getAttribute("to_login_changeuin");
    Object localObject2 = paramToServiceMsg.getUin();
    paramToServiceMsg.setUin((String)localObject1);
    paramToServiceMsg.addAttribute("to_login_changeuin", localObject2);
    localObject1 = new HashMap();
    localObject2 = new e();
    b = 0;
    a = 1;
    c = new byte[0];
    ((HashMap)localObject1).put("RequestNameExchangeUin", localObject2);
    localObject1 = e.a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), 13, (HashMap)localObject1);
    paramToServiceMsg.setServiceCmd("login.chguin");
    paramToServiceMsg.putWupBuffer((byte[])localObject1);
    paramToServiceMsg.getAttributes().put("grayCheck", Boolean.valueOf(true));
    a.sendSsoMsg(paramToServiceMsg);
    return paramToServiceMsg.getRequestSsoSeq();
  }
  
  a c(a paramA)
  {
    a localA = n(paramA.d());
    if (localA == null)
    {
      b(paramA);
      return paramA;
    }
    if ((paramA.f() != null) && (paramA.f().length > 0)) {
      localA.e(paramA.f());
    }
    if ((paramA.i() != null) && (paramA.i().length > 0)) {
      localA.h(paramA.i());
    }
    if ((paramA.k() != null) && (paramA.k().length > 0)) {
      localA.j(paramA.k());
    }
    if ((paramA.l() != null) && (paramA.l().length() > 0)) {
      localA.b(paramA.l());
    }
    if ((paramA.a() != null) && (paramA.a().length > 0)) {
      localA.a(paramA.a());
    }
    if ((paramA.b() != null) && (paramA.b().length > 0)) {
      localA.b(paramA.b());
    }
    if ((paramA.c() != null) && (paramA.c().length > 0)) {
      localA.c(paramA.c());
    }
    if ((paramA.z() != null) && (paramA.z().length() > 0)) {
      localA.d(paramA.z());
    }
    b(localA);
    return localA;
  }
  
  public ArrayList c()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = n.keySet().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((String)localIterator.next());
    }
    return localArrayList;
  }
  
  public boolean c(String paramString)
  {
    r(paramString);
    a.sender.a(paramString);
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.AccountCenter", 2, "del user " + paramString + " succ.");
    }
    return true;
  }
  
  public long d(String paramString)
  {
    paramString = n(paramString);
    if (paramString == null) {
      return 0L;
    }
    return paramString.A();
  }
  
  public ArrayList d()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = n.keySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (String)localIterator.next();
      localObject = (a)n.get(localObject);
      if (localObject != null) {
        localArrayList.add(((a)localObject).p());
      }
    }
    return localArrayList;
  }
  
  int e()
  {
    return h;
  }
  
  public long e(String paramString)
  {
    paramString = n(paramString);
    if (paramString == null) {
      return 0L;
    }
    return paramString.B();
  }
  
  public long f(String paramString)
  {
    paramString = n(paramString);
    if (paramString == null) {
      return 0L;
    }
    return paramString.C();
  }
  
  public byte[] f()
  {
    return util.get_ksid(BaseApplication.getContext());
  }
  
  public long g(String paramString)
  {
    paramString = n(paramString);
    if (paramString == null) {
      return 0L;
    }
    return paramString.D();
  }
  
  public ConcurrentHashMap g()
  {
    return n;
  }
  
  public String h()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = n.entrySet().iterator();
    while (localIterator.hasNext())
    {
      a localA = (a)((Map.Entry)localIterator.next()).getValue();
      localStringBuffer.append("UIN=" + localA.d() + ",LOGINED=" + localA.o() + ",A2=" + HexUtil.bytes2HexStr(localA.f()) + ",D2=" + HexUtil.bytes2HexStr(localA.i()) + ",KEY=" + HexUtil.bytes2HexStr(localA.k())).append(";");
    }
    return localStringBuffer.toString();
  }
  
  public String h(String paramString)
  {
    paramString = n(paramString);
    if ((paramString != null) && (paramString.o())) {
      return paramString.l();
    }
    return null;
  }
  
  public String i()
  {
    return o;
  }
  
  public boolean i(String paramString)
  {
    paramString = n(paramString);
    return (paramString != null) && (paramString.o());
  }
  
  public String j(String paramString)
  {
    return (String)m.get(paramString);
  }
  
  public String k(String paramString)
  {
    Iterator localIterator = m.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      String str = (String)localEntry.getValue();
      if ((str.equalsIgnoreCase(paramString)) && (l(str))) {
        return (String)localEntry.getKey();
      }
    }
    return null;
  }
  
  public boolean l(String paramString)
  {
    boolean bool = false;
    try
    {
      long l1 = Long.parseLong(paramString);
      if (l1 > 10000L) {
        bool = true;
      }
      return bool;
    }
    catch (NumberFormatException paramString) {}
    return false;
  }
  
  /* Error */
  public void m(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 56	com/tencent/mobileqq/msf/core/auth/b:o	Ljava/lang/String;
    //   6: aload_1
    //   7: invokevirtual 428	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   10: ifeq +22 -> 32
    //   13: aload_0
    //   14: ldc 54
    //   16: ldc_w 765
    //   19: invokevirtual 767	com/tencent/mobileqq/msf/core/auth/b:b	(Ljava/lang/String;Ljava/lang/String;)V
    //   22: aload_0
    //   23: getfield 64	com/tencent/mobileqq/msf/core/auth/b:a	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   26: ldc_w 765
    //   29: invokevirtual 770	com/tencent/mobileqq/msf/core/MsfCore:stopPCActivePolling	(Ljava/lang/String;)V
    //   32: aload_0
    //   33: aload_1
    //   34: invokevirtual 558	com/tencent/mobileqq/msf/core/auth/b:n	(Ljava/lang/String;)Lcom/tencent/mobileqq/msf/core/auth/a;
    //   37: astore_2
    //   38: aload_1
    //   39: iconst_0
    //   40: invokestatic 384	com/tencent/mobileqq/msf/core/w:a	(Ljava/lang/String;Z)V
    //   43: aload_2
    //   44: ifnull +20 -> 64
    //   47: aload_2
    //   48: iconst_0
    //   49: invokevirtual 296	com/tencent/mobileqq/msf/core/auth/a:a	(Z)V
    //   52: aload_0
    //   53: aload_1
    //   54: invokevirtual 560	com/tencent/mobileqq/msf/core/auth/b:o	(Ljava/lang/String;)V
    //   57: aload_1
    //   58: invokestatic 773	com/tencent/qphone/base/util/CodecWarpper:nateiveRemoveAccountKey	(Ljava/lang/String;)V
    //   61: aload_0
    //   62: monitorexit
    //   63: return
    //   64: aload_1
    //   65: invokestatic 776	com/tencent/qphone/base/util/CodecWarpper:removeAccountKey	(Ljava/lang/String;)V
    //   68: goto -7 -> 61
    //   71: astore_1
    //   72: aload_0
    //   73: monitorexit
    //   74: aload_1
    //   75: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	76	0	this	b
    //   0	76	1	paramString	String
    //   37	11	2	localA	a
    // Exception table:
    //   from	to	target	type
    //   2	32	71	finally
    //   32	43	71	finally
    //   47	61	71	finally
    //   64	68	71	finally
  }
  
  a n(String paramString)
  {
    return (a)n.get(paramString);
  }
  
  void o(String paramString)
  {
    a localA = n(paramString);
    String str = localA.q();
    if (QLog.isDevelopLevel()) {
      QLog.d("MSF.C.AccountCenter", 4, "storeAccount uin:" + paramString);
    }
    MsfStore.getNativeConfigStore().n_setConfig("key_account_head_" + localA.d(), str);
  }
  
  public String p(String paramString)
  {
    String str = "";
    a localA = n(paramString);
    paramString = str;
    if (localA != null) {
      paramString = localA.q();
    }
    return paramString;
  }
  
  public void q(String paramString)
  {
    Object localObject = n(paramString);
    if (localObject == null) {
      return;
    }
    String str = ((a)localObject).d();
    byte[] arrayOfByte1 = ((a)localObject).f();
    byte[] arrayOfByte2 = ((a)localObject).g();
    byte[] arrayOfByte3 = ((a)localObject).h();
    byte[] arrayOfByte4 = ((a)localObject).i();
    byte[] arrayOfByte5 = ((a)localObject).j();
    byte[] arrayOfByte6 = ((a)localObject).k();
    localObject = ((a)localObject).l();
    CodecWarpper.setAccountKey(str, new byte[0], arrayOfByte1, arrayOfByte2, arrayOfByte3, arrayOfByte4, arrayOfByte5, arrayOfByte6, new byte[0], (String)localObject);
    w.a(paramString, false);
  }
}
