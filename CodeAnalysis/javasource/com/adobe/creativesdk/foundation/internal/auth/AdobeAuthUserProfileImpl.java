package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;

public class AdobeAuthUserProfileImpl
  extends AdobeAuthUserProfile
{
  public AdobeAuthUserProfileImpl() {}
  
  public void setAdobeID(String paramString)
  {
    adobeID = paramString;
  }
  
  public void setDisplayName(String paramString)
  {
    displayName = paramString;
  }
  
  public void setEmail(String paramString)
  {
    email = paramString;
  }
  
  public void setEnterprise(boolean paramBoolean)
  {
    isEnterprise = paramBoolean;
  }
  
  public void setFirstName(String paramString)
  {
    firstName = paramString;
  }
  
  public void setLastName(String paramString)
  {
    lastName = paramString;
  }
}
