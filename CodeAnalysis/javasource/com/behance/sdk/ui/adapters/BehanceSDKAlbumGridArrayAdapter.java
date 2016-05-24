package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.behance.sdk.R.dimen;
import com.behance.sdk.R.drawable;
import com.behance.sdk.R.id;
import com.behance.sdk.R.integer;
import com.behance.sdk.R.layout;
import com.behance.sdk.dto.BehanceSDKAlbumDTO;
import com.behance.sdk.enums.BehanceSDKAlbumType;
import java.util.List;

public class BehanceSDKAlbumGridArrayAdapter
  extends ArrayAdapter<BehanceSDKAlbumDTO>
{
  private int albumCoverImageHeight;
  private int albumNameContainerHeight;
  private LayoutInflater layoutInflater;
  
  public BehanceSDKAlbumGridArrayAdapter(Context paramContext, List<BehanceSDKAlbumDTO> paramList)
  {
    super(paramContext, R.layout.bsdk_adapter_album_grid_item, paramList);
    layoutInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
    albumCoverImageHeight = computeAlbumCoverImageHeight();
    albumNameContainerHeight = ((int)(albumCoverImageHeight * 0.25D));
  }
  
  private int computeAlbumCoverImageHeight()
  {
    Resources localResources = getContext().getResources();
    int i = localResources.getDimensionPixelSize(R.dimen.bsdk_image_selector_view_album_grid_left_right_padding);
    int j = localResources.getDimensionPixelSize(R.dimen.bsdk_image_selector_view_album_grid_item_margin);
    int k = localResources.getInteger(R.integer.bsdk_album_selector_fragment_grid_col_count);
    int m = localResources.getDimensionPixelSize(R.dimen.bsdk_image_selector_view_adapter_bg_stroke_width);
    return (getDisplayMetricswidthPixels - i * 2 - (k - 1) * j) / k - m * 2;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i;
    ImageView localImageView;
    TextView localTextView;
    int j;
    if (paramView == null)
    {
      paramView = layoutInflater.inflate(R.layout.bsdk_adapter_album_grid_item, paramViewGroup, false);
      i = 0;
      paramViewGroup = (BehanceSDKAlbumDTO)getItem(paramInt);
      localImageView = (ImageView)paramView.findViewById(R.id.bsdkAlbumGridAdapterCoverImageView);
      localTextView = (TextView)paramView.findViewById(R.id.bsdkAlbumGridAdapterAlbumNameTxtView);
      if (i != 0) {
        localImageView.setImageBitmap(null);
      }
      i = albumCoverImageHeight;
      j = albumNameContainerHeight;
      paramInt = i;
      if (paramViewGroup != null)
      {
        Context localContext = getContext();
        if (paramViewGroup.getAlbumType() != BehanceSDKAlbumType.DEVICE_ALBUM) {
          break label187;
        }
        localImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        localImageView.setImageBitmap(paramViewGroup.getCoverBitmap(localContext));
        localTextView.setText(paramViewGroup.getName());
        localTextView.setVisibility(0);
        paramInt = i;
      }
      label136:
      paramViewGroup = localImageView.getLayoutParams();
      if (paramViewGroup == null) {
        break label274;
      }
      height = paramInt;
      label151:
      localImageView.setLayoutParams(paramViewGroup);
      paramViewGroup = localTextView.getLayoutParams();
      if (paramViewGroup == null) {
        break label287;
      }
      height = j;
    }
    for (;;)
    {
      localTextView.setLayoutParams(paramViewGroup);
      return paramView;
      i = 1;
      break;
      label187:
      if (paramViewGroup.getAlbumType() == BehanceSDKAlbumType.CAMERA)
      {
        paramInt = i + j;
        localImageView.setScaleType(ImageView.ScaleType.CENTER);
        localImageView.setImageResource(R.drawable.bsdk_icon_adapter_album_camera_type_indicator);
        localTextView.setVisibility(8);
        break label136;
      }
      paramInt = i;
      if (paramViewGroup.getAlbumType() != BehanceSDKAlbumType.CREATIVE_CLOUD) {
        break label136;
      }
      paramInt = i + j;
      localImageView.setScaleType(ImageView.ScaleType.CENTER);
      localImageView.setImageResource(R.drawable.bsdk_icon_adapter_album_cloud_type_indicator);
      localTextView.setVisibility(8);
      break label136;
      label274:
      paramViewGroup = new RelativeLayout.LayoutParams(-1, paramInt);
      break label151;
      label287:
      paramViewGroup = new RelativeLayout.LayoutParams(-1, j);
    }
  }
}
