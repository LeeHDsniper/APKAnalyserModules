package com.adobe.creativesdk.aviary.internal.headless.filters;

import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public abstract class IntensityNativeFilter
  extends NativeFilter
{
  public IntensityNativeFilter(String paramString)
  {
    super(paramString);
  }
  
  public double getIntensity()
  {
    return ((Double)mActions.get(0).getValue("intensity", Double.valueOf(1.0D))).doubleValue();
  }
  
  public void setIntensity(double paramDouble)
  {
    mActions.get(0).setValue("intensity", paramDouble);
  }
}
