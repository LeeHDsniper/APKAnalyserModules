package com.behance.sdk.dto.search;

import com.behance.sdk.enums.BehanceSDKProjectModuleType;

public class BehanceSDKImageModuleDTO
  extends BehanceSDKAbstractProjectModuleDTO
{
  private static final long serialVersionUID = -5955021798991383472L;
  private boolean fullBleed;
  private String hdSrcUrl;
  private int height;
  private String srcUrl;
  private int width;
  
  public BehanceSDKImageModuleDTO()
  {
    setType(BehanceSDKProjectModuleType.IMAGE);
  }
  
  public void setFullBleed(boolean paramBoolean)
  {
    fullBleed = paramBoolean;
  }
  
  public void setHDSrcUrl(String paramString)
  {
    hdSrcUrl = paramString;
  }
  
  public void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  public void setSrcUrl(String paramString)
  {
    srcUrl = paramString;
  }
  
  public void setWidth(int paramInt)
  {
    width = paramInt;
  }
}
