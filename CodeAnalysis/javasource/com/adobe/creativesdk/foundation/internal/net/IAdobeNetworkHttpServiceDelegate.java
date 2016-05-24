package com.adobe.creativesdk.foundation.internal.net;

public abstract interface IAdobeNetworkHttpServiceDelegate
{
  public abstract boolean HTTPServiceAuthenticationDidFail(AdobeNetworkHttpService paramAdobeNetworkHttpService);
  
  public abstract void HTTPServiceDidDisconnect(AdobeNetworkHttpService paramAdobeNetworkHttpService);
  
  public abstract void HTTPServiceIsActive(AdobeNetworkHttpService paramAdobeNetworkHttpService);
}
