package com.behance.sdk.dto.search;

import java.io.Serializable;

public class BehanceSDKUserDetailsSectionDTO
  implements Serializable
{
  private static final long serialVersionUID = -7480439910516741476L;
  private String description;
  private String title;
  
  public BehanceSDKUserDetailsSectionDTO() {}
  
  public void setDescription(String paramString)
  {
    description = paramString;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
}
