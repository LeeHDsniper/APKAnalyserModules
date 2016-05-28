package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import android.os.Build.VERSION;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewUtils;
import com.etsy.android.grid.util.DynamicHeightImageView;

public class AdobeUploadAssetCellViews
{
  public static class AdobeUploadAssetGridCellView
    extends AdobeAssetViewListBaseUploadAssetCellView
  {
    public AdobeUploadAssetGridCellView() {}
    
    protected void addProgressBarChildRule(RelativeLayout.LayoutParams paramLayoutParams)
    {
      if (Build.VERSION.SDK_INT > 17)
      {
        super.addProgressBarChildRule(paramLayoutParams);
        return;
      }
      paramLayoutParams.addRule(8, R.id.assetview_assetgrid_assetcell_selectbtn);
    }
    
    protected RelativeLayout getProgressBarContainer()
    {
      return (RelativeLayout)getRootView().findViewById(R.id.assetview_assetgrid_assetcell_imageContainer);
    }
  }
  
  public static class AdobeUploadAssetListCellView
    extends AdobeAssetViewListBaseUploadAssetCellView
  {
    public AdobeUploadAssetListCellView() {}
    
    protected RelativeLayout getProgressBarContainer()
    {
      return (RelativeLayout)getRootView().findViewById(R.id.assetview_assetlist_assetcell_root);
    }
    
    protected void handleOnFinishInflate()
    {
      _titleView = ((TextView)findViewById(R.id.assetview_assetlist_assetcell_title));
      _imageViewAssetPicture = ((ImageView)findViewById(R.id.assetview_assetlist_assetcell_imageView));
      _selectBtn = ((ImageButton)findViewById(R.id.assetview_assetlist_assetcell_selectbtn));
      LinearLayout localLinearLayout = (LinearLayout)getRootView().findViewById(R.id.assetview_assetlist_assetcell_container);
      localLinearLayout.removeView(_imageViewAssetPicture);
      DynamicHeightImageView localDynamicHeightImageView = new DynamicHeightImageView(getRootView().getContext());
      localDynamicHeightImageView.setScaleType(ImageView.ScaleType.CENTER);
      int i = AdobeAssetViewUtils.convertDpToPx(44);
      localDynamicHeightImageView.setLayoutParams(new LinearLayout.LayoutParams(i, i));
      localLinearLayout.addView(localDynamicHeightImageView, 1);
      _imageViewAssetPicture = localDynamicHeightImageView;
      forceAspectRatio(1.0F);
      createAttachProgressBarToView();
    }
  }
}
