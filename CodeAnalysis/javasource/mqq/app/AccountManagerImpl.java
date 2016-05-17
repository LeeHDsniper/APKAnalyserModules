package mqq.app;

import android.text.TextUtils;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.qphone.base.remote.SimpleAccount;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mqq.manager.AccountManager;
import mqq.manager.TicketManager;
import mqq.observer.AccountObserver;

public class AccountManagerImpl
  implements AccountManager
{
  private final AppRuntime app;
  
  public AccountManagerImpl(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
  }
  
  public void changeToken(HashMap<String, Object> paramHashMap, AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1032);
    localNewIntent.putExtra("mapSt", paramHashMap);
    localNewIntent.setObserver(paramAccountObserver);
    app.startServlet(localNewIntent);
  }
  
  public void deleteAccount(String paramString, AccountObserver paramAccountObserver)
  {
    MsfSdkUtils.delSimpleAccount(paramString);
    app.getApplication().setSortAccountList(MsfSdkUtils.getLoginedAccountList());
    Object localObject = new NewIntent(app.getApplication(), BuiltInServlet.class);
    ((NewIntent)localObject).putExtra("action", 1007);
    ((NewIntent)localObject).putExtra("uin", paramString);
    ((NewIntent)localObject).setObserver(paramAccountObserver);
    runNow = true;
    withouLogin = true;
    app.startServlet((NewIntent)localObject);
    paramAccountObserver = app.getApplication().sortAccountList.iterator();
    while (paramAccountObserver.hasNext())
    {
      localObject = (SimpleAccount)paramAccountObserver.next();
      if (((SimpleAccount)localObject).getUin().equals(paramString)) {
        app.getApplication().sortAccountList.remove(localObject);
      }
    }
  }
  
  public void getKey(AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1030);
    localNewIntent.setObserver(paramAccountObserver);
    app.startServlet(localNewIntent);
  }
  
  public void onDestroy() {}
  
  public void queryUpSmsStat(AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1022);
    localNewIntent.setObserver(paramAccountObserver);
    withouLogin = true;
    app.startServlet(localNewIntent);
  }
  
  public void refreshDA2(String paramString, AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1046);
    localNewIntent.putExtra("account", paramString);
    localNewIntent.setObserver(paramAccountObserver);
    app.startServlet(localNewIntent);
  }
  
  public void sendRegistByPhoneNumber(String paramString1, byte paramByte, String paramString2, String paramString3, Long paramLong, AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1003);
    localNewIntent.putExtra("countryCode", paramString2);
    localNewIntent.putExtra("phoneNumber", paramString3);
    localNewIntent.putExtra("language", paramByte);
    localNewIntent.putExtra("appid", paramLong);
    localNewIntent.putExtra("verifySig", paramString1);
    withouLogin = true;
    localNewIntent.setObserver(paramAccountObserver);
    app.startServlet(localNewIntent);
  }
  
  public void sendRegistByResendSms(AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1020);
    withouLogin = true;
    localNewIntent.setObserver(paramAccountObserver);
    app.startServlet(localNewIntent);
  }
  
  public void sendRegisterByCommitSmsVerifycode(String paramString, AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1004);
    localNewIntent.putExtra("code", paramString);
    localNewIntent.setObserver(paramAccountObserver);
    withouLogin = true;
    app.startServlet(localNewIntent);
  }
  
  public void sendRegisterBySetPass(String paramString1, String paramString2, String paramString3, boolean paramBoolean, AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1005);
    localNewIntent.putExtra("password", paramString1);
    localNewIntent.putExtra("nick", paramString2);
    localNewIntent.putExtra("code", paramString3);
    localNewIntent.putExtra("bindMobile", paramBoolean);
    localNewIntent.setObserver(paramAccountObserver);
    withouLogin = true;
    app.startServlet(localNewIntent);
  }
  
  public void sendRegisterQueryMobile(String paramString1, String paramString2, AccountObserver paramAccountObserver)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1041);
    localNewIntent.putExtra("countryCode", paramString1);
    localNewIntent.putExtra("phoneNumber", paramString2);
    withouLogin = true;
    localNewIntent.setObserver(paramAccountObserver);
    app.startServlet(localNewIntent);
  }
  
  public void updateSKey(AccountObserver paramAccountObserver)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (app != null)
    {
      TicketManager localTicketManager = (TicketManager)app.getManager(2);
      localObject1 = localObject2;
      if (localTicketManager != null)
      {
        localObject1 = localObject2;
        if (!TextUtils.isEmpty(app.getAccount())) {
          localObject1 = localTicketManager.getSkey(app.getAccount());
        }
      }
    }
    if (paramAccountObserver != null) {
      paramAccountObserver.onUpdateSKey((String)localObject1, "");
    }
  }
  
  public void updateSTwxWeb(AccountObserver paramAccountObserver)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (app != null)
    {
      TicketManager localTicketManager = (TicketManager)app.getManager(2);
      localObject1 = localObject2;
      if (localTicketManager != null)
      {
        localObject1 = localObject2;
        if (!TextUtils.isEmpty(app.getAccount())) {
          localObject1 = localTicketManager.getStweb(app.getAccount());
        }
      }
    }
    if (paramAccountObserver != null) {
      paramAccountObserver.onUpdateSTwxWeb((String)localObject1);
    }
  }
  
  public void updateSid(AccountObserver paramAccountObserver)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (app != null)
    {
      TicketManager localTicketManager = (TicketManager)app.getManager(2);
      localObject1 = localObject2;
      if (localTicketManager != null)
      {
        localObject1 = localObject2;
        if (!TextUtils.isEmpty(app.getAccount())) {
          localObject1 = localTicketManager.getSid(app.getAccount());
        }
      }
    }
    if (paramAccountObserver != null) {
      paramAccountObserver.onUpdateSid((String)localObject1);
    }
  }
}
