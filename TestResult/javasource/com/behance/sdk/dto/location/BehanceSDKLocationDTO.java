package com.behance.sdk.dto.location;

import java.io.Serializable;

public class BehanceSDKLocationDTO
  implements Serializable
{
  private static final long serialVersionUID = -2521060972117847947L;
  private String displayName;
  private String id;
  
  public BehanceSDKLocationDTO() {}
  
  public String getDisplayName()
  {
    return displayName;
  }
  
  public String getId()
  {
    return id;
  }
  
  public void setDisplayName(String paramString)
  {
    displayName = paramString;
  }
  
  public void setId(String paramString)
  {
    id = paramString;
  }
}
