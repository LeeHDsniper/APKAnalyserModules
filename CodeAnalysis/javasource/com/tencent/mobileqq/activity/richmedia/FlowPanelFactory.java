package com.tencent.mobileqq.activity.richmedia;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class FlowPanelFactory
{
  public static final int a = 0;
  
  public FlowPanelFactory()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static FlowPanel a(FlowActivity paramFlowActivity, int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return null;
    }
    return new FlowPlusPanel(paramFlowActivity);
  }
}
