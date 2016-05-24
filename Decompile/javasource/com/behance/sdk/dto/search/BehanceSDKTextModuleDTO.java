package com.behance.sdk.dto.search;

import com.behance.sdk.enums.BehanceSDKProjectModuleType;

public class BehanceSDKTextModuleDTO
  extends BehanceSDKAbstractProjectModuleDTO
{
  private static final long serialVersionUID = 1338853477624469887L;
  private String formattedText;
  private String plainText;
  
  public BehanceSDKTextModuleDTO()
  {
    setType(BehanceSDKProjectModuleType.TEXT);
  }
  
  public void setFormattedText(String paramString)
  {
    formattedText = paramString;
  }
  
  public void setPlainText(String paramString)
  {
    plainText = paramString;
  }
}
