package com.tencent.mobileqq.activity.fling;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TopBehindLayout
  extends FrameLayout
{
  private View a;
  
  public TopBehindLayout(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a(paramContext);
  }
  
  public TopBehindLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public TopBehindLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    a(paramContext);
  }
  
  private void a(Context paramContext) {}
  
  public void setContent(View paramView)
  {
    if (a != null) {
      removeView(a);
    }
    a = paramView;
    addView(a);
  }
}
