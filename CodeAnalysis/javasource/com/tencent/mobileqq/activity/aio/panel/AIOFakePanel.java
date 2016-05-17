package com.tencent.mobileqq.activity.aio.panel;

import android.content.Context;
import android.widget.LinearLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class AIOFakePanel
  extends LinearLayout
{
  public AIOFakePanel(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    setBackgroundResource(2130842663);
  }
  
  public void setPanelType() {}
}
