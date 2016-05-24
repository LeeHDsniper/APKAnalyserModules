package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;

public class AdobeAssetViewSectionalListViewAssetViewCell
  extends AdobeAssetViewListBaseCellView
{
  public AdobeAssetViewSectionalListViewAssetViewCell() {}
  
  protected void handleOnFinishInflate()
  {
    _titleView = ((TextView)findViewById(R.id.assetview_assetlist_assetcell_title));
    _imageViewAssetPicture = ((ImageView)findViewById(R.id.assetview_assetlist_assetcell_imageView));
    _selectBtn = ((ImageButton)findViewById(R.id.assetview_assetlist_assetcell_selectbtn));
  }
  
  protected boolean providesSelection()
  {
    return true;
  }
}
