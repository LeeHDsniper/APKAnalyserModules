package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import java.util.ArrayList;

public class AdobeAssetPackagePages
  extends AdobeAssetPackage
{
  ArrayList<AdobeAssetFile> pages;
  
  public AdobeAssetPackagePages() {}
  
  public AdobeAssetPackagePages(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    super(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof AdobeAssetPackagePages)) {
      return super.equals(paramObject);
    }
    return false;
  }
  
  public ArrayList<AdobeAssetFile> getPages()
  {
    return pages;
  }
}
