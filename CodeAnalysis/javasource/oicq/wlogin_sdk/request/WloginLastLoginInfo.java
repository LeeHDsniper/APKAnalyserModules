package oicq.wlogin_sdk.request;

import java.io.Serializable;

public class WloginLastLoginInfo
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  public String mAccount = new String();
  public long mUin = 0L;
  
  public WloginLastLoginInfo()
  {
    mAccount = "";
  }
  
  public WloginLastLoginInfo(String paramString, long paramLong)
  {
    mAccount = paramString;
    mUin = paramLong;
  }
}
