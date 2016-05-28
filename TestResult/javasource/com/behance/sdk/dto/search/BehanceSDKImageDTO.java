package com.behance.sdk.dto.search;

import java.io.Serializable;

public class BehanceSDKImageDTO
  implements Serializable
{
  private static final long serialVersionUID = -4128494458878297783L;
  private int height;
  private String url;
  private int width;
  
  public BehanceSDKImageDTO() {}
  
  public BehanceSDKImageDTO(String paramString)
  {
    url = paramString;
  }
  
  public static BehanceSDKImageDTO getNewInstance(String paramString)
  {
    return new BehanceSDKImageDTO(paramString);
  }
}
