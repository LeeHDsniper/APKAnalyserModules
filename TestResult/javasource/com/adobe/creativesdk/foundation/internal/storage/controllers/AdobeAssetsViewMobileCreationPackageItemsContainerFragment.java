package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapCache.ImageCacheParams;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.MobilePackageItemsOneUpData;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;
import com.adobe.creativesdk.foundation.storage.IAdobeRequestCompletionCallback;
import java.util.ArrayList;

public class AdobeAssetsViewMobileCreationPackageItemsContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  private AdobeCloud _cloud;
  private MobileCreationPackageItemsDataSourceWrapper _mcPackageItemsWrapperDataSource;
  private MobileCreationsPackageCollectionsDataSourceDelegate _mcdatSouorceDelegate;
  AdobeAssetsViewMobileCreationPackageItemsListViewController _mobilePackageItemsListViewController;
  ReusableImageBitmapWorker _reusableBitmapCacheWorker;
  private AdobeAssetPackagePages _targetPackage;
  
  public AdobeAssetsViewMobileCreationPackageItemsContainerFragment() {}
  
  /* Error */
  public static AdobeAssetPackagePages getPackagePagesFromHref(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 47	java/net/URI
    //   5: dup
    //   6: aload_0
    //   7: invokespecial 50	java/net/URI:<init>	(Ljava/lang/String;)V
    //   10: astore_3
    //   11: new 47	java/net/URI
    //   14: dup
    //   15: aload_1
    //   16: invokespecial 50	java/net/URI:<init>	(Ljava/lang/String;)V
    //   19: astore_1
    //   20: aload_3
    //   21: invokestatic 56	com/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection:collectionFromHref	(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    //   24: astore_3
    //   25: aload_1
    //   26: invokestatic 56	com/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection:collectionFromHref	(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    //   29: astore 4
    //   31: aload_0
    //   32: ldc 58
    //   34: invokevirtual 64	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   37: ifeq +17 -> 54
    //   40: new 66	com/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile
    //   43: dup
    //   44: aload_3
    //   45: aload 4
    //   47: invokespecial 69	com/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile:<init>	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    //   50: astore_1
    //   51: goto +106 -> 157
    //   54: aload_0
    //   55: ldc 71
    //   57: invokevirtual 64	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   60: ifeq +17 -> 77
    //   63: new 73	com/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook
    //   66: dup
    //   67: aload_3
    //   68: aload 4
    //   70: invokespecial 74	com/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook:<init>	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    //   73: astore_1
    //   74: goto +83 -> 157
    //   77: aload_0
    //   78: ldc 76
    //   80: invokevirtual 64	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   83: ifeq +17 -> 100
    //   86: new 78	com/adobe/creativesdk/foundation/storage/AdobeAssetLineFile
    //   89: dup
    //   90: aload_3
    //   91: aload 4
    //   93: invokespecial 79	com/adobe/creativesdk/foundation/storage/AdobeAssetLineFile:<init>	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    //   96: astore_1
    //   97: goto +60 -> 157
    //   100: aload_0
    //   101: ldc 81
    //   103: invokevirtual 64	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   106: ifeq +17 -> 123
    //   109: new 83	com/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile
    //   112: dup
    //   113: aload_3
    //   114: aload 4
    //   116: invokespecial 84	com/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile:<init>	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    //   119: astore_1
    //   120: goto +37 -> 157
    //   123: aload_2
    //   124: astore_1
    //   125: aload_0
    //   126: ldc 86
    //   128: invokevirtual 64	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   131: ifeq +26 -> 157
    //   134: new 88	com/adobe/creativesdk/foundation/storage/AdobeAssetCompFile
    //   137: dup
    //   138: aload_3
    //   139: aload 4
    //   141: invokespecial 89	com/adobe/creativesdk/foundation/storage/AdobeAssetCompFile:<init>	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    //   144: astore_1
    //   145: goto +12 -> 157
    //   148: astore_0
    //   149: aconst_null
    //   150: areturn
    //   151: astore_0
    //   152: aconst_null
    //   153: areturn
    //   154: astore_0
    //   155: aconst_null
    //   156: areturn
    //   157: aload_1
    //   158: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	159	0	paramString1	String
    //   0	159	1	paramString2	String
    //   1	123	2	localObject1	Object
    //   10	129	3	localObject2	Object
    //   29	111	4	localAdobeStorageResourceCollection	com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection
    // Exception table:
    //   from	to	target	type
    //   2	11	148	java/net/URISyntaxException
    //   11	20	151	java/net/URISyntaxException
    //   20	51	154	java/net/URISyntaxException
    //   54	74	154	java/net/URISyntaxException
    //   77	97	154	java/net/URISyntaxException
    //   100	120	154	java/net/URISyntaxException
    //   125	145	154	java/net/URISyntaxException
  }
  
  protected int getAssetSelectionCount()
  {
    return AdobeStorageAssetSelectionState.selectedAssetCount();
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    paramBundle = new AdobeMobilePackageCollectionConfiguration();
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
    if ((_targetPackage != null) && (_targetPackage.isMetadataLoaded())) {
      return _targetPackage.getName();
    }
    return null;
  }
  
  protected IAdobeAssetDataSource getDataSource()
  {
    return _mcPackageItemsWrapperDataSource;
  }
  
  protected void handleAppOrientationChange()
  {
    _mobilePackageItemsListViewController.refreshLayoutDueToOrientationChange();
  }
  
  public void handleAssetClickAction(Object paramObject)
  {
    paramObject = (MobilePackageItemsOneUpData)paramObject;
    MobilePackageItemsOneUpViewController.createInstanceFromPackage(_packagePages, _itemsList, startIndex);
    paramObject = new Intent();
    paramObject.setClass(getActivity(), AdobeUXMobilePackageItemOneUpViewerActivity.class);
    getActivity().startActivityForResult(paramObject, AdobeAssetViewUtils.MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST);
  }
  
  protected void handleCancelSelectionUserAction() {}
  
  public void handleLongClickOnAsset(AdobeAsset paramAdobeAsset) {}
  
  protected void handleOpenCurrentSelectedFilesUserAction()
  {
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_FILES);
  }
  
  protected boolean hasActionBarOptions()
  {
    return true;
  }
  
  protected void hookUpDataSourceDelegate(boolean paramBoolean)
  {
    if (paramBoolean) {
      _mcPackageItemsWrapperDataSource.setDelegate(_mcdatSouorceDelegate);
    }
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration)
  {
    paramAdobeAssetsViewContainerConfiguration = (AdobeMobilePackageCollectionConfiguration)paramAdobeAssetsViewContainerConfiguration;
    _targetPackage = getPackagePagesFromHref(paramAdobeAssetsViewContainerConfiguration.getTargetCollectionHref(), paramAdobeAssetsViewContainerConfiguration.getTargetParentCollectionHref());
  }
  
  protected boolean isContainerShowingRootCollection()
  {
    return false;
  }
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData) {}
  
  public void onDestroy()
  {
    if (_reusableBitmapCacheWorker != null)
    {
      _reusableBitmapCacheWorker.clearCache();
      _reusableBitmapCacheWorker = null;
    }
    super.onDestroy();
  }
  
  protected void resetAssetsListViewVisualLayout()
  {
    View localView = _mobilePackageItemsListViewController.getMainView();
    if (getAssetsMainRootFrame().indexOfChild(localView) == -1) {
      getAssetsMainRootFrame().addView(localView);
    }
    _currentAssetsViewController = _mobilePackageItemsListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    _mcPackageItemsWrapperDataSource = new MobileCreationPackageItemsDataSourceWrapper(null);
    _mcdatSouorceDelegate = new MobileCreationsPackageCollectionsDataSourceDelegate(null);
    _mcPackageItemsWrapperDataSource.setDelegate(_mcdatSouorceDelegate);
    ReusableImageBitmapCache.ImageCacheParams localImageCacheParams = new ReusableImageBitmapCache.ImageCacheParams();
    localImageCacheParams.setMemCacheSizePercent(0.1F);
    _reusableBitmapCacheWorker = new ReusableImageBitmapWorker(getActivity());
    _reusableBitmapCacheWorker.addImageCache(getActivity().getSupportFragmentManager(), localImageCacheParams);
    _mobilePackageItemsListViewController = new AdobeAssetsViewMobileCreationPackageItemsListViewController(getHostActivity());
    _mobilePackageItemsListViewController.setContainerController(this);
    _mobilePackageItemsListViewController.setTargetPackage(_targetPackage);
    _mobilePackageItemsListViewController.performInitialization(getHostActivity());
    _mobilePackageItemsListViewController.setReusableImageWorker(_reusableBitmapCacheWorker);
    _mcPackageItemsWrapperDataSource.loadItemsFromScratch();
  }
  
  private class MobileCreationPackageItemsDataSourceWrapper
    implements IAdobeAssetDataSource
  {
    AdobeAssetsViewMobileCreationPackageItemsContainerFragment.MobileCreationsPackageCollectionsDataSourceDelegate _delegate;
    
    private MobileCreationPackageItemsDataSourceWrapper() {}
    
    private void loadMetadata()
    {
      _targetPackage.reloadMetadata(new IAdobeRequestCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion()
        {
          if (_delegate == null) {
            return;
          }
          setContainerFragmentTitle(_targetPackage.getName());
          if (_targetPackage.getPages() == null) {}
          for (;;)
          {
            _delegate.didFinishLoading();
            return;
            _targetPackage.getPages().size();
          }
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
      if (_targetPackage.getPages() == null) {
        return 0;
      }
      return _targetPackage.getPages().size();
    }
    
    public boolean loadItemsFromScratch()
    {
      if (_delegate != null) {
        _delegate.willLoadDataFromScratch();
      }
      loadMetadata();
      return true;
    }
    
    public void loadNextPageOfData() {}
    
    public void resetDelegate()
    {
      _delegate = null;
    }
    
    public void setDelegate(AdobeAssetsViewMobileCreationPackageItemsContainerFragment.MobileCreationsPackageCollectionsDataSourceDelegate paramMobileCreationsPackageCollectionsDataSourceDelegate)
    {
      _delegate = paramMobileCreationsPackageCollectionsDataSourceDelegate;
    }
  }
  
  private class MobileCreationsPackageCollectionsDataSourceDelegate
    implements IAdobeAssetDataSourceDelegate
  {
    private MobileCreationsPackageCollectionsDataSourceDelegate() {}
    
    public void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException)
    {
      ds_didFailToLoadMoreDataWithError(paramAdobeAssetException);
    }
    
    public void didFinishLoading()
    {
      ds_didFinishLoading(_mcPackageItemsWrapperDataSource.getCount());
      _mobilePackageItemsListViewController.refreshDueToDataChange();
    }
    
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
}
