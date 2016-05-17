package com.tencent.mobileqq.activity.richmedia;

import android.content.Context;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class FlowPanel
{
  FlowActivity a;
  
  public FlowPanel(FlowActivity paramFlowActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramFlowActivity;
  }
  
  public Context a()
  {
    return a;
  }
  
  public abstract void a();
  
  public abstract void a(ViewGroup paramViewGroup);
  
  public abstract void b();
}
