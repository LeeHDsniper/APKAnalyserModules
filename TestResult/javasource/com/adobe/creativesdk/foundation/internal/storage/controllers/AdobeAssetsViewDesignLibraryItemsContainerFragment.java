package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.LibraryItemsOneUpViewController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.LibraryDesignItemsOneUpData;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.IAdobeRequestCompletionCallback;

public class AdobeAssetsViewDesignLibraryItemsContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  private AdobeCloud _cloud;
  private DesignLibraryCollectionsDataSourceDelegate _designLibraryCollectionsDataSourceDelegate;
  AdobeAssetsViewDesignLibraryItemsListViewController _designLibraryItemsListViewController;
  private DesignLibraryItemsDataSourceWrapper _designLibraryItemsWrapperDataSource;
  private AdobeAssetLibrary _targetLibrary;
  
  public AdobeAssetsViewDesignLibraryItemsContainerFragment() {}
  
  /* Error */
  public static AdobeAssetLibrary getLibraryFolderFromHref(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: new 41	java/net/URI
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 44	java/net/URI:<init>	(Ljava/lang/String;)V
    //   8: astore_0
    //   9: new 41	java/net/URI
    //   12: dup
    //   13: aload_1
    //   14: invokespecial 44	java/net/URI:<init>	(Ljava/lang/String;)V
    //   17: astore_1
    //   18: new 46	com/adobe/creativesdk/foundation/storage/AdobeAssetLibrary
    //   21: dup
    //   22: aload_0
    //   23: invokestatic 52	com/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection:collectionFromHref	(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    //   26: aload_1
    //   27: invokestatic 52	com/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection:collectionFromHref	(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    //   30: invokespecial 55	com/adobe/creativesdk/foundation/storage/AdobeAssetLibrary:<init>	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    //   33: astore_0
    //   34: aload_0
    //   35: areturn
    //   36: astore_0
    //   37: aconst_null
    //   38: areturn
    //   39: astore_0
    //   40: aconst_null
    //   41: areturn
    //   42: astore_0
    //   43: aconst_null
    //   44: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	45	0	paramString1	String
    //   0	45	1	paramString2	String
    // Exception table:
    //   from	to	target	type
    //   0	9	36	java/net/URISyntaxException
    //   9	18	39	java/net/URISyntaxException
    //   18	34	42	java/net/URISyntaxException
  }
  
  protected int getAssetSelectionCount()
  {
    return 0;
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    paramBundle = new AdobeDesignLibraryCollectionConfiguration();
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
    if ((_targetLibrary != null) && (_targetLibrary.isMetadataLoaded())) {
      return _targetLibrary.getName();
    }
    return null;
  }
  
  protected IAdobeAssetDataSource getDataSource()
  {
    return _designLibraryItemsWrapperDataSource;
  }
  
  protected int getEmptyStateViewId()
  {
    return R.layout.adobe_library_items_emptycollectioncell;
  }
  
  protected void handleAppOrientationChange()
  {
    _designLibraryItemsListViewController.refreshLayoutDueToOrientationChange();
  }
  
  public void handleAssetClickAction(Object paramObject)
  {
    paramObject = (LibraryDesignItemsOneUpData)paramObject;
    LibraryItemsOneUpViewController.createInstanceFromLibrary(library, _itemsList, startIndex);
    paramObject = new Intent();
    paramObject.setClass(getActivity(), AdobeUXLibraryItemCollectionOneUpViewerActivity.class);
    getActivity().startActivityForResult(paramObject, AdobeAssetViewUtils.LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST);
  }
  
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
      _designLibraryItemsWrapperDataSource.setDelegate(_designLibraryCollectionsDataSourceDelegate);
    }
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration)
  {
    paramAdobeAssetsViewContainerConfiguration = (AdobeDesignLibraryCollectionConfiguration)paramAdobeAssetsViewContainerConfiguration;
    _targetLibrary = getLibraryFolderFromHref(paramAdobeAssetsViewContainerConfiguration.getTargetCollectionHref(), paramAdobeAssetsViewContainerConfiguration.getTargetParentCollectionHref());
  }
  
  protected boolean isContainerShowingRootCollection()
  {
    return false;
  }
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData) {}
  
  protected void resetAssetsListViewVisualLayout()
  {
    View localView = _designLibraryItemsListViewController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _designLibraryItemsListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    _designLibraryItemsWrapperDataSource = new DesignLibraryItemsDataSourceWrapper(null);
    _designLibraryCollectionsDataSourceDelegate = new DesignLibraryCollectionsDataSourceDelegate(null);
    _designLibraryItemsWrapperDataSource.setDelegate(_designLibraryCollectionsDataSourceDelegate);
    _designLibraryItemsListViewController = new AdobeAssetsViewDesignLibraryItemsListViewController(getHostActivity());
    _designLibraryItemsListViewController.setClientViewConfiguration((AdobeDesignLibraryCollectionConfiguration)_assetViewConfiguration);
    _designLibraryItemsListViewController.setContainerController(this);
    _designLibraryItemsListViewController.setTargetLibraryFolder(_targetLibrary);
    _designLibraryItemsListViewController.performInitialization(getHostActivity());
    _designLibraryItemsWrapperDataSource.loadItemsFromScratch();
  }
  
  private class DesignLibraryCollectionsDataSourceDelegate
    implements IAdobeAssetDataSourceDelegate
  {
    private DesignLibraryCollectionsDataSourceDelegate() {}
    
    public void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException)
    {
      ds_didFailToLoadMoreDataWithError(paramAdobeAssetException);
    }
    
    public void didFinishLoading() {}
    
    public void didLoadMoreDataWithCount(int paramInt)
    {
      ds_didLoadMoreDataWithCount(paramInt, null, null);
    }
    
    public void willLoadDataFromScratch()
    {
      ds_willLoadDataFromScratch();
    }
    
    public void willLoadNextPageForExistingPackage() {}
  }
  
  private class DesignLibraryItemsDataSourceWrapper
    implements IAdobeAssetDataSource
  {
    AdobeAssetsViewDesignLibraryItemsContainerFragment.DesignLibraryCollectionsDataSourceDelegate _delegate;
    
    private DesignLibraryItemsDataSourceWrapper() {}
    
    private void loadLibraryMetaData()
    {
      _targetLibrary.reloadMetadata(new IAdobeRequestCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion()
        {
          if (_delegate == null) {
            return;
          }
          setContainerFragmentTitle(_targetLibrary.getName());
          _delegate.didLoadMoreDataWithCount(_targetLibrary.count());
        }
      }, new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
        {
          if (_delegate == null) {
            return;
          }
          _delegate.didFailToLoadMoreDataWithError(new AdobeAssetException(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, paramAnonymousAdobeCSDKException.getData()));
        }
      });
    }
    
    public int getCount()
    {
      return _targetLibrary.count();
    }
    
    public boolean loadItemsFromScratch()
    {
      if (_delegate != null) {
        _delegate.willLoadDataFromScratch();
      }
      loadLibraryMetaData();
      return true;
    }
    
    public void loadNextPageOfData() {}
    
    public void resetDelegate()
    {
      _delegate = null;
    }
    
    public void setDelegate(AdobeAssetsViewDesignLibraryItemsContainerFragment.DesignLibraryCollectionsDataSourceDelegate paramDesignLibraryCollectionsDataSourceDelegate)
    {
      _delegate = paramDesignLibraryCollectionsDataSourceDelegate;
    }
  }
}
