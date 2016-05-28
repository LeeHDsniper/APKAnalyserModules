package com.adobe.creativesdk.foundation.internal.storage.controllers;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMimeTypes;
import java.util.EnumSet;

public class AdobeAssetMainBrowserConfiguration
{
  public static String ADOBE_CLOUD_KEY = "ADOBE_CLOUD";
  public static String DATA_SOURCE_FILTER_ARRAY_KEY;
  public static String DATA_SOURCE_FILTER_TYPE_KEY;
  public static String DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY = "DESIGNLIBRARYITEMS_FILTER_ARRAY";
  public static String DESIGNLIBRARYITEMS_FILTER_TYPE_KEY = "DESIGNLIBRARYITEMS_FILTER_TYPE";
  public static String MIME_TYPE_FILTER_ARRAY_KEY = "MIME_TYPES_FILTER_ARRAY";
  public static String MIME_TYPE_FILTER_TYPE_KEY = "MIME_TYPES_FILTER_TYPE";
  private AdobeCloud _cloud;
  private EnumSet<AdobeAssetDataSourceType> dataSourcesFilter;
  private boolean isDataSourceFilterInclusive;
  private boolean isMimeTypeFilterInclusive;
  private EnumSet<AdobeAssetMimeTypes> mimeTypesFilter;
  
  static
  {
    DATA_SOURCE_FILTER_ARRAY_KEY = "DATA_SOURCE_FILTER_ARRAY";
    DATA_SOURCE_FILTER_TYPE_KEY = "DATA_SOURCE_FILTER_TYPE";
  }
  
  AdobeAssetMainBrowserConfiguration(EnumSet<AdobeAssetDataSourceType> paramEnumSet, boolean paramBoolean1, EnumSet<AdobeAssetMimeTypes> paramEnumSet1, boolean paramBoolean2, AdobeCloud paramAdobeCloud)
  {
    dataSourcesFilter = paramEnumSet;
    isDataSourceFilterInclusive = paramBoolean1;
    mimeTypesFilter = paramEnumSet1;
    isMimeTypeFilterInclusive = paramBoolean2;
    if (paramAdobeCloud != null) {
      _cloud = AdobeCloudManager.getSharedCloudManager().getMatchingCloud(paramAdobeCloud);
    }
  }
  
  AdobeCloud getCloud()
  {
    return _cloud;
  }
  
  public EnumSet<AdobeAssetDataSourceType> getDataSourcesFilter()
  {
    return dataSourcesFilter;
  }
}
