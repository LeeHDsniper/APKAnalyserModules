package com.adobe.creativesdk.aviary.internal.filters;

import com.adobe.creativesdk.aviary.internal.headless.filters.IntensityNativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public class BorderFilter
  extends IntensityNativeFilter
{
  private double mFrameDefaultSize;
  
  BorderFilter()
  {
    super("imageborders");
  }
  
  public void setHiRes(boolean paramBoolean)
  {
    mActions.get(0).setValue("large", paramBoolean);
  }
  
  public void setIdentifier(CharSequence paramCharSequence)
  {
    mActions.get(0).setValue("bordername", paramCharSequence);
  }
  
  public void setIntensity(double paramDouble)
  {
    super.setIntensity(paramDouble);
    if (mFrameDefaultSize > 0.0D) {
      mActions.get(0).setValue("bordersize", mFrameDefaultSize * paramDouble);
    }
  }
  
  public void setSize(double paramDouble)
  {
    mFrameDefaultSize = paramDouble;
    mActions.get(0).setValue("bordersize", paramDouble);
  }
  
  public void setSourceDir(CharSequence paramCharSequence)
  {
    mActions.get(0).setValue("source", paramCharSequence);
  }
}
