package com.behance.sdk.managers;

import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.behance.sdk.exception.BehanceSDKUserNotAuthenticatedException;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;

public class BehanceSDKUserManager
{
  private static BehanceSDKUserManager instance;
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKUserManager.class);
  
  private BehanceSDKUserManager() {}
  
  public static BehanceSDKUserManager getInstance()
  {
    if (instance == null) {
      instance = new BehanceSDKUserManager();
    }
    return instance;
  }
  
  public String checkExpiryAndGetAccessToken()
    throws BehanceSDKUserNotAuthenticatedException
  {
    AdobeUXAuthManagerRestricted localAdobeUXAuthManagerRestricted = AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted();
    AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.getSharedInstance();
    if (!localAdobeUXAuthManagerRestricted.hasValidAccessToken()) {
      try
      {
        logger.debug("Access token expired. Trying to get new access token.", new Object[0]);
        boolean bool = localAdobeUXAuthManagerRestricted.reAuthenticate();
        logger.debug("Refreshed Access token status [%s].", new Object[] { Boolean.valueOf(bool) });
        if (!bool) {
          throw new BehanceSDKUserNotAuthenticatedException("Problem refreshing access token");
        }
      }
      catch (Exception localException)
      {
        logger.warn("Device token expired.", new Object[0]);
        throw new BehanceSDKUserNotAuthenticatedException("Problem refreshing access token");
      }
    }
    logger.debug("Access token is valid. Using the existing one.", new Object[0]);
    return localAdobeAuthIdentityManagementService.getAccessToken();
  }
  
  public boolean isUserAnEnterpriseUser()
  {
    AdobeAuthUserProfile localAdobeAuthUserProfile = AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().getUserProfile();
    if (localAdobeAuthUserProfile != null) {
      return localAdobeAuthUserProfile.isEnterpriseUser();
    }
    return false;
  }
  
  public boolean isUserAuthenticatedWithAdobe()
  {
    return AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().isAuthenticated();
  }
  
  public boolean isUserEntitledToUseBehance()
  {
    return AdobeEntitlementServices.getSharedServices().isEntitledToService("behance", null);
  }
}
