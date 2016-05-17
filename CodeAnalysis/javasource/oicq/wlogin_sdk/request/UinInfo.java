package oicq.wlogin_sdk.request;

import java.io.Serializable;

public class UinInfo
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  public boolean _hasPassword;
  public Long _uin;
  private int pwdState = 0;
  
  public UinInfo(Long paramLong, boolean paramBoolean)
  {
    _uin = paramLong;
    _hasPassword = paramBoolean;
    if (paramBoolean) {}
    for (int i = 1;; i = 2)
    {
      pwdState = i;
      return;
    }
  }
  
  public boolean getHasPassword()
  {
    boolean bool2 = true;
    boolean bool1 = bool2;
    if (!_hasPassword) {
      if (pwdState > 1) {
        break label31;
      }
    }
    label31:
    for (bool1 = bool2;; bool1 = false)
    {
      _hasPassword = bool1;
      return _hasPassword;
    }
  }
}
