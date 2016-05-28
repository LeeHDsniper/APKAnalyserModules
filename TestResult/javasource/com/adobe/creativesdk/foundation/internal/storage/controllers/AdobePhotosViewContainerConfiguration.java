package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;

public class AdobePhotosViewContainerConfiguration
  extends AdobeAssetsViewContainerConfiguration
{
  private String getTargetCollectionCatalogGuid;
  private String getTargetCollectionCatalogName;
  private String targetCollectionGUID;
  private String targetCollectionName;
  
  public AdobePhotosViewContainerConfiguration() {}
  
  public void createFromBundle(Bundle paramBundle)
  {
    if (paramBundle == null) {
      return;
    }
    super.createFromBundle(paramBundle);
    targetCollectionGUID = ((String)paramBundle.get("ASSET_CONTAINER_TARGET_COLLECTION_GUID"));
    targetCollectionName = ((String)paramBundle.get("ASSET_CONTAINER_TARGET_COLLECTION_NAME"));
    getTargetCollectionCatalogGuid = ((String)paramBundle.get("ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_GUID"));
    getTargetCollectionCatalogName = ((String)paramBundle.get("ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_NAME"));
  }
  
  public String getTargetCollectionCatalogGUID()
  {
    return getTargetCollectionCatalogGuid;
  }
  
  public String getTargetCollectionCatalogName()
  {
    return getTargetCollectionCatalogName;
  }
  
  public String getTargetCollectionGUID()
  {
    return targetCollectionGUID;
  }
  
  public String getTargetCollectionName()
  {
    return targetCollectionName;
  }
}
