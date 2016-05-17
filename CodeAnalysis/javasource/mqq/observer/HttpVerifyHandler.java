package mqq.observer;

import java.util.HashMap;

public abstract interface HttpVerifyHandler
{
  public abstract void cancelVerifyCode(String paramString, HashMap paramHashMap);
  
  public abstract void refreVerifyCode(String paramString, HashMap paramHashMap);
  
  public abstract void submitVerifyCode(String paramString1, HashMap paramHashMap, String paramString2);
}
