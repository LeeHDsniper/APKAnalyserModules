package com.adobe.creativesdk.behance;

import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.behance.sdk.IBehanceSDKUserCredentials;

class AdobeBehanceUserDetails
  implements IBehanceSDKUserCredentials
{
  AdobeBehanceUserDetails() {}
  
  public String getClientId()
  {
    return AdobeAuthIdentityManagementService.getSharedInstance().getClientID();
  }
  
  public String getUserBehanceAccountId()
  {
    return AdobeAuthIdentityManagementService.getSharedInstance().getAdobeID();
  }
}
