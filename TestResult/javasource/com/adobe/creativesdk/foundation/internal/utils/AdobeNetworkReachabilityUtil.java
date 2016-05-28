package com.adobe.creativesdk.foundation.internal.utils;

import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;

public class AdobeNetworkReachabilityUtil
{
  private static int _sharedCount = 0;
  private static volatile AdobeNetworkReachability _sharedInstance;
  
  public static void destorySharedInstance()
  {
    if (_sharedInstance == null) {
      _sharedCount = 0;
    }
    do
    {
      return;
      _sharedCount -= 1;
    } while (_sharedCount != 0);
    _sharedInstance.stopNotification();
    _sharedInstance = null;
  }
  
  public static AdobeNetworkReachability getSharedInstance()
  {
    try
    {
      if (_sharedInstance == null)
      {
        _sharedInstance = new AdobeNetworkReachability();
        _sharedInstance.startNotification(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext());
      }
      _sharedCount += 1;
      return _sharedInstance;
    }
    finally {}
  }
}
