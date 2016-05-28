package com.adobe.creativesdk.foundation.internal.net;

class AdobeNetworkHttpDataDownloadTask
  extends AdobeNetworkHttpTask
{
  AdobeNetworkHttpDataDownloadTask() {}
  
  protected void captureInputStream()
  {
    captureData(_response);
  }
}
