package mqq.app;

import android.content.Context;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import mqq.manager.WtloginManager;
import mqq.observer.WtloginObserver;
import oicq.wlogin_sdk.request.Ticket;
import oicq.wlogin_sdk.request.WFastLoginInfo;
import oicq.wlogin_sdk.request.WUserSigInfo;
import oicq.wlogin_sdk.request.WtloginHelper;
import oicq.wlogin_sdk.sharemem.WloginLoginInfo;
import oicq.wlogin_sdk.sharemem.WloginSimpleInfo;
import oicq.wlogin_sdk.tools.util;

public class WtloginManagerImpl
  implements WtloginManager
{
  private final AppRuntime app;
  private WtloginHelper localWtloginHelper;
  
  public WtloginManagerImpl(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
    localWtloginHelper = new WtloginHelper(paramAppRuntime.getApplication(), true);
  }
  
  public int AskDevLockSms(String paramString, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2109);
    localNewIntent.putExtra("userAccount", paramString);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CheckDevLockSms(String paramString1, long paramLong, String paramString2, byte[] paramArrayOfByte, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2110);
    localNewIntent.putExtra("userAccount", paramString1);
    localNewIntent.putExtra("subAppid", paramLong);
    localNewIntent.putExtra("smsCode", paramString2);
    localNewIntent.putExtra("sppKey", paramArrayOfByte);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CheckDevLockStatus(String paramString, long paramLong, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2108);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("subAppid", paramLong);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CheckPictureAndGetSt(String paramString, byte[] paramArrayOfByte, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2102);
    localNewIntent.putExtra("uin", paramString);
    localNewIntent.putExtra("userInput", paramArrayOfByte);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CheckSMSAndGetSt(String paramString, byte[] paramArrayOfByte, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2113);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("userInput", paramArrayOfByte);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CheckSMSAndGetStExt(String paramString, byte[] paramArrayOfByte, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2113);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("userInput", paramArrayOfByte);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CheckSMSVerifyLoginAccount(String paramString1, String paramString2, int paramInt, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2118);
    localNewIntent.putExtra("userAccount", paramString1);
    localNewIntent.putExtra("countryCode", paramString2);
    localNewIntent.putExtra("appid", paramInt);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public Boolean ClearUserFastLoginData(String paramString, long paramLong)
  {
    return localWtloginHelper.ClearUserLoginData(paramString, paramLong);
  }
  
  public int CloseCode(String paramString, long paramLong, byte[] paramArrayOfByte, int paramInt, ArrayList<String> paramArrayList, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2105);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("appid", paramLong);
    localNewIntent.putExtra("code", paramArrayOfByte);
    localNewIntent.putStringArrayListExtra("data", paramArrayList);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int CloseDevLock(String paramString, long paramLong, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2111);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("subAppid", paramLong);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int GetA1WithA1(String paramString, long paramLong1, long paramLong2, byte[] paramArrayOfByte1, long paramLong3, long paramLong4, long paramLong5, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, WFastLoginInfo paramWFastLoginInfo, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2106);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("dwSrcAppid", paramLong1);
    localNewIntent.putExtra("dwSubSrcAppid", paramLong2);
    localNewIntent.putExtra("dstAppName", paramArrayOfByte1);
    localNewIntent.putExtra("dwDstSsoVer", paramLong3);
    localNewIntent.putExtra("dwDstAppid", paramLong4);
    localNewIntent.putExtra("dwSubDstAppid", paramLong5);
    localNewIntent.putExtra("dstAppVer", paramArrayOfByte2);
    localNewIntent.putExtra("dstAppSign", paramArrayOfByte3);
    intentMap = new HashMap();
    intentMap.put("fastLoginInfo", paramWFastLoginInfo);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public List<WloginLoginInfo> GetAllLoginInfo()
  {
    return localWtloginHelper.GetAllLoginInfo();
  }
  
  public Boolean GetBasicUserInfo(String paramString, WloginSimpleInfo paramWloginSimpleInfo)
  {
    return localWtloginHelper.GetBasicUserInfo(paramString, paramWloginSimpleInfo);
  }
  
  public WUserSigInfo GetLocalSig(String paramString, long paramLong)
  {
    return localWtloginHelper.GetLocalSig(paramString, paramLong);
  }
  
  public Ticket GetLocalTicket(String paramString, long paramLong, int paramInt)
  {
    return localWtloginHelper.GetLocalTicket(paramString, paramLong, paramInt);
  }
  
  public int GetStViaSMSVerifyLogin(String paramString1, String paramString2, int paramInt, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2121);
    localNewIntent.putExtra("userAccount", paramString2);
    localNewIntent.putExtra("countryCode", paramString1);
    localNewIntent.putExtra("appid", paramInt);
    if ("com.tencent.mobileqq:openSdk".equals(app.getApplication().getProcessName())) {
      localNewIntent.putExtra("from_where", "ssoAccountAction");
    }
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int GetStWithPasswd(String paramString1, long paramLong, String paramString2, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2100);
    localNewIntent.putExtra("uin", paramString1);
    localNewIntent.putExtra("appid", paramLong);
    localNewIntent.putExtra("passwd", paramString2);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int GetStWithoutPasswd(String paramString, long paramLong1, long paramLong2, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2101);
    localNewIntent.putExtra("uin", paramString);
    localNewIntent.putExtra("dwSrcAppid", paramLong1);
    localNewIntent.putExtra("dwDstAppid", paramLong2);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int GetSubaccountStViaSMSVerifyLogin(String paramString1, String paramString2, String paramString3, int paramInt, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2122);
    localNewIntent.putExtra("userAccount", paramString3);
    localNewIntent.putExtra("countryCode", paramString2);
    localNewIntent.putExtra("appid", paramInt);
    localNewIntent.putExtra("mainaccount", paramString1);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public boolean IsNeedLoginWithPasswd(String paramString, int paramInt)
  {
    return localWtloginHelper.IsNeedLoginWithPasswd(paramString, paramInt).booleanValue();
  }
  
  public boolean IsUserHaveA1(String paramString, long paramLong)
  {
    return localWtloginHelper.IsUserHaveA1(paramString, paramLong).booleanValue();
  }
  
  public boolean IsWtLoginUrl(String paramString)
  {
    return localWtloginHelper.IsWtLoginUrl(paramString);
  }
  
  public void RefreshMemorySig()
  {
    localWtloginHelper.RefreshMemorySig();
  }
  
  public int RefreshPictureData(String paramString, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2103);
    localNewIntent.putExtra("uin", paramString);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int RefreshSMSData(String paramString, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2112);
    localNewIntent.putExtra("userAccount", paramString);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int RefreshSMSVerifyLoginCode(String paramString1, String paramString2, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2119);
    localNewIntent.putExtra("userAccount", paramString2);
    localNewIntent.putExtra("countryCode", paramString1);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int RegGetSMSVerifyLoginAccount(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2117);
    localNewIntent.putExtra("msgchk", paramArrayOfByte1);
    localNewIntent.putExtra("nick", paramArrayOfByte2);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public void SetDevlockMobileType(int paramInt)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2129);
    localNewIntent.putExtra("mobile_type", paramInt);
    withouLogin = true;
    app.startServlet(localNewIntent);
  }
  
  public int VerifyCode(String paramString, long paramLong, boolean paramBoolean, byte[] paramArrayOfByte, int[] paramArrayOfInt, int paramInt, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2104);
    localNewIntent.putExtra("userAccount", paramString);
    localNewIntent.putExtra("appid", paramLong);
    localNewIntent.putExtra("close", paramBoolean);
    localNewIntent.putExtra("code", paramArrayOfByte);
    localNewIntent.putExtra("tlv", paramArrayOfInt);
    localNewIntent.putExtra("version", paramInt);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public int VerifySMSVerifyLoginCode(String paramString1, String paramString2, String paramString3, WtloginObserver paramWtloginObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2120);
    localNewIntent.putExtra("userAccount", paramString2);
    localNewIntent.putExtra("countryCode", paramString1);
    localNewIntent.putExtra("code", paramString3);
    withouLogin = true;
    localNewIntent.setObserver(paramWtloginObserver);
    app.startServlet(localNewIntent);
    return 0;
  }
  
  public boolean getHasPwd(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("sp", 2, "getHasPwd uin= " + paramString);
    }
    return localWtloginHelper.getHasPassword(Long.valueOf(paramString).longValue());
  }
  
  public byte[] getPkgSigFromApkName(Context paramContext, String paramString)
  {
    return util.getPkgSigFromApkName(paramContext, paramString);
  }
  
  public void onDestroy() {}
  
  public void refreLocalHelper(Context paramContext)
  {
    localWtloginHelper = new WtloginHelper(paramContext, true);
  }
  
  public void setHasPwd(String paramString, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("sp", 2, "setHasPwd uin= " + paramString + " hasPwd= " + paramBoolean);
    }
    localWtloginHelper.setHasPassword(Long.valueOf(paramString).longValue(), paramBoolean);
  }
  
  public void setRegDevLockFlag(int paramInt)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), WtloginServlet.class);
    localNewIntent.putExtra("action", 2125);
    localNewIntent.putExtra("flag", paramInt);
    withouLogin = true;
    app.startServlet(localNewIntent);
  }
}
