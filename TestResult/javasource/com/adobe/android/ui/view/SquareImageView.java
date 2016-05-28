package com.adobe.android.ui.view;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;

public class SquareImageView
  extends ImageView
{
  public SquareImageView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public SquareImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public SquareImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    paramInt1 = Math.max(getMeasuredWidth(), getMeasuredHeight());
    setMeasuredDimension(paramInt1, paramInt1);
  }
}
