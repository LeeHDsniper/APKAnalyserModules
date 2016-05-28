package com.adobe.creativesdk.aviary.internal.headless.filters.impl;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;

public abstract class AdjustSliderFilter
  extends NativeFilter
{
  public AdjustSliderFilter(String paramString)
  {
    super(new String[] { paramString });
  }
  
  public abstract void setAdjustTool(int paramInt, double paramDouble);
}
