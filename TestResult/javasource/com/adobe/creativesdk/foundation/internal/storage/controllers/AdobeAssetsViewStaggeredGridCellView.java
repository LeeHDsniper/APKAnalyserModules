package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.graphics.Bitmap;
import android.view.View;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.etsy.android.grid.util.DynamicHeightImageView;

public abstract class AdobeAssetsViewStaggeredGridCellView
  extends AdobeAssetViewListBaseCellView
{
  private float _forcedAspectRatio = 0.0F;
  
  public AdobeAssetsViewStaggeredGridCellView() {}
  
  protected void SetThumbnailOnAssetCell(Bitmap paramBitmap)
  {
    if ((paramBitmap != null) && (_forcedAspectRatio == 0.0F))
    {
      int i = paramBitmap.getWidth();
      float f = paramBitmap.getHeight() / i;
      if (Math.abs(((DynamicHeightImageView)_imageViewAssetPicture).getHeightRatio() - f) > 0.01D) {
        ((DynamicHeightImageView)_imageViewAssetPicture).setHeightRatio(f);
      }
    }
    for (;;)
    {
      super.SetThumbnailOnAssetCell(paramBitmap);
      return;
      ((DynamicHeightImageView)_imageViewAssetPicture).setHeightRatio(1.0D);
    }
  }
  
  protected void changeSelectionOverlay() {}
  
  public void forceAspectRatio(float paramFloat)
  {
    _forcedAspectRatio = paramFloat;
    setAssetImageAspectRatioHint(_forcedAspectRatio);
  }
  
  public void forceHideBottomTitleBar()
  {
    findViewById(R.id.assetview_assetgrid_assetcell_bottom_title_section).setVisibility(8);
  }
  
  protected void handlePostInflate()
  {
    if (_imageViewAssetPicture != null) {
      ((DynamicHeightImageView)_imageViewAssetPicture).setHeightRatio(_aspectRatioHint);
    }
    super.handlePostInflate();
  }
  
  public void setAssetImageAspectRatioHint(float paramFloat)
  {
    if (paramFloat == _aspectRatioHint) {
      return;
    }
    if (_forcedAspectRatio != 0.0F) {
      paramFloat = _forcedAspectRatio;
    }
    super.setAssetImageAspectRatioHint(paramFloat);
    ((DynamicHeightImageView)_imageViewAssetPicture).setHeightRatio(_aspectRatioHint);
  }
}
