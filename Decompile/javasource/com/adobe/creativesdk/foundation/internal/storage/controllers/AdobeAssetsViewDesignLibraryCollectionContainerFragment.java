package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToDesignLibraryCollectionData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateToDesignLibraryCollectionCommand;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import java.net.URI;

public class AdobeAssetsViewDesignLibraryCollectionContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  private AdobeCloud _cloud;
  private AdobeAssetDataSource _designDataSource;
  private AdobeAssetsViewDesignLibraryCollectionListViewController _designLibraryCollectionListViewController;
  private DesignLibraryCollectionsDataSourceDelegate _designLibraryCollectionsDataSourceDelegate;
  
  public AdobeAssetsViewDesignLibraryCollectionContainerFragment() {}
  
  protected void configureEmptyStateView(View paramView)
  {
    paramView.findViewById(R.id.adobe_photo_asset_browser_empty_state_icon).setVisibility(8);
    ((TextView)paramView.findViewById(R.id.adobe_photo_asset_browser_empty_state_message)).setText(getResources().getString(R.string.adobe_my_libraries_empty_collection));
  }
  
  protected int getAssetSelectionCount()
  {
    return 0;
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    paramBundle = new AdobePhotosViewContainerConfiguration();
    paramBundle.createFromBundle(getArguments());
    _cloud = paramBundle.getCloud();
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
    return _designDataSource;
  }
  
  protected int getEmptyStateViewId()
  {
    return R.layout.adobe_photo_assetbrowser_empty_state_view;
  }
  
  protected void handleAppOrientationChange()
  {
    _designLibraryCollectionListViewController.refreshLayoutDueToOrientationChange();
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
      _designDataSource.setDelegate(_designLibraryCollectionsDataSourceDelegate);
    }
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration) {}
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData)
  {
    paramNavBaseCommandData = (AdobeAssetViewNavigateCommands.NavToDesignLibraryCollectionData)paramNavBaseCommandData;
    AdobeAssetViewNavigateToDesignLibraryCollectionCommand localAdobeAssetViewNavigateToDesignLibraryCollectionCommand = new AdobeAssetViewNavigateToDesignLibraryCollectionCommand();
    collectionGUID = collectionGUID;
    collectionName = collectionName;
    collectionHref = collectionHref;
    parentHref = library.getParentHref().toString();
    library = library;
    postActionCommand(AdobeAssetViewBrowserCommandName.NAVIGATE_TO_DESIGNLIBRARY_COLLECTION, localAdobeAssetViewNavigateToDesignLibraryCollectionCommand);
  }
  
  protected void resetAssetsListViewVisualLayout()
  {
    View localView = _designLibraryCollectionListViewController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _designLibraryCollectionListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    if (_designLibraryCollectionListViewController != null) {
      return;
    }
    _designLibraryCollectionListViewController = new AdobeAssetsViewDesignLibraryCollectionListViewController(getActivity());
    _designLibraryCollectionListViewController.setContainerController(this);
    _designLibraryCollectionsDataSourceDelegate = new DesignLibraryCollectionsDataSourceDelegate(null);
    _designDataSource = new AdobeAssetDataSource(AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary, _assetViewConfiguration.getCloud());
    _designDataSource.setDelegate(_designLibraryCollectionsDataSourceDelegate);
    _designLibraryCollectionListViewController.setDesignLibraryCollectionsDataSource(_designDataSource);
    _designLibraryCollectionListViewController.performInitialization(getActivity());
    _currentAssetsViewController = _designLibraryCollectionListViewController;
    _designDataSource.loadItemsFromScratch(true);
  }
  
  private class DesignLibraryCollectionsDataSourceDelegate
    implements IAdobeAssetDataSourceDelegate
  {
    private DesignLibraryCollectionsDataSourceDelegate() {}
    
    public void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException)
    {
      ds_didFailToLoadMoreDataWithError(paramAdobeAssetException);
    }
    
    public void didFinishLoading()
    {
      ds_didFinishLoading(_designDataSource.getCount());
    }
    
    public void didLoadMoreDataWithCount(int paramInt)
    {
      ds_didLoadMoreDataWithCount(_designDataSource.getCount(), null, null);
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
