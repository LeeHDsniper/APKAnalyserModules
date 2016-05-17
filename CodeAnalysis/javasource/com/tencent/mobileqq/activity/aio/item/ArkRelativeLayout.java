package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class ArkRelativeLayout
  extends RelativeLayout
{
  public WeakReference a;
  
  public ArkRelativeLayout(Context paramContext)
  {
    this(paramContext, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ArkRelativeLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ArkRelativeLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public void a(ArkRelativeLayout.LayoutListener paramLayoutListener)
  {
    a = new WeakReference(paramLayoutListener);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if ((a != null) && (a.get() != null)) {
      ((ArkRelativeLayout.LayoutListener)a.get()).onLayout(paramBoolean, paramInt1 + getPaddingLeft(), paramInt2 + getPaddingTop(), paramInt3 - getPaddingRight(), paramInt4 - getPaddingBottom());
    }
  }
}
