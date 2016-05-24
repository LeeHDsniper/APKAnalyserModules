package com.behance.sdk.dto.search;

import com.behance.sdk.enums.BehanceSDKProjectModuleType;

public class BehanceSDKVideoModuleDTO
  extends BehanceSDKAbstractProjectModuleDTO
{
  private static final long serialVersionUID = 3940509017288235471L;
  private String embedHTML;
  private int height;
  private String imageSrc;
  private String playerSkin;
  private String playerUrl;
  private String videoSrc;
  private int width;
  
  public BehanceSDKVideoModuleDTO()
  {
    setType(BehanceSDKProjectModuleType.VIDEO);
  }
  
  public void setEmbedHTML(String paramString)
  {
    embedHTML = paramString;
  }
  
  public void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  public void setImageSrc(String paramString)
  {
    imageSrc = paramString;
  }
  
  public void setPlayerSkin(String paramString)
  {
    playerSkin = paramString;
  }
  
  public void setPlayerUrl(String paramString)
  {
    playerUrl = paramString;
  }
  
  public void setVideoSrc(String paramString)
  {
    videoSrc = paramString;
  }
  
  public void setWidth(int paramInt)
  {
    width = paramInt;
  }
}
