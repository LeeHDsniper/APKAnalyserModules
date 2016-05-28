package com.adobe.creativesdk.aviary.internal.filters;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public class AdjustFilter
  extends NativeFilter
{
  AdjustFilter()
  {
    super(new String[0]);
  }
  
  private void setFeatherEditSize(int paramInt1, int paramInt2)
  {
    MoaAction localMoaAction2 = mActions.get("setfeathereditsize");
    MoaAction localMoaAction1 = localMoaAction2;
    if (localMoaAction2 == null)
    {
      localMoaAction1 = MoaActionFactory.action("setfeathereditsize");
      mActions.add(localMoaAction1);
    }
    localMoaAction1.setValue("width", paramInt1);
    localMoaAction1.setValue("height", paramInt2);
  }
  
  public boolean setFixedRotation(int paramInt)
  {
    if ((paramInt % 90 == 0) && (paramInt != 0))
    {
      MoaAction localMoaAction2 = mActions.get("rotate90");
      MoaAction localMoaAction1 = localMoaAction2;
      if (localMoaAction2 == null)
      {
        localMoaAction1 = MoaActionFactory.action("rotate90");
        mActions.add(localMoaAction1);
        setFeatherEditSize(1, 1);
      }
      localMoaAction1.setValue("angle", paramInt);
      return true;
    }
    return false;
  }
  
  public boolean setFlip(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramBoolean1) || (paramBoolean2))
    {
      MoaAction localMoaAction2 = mActions.get("flip");
      MoaAction localMoaAction1 = localMoaAction2;
      if (localMoaAction2 == null)
      {
        localMoaAction1 = MoaActionFactory.action("flip");
        mActions.add(localMoaAction1);
      }
      localMoaAction1.setValue("horizontal", paramBoolean1);
      localMoaAction1.setValue("vertical", paramBoolean2);
      return true;
    }
    return false;
  }
  
  public boolean setStraighten(double paramDouble1, double paramDouble2, double paramDouble3)
  {
    if (paramDouble1 != 0.0D)
    {
      MoaAction localMoaAction2 = mActions.get("rotate");
      MoaAction localMoaAction1 = localMoaAction2;
      if (localMoaAction2 == null)
      {
        localMoaAction1 = MoaActionFactory.action("rotate");
        mActions.add(localMoaAction1);
      }
      localMoaAction1.setValue("angle", paramDouble1);
      localMoaAction1.setValue("width", paramDouble2);
      localMoaAction1.setValue("height", paramDouble3);
      return true;
    }
    return false;
  }
}
