package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.dto.BehanceSDKWIPDTO;
import com.behance.sdk.dto.BehanceSDKWIPDTO.WIPRevisionImageType;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.List;

public class BehanceSDKWIPListAdapter
  extends BaseAdapter
{
  private DisplayImageOptions imageLoaderOptions;
  private ImageLoader imageloader;
  private LayoutInflater inflater;
  private int selectedWIPId;
  private List<BehanceSDKWIPDTO> wipsList;
  
  public BehanceSDKWIPListAdapter(Context paramContext, List<BehanceSDKWIPDTO> paramList, int paramInt)
  {
    wipsList = paramList;
    setSelectedWIPId(paramInt);
    inflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
    imageLoaderOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(false).cacheOnDisk(false).showImageOnFail(17301624).build();
    imageloader = ImageLoader.getInstance();
  }
  
  public int getCount()
  {
    if (wipsList != null) {
      return wipsList.size();
    }
    return 0;
  }
  
  public BehanceSDKWIPDTO getItem(int paramInt)
  {
    if (wipsList != null) {
      return (BehanceSDKWIPDTO)wipsList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getSelectedWIPId()
  {
    return selectedWIPId;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = 0;
    if (paramView == null) {
      paramView = inflater.inflate(R.layout.bsdk_adapter_wip_list_view_item, paramViewGroup, false);
    }
    View localView;
    for (;;)
    {
      paramViewGroup = getItem(paramInt);
      if (paramViewGroup != null)
      {
        Object localObject = (TextView)paramView.findViewById(R.id.bsdkWIPItemAdapterWIPNameTextView);
        ImageView localImageView = (ImageView)paramView.findViewById(R.id.bsdkWIPItemAdapterWIPThumbnailImageView);
        localView = paramView.findViewById(R.id.bsdkWIPItemAdapterWIPSelectedIndicator);
        if (i != 0) {
          localImageView.setImageDrawable(null);
        }
        ((TextView)localObject).setText(paramViewGroup.getTitle());
        localObject = paramViewGroup.getLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMBNAIL_SM);
        if ((localObject != null) && (((String)localObject).length() > 0)) {
          imageloader.displayImage((String)localObject, localImageView, imageLoaderOptions);
        }
        if ((paramViewGroup.getId() <= 0) || (paramViewGroup.getId() != getSelectedWIPId())) {
          break;
        }
        localView.setVisibility(0);
      }
      return paramView;
      i = 1;
    }
    localView.setVisibility(4);
    return paramView;
  }
  
  public void setSelectedWIPId(int paramInt)
  {
    selectedWIPId = paramInt;
  }
}
