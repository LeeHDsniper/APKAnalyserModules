package com.adobe.android.ui.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import com.adobe.android.ui.R.styleable;

public class AdaptiveFrameLayout
  extends FrameLayout
{
  int mDimension;
  float mFraction;
  
  public AdaptiveFrameLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdaptiveFrameLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdaptiveFrameLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, 0);
  }
  
  public AdaptiveFrameLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    super(paramContext, paramAttributeSet, paramInt1);
    initFromAttributes(paramContext, paramAttributeSet, paramInt1, paramInt2);
  }
  
  private void initFromAttributes(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeAdaptiveFrameLayout, paramInt1, paramInt2);
    if (!isInEditMode())
    {
      mDimension = paramContext.getInt(R.styleable.AdobeAdaptiveFrameLayout_adobe_layout_dimension, -1);
      mFraction = paramContext.getFraction(R.styleable.AdobeAdaptiveFrameLayout_adobe_layout_dimension_value, 1, 1, 0.5F);
    }
    paramContext.recycle();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    int i;
    int j;
    if (paramBoolean)
    {
      i = paramInt3 - paramInt1;
      paramInt4 -= paramInt2;
      j = 0;
      if ((mDimension != 0) || (i <= 0)) {
        break label101;
      }
      paramInt2 = (int)(i * mFraction);
      paramInt1 = 1;
      paramInt3 = i;
    }
    for (;;)
    {
      if (paramInt1 != 0)
      {
        ViewGroup.LayoutParams localLayoutParams = getLayoutParams();
        if ((width != paramInt3) || (height != paramInt2))
        {
          width = paramInt3;
          height = paramInt2;
        }
      }
      return;
      label101:
      paramInt1 = j;
      paramInt2 = paramInt4;
      paramInt3 = i;
      if (mDimension == 1)
      {
        paramInt1 = j;
        paramInt2 = paramInt4;
        paramInt3 = i;
        if (paramInt4 > 0)
        {
          paramInt3 = (int)(paramInt4 * mFraction);
          paramInt1 = 1;
          paramInt2 = paramInt4;
        }
      }
    }
  }
}
