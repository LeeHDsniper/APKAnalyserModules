package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog;

public abstract interface IAdobePhotoCollectionsDataSourceDelegate
{
  public abstract void loadCatalogFailed(AdobeCSDKException paramAdobeCSDKException);
  
  public abstract void loadCatalogSucceeded(AdobePhotoCatalog paramAdobePhotoCatalog);
  
  public abstract void loadFirstPageFailed(AdobeCSDKException paramAdobeCSDKException);
  
  public abstract void loadFirstPageSucceeded();
  
  public abstract void loadNextPageOfDataFailed(AdobeCSDKException paramAdobeCSDKException);
  
  public abstract void loadNextPageOfDataSucceeded();
  
  public abstract void willLoadCatalog();
  
  public abstract void willLoadFirstPage();
  
  public abstract void willLoadNextPage();
}
