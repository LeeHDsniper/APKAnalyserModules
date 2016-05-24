package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.behance.sdk.R.color;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.dto.location.BehanceSDKLocationDTO;
import java.util.List;

public class BehanceSDKLocationFilterListItemArrayAdapter<T>
  extends ArrayAdapter<T>
{
  private final Context context;
  private final List<T> data;
  private BehanceSDKLocationDTO selectedLocationDTO;
  
  public BehanceSDKLocationFilterListItemArrayAdapter(Context paramContext, BehanceSDKLocationDTO paramBehanceSDKLocationDTO, List<T> paramList)
  {
    super(paramContext, R.layout.bsdk_dialog_fragment_location_filter_item_adapter, paramList);
    context = paramContext;
    setSelectedLocationDTO(paramBehanceSDKLocationDTO);
    data = paramList;
  }
  
  public BehanceSDKLocationDTO getSelectedLocationDTO()
  {
    return selectedLocationDTO;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(R.layout.bsdk_dialog_fragment_location_filter_item_adapter, paramViewGroup, false);
    paramViewGroup = (TextView)paramView.findViewById(R.id.bsdkLocationFilterDialogLocationItemTxtView);
    View localView = paramView.findViewById(R.id.bsdkLocationFilterDialogLocationItemSelectedIdicatorImageView);
    Object localObject = data.get(paramInt);
    if ((localObject instanceof BehanceSDKLocationDTO))
    {
      localObject = (BehanceSDKLocationDTO)localObject;
      paramViewGroup.setText(((BehanceSDKLocationDTO)localObject).getDisplayName());
      if ((getSelectedLocationDTO() != null) && (getSelectedLocationDTO().getDisplayName().equals(((BehanceSDKLocationDTO)localObject).getDisplayName())))
      {
        paramViewGroup.setTextColor(context.getResources().getColor(R.color.bsdk_adobe_blue));
        localView.setVisibility(0);
      }
    }
    else
    {
      return paramView;
    }
    paramViewGroup.setTextColor(context.getResources().getColor(R.color.bsdk_location_filter_dialog_location_item_txt_color));
    localView.setVisibility(4);
    return paramView;
  }
  
  public void setSelectedLocationDTO(BehanceSDKLocationDTO paramBehanceSDKLocationDTO)
  {
    selectedLocationDTO = paramBehanceSDKLocationDTO;
  }
}
