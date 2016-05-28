package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobePhotoAssetsDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobePhotoAssetsDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import java.util.HashMap;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetsViewPhotoAssetsContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  private AdobePhotoAssetsDataSource _photoAssetsDataSource;
  private PhotoAssetsDataSourceDelegate _photoAssetsDataSourceDelegate;
  private AdobeAssetsViewPhotoAssetsListViewController _photoAssetsListViewController;
  private Observer _photoAssetsSelectionCountChange;
  private int _selectionTimeStampAtStop = -1;
  private AdobePhotoCollection _targetCollection;
  
  public AdobeAssetsViewPhotoAssetsContainerFragment() {}
  
  private void setTargetCollection(AdobePhotoCollection paramAdobePhotoCollection)
  {
    _targetCollection = paramAdobePhotoCollection;
  }
  
  protected int getAssetSelectionCount()
  {
    return AdobeStoragePhotoAssetSelectionState.selectedAssetCount();
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    AdobePhotosViewContainerConfiguration localAdobePhotosViewContainerConfiguration = new AdobePhotosViewContainerConfiguration();
    localAdobePhotosViewContainerConfiguration.createFromBundle(paramBundle);
    return localAdobePhotosViewContainerConfiguration;
  }
  
  protected String getContainerNameForRoot()
  {
    return getString(R.string.adobe_uxassetbrowser_csdk_myassets_main);
  }
  
  protected String getCurrentTargetCollectionName()
  {
    return _targetCollection.getName();
  }
  
  protected IAdobeAssetDataSource getDataSource()
  {
    return _photoAssetsDataSource;
  }
  
  protected int getEmptyStateViewId()
  {
    return R.layout.adobe_photo_assetbrowser_empty_state_view;
  }
  
  AdobePhotoCollection getPhotoCollectionFromHref(AdobePhotosViewContainerConfiguration paramAdobePhotosViewContainerConfiguration)
  {
    AdobePhotoCatalog localAdobePhotoCatalog = new AdobePhotoCatalog(paramAdobePhotosViewContainerConfiguration.getTargetCollectionCatalogName(), paramAdobePhotosViewContainerConfiguration.getTargetCollectionCatalogGUID(), _assetViewConfiguration.getCloud());
    return new AdobePhotoCollection(paramAdobePhotosViewContainerConfiguration.getTargetCollectionName(), paramAdobePhotosViewContainerConfiguration.getTargetCollectionGUID(), localAdobePhotoCatalog);
  }
  
  protected void handleAnyListCellViewsRefresh()
  {
    if ((_selectionTimeStampAtStop != -1) && (_currentAssetsViewController != null) && (_selectionTimeStampAtStop != AdobeStoragePhotoAssetSelectionState.getCurrentSelectionTimeStamp())) {
      _photoAssetsListViewController.refreshOnlyListView();
    }
    _selectionTimeStampAtStop = -1;
  }
  
  public void handleAssetClickAction(Object paramObject)
  {
    if (!(paramObject instanceof AdobePhotoAsset)) {}
    do
    {
      return;
      AdobePhotoAssetViewerController.generateAssetArray(_photoAssetsDataSource, (AdobePhotoAsset)paramObject);
    } while (!AdobePhotoAssetViewerController.isDataSourceValidForAssetViewerLaunch());
    paramObject = new Intent();
    paramObject.setClass(getActivity(), AdobeUXPhotoAssetOneUpViewerActivity.class);
    getActivity().startActivityForResult(paramObject, AdobeAssetViewUtils.PHOTO_ONE_UP_ACTIVITY_REQUEST);
  }
  
  protected void handleCancelSelectionUserAction() {}
  
  public void handleLongClickOnAsset(AdobeAsset paramAdobeAsset) {}
  
  protected void handleOnStop()
  {
    super.handleOnStop();
    _selectionTimeStampAtStop = AdobeStoragePhotoAssetSelectionState.getCurrentSelectionTimeStamp();
  }
  
  protected void handleOpenCurrentSelectedFilesUserAction()
  {
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_PHOTOS);
  }
  
  protected void handlePostOnCreateView(Bundle paramBundle)
  {
    super.handlePostOnCreateView(paramBundle);
    _selectionTimeStampAtStop = -1;
  }
  
  protected boolean hasActionBarOptions()
  {
    return true;
  }
  
  protected void hookUpDataSourceDelegate(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      _photoAssetsDataSource.setDataSourceDelegate(_photoAssetsDataSourceDelegate);
      return;
    }
    _photoAssetsDataSource.setDataSourceDelegate(null);
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration)
  {
    setTargetCollection(getPhotoCollectionFromHref((AdobePhotosViewContainerConfiguration)paramAdobeAssetsViewContainerConfiguration));
  }
  
  protected boolean isContainerShowingRootCollection()
  {
    return false;
  }
  
  public void loadMoreItemsFromDataSource()
  {
    if (_photoAssetsDataSource.hasMorePages()) {
      super.loadMoreItemsFromDataSource();
    }
  }
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData) {}
  
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
    View localView = _photoAssetsListViewController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _photoAssetsListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    if (_photoAssetsListViewController != null) {
      return;
    }
    _photoAssetsListViewController = new AdobeAssetsViewPhotoAssetsListViewController(getActivity());
    _photoAssetsListViewController.setContainerController(this);
    _photoAssetsDataSourceDelegate = new PhotoAssetsDataSourceDelegate(null);
    _photoAssetsDataSource = new AdobePhotoAssetsDataSource(_targetCollection, _photoAssetsDataSourceDelegate);
    _photoAssetsListViewController.set_photoAssetsDataSource(_photoAssetsDataSource);
    _photoAssetsListViewController.performInitialization(getActivity());
    _currentAssetsViewController = _photoAssetsListViewController;
    _photoAssetsDataSource.loadFirstPage();
  }
  
  protected void unRegisterLocalNotifications()
  {
    super.unRegisterLocalNotifications();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _photoAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _photoAssetsSelectionCountChange);
  }
  
  private class PhotoAssetsDataSourceDelegate
    implements IAdobePhotoAssetsDataSourceDelegate
  {
    private PhotoAssetsDataSourceDelegate() {}
    
    private void loadDataFailed(AdobeCSDKException paramAdobeCSDKException)
    {
      ds_handleLoadDataErrorCommon();
      if (((paramAdobeCSDKException instanceof AdobePhotoException)) && (((AdobePhotoException)paramAdobeCSDKException).getData().get("AdobeNetworkHTTPStatus").equals(Integer.valueOf(600)))) {
        markAsWentOffline();
      }
    }
    
    public void loadFirstPageFailed(AdobeCSDKException paramAdobeCSDKException)
    {
      loadDataFailed(paramAdobeCSDKException);
    }
    
    public void loadFirstPageSucceeded()
    {
      ds_didLoadMoreDataWithCount(_photoAssetsDataSource.getCount(), null, null);
    }
    
    public void loadNextPageFailed(AdobeCSDKException paramAdobeCSDKException)
    {
      loadDataFailed(paramAdobeCSDKException);
    }
    
    public void loadNextPageSucceeded()
    {
      loadFirstPageSucceeded();
    }
    
    public void willLoadFirstPage()
    {
      ds_willLoadDataFromScratch();
    }
    
    public void willLoadNextPage()
    {
      ds_willLoadNextPageForExistingCollection();
    }
  }
}
