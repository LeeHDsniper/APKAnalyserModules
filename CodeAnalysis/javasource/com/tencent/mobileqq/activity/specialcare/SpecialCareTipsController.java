package com.tencent.mobileqq.activity.specialcare;

import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SpecialCareTipsController
{
  private ViewGroup a;
  
  public SpecialCareTipsController(ViewGroup paramViewGroup)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramViewGroup;
  }
  
  public void a()
  {
    a.setVisibility(8);
  }
  
  public void a(View paramView)
  {
    if (paramView != null)
    {
      if (a.indexOfChild(paramView) == -1) {
        a.addView(paramView);
      }
      int i = 0;
      while (i < a.getChildCount())
      {
        a.getChildAt(i).setVisibility(8);
        i += 1;
      }
      paramView.setVisibility(0);
      a.setVisibility(0);
    }
  }
}
