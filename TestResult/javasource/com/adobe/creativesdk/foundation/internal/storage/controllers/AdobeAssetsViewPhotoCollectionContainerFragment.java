package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobePhotoCollectionsDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobePhotoCollectionsDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToPhotoCollectionData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateToPhotoCollectionCommand;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import java.util.HashMap;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetsViewPhotoCollectionContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  private Observer _photoAssetsSelectionCountChange;
  private AdobePhotoCollectionsDataSource _photoCollectionsDataSource;
  private PhotoCollectionsDataSourceDelegate _photoCollectionsDataSourceDelegate;
  private AdobeAssetsViewPhotoCollectionListViewController _photosCollectionListViewController;
  
  public AdobeAssetsViewPhotoCollectionContainerFragment() {}
  
  protected int getAssetSelectionCount()
  {
    return AdobeStoragePhotoAssetSelectionState.selectedAssetCount();
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    paramBundle = new AdobePhotosViewContainerConfiguration();
    paramBundle.createFromBundle(getArguments());
    return paramBundle;
  }
  
  protected String getContainerNameForRoot()
  {
    return getString(R.string.adobe_uxassetbrowser_csdk_myassets_main);
  }
  
  protected String getCurrentTargetCollectionName()
  {
    return null;
  }
  
  protected IAdobeAssetDataSource getDataSource()
  {
    return _photoCollectionsDataSource;
  }
  
  protected int getEmptyStateViewId()
  {
    return R.layout.adobe_photo_assetbrowser_empty_state_view;
  }
  
  public void handleAssetClickAction(Object paramObject) {}
  
  protected void handleCancelSelectionUserAction() {}
  
  public void handleLongClickOnAsset(AdobeAsset paramAdobeAsset) {}
  
  protected void handleOpenCurrentSelectedFilesUserAction()
  {
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_PHOTOS);
  }
  
  protected boolean hasActionBarOptions()
  {
    return true;
  }
  
  protected void hookUpDataSourceDelegate(boolean paramBoolean)
  {
    if (paramBoolean) {
      _photoCollectionsDataSource.setDataSourceDelegate(_photoCollectionsDataSourceDelegate);
    }
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration) {}
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData)
  {
    paramNavBaseCommandData = (AdobeAssetViewNavigateCommands.NavToPhotoCollectionData)paramNavBaseCommandData;
    AdobeAssetViewNavigateToPhotoCollectionCommand localAdobeAssetViewNavigateToPhotoCollectionCommand = new AdobeAssetViewNavigateToPhotoCollectionCommand();
    collectionGUID = collectionGUID;
    collectionName = collectionName;
    catalogGUID = catalogGUID;
    catalogName = catalogName;
    postActionCommand(AdobeAssetViewBrowserCommandName.NAVIGATE_TO_PHOTO_COLLECTION, localAdobeAssetViewNavigateToPhotoCollectionCommand);
  }
  
  protected void registerLocalNofications()
  {
    super.registerLocalNofications();
    if (_photoAssetsSelectionCountChange == null) {
      _photoAssetsSelectionCountChange = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          configureMultiSelectViews();
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _photoAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _photoAssetsSelectionCountChange);
  }
  
  protected void resetAssetsListViewVisualLayout()
  {
    View localView = _photosCollectionListViewController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _photosCollectionListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    if (_photosCollectionListViewController != null) {
      return;
    }
    _photosCollectionListViewController = new AdobeAssetsViewPhotoCollectionListViewController(getActivity());
    _photosCollectionListViewController.setContainerController(this);
    _photoCollectionsDataSourceDelegate = new PhotoCollectionsDataSourceDelegate(null);
    _photoCollectionsDataSource = new AdobePhotoCollectionsDataSource(_photoCollectionsDataSourceDelegate, _assetViewConfiguration.getCloud());
    _photosCollectionListViewController.set_photoCollectionsDataSource(_photoCollectionsDataSource);
    _photosCollectionListViewController.performInitialization(getActivity());
    _currentAssetsViewController = _photosCollectionListViewController;
    _photoCollectionsDataSource.loadCatalog();
  }
  
  protected void unRegisterLocalNotifications()
  {
    super.unRegisterLocalNotifications();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _photoAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _photoAssetsSelectionCountChange);
  }
  
  private class PhotoCollectionsDataSourceDelegate
    implements IAdobePhotoCollectionsDataSourceDelegate
  {
    private PhotoCollectionsDataSourceDelegate() {}
    
    private void loadDataFailed(AdobeCSDKException paramAdobeCSDKException, boolean paramBoolean)
    {
      int j = 0;
      ds_handleLoadDataErrorCommon();
      AdobePhotoException localAdobePhotoException = (AdobePhotoException)paramAdobeCSDKException;
      int i = j;
      if (localAdobePhotoException.getData() != null)
      {
        i = j;
        if (localAdobePhotoException.getData().containsKey("AdobeNetworkHTTPStatus")) {
          i = ((Integer)localAdobePhotoException.getData().get("AdobeNetworkHTTPStatus")).intValue();
        }
      }
      if ((paramAdobeCSDKException instanceof AdobePhotoException)) {
        switch (i)
        {
        }
      }
      do
      {
        return;
        markAsWentOffline();
        return;
      } while (!paramBoolean);
      ds_handleLoadDataErrorShowEmptyAssetsView();
    }
    
    public void loadCatalogFailed(AdobeCSDKException paramAdobeCSDKException)
    {
      loadDataFailed(paramAdobeCSDKException, true);
    }
    
    public void loadCatalogSucceeded(AdobePhotoCatalog paramAdobePhotoCatalog) {}
    
    public void loadFirstPageFailed(AdobeCSDKException paramAdobeCSDKException)
    {
      loadDataFailed(paramAdobeCSDKException, true);
    }
    
    public void loadFirstPageSucceeded()
    {
      ds_didLoadMoreDataWithCount(_photoCollectionsDataSource.getCount(), null, null);
    }
    
    public void loadNextPageOfDataFailed(AdobeCSDKException paramAdobeCSDKException)
    {
      loadDataFailed(paramAdobeCSDKException, false);
    }
    
    public void loadNextPageOfDataSucceeded() {}
    
    public void willLoadCatalog()
    {
      ds_willLoadDataFromScratch();
    }
    
    public void willLoadFirstPage()
    {
      ds_willLoadNextPageForNonExistingCollection();
    }
    
    public void willLoadNextPage()
    {
      ds_willLoadNextPageForExistingCollection();
    }
  }
}
