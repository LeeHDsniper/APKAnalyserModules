package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.AdobePhotoCollectionsDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.GridSpacesItemDecoration;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobePhoto;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAssetRendition;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.util.ArrayList;
import java.util.Map;

public abstract class AdobeAssetsViewPhotosBaseListViewController
  extends AdobeAssetsViewBaseRecyclerViewController
{
  public AdobeAssetsViewPhotosBaseListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  void cancelThumbnailRenditionRequestOfAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    if ((originalAsset instanceof AdobePhotoAsset)) {
      ((AdobePhotoAsset)originalAsset).cancelDownloadRequest();
    }
  }
  
  protected RecyclerView getConcreteRecyclerView(Context paramContext)
  {
    return _recyclerView;
  }
  
  protected RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext)
  {
    return new GridSpacesItemDecoration(5, getHostActivity());
  }
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    switch (getResourcesgetConfigurationorientation)
    {
    }
    for (paramContext = new StaggeredGridLayoutManager(2, 1);; paramContext = new StaggeredGridLayoutManager(3, 1))
    {
      paramContext.setGapStrategy(2);
      return paramContext;
    }
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.adobe_storage_assets_gridview, new FrameLayout(paramContext));
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.gridview_swipe_refresh_layout));
    _recyclerView = ((RecyclerView)paramContext.findViewById(R.id.storage_assetbrowser_StaggeredGridView));
    return paramContext;
  }
  
  public boolean getSelectionOverallVisibility()
  {
    return false;
  }
  
  public void handleAssetCellSelectionToggle(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView)
  {
    int i = paramAdobeAssetViewListBaseCellView.getPosition();
    Object localObject = (AdobePhoto)_assetsItemsAdapter.getItem(i).originalAsset;
    if ((localObject != null) && ((localObject instanceof AdobePhotoAsset)) && (AdobeStoragePhotoAssetSelectionState.isMultiSelectModeActive()))
    {
      localObject = (AdobePhotoAsset)localObject;
      if (paramAdobeAssetViewListBaseCellView.isMarkedSelected())
      {
        paramAdobeAssetViewListBaseCellView.markSelected(false);
        AdobeStoragePhotoAssetSelectionState.removeSelectedAsset((AdobePhotoAsset)localObject);
      }
    }
    else
    {
      return;
    }
    paramAdobeAssetViewListBaseCellView.markSelected(true);
    AdobeStoragePhotoAssetSelectionState.addSelectedAsset((AdobePhotoAsset)localObject);
  }
  
  protected boolean isAssetSelected(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    if ((originalAsset instanceof AdobePhotoAsset)) {
      return AdobeStoragePhotoAssetSelectionState.containsAsset((AdobePhotoAsset)originalAsset);
    }
    return false;
  }
  
  protected boolean loadAssetRendition(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, final IAdobeGenericRequestCallback<byte[], AdobeCSDKException> paramIAdobeGenericRequestCallback)
  {
    paramAdobeAssetFileRenditionType = new IAdobeGenericRequestCallback()
    {
      public void onCancellation()
      {
        paramIAdobeGenericRequestCallback.onCancellation();
      }
      
      public void onCompletion(byte[] paramAnonymousArrayOfByte)
      {
        paramIAdobeGenericRequestCallback.onCompletion(paramAnonymousArrayOfByte);
      }
      
      public void onError(AdobePhotoException paramAnonymousAdobePhotoException)
      {
        paramIAdobeGenericRequestCallback.onError(paramAnonymousAdobePhotoException);
      }
      
      public void onProgress(double paramAnonymousDouble)
      {
        paramIAdobeGenericRequestCallback.onProgress(paramAnonymousDouble);
      }
    };
    paramAdobeAssetsViewCellAssetData = originalAsset;
    if ((paramAdobeAssetsViewCellAssetData instanceof AdobePhotoCollection))
    {
      paramAdobeAssetsViewCellAssetData = (AdobePhotoCollection)paramAdobeAssetsViewCellAssetData;
      adjustRenditionSizeBasedOnDeviceScale(AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION);
      AdobePhotoCollectionsDataSource.getRenditionForCollection(paramAdobeAssetsViewCellAssetData, paramAdobeAssetFileRenditionType);
    }
    for (;;)
    {
      return true;
      if ((paramAdobeAssetsViewCellAssetData instanceof AdobePhotoAsset))
      {
        paramAdobeAssetsViewCellAssetData = (AdobePhotoAsset)paramAdobeAssetsViewCellAssetData;
        paramAdobeAssetImageDimensions = (AdobePhotoAssetRendition)paramAdobeAssetsViewCellAssetData.getRenditions().get("thumbnail2x");
        if (paramAdobeAssetImageDimensions != null) {
          paramAdobeAssetsViewCellAssetData.downloadRendition(paramAdobeAssetImageDimensions, paramAdobeAssetFileRenditionType);
        } else {
          paramIAdobeGenericRequestCallback.onCompletion(null);
        }
      }
    }
  }
  
  protected abstract class PhotoListViewBaseAdapter
    extends AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter
  {
    ArrayList<AdobePhoto> _photoCollectionsList;
    
    public PhotoListViewBaseAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected AdobeAssetViewListBaseCellView createNewAssetCellView(ViewGroup paramViewGroup, int paramInt)
    {
      AdobeAssetGenericStaggeredCellView localAdobeAssetGenericStaggeredCellView = new AdobeAssetGenericStaggeredCellView();
      localAdobeAssetGenericStaggeredCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_generic_staggered_assetviewcell, paramViewGroup);
      handleCellPostCreation(localAdobeAssetGenericStaggeredCellView);
      return localAdobeAssetGenericStaggeredCellView;
    }
    
    AdobeAssetsViewCellAssetData getAssetCellDataFromPhoto(AdobePhoto paramAdobePhoto)
    {
      AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = new AdobeAssetsViewCellAssetData();
      originalAsset = paramAdobePhoto;
      guid = paramAdobePhoto.getGUID();
      title = getPhotoName(paramAdobePhoto);
      creationDate = paramAdobePhoto.getCreationDate();
      modificationDate = paramAdobePhoto.getModificationDate();
      if ((paramAdobePhoto instanceof AdobePhotoAsset)) {}
      for (paramAdobePhoto = ((AdobePhotoAsset)paramAdobePhoto).getMetadata();; paramAdobePhoto = null)
      {
        optionalMetadata = paramAdobePhoto;
        return localAdobeAssetsViewCellAssetData;
      }
    }
    
    protected AdobeAssetsViewCellAssetData getAssetItemData(int paramInt)
    {
      Object localObject2 = null;
      ArrayList localArrayList = getPhotosList();
      Object localObject1 = localObject2;
      if (localArrayList != null)
      {
        localObject1 = localObject2;
        if (paramInt >= 0)
        {
          localObject1 = localObject2;
          if (paramInt < localArrayList.size()) {
            localObject1 = getAssetCellDataFromPhoto((AdobePhoto)localArrayList.get(paramInt));
          }
        }
      }
      return localObject1;
    }
    
    protected int getAssetsCount()
    {
      int i = 0;
      if (getPhotosList() != null) {
        i = getPhotosList().size();
      }
      return i;
    }
    
    protected String getPhotoName(AdobePhoto paramAdobePhoto)
    {
      String str = null;
      if ((paramAdobePhoto instanceof AdobePhotoCollection)) {
        str = ((AdobePhotoCollection)paramAdobePhoto).getName();
      }
      while (!(paramAdobePhoto instanceof AdobePhotoAsset)) {
        return str;
      }
      return ((AdobePhotoAsset)paramAdobePhoto).getName();
    }
    
    protected abstract ArrayList<AdobePhoto> getPhotosList();
    
    protected void handleCellPostCreation(AdobeAssetGenericStaggeredCellView paramAdobeAssetGenericStaggeredCellView) {}
    
    protected void invalidateAssetsList()
    {
      _photoCollectionsList = null;
    }
    
    protected boolean isAssetCellViewAlreadyRepresentAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((originalAsset instanceof AdobePhotoAsset))
      {
        String str1 = paramAdobeAssetViewListBaseCellView.getGuid();
        String str2 = guid;
        bool1 = bool2;
        if (str1 != null)
        {
          bool1 = bool2;
          if (str2 != null)
          {
            bool1 = bool2;
            if (str1.equalsIgnoreCase(str2))
            {
              if (AdobeStoragePhotoAssetSelectionState.isMultiSelectModeActive())
              {
                bool1 = paramAdobeAssetViewListBaseCellView.isMarkedSelected();
                bool2 = isAssetSelected(paramAdobeAssetsViewCellAssetData);
                if (bool1 != bool2) {
                  paramAdobeAssetViewListBaseCellView.markSelected(bool2);
                }
              }
              bool1 = true;
            }
          }
        }
      }
      return bool1;
    }
    
    protected boolean isAssetHasThumbnail(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      return true;
    }
    
    protected boolean isAssetSelectable(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      return false;
    }
  }
}
