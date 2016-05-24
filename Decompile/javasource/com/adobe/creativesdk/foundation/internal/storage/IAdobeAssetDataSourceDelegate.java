package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.storage.AdobeAssetException;

public abstract interface IAdobeAssetDataSourceDelegate
{
  public abstract void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException);
  
  public abstract void didFinishLoading();
  
  public abstract void didLoadMoreDataWithCount(int paramInt);
  
  public abstract void willLoadDataFromScratch();
  
  public abstract void willLoadNextPageForExistingPackage();
}
