package com.behance.sdk;

import com.behance.sdk.project.modules.ImageModule;
import java.io.File;

public class BehanceSDKPublishWIPOptions
  extends BehanceSDKAbstractPublishOptions
{
  private int existingWIPId;
  private String wipDescription;
  private ImageModule wipRevisionImageModule;
  private String wipTags;
  private String wipTitle;
  
  public BehanceSDKPublishWIPOptions(ImageModule paramImageModule)
  {
    setWipRevisionImageModule(paramImageModule);
  }
  
  public BehanceSDKPublishWIPOptions(File paramFile)
  {
    setWipRevisionImageModule(new ImageModule(paramFile));
  }
  
  private void setWipRevisionImageModule(ImageModule paramImageModule)
  {
    wipRevisionImageModule = paramImageModule;
  }
  
  public int getExistingWIPId()
  {
    return existingWIPId;
  }
  
  public String getWipDescription()
  {
    return wipDescription;
  }
  
  public ImageModule getWipRevisionImageModule()
  {
    return wipRevisionImageModule;
  }
  
  public String getWipTags()
  {
    return wipTags;
  }
  
  public String getWipTitle()
  {
    return wipTitle;
  }
  
  public void setExistingWIPId(int paramInt)
  {
    existingWIPId = paramInt;
  }
  
  public void setWipDescription(String paramString)
  {
    wipDescription = paramString;
  }
  
  public void setWipTags(String paramString)
  {
    wipTags = paramString;
  }
  
  public void setWipTitle(String paramString)
  {
    wipTitle = paramString;
  }
}
