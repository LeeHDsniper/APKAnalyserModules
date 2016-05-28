package com.adobe.creativesdk.aviary.internal.headless.filters.impl;

import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;

public class CropFilter
  extends NativeFilter
{
  public CropFilter()
  {
    super(new String[] { "crop" });
  }
  
  public void setPreviewSize(MoaPointParameter paramMoaPointParameter)
  {
    mActions.get(0).setValue("previewsize", paramMoaPointParameter);
  }
  
  public void setSize(MoaPointParameter paramMoaPointParameter)
  {
    mActions.get(0).setValue("size", paramMoaPointParameter);
  }
  
  public void setTopLeft(MoaPointParameter paramMoaPointParameter)
  {
    mActions.get(0).setValue("upperleftpoint", paramMoaPointParameter);
  }
}
