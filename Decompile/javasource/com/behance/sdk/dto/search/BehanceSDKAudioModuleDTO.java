package com.behance.sdk.dto.search;

import com.behance.sdk.enums.BehanceSDKProjectModuleType;

public class BehanceSDKAudioModuleDTO
  extends BehanceSDKAbstractProjectModuleDTO
{
  private static final long serialVersionUID = -646184695805770780L;
  private String embedHTML;
  private String srcURL;
  
  public BehanceSDKAudioModuleDTO()
  {
    setType(BehanceSDKProjectModuleType.AUDIO);
  }
  
  public void setEmbedHTML(String paramString)
  {
    embedHTML = paramString;
  }
  
  public void setSrcURL(String paramString)
  {
    srcURL = paramString;
  }
}
