package com.adobe.creativesdk.aviary.internal.filters;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaColorParameter;

public class MemeFilter
  extends NativeFilter
{
  private MoaAction mAction = mActions.get(0);
  
  MemeFilter()
  {
    super(new String[] { "memegen" });
  }
  
  public void setAssetFontName(String paramString)
  {
    mAction.setValue("fontname", "assets/" + paramString);
  }
  
  public void setBottomText(String paramString)
  {
    mAction.setValue("bottomtext", paramString);
  }
  
  public void setFillColor(int paramInt)
  {
    mAction.setValue("fillcolor", new MoaColorParameter(Integer.valueOf(paramInt)));
  }
  
  public void setFontSourceDir(String paramString)
  {
    mAction.setValue("fontsourcedir", paramString);
  }
  
  public void setPaddingBottom(double paramDouble)
  {
    mAction.setValue("paddingbottom", paramDouble);
  }
  
  public void setPaddingTop(double paramDouble)
  {
    mAction.setValue("paddingtop", paramDouble);
  }
  
  public void setStrokeColor(int paramInt)
  {
    mAction.setValue("outlinecolor", new MoaColorParameter(Integer.valueOf(paramInt)));
  }
  
  public void setTextSize(double paramDouble)
  {
    mAction.setValue("textsize", paramDouble);
  }
  
  public void setTopText(String paramString)
  {
    mAction.setValue("toptext", paramString);
  }
}
