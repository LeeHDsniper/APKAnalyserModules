package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;

public class AdobeAssetViewGridFolderCellView
  extends AdobeAssetViewListBaseCellView
{
  boolean _isSharedFolder = false;
  
  public AdobeAssetViewGridFolderCellView() {}
  
  protected void handleOnFinishInflate()
  {
    _titleView = ((TextView)findViewById(R.id.assetview_assetgrid_foldercell_title));
    _imageViewAssetPicture = ((ImageView)findViewById(R.id.assetview_assetgrid_foldercell_image));
  }
  
  public void prepareForReuse()
  {
    super.prepareForReuse();
    _imageViewAssetPicture.setVisibility(0);
  }
  
  protected boolean providesSelection()
  {
    return false;
  }
  
  public void setSharedFolder(boolean paramBoolean)
  {
    if ((_isSharedFolder == paramBoolean) || (_imageViewAssetPicture == null)) {
      return;
    }
    _isSharedFolder = paramBoolean;
    ImageView localImageView = _imageViewAssetPicture;
    if (paramBoolean) {}
    for (int i = R.drawable.collection_folder_shared;; i = R.drawable.collection_folder)
    {
      localImageView.setImageResource(i);
      return;
    }
  }
}
