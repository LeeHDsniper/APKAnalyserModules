package com.adobe.creativesdk.aviary.internal.headless.filters.impl;

import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public class AdjustExposureFilter
  extends AdjustSliderFilter
{
  public AdjustExposureFilter()
  {
    super("consolidatedadjust");
  }
  
  public static String getToolName(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      throw new IndexOutOfBoundsException();
    case 0: 
      return "brightness";
    case 1: 
      return "contrast";
    case 2: 
      return "highlight";
    }
    return "shadow";
  }
  
  public void setAdjustTool(int paramInt, double paramDouble)
  {
    MoaAction localMoaAction = mActions.get(0);
    switch (paramInt)
    {
    default: 
      throw new IndexOutOfBoundsException();
    case 0: 
      localMoaAction.setValue("brightness", paramDouble);
      return;
    case 1: 
      localMoaAction.setValue("contrast", paramDouble);
      return;
    case 2: 
      localMoaAction.setValue("highlight", paramDouble);
      return;
    }
    localMoaAction.setValue("shadow", paramDouble);
  }
}
