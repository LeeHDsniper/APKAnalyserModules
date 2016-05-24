package com.behance.sdk.dto.search;

import java.io.Serializable;

public class BehanceSDKWebLinkDTO
  implements Serializable
{
  private static final long serialVersionUID = -7059543451360851235L;
  private String title;
  private String url;
  
  public BehanceSDKWebLinkDTO() {}
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public void setUrl(String paramString)
  {
    url = paramString;
  }
}
