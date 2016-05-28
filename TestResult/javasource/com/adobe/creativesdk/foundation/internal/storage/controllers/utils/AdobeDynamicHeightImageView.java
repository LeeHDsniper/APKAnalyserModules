package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import android.content.Context;
import android.util.AttributeSet;
import com.etsy.android.grid.util.DynamicHeightImageView;

public class AdobeDynamicHeightImageView
  extends DynamicHeightImageView
{
  public AdobeDynamicHeightImageView(Context paramContext)
  {
    super(paramContext);
  }
  
  public AdobeDynamicHeightImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if ((getMeasuredHeight() < getSuggestedMinimumHeight()) || (getMeasuredWidth() < getSuggestedMinimumWidth()))
    {
      paramInt1 = Math.max(getMeasuredHeight(), getSuggestedMinimumHeight());
      setMeasuredDimension(Math.max(getMeasuredWidth(), getSuggestedMinimumWidth()), paramInt1);
    }
  }
}
