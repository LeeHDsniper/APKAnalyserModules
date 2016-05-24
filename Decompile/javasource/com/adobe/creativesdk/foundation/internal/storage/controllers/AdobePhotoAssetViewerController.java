package com.adobe.creativesdk.foundation.internal.storage.controllers;

import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobePhotoAssetsDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Observable;
import java.util.Observer;

public class AdobePhotoAssetViewerController
{
  private static ArrayList<AdobePhotoAsset> _assetList;
  private static IAssetViewerActivity _assetViewerActivity = null;
  private static Observer _asset_collection_changed_observer;
  private static Observer _asset_selection_changed_observer = null;
  private static WeakReference<AdobePhotoAssetsDataSource> _dataSource = null;
  private static int _selectedIndex;
  
  static
  {
    _asset_collection_changed_observer = null;
  }
  
  static void addSelectedAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    AdobeStoragePhotoAssetSelectionState.addSelectedAsset(paramAdobePhotoAsset);
  }
  
  static boolean containsAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    return AdobeStoragePhotoAssetSelectionState.containsAsset(paramAdobePhotoAsset);
  }
  
  static int count()
  {
    if (_assetList != null) {
      return _assetList.size();
    }
    return 0;
  }
  
  private static int findIndex(ArrayList<AdobePhotoAsset> paramArrayList, AdobePhotoAsset paramAdobePhotoAsset)
  {
    int j;
    if (paramAdobePhotoAsset == null)
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
      if (((AdobePhotoAsset)paramArrayList.next()).isEqualToAsset(paramAdobePhotoAsset)) {
        break;
      }
      i += 1;
    }
    label49:
    return -1;
  }
  
  static void generateAssetArray(AdobePhotoAssetsDataSource paramAdobePhotoAssetsDataSource, AdobePhotoAsset paramAdobePhotoAsset)
  {
    _dataSource = new WeakReference(paramAdobePhotoAssetsDataSource);
    _assetList = paramAdobePhotoAssetsDataSource.getAssets();
    _selectedIndex = findIndex(_assetList, paramAdobePhotoAsset);
  }
  
  static AdobePhotoAsset getAssetAtPos(int paramInt)
  {
    return (AdobePhotoAsset)_assetList.get(paramInt);
  }
  
  static IAssetViewerActivity getCurrentAssetViewerActivity()
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
  
  static void getRenditionForAsset(AdobePhotoAsset paramAdobePhotoAsset, IAdobeGenericRequestCallback<byte[], AdobePhotoException> paramIAdobeGenericRequestCallback)
  {
    AdobePhotoAssetsDataSource.getRenditionForAsset(paramAdobePhotoAsset, paramIAdobeGenericRequestCallback);
  }
  
  static int getSelectedAssetCount()
  {
    return AdobeStoragePhotoAssetSelectionState.selectedAssetCount();
  }
  
  static int getSelectedIndex()
  {
    return _selectedIndex;
  }
  
  static int getTotalAssetsCount()
  {
    if ((_dataSource != null) && (_dataSource.get() != null)) {
      return ((AdobePhotoAssetsDataSource)_dataSource.get()).getTotalAssetsCount();
    }
    return -1;
  }
  
  static boolean isDataSourceValidForAssetViewerLaunch()
  {
    return (_assetList != null) && (_assetList.size() > 0);
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
    return AdobeStoragePhotoAssetSelectionState.isMultiSelectModeActive();
  }
  
  static void loadNextPage()
  {
    if ((_dataSource != null) && (_dataSource.get() != null)) {
      ((AdobePhotoAssetsDataSource)_dataSource.get()).loadNextPageOfData();
    }
  }
  
  static void removeSelectedAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    AdobeStoragePhotoAssetSelectionState.removeSelectedAsset(paramAdobePhotoAsset);
  }
  
  static void resetCurrentAdobeUXAssetViewerActivity()
  {
    try
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobePhotoAssetsDataSourceDidLoadNewPageNotification, _asset_collection_changed_observer);
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
          if (AdobePhotoAssetViewerController._assetViewerActivity == null) {
            return;
          }
          AdobePhotoAssetViewerController._assetViewerActivity.handleAssetSelectionChanged();
        }
      };
      _asset_collection_changed_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          if (AdobePhotoAssetViewerController._assetViewerActivity == null) {}
          do
          {
            return;
            AdobePhotoAssetViewerController.access$102(AdobePhotoAssetViewerController._assetViewerActivity.fetchCurrentPageIndex());
          } while ((AdobePhotoAssetViewerController._dataSource == null) || (AdobePhotoAssetViewerController._dataSource.get() == null));
          AdobePhotoAssetViewerController.access$302(((AdobePhotoAssetsDataSource)AdobePhotoAssetViewerController._dataSource.get()).getAssets());
          AdobePhotoAssetViewerController._assetViewerActivity.handleAssetCollectionChanged();
        }
      };
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _asset_selection_changed_observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobePhotoAssetsDataSourceDidLoadNewPageNotification, _asset_collection_changed_observer);
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
