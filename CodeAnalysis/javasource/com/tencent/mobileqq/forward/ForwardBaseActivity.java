package com.tencent.mobileqq.forward;

import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ForwardBaseActivity
  extends IphoneTitleBarActivity
  implements ForwardConstants
{
  public ForwardBaseActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
