package com.behance.sdk.dto.search;

import com.behance.sdk.enums.BehanceSDKProjectModuleType;

public class BehanceSDKEmbedModuleDTO
  extends BehanceSDKAbstractProjectModuleDTO
{
  private static final long serialVersionUID = 8255416349782999744L;
  private String embedHTML;
  
  public BehanceSDKEmbedModuleDTO()
  {
    setType(BehanceSDKProjectModuleType.EMBED);
  }
  
  public void setEmbedHTML(String paramString)
  {
    embedHTML = paramString;
  }
}
