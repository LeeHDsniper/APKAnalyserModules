package com.adobe.creativesdk.foundation.internal.PushNotification.delegates;

public abstract interface IAdobeNotificationInterface
{
  public abstract String getAdobeAppID();
  
  public abstract String getFullPackageName();
  
  public abstract void registerGCM(IAdobeGoogleRegistrationCallback paramIAdobeGoogleRegistrationCallback);
}
