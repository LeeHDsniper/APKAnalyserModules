package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class GetDiscussionInfo
  extends AsyncStep
{
  public GetDiscussionInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ((DiscussionHandler)a.b.a(6)).a();
    return 7;
  }
}
