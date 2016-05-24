package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.MobileCreationsDataSourceFactory;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapCache.ImageCacheParams;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.MobilePackageItemsOneUpData;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;

public class AdobeAssetsViewCompositionsContainerFragment
  extends AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment
{
  private AdobeAssetsViewCompositionsListViewController _compsListViewController;
  private CompsDataSourceDelegate _dataSourceDelegate;
  
  public AdobeAssetsViewCompositionsContainerFragment() {}
  
  protected void configureEmptyStateView(View paramView)
  {
    if (_dataSourcesType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix)
    {
      ((LinearLayout)paramView.findViewById(R.id.android_play_store_btn)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          try
          {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.adobe.photoshopmix")));
            return;
          }
          catch (ActivityNotFoundException paramAnonymousView)
          {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=com.adobe.photoshopmix")));
          }
        }
      });
      return;
    }
    paramView.findViewById(R.id.adobe_photo_asset_browser_empty_state_icon).setVisibility(8);
    ((TextView)paramView.findViewById(R.id.adobe_photo_asset_browser_empty_state_message)).setText(getResources().getString(R.string.adobe_comps_empty_collection));
  }
  
  protected int getEmptyStateViewId()
  {
    if (_dataSourcesType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix) {
      return R.layout.adobe_psmix_empty_state_view;
    }
    return R.layout.adobe_photo_assetbrowser_empty_state_view;
  }
  
  protected void handleAppOrientationChange()
  {
    _compsListViewController.refreshLayoutDueToOrientationChange();
  }
  
  public void handleAssetClickAction(Object paramObject)
  {
    paramObject = (MobilePackageItemsOneUpData)paramObject;
    MobilePackageItemsOneUpViewController.createInstanceFromPackage(_packagePages, _itemsList, 0);
    paramObject = new Intent();
    paramObject.setClass(getActivity(), AdobeUXCompositionOneUpViewerActivity.class);
    getActivity().startActivityForResult(paramObject, AdobeAssetViewUtils.MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST);
  }
  
  protected void hookUpDataSourceDelegate(boolean paramBoolean)
  {
    if (paramBoolean) {
      _assetsDataSource.setDelegate(_dataSourceDelegate);
    }
  }
  
  protected void resetAssetsListViewVisualLayout()
  {
    View localView = _compsListViewController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _compsListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    if (_compsListViewController != null) {
      return;
    }
    ReusableImageBitmapCache.ImageCacheParams localImageCacheParams = new ReusableImageBitmapCache.ImageCacheParams();
    localImageCacheParams.setMemCacheSizePercent(0.1F);
    _reusableBitmapCacheWorker = new ReusableImageBitmapWorker(getActivity());
    _reusableBitmapCacheWorker.addImageCache(getActivity().getSupportFragmentManager(), localImageCacheParams);
    _compsListViewController = new AdobeAssetsViewCompositionsListViewController(getActivity(), _dataSourcesType);
    _compsListViewController.setContainerController(this);
    _compsListViewController.setReusableImageWorker(_reusableBitmapCacheWorker);
    _assetsDataSource = MobileCreationsDataSourceFactory.getInstance().getDataSourceByType(_dataSourcesType);
    if (_assetsDataSource == null) {
      _assetsDataSource = new AdobeAssetDataSource(_dataSourcesType, _assetViewConfiguration.getCloud());
    }
    _dataSourceDelegate = new CompsDataSourceDelegate(null);
    _assetsDataSource.setDelegate(_dataSourceDelegate);
    _compsListViewController.setMobileCreationCollectionsDataSource(_assetsDataSource);
    _compsListViewController.performInitialization(getActivity());
    _currentAssetsViewController = _compsListViewController;
    _assetsDataSource.loadItemsFromScratch(true);
  }
  
  private class CompsDataSourceDelegate
    implements IAdobeAssetDataSourceDelegate
  {
    private CompsDataSourceDelegate() {}
    
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
