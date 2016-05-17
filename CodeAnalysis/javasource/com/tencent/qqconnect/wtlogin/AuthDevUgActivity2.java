package com.tencent.qqconnect.wtlogin;

import com.tencent.mobileqq.activity.AuthDevUgActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class AuthDevUgActivity2
  extends AuthDevUgActivity
{
  public AuthDevUgActivity2()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
