package com.adobe.creativesdk.aviary.internal.filters;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;

public class OverlayFilter
  extends NativeFilter
{
  OverlayFilter()
  {
    super(new String[] { "overlay" });
  }
  
  public void setSourceDir(String paramString)
  {
    getActions().get(0).setValue("source", paramString);
  }
  
  public void setUrl(String paramString)
  {
    getActions().get(0).setValue("url", paramString);
  }
}
