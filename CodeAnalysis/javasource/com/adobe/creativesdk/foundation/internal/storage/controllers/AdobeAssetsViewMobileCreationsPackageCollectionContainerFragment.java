package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.menu;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.MobileCreationsDataSourceFactory;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapCache.ImageCacheParams;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetCompFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDrawFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderBy;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderDirection;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLineFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPSMixFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;
import com.adobe.creativesdk.foundation.storage.AdobeAssetSketchbook;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  AdobeAssetDataSource _assetsDataSource;
  AdobeAssetsViewMobileCreationsPackageCollectionListViewController _assetsMobileCreationCollectionController;
  AdobeCloud _cloud;
  AdobeAssetDataSourceType _dataSourcesType;
  MobileCreationPackageCollectionsDataSourceDelegate _mcCollectionDataSourceDelegate;
  ReusableImageBitmapWorker _reusableBitmapCacheWorker;
  Observer _storageAssetsSelectionCountChange;
  
  public AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment() {}
  
  public static AdobeAssetDataSourceType getAssetDataSourceTypeFor(AdobeAssetPackagePages paramAdobeAssetPackagePages)
  {
    AdobeAssetDataSourceType localAdobeAssetDataSourceType = AdobeAssetDataSourceType.AdobeAssetDataSourceFiles;
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetSketchbook)) {
      localAdobeAssetDataSourceType = AdobeAssetDataSourceType.AdobeAssetDataSourceSketches;
    }
    do
    {
      return localAdobeAssetDataSourceType;
      if ((paramAdobeAssetPackagePages instanceof AdobeAssetLineFile)) {
        return AdobeAssetDataSourceType.AdobeAssetDataSourceLine;
      }
      if ((paramAdobeAssetPackagePages instanceof AdobeAssetDrawFile)) {
        return AdobeAssetDataSourceType.AdobeAssetDataSourceDraw;
      }
      if ((paramAdobeAssetPackagePages instanceof AdobeAssetPSMixFile)) {
        return AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix;
      }
    } while (!(paramAdobeAssetPackagePages instanceof AdobeAssetCompFile));
    return AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions;
  }
  
  protected void configureEmptyStateView(View paramView)
  {
    paramView.findViewById(R.id.adobe_photo_asset_browser_empty_state_icon).setVisibility(8);
    paramView = (TextView)paramView.findViewById(R.id.adobe_photo_asset_browser_empty_state_message);
    if (_dataSourcesType == AdobeAssetDataSourceType.AdobeAssetDataSourceSketches)
    {
      paramView.setText(getResources().getString(R.string.adobe_sketches_empty_collection));
      return;
    }
    paramView.setText(getResources().getString(R.string.adobe_mobilecreations_empty_collection));
  }
  
  protected AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController createActionBarController()
  {
    return new ActionBarController();
  }
  
  protected int getAssetSelectionCount()
  {
    return 0;
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    paramBundle = new AdobeAssetsViewContainerConfiguration();
    paramBundle.createFromBundle(getArguments());
    _dataSourcesType = paramBundle.getDataSourceType();
    _cloud = paramBundle.getCloud();
    return paramBundle;
  }
  
  protected String getContainerNameForRoot()
  {
    return "My assets";
  }
  
  protected String getCurrentTargetCollectionName()
  {
    return null;
  }
  
  protected IAdobeAssetDataSource getDataSource()
  {
    return _assetsDataSource;
  }
  
  protected int getEmptyStateViewId()
  {
    return R.layout.adobe_photo_assetbrowser_empty_state_view;
  }
  
  protected void handleAppOrientationChange()
  {
    _assetsMobileCreationCollectionController.refreshLayoutDueToOrientationChange();
  }
  
  public void handleAssetClickAction(Object paramObject) {}
  
  protected void handleCancelSelectionUserAction() {}
  
  public void handleLongClickOnAsset(AdobeAsset paramAdobeAsset) {}
  
  protected void handleOpenCurrentSelectedFilesUserAction() {}
  
  protected boolean hasActionBarOptions()
  {
    return true;
  }
  
  protected void hookUpDataSourceDelegate(boolean paramBoolean)
  {
    if (paramBoolean) {
      _assetsDataSource.setDelegate(_mcCollectionDataSourceDelegate);
    }
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration) {}
  
  public void loadMoreItemsFromDataSource()
  {
    _assetsDataSource.loadNextPageOfData();
  }
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData)
  {
    postActionCommand(AdobeAssetViewBrowserCommandName.NAVIGATE_TO_MOBILECREATION_COLLECTION, paramNavBaseCommandData);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public void onDestroy()
  {
    if (_reusableBitmapCacheWorker != null)
    {
      _reusableBitmapCacheWorker.clearCache();
      _reusableBitmapCacheWorker = null;
    }
    super.onDestroy();
  }
  
  protected void registerLocalNofications()
  {
    super.registerLocalNofications();
    if (_storageAssetsSelectionCountChange == null) {
      _storageAssetsSelectionCountChange = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          configureMultiSelectViews();
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _storageAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _storageAssetsSelectionCountChange);
  }
  
  protected void resetAssetsListViewVisualLayout()
  {
    View localView = _assetsMobileCreationCollectionController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _assetsMobileCreationCollectionController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    if (_assetsMobileCreationCollectionController != null) {
      return;
    }
    ReusableImageBitmapCache.ImageCacheParams localImageCacheParams = new ReusableImageBitmapCache.ImageCacheParams();
    localImageCacheParams.setMemCacheSizePercent(0.1F);
    _reusableBitmapCacheWorker = new ReusableImageBitmapWorker(getActivity());
    _reusableBitmapCacheWorker.addImageCache(getActivity().getSupportFragmentManager(), localImageCacheParams);
    _assetsMobileCreationCollectionController = new AdobeAssetsViewMobileCreationsPackageCollectionListViewController(getActivity(), _dataSourcesType);
    _assetsMobileCreationCollectionController.setContainerController(this);
    _assetsMobileCreationCollectionController.setReusableImageWorker(_reusableBitmapCacheWorker);
    _assetsDataSource = MobileCreationsDataSourceFactory.getInstance().getDataSourceByType(_dataSourcesType);
    if (_assetsDataSource == null) {
      _assetsDataSource = new AdobeAssetDataSource(_dataSourcesType, _assetViewConfiguration.getCloud());
    }
    _mcCollectionDataSourceDelegate = new MobileCreationPackageCollectionsDataSourceDelegate(null);
    _assetsDataSource.setDelegate(_mcCollectionDataSourceDelegate);
    _assetsMobileCreationCollectionController.setMobileCreationCollectionsDataSource(_assetsDataSource);
    _assetsMobileCreationCollectionController.performInitialization(getActivity());
    _currentAssetsViewController = _assetsMobileCreationCollectionController;
    _assetsDataSource.loadItemsFromScratch(true);
  }
  
  protected void unRegisterLocalNotifications()
  {
    super.unRegisterLocalNotifications();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _storageAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _storageAssetsSelectionCountChange);
  }
  
  class ActionBarController
    extends AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController
  {
    protected MenuItem _sortMenuItem;
    
    ActionBarController()
    {
      super();
    }
    
    protected boolean handleOptionItemSelect(int paramInt)
    {
      if (paramInt == R.id.adobe_uxassetbrowser_sdk_common_menu_sortbydate)
      {
        AdobeAssetFolderOrderBy localAdobeAssetFolderOrderBy = AdobeAssetFolderOrderBy.ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED;
        AdobeAssetFolderOrderDirection localAdobeAssetFolderOrderDirection = AdobeAssetFolderOrderDirection.ADOBE_ASSET_FOLDER_ORDER_ASCENDING;
        AdobeAssetDataSource localAdobeAssetDataSource = (AdobeAssetDataSource)getDataSource();
        localAdobeAssetDataSource.getTargetFolder().resetPagingOrderedByField(localAdobeAssetFolderOrderBy, localAdobeAssetFolderOrderDirection);
        localAdobeAssetDataSource.loadItemsFromScratch(true);
        return true;
      }
      return super.handleOptionItemSelect(paramInt);
    }
    
    public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
    {
      paramMenuInflater.inflate(R.menu.adobe_assetview_common_sort, paramMenu);
      _sortMenuItem = paramMenu.findItem(R.id.adobe_uxassetbrowser_sdk_common_menu_sortbydate);
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu)
    {
      String str = getResources().getString(R.string.adobe_mobilecreations_sort);
      _sortMenuItem.setTitle(AdobeAssetViewUtils.getAdobeFontFormattedString(str, getActivity()));
      _sortMenuItem.setVisible(true);
      super.onPrepareOptionsMenu(paramMenu);
    }
  }
  
  private class MobileCreationPackageCollectionsDataSourceDelegate
    implements IAdobeAssetDataSourceDelegate
  {
    private MobileCreationPackageCollectionsDataSourceDelegate() {}
    
    public void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException)
    {
      ds_didFailToLoadMoreDataWithError(paramAdobeAssetException);
    }
    
    public void didFinishLoading()
    {
      ds_didFinishLoading(_assetsDataSource.getCount());
    }
    
    public void didLoadMoreDataWithCount(int paramInt)
    {
      ds_didLoadMoreDataWithCount(paramInt, null, null);
    }
    
    public void willLoadDataFromScratch()
    {
      ds_willLoadDataFromScratch();
    }
    
    public void willLoadNextPageForExistingPackage()
    {
      ds_willLoadNextPageForExistingCollection();
    }
  }
}
