package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.RelativeLayout;

public class AdobeDesignItemDynamicHeightView
  extends RelativeLayout
{
  private double mHeightRatio = 1.0D;
  
  public AdobeDesignItemDynamicHeightView(Context paramContext)
  {
    super(paramContext);
  }
  
  public AdobeDesignItemDynamicHeightView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public AdobeDesignItemDynamicHeightView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt1);
  }
  
  public void setHeightRatio(double paramDouble)
  {
    mHeightRatio = paramDouble;
  }
}
