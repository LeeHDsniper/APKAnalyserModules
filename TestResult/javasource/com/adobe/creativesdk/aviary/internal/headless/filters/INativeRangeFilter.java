package com.adobe.creativesdk.aviary.internal.headless.filters;

import com.adobe.creativesdk.aviary.internal.headless.moa.MoaFloatParameter;

public abstract interface INativeRangeFilter
  extends INativeFilter
{
  public abstract MoaFloatParameter getValue();
  
  public abstract void setValue(Float paramFloat);
}
