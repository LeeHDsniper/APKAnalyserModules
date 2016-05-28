package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import java.util.List;

public class BehanceSDKAdobeCloudSelectionListItemAdapter
  extends BaseAdapter
{
  private List<AdobeCloud> cloudsList;
  private LayoutInflater inflater;
  private AdobeCloud selectedCloud;
  
  public BehanceSDKAdobeCloudSelectionListItemAdapter(Context paramContext, List<AdobeCloud> paramList, AdobeCloud paramAdobeCloud)
  {
    cloudsList = paramList;
    setSelectedCloud(paramAdobeCloud);
    inflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
  }
  
  public int getCount()
  {
    if (cloudsList != null) {
      return cloudsList.size();
    }
    return 0;
  }
  
  public AdobeCloud getItem(int paramInt)
  {
    if (cloudsList != null) {
      return (AdobeCloud)cloudsList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public AdobeCloud getSelectedCloud()
  {
    return selectedCloud;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView == null) {
      paramView = inflater.inflate(R.layout.bsdk_adapter_adobe_cloud_selection_list_item, paramViewGroup, false);
    }
    View localView;
    for (;;)
    {
      paramViewGroup = getItem(paramInt);
      if (paramViewGroup != null)
      {
        Object localObject = (TextView)paramView.findViewById(R.id.bsdkCloudSelectionItemAdapterCloudNameTextView);
        localView = paramView.findViewById(R.id.bsdkCloudSelectionItemAdapterSelectedIndicator);
        ((TextView)localObject).setText(paramViewGroup.getName());
        localObject = getSelectedCloud();
        if ((localObject == null) || (((AdobeCloud)localObject).getName() == null) || (!((AdobeCloud)localObject).getName().equals(paramViewGroup.getName()))) {
          break;
        }
        localView.setVisibility(0);
      }
      return paramView;
    }
    localView.setVisibility(4);
    return paramView;
  }
  
  public void setSelectedCloud(AdobeCloud paramAdobeCloud)
  {
    selectedCloud = paramAdobeCloud;
  }
}
