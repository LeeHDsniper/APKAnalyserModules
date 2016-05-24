package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import com.adobe.creativesdk.foundation.internal.storage.AdobePhotoAssetsDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.storage.AdobePhoto;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class AdobeAssetsViewPhotoAssetsListViewController
  extends AdobeAssetsViewPhotosBaseListViewController
{
  private AdobePhotoAssetsDataSource _photoAssetsDataSource;
  
  public AdobeAssetsViewPhotoAssetsListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  protected AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new PhotosAssetsListViewBaseAdapter(getHostActivity());
  }
  
  public boolean getSelectionOverallVisibility()
  {
    return AdobeStoragePhotoAssetSelectionState.isMultiSelectModeActive();
  }
  
  protected void handleListItemClick(int paramInt)
  {
    AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = _assetsItemsAdapter.getAssetItemData(paramInt);
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).handleAssetClickAction(originalAsset);
  }
  
  public void set_photoAssetsDataSource(AdobePhotoAssetsDataSource paramAdobePhotoAssetsDataSource)
  {
    _photoAssetsDataSource = paramAdobePhotoAssetsDataSource;
  }
  
  protected class PhotosAssetsListViewBaseAdapter
    extends AdobeAssetsViewPhotosBaseListViewController.PhotoListViewBaseAdapter
  {
    public PhotosAssetsListViewBaseAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected ArrayList<AdobePhoto> getPhotosList()
    {
      if ((_photoCollectionsList == null) && (_photoAssetsDataSource != null) && (_photoAssetsDataSource.getAssets() != null)) {
        _photoCollectionsList = new ArrayList(_photoAssetsDataSource.getAssets());
      }
      return _photoCollectionsList;
    }
    
    protected void handleCellPostCreation(AdobeAssetGenericStaggeredCellView paramAdobeAssetGenericStaggeredCellView)
    {
      paramAdobeAssetGenericStaggeredCellView.forceHideBottomTitleBar();
    }
    
    protected boolean isAssetSelectable(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      return true;
    }
  }
}
