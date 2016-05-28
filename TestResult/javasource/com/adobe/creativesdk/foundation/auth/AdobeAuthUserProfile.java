package com.adobe.creativesdk.foundation.auth;

import java.io.Serializable;

public class AdobeAuthUserProfile
  implements Serializable
{
  protected String adobeID = null;
  protected String description = null;
  protected String displayName = null;
  protected String email = null;
  protected boolean emailVerified = false;
  protected String firstName = null;
  protected boolean isEnterprise = false;
  protected String lastName = null;
  
  public AdobeAuthUserProfile() {}
  
  public String getAdobeID()
  {
    return adobeID;
  }
  
  public String getDisplayName()
  {
    return displayName;
  }
  
  public String getEmail()
  {
    return email;
  }
  
  public boolean isEnterpriseUser()
  {
    return isEnterprise;
  }
}
