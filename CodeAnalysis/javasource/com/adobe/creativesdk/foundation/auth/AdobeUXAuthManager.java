package com.adobe.creativesdk.foundation.auth;

import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;

public final class AdobeUXAuthManager
{
  private static AdobeUXAuthManager sharedInstance = null;
  private AdobeUXAuthManagerRestricted _authManagerRestricted = null;
  private int _currentRequestCode = -1;
  
  private AdobeUXAuthManager() {}
  
  public static AdobeUXAuthManager getSharedAuthManager()
  {
    if (sharedInstance == null) {
      sharedInstance = new AdobeUXAuthManager();
    }
    return sharedInstance;
  }
  
  public AdobeAuthUserProfile getUserProfile()
  {
    return _authManagerRestricted.getUserProfile();
  }
  
  public boolean isAuthenticated()
  {
    return _authManagerRestricted.isAuthenticated();
  }
}
