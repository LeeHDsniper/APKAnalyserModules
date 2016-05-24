package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.etsy.android.grid.util.DynamicHeightImageView;

public class AdobeAssetGenericStaggeredCellView
  extends AdobeAssetsViewStaggeredGridCellView
{
  public AdobeAssetGenericStaggeredCellView() {}
  
  protected void handleOnFinishInflate()
  {
    _titleView = ((TextView)findViewById(R.id.assetview_assetgrid_assetcell_title));
    _imageViewAssetPicture = ((ImageView)findViewById(R.id.assetview_assetgrid_assetcell_imageView));
    _videoDuration = ((TextView)findViewById(R.id.assetview_assetgrid_assetcell_video_duration));
    _videoIndicator = ((ImageView)findViewById(R.id.assetview_assetgrid_assetcell_video_indicator));
    ((DynamicHeightImageView)_imageViewAssetPicture).setHeightRatio(_aspectRatioHint);
    _selectBtn = ((ImageButton)findViewById(R.id.assetview_assetgrid_assetcell_selectbtn));
    TextView localTextView = _titleView;
    if (hasTitleView()) {}
    for (int i = 0;; i = 8)
    {
      localTextView.setVisibility(i);
      return;
    }
  }
  
  protected boolean hasTitleView()
  {
    return true;
  }
  
  protected boolean providesSelection()
  {
    return true;
  }
}
