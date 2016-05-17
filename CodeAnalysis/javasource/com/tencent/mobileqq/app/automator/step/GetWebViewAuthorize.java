package com.tencent.mobileqq.app.automator.step;

import com.tencent.biz.AuthorizeConfig;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class GetWebViewAuthorize
  extends AsyncStep
{
  public GetWebViewAuthorize()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    AuthorizeConfig.a();
    return 7;
  }
}
