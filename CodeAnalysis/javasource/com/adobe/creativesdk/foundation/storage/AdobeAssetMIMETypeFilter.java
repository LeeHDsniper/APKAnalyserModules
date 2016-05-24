package com.adobe.creativesdk.foundation.storage;

import java.util.EnumSet;

public class AdobeAssetMIMETypeFilter
{
  private AdobeAssetMIMETypeFilterType filterType;
  private EnumSet<AdobeAssetMimeTypes> mimeTypes;
  
  public AdobeAssetMIMETypeFilter() {}
  
  public static AdobeAssetMIMETypeFilter createFromMimeTypes(EnumSet<AdobeAssetMimeTypes> paramEnumSet, AdobeAssetMIMETypeFilterType paramAdobeAssetMIMETypeFilterType)
  {
    AdobeAssetMIMETypeFilter localAdobeAssetMIMETypeFilter = new AdobeAssetMIMETypeFilter();
    filterType = paramAdobeAssetMIMETypeFilterType;
    mimeTypes = paramEnumSet;
    return localAdobeAssetMIMETypeFilter;
  }
  
  public AdobeAssetMIMETypeFilterType getFilterType()
  {
    return filterType;
  }
  
  public EnumSet<AdobeAssetMimeTypes> getMimeTypes()
  {
    return mimeTypes;
  }
}
