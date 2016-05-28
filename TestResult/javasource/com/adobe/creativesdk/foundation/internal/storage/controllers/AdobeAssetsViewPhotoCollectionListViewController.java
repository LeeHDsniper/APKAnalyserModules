package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.internal.storage.AdobePhotoCollectionsDataSource;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToPhotoCollectionData;
import com.adobe.creativesdk.foundation.storage.AdobePhoto;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class AdobeAssetsViewPhotoCollectionListViewController
  extends AdobeAssetsViewPhotosBaseListViewController
{
  private AdobePhotoCollectionsDataSource _photoCollectionsDataSource;
  private int rightMargin = -1;
  
  public AdobeAssetsViewPhotoCollectionListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  protected AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new PhotosCollectionListViewBaseAdapter(getHostActivity());
  }
  
  protected AdobeAssetViewNavigateCommands.NavBaseCommandData getPhotoCollectionNavigationCommand(AdobePhotoCollection paramAdobePhotoCollection)
  {
    AdobeAssetViewNavigateCommands.NavToPhotoCollectionData localNavToPhotoCollectionData = new AdobeAssetViewNavigateCommands.NavToPhotoCollectionData();
    collectionGUID = paramAdobePhotoCollection.getGUID();
    collectionName = paramAdobePhotoCollection.getName();
    catalogGUID = paramAdobePhotoCollection.getCatalog().getGUID();
    catalogName = paramAdobePhotoCollection.getCatalog().getName();
    return localNavToPhotoCollectionData;
  }
  
  protected void handleListItemClick(int paramInt)
  {
    Object localObject = _assetsItemsAdapter.getAssetItemData(paramInt);
    if ((localObject == null) || (originalAsset == null) || (!(originalAsset instanceof AdobePhotoCollection))) {
      return;
    }
    localObject = (AdobePhotoCollection)originalAsset;
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).navigateToCollection(getPhotoCollectionNavigationCommand((AdobePhotoCollection)localObject));
  }
  
  public void set_photoCollectionsDataSource(AdobePhotoCollectionsDataSource paramAdobePhotoCollectionsDataSource)
  {
    _photoCollectionsDataSource = paramAdobePhotoCollectionsDataSource;
  }
  
  protected class PhotosCollectionListViewBaseAdapter
    extends AdobeAssetsViewPhotosBaseListViewController.PhotoListViewBaseAdapter
  {
    public PhotosCollectionListViewBaseAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    private int getRightMargin()
    {
      if (rightMargin == -1)
      {
        float f = getHostActivity().getResources().getDisplayMetrics().density;
        AdobeAssetsViewPhotoCollectionListViewController.access$102(AdobeAssetsViewPhotoCollectionListViewController.this, (int)(10 * f));
      }
      return rightMargin;
    }
    
    protected ArrayList<AdobePhoto> getPhotosList()
    {
      if ((_photoCollectionsList == null) && (_photoCollectionsDataSource != null) && (_photoCollectionsDataSource.getCollections() != null)) {
        _photoCollectionsList = new ArrayList(_photoCollectionsDataSource.getCollections());
      }
      return _photoCollectionsList;
    }
    
    protected void handleCellPostCreation(AdobeAssetGenericStaggeredCellView paramAdobeAssetGenericStaggeredCellView)
    {
      paramAdobeAssetGenericStaggeredCellView.forceAspectRatio(1.0F);
      _selectBtn.setVisibility(8);
      _imageViewAssetPicture.setScaleType(ImageView.ScaleType.CENTER_CROP);
      paramAdobeAssetGenericStaggeredCellView = (LinearLayout)paramAdobeAssetGenericStaggeredCellView.getRootView().findViewById(R.id.assetview_assetgrid_assetcell_bottom_title_section);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      ((ViewGroup.MarginLayoutParams)((TextView)paramAdobeAssetGenericStaggeredCellView.findViewById(R.id.assetview_assetgrid_assetcell_title)).getLayoutParams()).setMargins(0, 0, getRightMargin(), 0);
      localLayoutParams.addRule(11);
      localLayoutParams.addRule(13);
      ImageView localImageView = new ImageView(getHostActivity());
      localImageView.setImageResource(R.drawable.folder_forward_icon);
      localImageView.setLayoutParams(localLayoutParams);
      paramAdobeAssetGenericStaggeredCellView.addView(localImageView);
    }
  }
}
