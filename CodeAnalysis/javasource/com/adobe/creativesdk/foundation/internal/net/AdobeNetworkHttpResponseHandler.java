package com.adobe.creativesdk.foundation.internal.net;

abstract class AdobeNetworkHttpResponseHandler
{
  Runnable _requestRunner = null;
  
  AdobeNetworkHttpResponseHandler() {}
  
  abstract void handleResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
}
