package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;

class DataSourceDelegate
  implements IAdobeAssetDataSourceDelegate
{
  private AdobeAssetDataSourceType _type;
  
  DataSourceDelegate(AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    _type = paramAdobeAssetDataSourceType;
  }
  
  public void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException) {}
  
  public void didFinishLoading()
  {
    if (MobileCreationsDataSourceFactory.getInstance() != null) {
      MobileCreationsDataSourceFactory.getInstance().notifyDataSourceIsReady(_type);
    }
  }
  
  public void didLoadMoreDataWithCount(int paramInt) {}
  
  public void willLoadDataFromScratch() {}
  
  public void willLoadNextPageForExistingPackage() {}
}
