package com.adobe.creativesdk.foundation.internal.auth.authenticator;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class AdobeCSDKAdobeIDAuthenticatorService
  extends Service
{
  public AdobeCSDKAdobeIDAuthenticatorService() {}
  
  private void initializeAuthenticatorService() {}
  
  public IBinder onBind(Intent paramIntent)
  {
    return new AdobeCSDKAdobeIDAuthenticator(this).getIBinder();
  }
  
  public void onCreate()
  {
    super.onCreate();
    initializeAuthenticatorService();
  }
}
