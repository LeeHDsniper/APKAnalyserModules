package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMimeTypes;
import java.util.EnumSet;

public class AdobeAssetsViewContainerConfiguration
{
  public static String ADOBE_CLOUD_KEY = "ADOBE_CLOUD";
  private AdobeCloud _cloud;
  private AdobeAssetDataSourceType dataSourceType;
  private boolean isMimeTypeFilterInclusive;
  private EnumSet<AdobeAssetMimeTypes> mimeTypesFilter;
  private String targetCollectionHref;
  
  public AdobeAssetsViewContainerConfiguration() {}
  
  public void createFromBundle(Bundle paramBundle)
  {
    dataSourceType = ((AdobeAssetDataSourceType)paramBundle.get("ASSET_CONTAINER_DATA_SOURCE_TYPE"));
    targetCollectionHref = ((String)paramBundle.get("ASSET_CONTAINER_TARGET_COLLECTION_HREF"));
    mimeTypesFilter = ((EnumSet)paramBundle.getSerializable("ASSET_CONTAINER_MIME_FILTERS"));
    isMimeTypeFilterInclusive = paramBundle.getBoolean("ASSET_CONTAINER_MIME_TYPES_FILTER");
    paramBundle = (AdobeCloud)paramBundle.getSerializable(ADOBE_CLOUD_KEY);
    if (paramBundle != null) {
      _cloud = AdobeCloudManager.getSharedCloudManager().getMatchingCloud(paramBundle);
    }
  }
  
  public AdobeCloud getCloud()
  {
    return _cloud;
  }
  
  public AdobeAssetDataSourceType getDataSourceType()
  {
    return dataSourceType;
  }
  
  public boolean getIsMimeTypeFilterInclusive()
  {
    return isMimeTypeFilterInclusive;
  }
  
  public EnumSet<AdobeAssetMimeTypes> getMimeTypesFilter()
  {
    return mimeTypesFilter;
  }
  
  public String getTargetCollectionHref()
  {
    return targetCollectionHref;
  }
}
