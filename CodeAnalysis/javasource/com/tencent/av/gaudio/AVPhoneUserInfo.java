package com.tencent.av.gaudio;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.Serializable;

public class AVPhoneUserInfo
  implements Serializable
{
  public long account;
  public int accountType;
  public AVPhoneUserInfo.TelInfo telInfo;
  
  public AVPhoneUserInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    accountType = 0;
    account = 0L;
    telInfo = new AVPhoneUserInfo.TelInfo(this);
  }
  
  public String toString()
  {
    return "AVUserInfo-->Account = " + account + " , AccountType = " + accountType + " , TelInfo = " + telInfo + " .";
  }
}
