package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeListIndexPath;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeListSectionsIndexSet;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import java.util.ArrayList;

public abstract interface IAdobeStorageDataSourceDelegate
{
  public abstract void didClearFilterString();
  
  public abstract void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException);
  
  public abstract void didLoadMoreDataWithCount(int paramInt, AdobeListSectionsIndexSet paramAdobeListSectionsIndexSet, ArrayList<AdobeListIndexPath> paramArrayList);
  
  public abstract void didSortByType(AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType paramAdobeUXAssetBrowserSortType, AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState paramAdobeUXAssetBrowserSortState);
  
  public abstract void didStartLoadingMorePagesToFilter();
  
  public abstract void didStopLoadingMorePagesToFilter();
  
  public abstract void startedLoadingMoreFolders();
  
  public abstract void stoppedLoadingMoreFolders();
  
  public abstract void willLoadDataFromScratch();
  
  public abstract void willLoadNextPageForExistingCollection();
  
  public abstract void willLoadNextPageForNonExistingCollection();
}
