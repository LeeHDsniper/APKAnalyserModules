package com.adobe.creativesdk.foundation;

import android.content.Context;
import com.adobe.creativesdk.foundation.auth.IAdobeAuthClientCredentials;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthManager;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.NoSuchPaddingException;

public class AdobeCSDKFoundation
{
  private static String _appName = null;
  private static String _appVersion = null;
  private static String _clientID = null;
  private static String _clientSecret = null;
  
  public static String getApplicationName()
  {
    return _appName;
  }
  
  public static String getApplicationVersion()
  {
    return _appVersion;
  }
  
  public static String getVersion()
  {
    return "0.6.6";
  }
  
  public static void initializeCSDKFoundation(Context paramContext)
  {
    if ((paramContext instanceof IAdobeAuthClientCredentials))
    {
      IAdobeAuthClientCredentials localIAdobeAuthClientCredentials = (IAdobeAuthClientCredentials)paramContext;
      _clientID = localIAdobeAuthClientCredentials.getClientID();
      _clientSecret = localIAdobeAuthClientCredentials.getClientSecret();
      AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(paramContext);
    }
    try
    {
      AdobeAuthManager.sharedAuthManager().setAuthenticationParameters(_clientID, _clientSecret, null);
      return;
    }
    catch (InvalidKeyException paramContext) {}catch (NoSuchAlgorithmException paramContext) {}catch (NoSuchPaddingException paramContext) {}
  }
}
