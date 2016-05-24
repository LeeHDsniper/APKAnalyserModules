package com.adobe.creativesdk.foundation.storage;

import java.util.EnumSet;
import java.util.Iterator;

public class AdobeAssetDesignLibraryItemFilter
{
  private EnumSet<AdobeAssetDesignLibraryItemType> designLibraryItemTypes;
  private AdobeAssetDesignLibraryItemFilterType filterType;
  
  public AdobeAssetDesignLibraryItemFilter() {}
  
  public static AdobeAssetDesignLibraryItemFilter createFromDesignLibraryItems(EnumSet<AdobeAssetDesignLibraryItemType> paramEnumSet, AdobeAssetDesignLibraryItemFilterType paramAdobeAssetDesignLibraryItemFilterType)
  {
    AdobeAssetDesignLibraryItemFilter localAdobeAssetDesignLibraryItemFilter = new AdobeAssetDesignLibraryItemFilter();
    designLibraryItemTypes = paramEnumSet;
    filterType = paramAdobeAssetDesignLibraryItemFilterType;
    return localAdobeAssetDesignLibraryItemFilter;
  }
  
  public EnumSet<AdobeAssetDesignLibraryItemType> getInclusiveDesignLibraryItems()
  {
    Object localObject;
    if (isInclusive()) {
      localObject = designLibraryItemTypes;
    }
    EnumSet localEnumSet;
    do
    {
      do
      {
        return localObject;
        localEnumSet = EnumSet.allOf(AdobeAssetDesignLibraryItemType.class);
        localObject = localEnumSet;
      } while (designLibraryItemTypes == null);
      localObject = localEnumSet;
    } while (designLibraryItemTypes.size() == 0);
    Iterator localIterator = designLibraryItemTypes.iterator();
    for (;;)
    {
      localObject = localEnumSet;
      if (!localIterator.hasNext()) {
        break;
      }
      localEnumSet.remove((AdobeAssetDesignLibraryItemType)localIterator.next());
    }
  }
  
  public boolean isInclusive()
  {
    return filterType == AdobeAssetDesignLibraryItemFilterType.ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION;
  }
}
