package com.adobe.creativesdk.aviary.internal.filters;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaColorParameter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;

public class TextFilter
  extends NativeFilter
{
  TextFilter()
  {
    super(new String[] { "addtext" });
  }
  
  public void setBottomRight(double paramDouble1, double paramDouble2)
  {
    mActions.get(0).setValue("bottomright", new MoaPointParameter(paramDouble2, paramDouble1));
  }
  
  public void setFillColor(int paramInt)
  {
    mActions.get(0).setValue("fillcolor", new MoaColorParameter(Integer.valueOf(paramInt)));
  }
  
  public void setRotation(float paramFloat)
  {
    mActions.get(0).setValue("rotation", paramFloat);
  }
  
  public void setStrokeColor(int paramInt)
  {
    mActions.get(0).setValue("outlinecolor", new MoaColorParameter(Integer.valueOf(paramInt)));
  }
  
  public void setText(CharSequence paramCharSequence)
  {
    mActions.get(0).setValue("text", paramCharSequence);
  }
  
  public void setTextSize(double paramDouble)
  {
    mActions.get(0).setValue("textsize", paramDouble);
  }
  
  public void setTopLeft(double paramDouble1, double paramDouble2)
  {
    mActions.get(0).setValue("topleft", new MoaPointParameter(paramDouble2, paramDouble1));
  }
}
