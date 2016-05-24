package com.behance.sdk.dto.search;

import java.io.Serializable;

public class BehanceSDKProjectCopyrightDTO
  implements Serializable
{
  private String licenseDescription;
  private String licenseType;
  
  public BehanceSDKProjectCopyrightDTO() {}
  
  public void setLicenseDescription(String paramString)
  {
    licenseDescription = paramString;
  }
  
  public void setLicenseType(String paramString)
  {
    licenseType = paramString;
  }
}
