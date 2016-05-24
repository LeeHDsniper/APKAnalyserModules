package com.behance.sdk.dto;

import com.behance.sdk.project.modules.ImageModule;
import java.io.Serializable;

public class BehanceSDKImageCropperDTO
  implements Serializable
{
  private static final long serialVersionUID = 3776756295261444517L;
  private int height = -1;
  private ImageModule imageModule;
  private boolean includeControls;
  private int minSize = -1;
  private int width = -1;
  
  public BehanceSDKImageCropperDTO() {}
  
  public int getHeight()
  {
    return height;
  }
  
  public ImageModule getImageModule()
  {
    return imageModule;
  }
  
  public int getMinSize()
  {
    return minSize;
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public boolean isIncludeControls()
  {
    return includeControls;
  }
  
  public void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  public void setImageModule(ImageModule paramImageModule)
  {
    imageModule = paramImageModule;
  }
  
  public void setIncludeControls(boolean paramBoolean)
  {
    includeControls = paramBoolean;
  }
  
  public void setMinSize(int paramInt)
  {
    minSize = paramInt;
  }
  
  public void setWidth(int paramInt)
  {
    width = paramInt;
  }
}
