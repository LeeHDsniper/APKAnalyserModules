package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qqhotspot.hotspotnode.ShowNodeTaskManager;

public class CheckHotSpotNode
  extends AsyncStep
{
  public CheckHotSpotNode()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ShowNodeTaskManager.a();
    return 7;
  }
}
