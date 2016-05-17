package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.msfmqpsdkbridge.MSFSigCheckWrapper;

public class SignatureScan
  extends AsyncStep
{
  public SignatureScan()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    new MSFSigCheckWrapper(a.b).a(false);
    return 7;
  }
}
