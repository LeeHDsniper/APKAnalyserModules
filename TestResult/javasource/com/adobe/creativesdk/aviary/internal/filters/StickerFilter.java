package com.adobe.creativesdk.aviary.internal.filters;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;

public class StickerFilter
  extends NativeFilter
{
  public StickerFilter(String paramString1, String paramString2)
  {
    super(new String[] { "addsticker" });
    setSourceDir(paramString1);
    setUrl(paramString2);
  }
  
  public void setAlpha(int paramInt)
  {
    getActions().get(0).setValue("alpha", paramInt);
  }
  
  public void setBottomRight(float paramFloat1, float paramFloat2)
  {
    getActions().get(0).setValue("bottomright", new MoaPointParameter(paramFloat1, paramFloat2));
  }
  
  public void setCenter(float paramFloat1, float paramFloat2)
  {
    getActions().get(0).setValue("center", new MoaPointParameter(paramFloat1, paramFloat2));
  }
  
  public void setFlipH(boolean paramBoolean)
  {
    getActions().get(0).setValue("fliph", paramBoolean);
  }
  
  public void setRotation(double paramDouble)
  {
    getActions().get(0).setValue("rotation", paramDouble);
  }
  
  public void setScale(float paramFloat1, float paramFloat2)
  {
    getActions().get(0).setValue("scale", new MoaPointParameter(paramFloat1, paramFloat2));
  }
  
  public void setSize(int paramInt1, int paramInt2)
  {
    getActions().get(0).setValue("size", new MoaPointParameter(paramInt1, paramInt2));
  }
  
  public void setSourceDir(String paramString)
  {
    getActions().get(0).setValue("source", paramString);
  }
  
  public void setTopLeft(float paramFloat1, float paramFloat2)
  {
    getActions().get(0).setValue("topleft", new MoaPointParameter(paramFloat1, paramFloat2));
  }
  
  public void setUrl(String paramString)
  {
    getActions().get(0).setValue("url", paramString);
  }
}
