package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import com.behance.sdk.R.dimen;
import com.behance.sdk.R.id;
import com.behance.sdk.R.integer;
import com.behance.sdk.R.layout;
import com.behance.sdk.project.modules.ImageModule;
import java.util.List;

public class BehanceSDKAlbumImageGridArrayAdapter
  extends ArrayAdapter<ImageModule>
{
  private int imageHeight;
  private LayoutInflater layoutInflater;
  private List<ImageModule> selectedImageModulesList;
  private int selectionIndicatorHeight;
  
  public BehanceSDKAlbumImageGridArrayAdapter(Context paramContext, List<ImageModule> paramList)
  {
    super(paramContext, R.layout.bsdk_adapter_album_image_view_grid_item, paramList);
    layoutInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
    imageHeight = computeImageHeight();
    selectionIndicatorHeight = computeSelectionIndicatorHeight();
  }
  
  private int computeImageHeight()
  {
    Resources localResources = getContext().getResources();
    int i = localResources.getDimensionPixelSize(R.dimen.bsdk_image_selector_view_album_image_grid_left_right_padding);
    int j = localResources.getDimensionPixelSize(R.dimen.bsdk_image_selector_view_album_image_grid_item_margin);
    int k = localResources.getInteger(R.integer.bsdk_image_selection_fragment_grid_col_count);
    int m = localResources.getDimensionPixelSize(R.dimen.bsdk_image_selector_view_adapter_bg_stroke_width);
    return (getDisplayMetricswidthPixels - i * 2 - (k - 1) * j) / k - m * 2;
  }
  
  private int computeSelectionIndicatorHeight()
  {
    int i = getContext().getResources().getDimensionPixelSize(R.dimen.bsdk_image_selector_view_adapter_bg_stroke_width);
    return imageHeight + i * 2;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i;
    ImageView localImageView;
    View localView;
    if (paramView == null)
    {
      paramView = layoutInflater.inflate(R.layout.bsdk_adapter_album_image_view_grid_item, paramViewGroup, false);
      i = 0;
      localImageView = (ImageView)paramView.findViewById(R.id.bsdkAlbumImageAdapterThumbnailImageView);
      localView = paramView.findViewById(R.id.bsdkAlbumImageAdapterSelectionIndicator);
      if (i != 0) {
        localImageView.setImageDrawable(null);
      }
      paramViewGroup = localImageView.getLayoutParams();
      if (paramViewGroup == null) {
        break label160;
      }
      height = imageHeight;
      label70:
      localImageView.setLayoutParams(paramViewGroup);
      paramViewGroup = localView.getLayoutParams();
      if (paramViewGroup == null) {
        break label176;
      }
      height = selectionIndicatorHeight;
    }
    for (;;)
    {
      localView.setLayoutParams(paramViewGroup);
      paramViewGroup = (ImageModule)getItem(paramInt);
      if (paramViewGroup != null)
      {
        localImageView.setImageBitmap(paramViewGroup.getThumbNail(getContext()));
        if ((selectedImageModulesList == null) || (!selectedImageModulesList.contains(paramViewGroup))) {
          break label192;
        }
        localView.setVisibility(0);
      }
      return paramView;
      i = 1;
      break;
      label160:
      paramViewGroup = new RelativeLayout.LayoutParams(-1, imageHeight);
      break label70;
      label176:
      paramViewGroup = new RelativeLayout.LayoutParams(-1, selectionIndicatorHeight);
    }
    label192:
    localView.setVisibility(4);
    return paramView;
  }
  
  public void setSelectedImageModulesList(List<ImageModule> paramList)
  {
    selectedImageModulesList = paramList;
  }
}
