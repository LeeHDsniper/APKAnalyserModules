package com.adobe.creativesdk.aviary.internal.headless.filters.impl;

import com.adobe.creativesdk.aviary.internal.headless.filters.IntensityNativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public class EffectFilter
  extends IntensityNativeFilter
{
  public EffectFilter()
  {
    super("effects");
    setSeed(SEED);
  }
  
  public void setIntensity(double paramDouble)
  {
    mActions.get(0).setValue("intensity", paramDouble);
  }
  
  public final void setMoaLiteEffect(String paramString)
  {
    mActions.get(0).setValue("filename", paramString);
  }
}
