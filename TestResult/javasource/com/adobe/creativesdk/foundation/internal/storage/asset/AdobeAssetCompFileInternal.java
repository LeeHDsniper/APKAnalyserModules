package com.adobe.creativesdk.foundation.internal.storage.asset;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.storage.AdobeAssetCompFile;

public class AdobeAssetCompFileInternal
  extends AdobeAssetCompFile
{
  public AdobeAssetCompFileInternal(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    super(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2);
  }
  
  public void setCloud(AdobeCloud paramAdobeCloud)
  {
    super.setCloud(paramAdobeCloud);
  }
}
