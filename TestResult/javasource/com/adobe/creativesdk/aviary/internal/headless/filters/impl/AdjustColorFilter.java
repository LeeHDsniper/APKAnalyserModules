package com.adobe.creativesdk.aviary.internal.headless.filters.impl;

import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public class AdjustColorFilter
  extends AdjustSliderFilter
{
  public AdjustColorFilter()
  {
    super("adjustcolor");
  }
  
  public static String getToolName(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      throw new IndexOutOfBoundsException();
    case 0: 
      return "saturation";
    case 1: 
      return "warmth";
    case 2: 
      return "tint";
    }
    return "fade";
  }
  
  public void setAdjustTool(int paramInt, double paramDouble)
  {
    MoaAction localMoaAction = mActions.get(0);
    switch (paramInt)
    {
    default: 
      throw new IndexOutOfBoundsException();
    case 0: 
      localMoaAction.setValue("saturation", paramDouble);
      return;
    case 1: 
      localMoaAction.setValue("warmth", paramDouble);
      return;
    case 2: 
      localMoaAction.setValue("tint", paramDouble);
      return;
    }
    localMoaAction.setValue("fade", paramDouble);
  }
}
