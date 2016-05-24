package com.adobe.creativesdk.foundation.internal.storage.controllers;

import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageSortIndexCollation;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetViewerController
{
  private static IAssetViewerActivity _assetViewerActivity = null;
  private static Observer _asset_collection_changed_observer;
  private static Observer _asset_selection_changed_observer = null;
  private static WeakReference<AdobeStorageDataSource> _dataSource = null;
  private static ArrayList<AdobeAsset> _filteredAssetList;
  private static int _selectedIndex;
  
  static
  {
    _asset_collection_changed_observer = null;
  }
  
  static void addSelectedAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    AdobeStorageAssetSelectionState.addSelectedAsset(paramAdobeAssetFile);
  }
  
  static boolean containsAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    return AdobeStorageAssetSelectionState.containsAsset(paramAdobeAssetFile);
  }
  
  static int count()
  {
    if (_filteredAssetList != null) {
      return _filteredAssetList.size();
    }
    return 0;
  }
  
  private static int findIndex(ArrayList<AdobeAsset> paramArrayList, AdobeAsset paramAdobeAsset)
  {
    int j;
    if (paramAdobeAsset == null)
    {
      j = -1;
      return j;
    }
    int i = 0;
    paramArrayList = paramArrayList.iterator();
    for (;;)
    {
      if (!paramArrayList.hasNext()) {
        break label49;
      }
      j = i;
      if (((AdobeAsset)paramArrayList.next()).equals(paramAdobeAsset)) {
        break;
      }
      i += 1;
    }
    label49:
    return -1;
  }
  
  static void generateAssetArray(AdobeStorageDataSource paramAdobeStorageDataSource, AdobeAsset paramAdobeAsset)
  {
    _dataSource = new WeakReference(paramAdobeStorageDataSource);
    _filteredAssetList = paramAdobeStorageDataSource.purifiedAssetsToDisplay();
    _selectedIndex = findIndex(_filteredAssetList, paramAdobeAsset);
  }
  
  static AdobeAsset getAssetAtPos(int paramInt)
  {
    return (AdobeAsset)_filteredAssetList.get(paramInt);
  }
  
  public static IAssetViewerActivity getCurrentAssetViewerActivity()
  {
    try
    {
      IAssetViewerActivity localIAssetViewerActivity = _assetViewerActivity;
      return localIAssetViewerActivity;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  static String getFileProvideAuthority()
  {
    try
    {
      String str = AdobeUXAssetViewerPreferences.getFileProvideAuthority();
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  static int getSelectedAssetCount()
  {
    return AdobeStorageAssetSelectionState.selectedAssetCount();
  }
  
  static int getSelectedIndex()
  {
    return _selectedIndex;
  }
  
  public static boolean isDataSourceValidForAssetViewerLaunch()
  {
    return (_filteredAssetList != null) && (_filteredAssetList.size() > 0);
  }
  
  static boolean isMenuEnabled()
  {
    try
    {
      boolean bool = AdobeUXAssetViewerPreferences.isMenuEnabled();
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  static boolean isMultiSelectModeActive()
  {
    return AdobeStorageAssetSelectionState.isMultiSelectModeActive();
  }
  
  static boolean loadNextPage()
  {
    return (_dataSource != null) && (_dataSource.get() != null) && (((AdobeStorageDataSource)_dataSource.get()).loadNextPage());
  }
  
  static void removeSelectedAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    AdobeStorageAssetSelectionState.removeSelectedAsset(paramAdobeAssetFile);
  }
  
  static void resetCurrentAdobeUXAssetViewerActivity()
  {
    try
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageDataSourceDidLoadNewPageNotification, _asset_collection_changed_observer);
      _assetViewerActivity = null;
      _selectedIndex = -1;
      _asset_selection_changed_observer = null;
      _asset_collection_changed_observer = null;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  static void setCurrentAssetViewerActivity(IAssetViewerActivity paramIAssetViewerActivity)
  {
    try
    {
      _assetViewerActivity = paramIAssetViewerActivity;
      _asset_selection_changed_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          if (AdobeAssetViewerController._assetViewerActivity == null) {
            return;
          }
          AdobeAssetViewerController._assetViewerActivity.handleAssetSelectionChanged();
        }
      };
      _asset_collection_changed_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          if (AdobeAssetViewerController._assetViewerActivity == null) {}
          do
          {
            return;
            AdobeAssetViewerController.access$102(AdobeAssetViewerController._assetViewerActivity.fetchCurrentPageIndex());
          } while ((AdobeAssetViewerController._dataSource == null) || (AdobeAssetViewerController._dataSource.get() == null));
          paramAnonymousObservable = _dataSourcegetsortIndexCollator.flattenedItems();
          AdobeAssetViewerController.access$302(new ArrayList());
          paramAnonymousObservable = paramAnonymousObservable.iterator();
          while (paramAnonymousObservable.hasNext())
          {
            paramAnonymousObject = (AdobeAsset)paramAnonymousObservable.next();
            if ((paramAnonymousObject instanceof AdobeAssetFile)) {
              AdobeAssetViewerController._filteredAssetList.add(paramAnonymousObject);
            }
          }
          AdobeAssetViewerController._assetViewerActivity.handleAssetCollectionChanged();
        }
      };
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageDataSourceDidLoadNewPageNotification, _asset_collection_changed_observer);
      return;
    }
    finally
    {
      paramIAssetViewerActivity = finally;
      throw paramIAssetViewerActivity;
    }
  }
  
  static void setSelectedIndex(int paramInt)
  {
    _selectedIndex = paramInt;
  }
}
