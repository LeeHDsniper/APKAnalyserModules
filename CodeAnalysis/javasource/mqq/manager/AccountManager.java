package mqq.manager;

import java.util.HashMap;
import mqq.observer.AccountObserver;

public abstract interface AccountManager
  extends Manager
{
  public abstract void changeToken(HashMap<String, Object> paramHashMap, AccountObserver paramAccountObserver);
  
  public abstract void deleteAccount(String paramString, AccountObserver paramAccountObserver);
  
  public abstract void getKey(AccountObserver paramAccountObserver);
  
  public abstract void queryUpSmsStat(AccountObserver paramAccountObserver);
  
  public abstract void refreshDA2(String paramString, AccountObserver paramAccountObserver);
  
  public abstract void sendRegistByPhoneNumber(String paramString1, byte paramByte, String paramString2, String paramString3, Long paramLong, AccountObserver paramAccountObserver);
  
  public abstract void sendRegistByResendSms(AccountObserver paramAccountObserver);
  
  public abstract void sendRegisterByCommitSmsVerifycode(String paramString, AccountObserver paramAccountObserver);
  
  public abstract void sendRegisterBySetPass(String paramString1, String paramString2, String paramString3, boolean paramBoolean, AccountObserver paramAccountObserver);
  
  public abstract void sendRegisterQueryMobile(String paramString1, String paramString2, AccountObserver paramAccountObserver);
  
  public abstract void updateSKey(AccountObserver paramAccountObserver);
  
  public abstract void updateSTwxWeb(AccountObserver paramAccountObserver);
  
  public abstract void updateSid(AccountObserver paramAccountObserver);
}
