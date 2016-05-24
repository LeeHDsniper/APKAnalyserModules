package com.adobe.creativesdk.foundation.storage;

import java.util.EnumSet;
import java.util.Iterator;

public class AdobeAssetDataSourceFilter
{
  private EnumSet<AdobeAssetDataSourceType> dataSources;
  private AdobeAssetDataSourceFilterType filterType;
  
  public static EnumSet<AdobeAssetDataSourceType> allSupportedDataSources()
  {
    return EnumSet.allOf(AdobeAssetDataSourceType.class);
  }
  
  public EnumSet<AdobeAssetDataSourceType> getInclusiveDataSources()
  {
    Object localObject;
    if (isInclusive()) {
      localObject = dataSources;
    }
    EnumSet localEnumSet;
    do
    {
      do
      {
        return localObject;
        localEnumSet = allSupportedDataSources();
        localObject = localEnumSet;
      } while (dataSources == null);
      localObject = localEnumSet;
    } while (dataSources.size() == 0);
    Iterator localIterator = dataSources.iterator();
    for (;;)
    {
      localObject = localEnumSet;
      if (!localIterator.hasNext()) {
        break;
      }
      localEnumSet.remove((AdobeAssetDataSourceType)localIterator.next());
    }
  }
  
  public boolean isInclusive()
  {
    return filterType == AdobeAssetDataSourceFilterType.ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION;
  }
}
