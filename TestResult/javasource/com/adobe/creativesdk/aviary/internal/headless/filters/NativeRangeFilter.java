package com.adobe.creativesdk.aviary.internal.headless.filters;

import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaFloatParameter;

public class NativeRangeFilter
  extends NativeFilter
  implements INativeRangeFilter
{
  protected MoaFloatParameter defaultParam = new MoaFloatParameter(0.0F);
  protected String mKey;
  
  public NativeRangeFilter(String paramString1, String paramString2)
  {
    super(paramString1);
    mKey = paramString2;
  }
  
  public MoaFloatParameter getValue()
  {
    return (MoaFloatParameter)mActions.get(0).getValue(mKey, defaultParam);
  }
  
  public void setValue(Float paramFloat)
  {
    mActions.get(0).setValue(mKey, new MoaFloatParameter(paramFloat.floatValue()));
  }
}
