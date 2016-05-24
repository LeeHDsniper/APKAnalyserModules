package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;

public abstract interface IAdobePhotoAssetsDataSourceDelegate
{
  public abstract void loadFirstPageFailed(AdobeCSDKException paramAdobeCSDKException);
  
  public abstract void loadFirstPageSucceeded();
  
  public abstract void loadNextPageFailed(AdobeCSDKException paramAdobeCSDKException);
  
  public abstract void loadNextPageSucceeded();
  
  public abstract void willLoadFirstPage();
  
  public abstract void willLoadNextPage();
}
