package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.behance.sdk.R.color;
import com.behance.sdk.R.dimen;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.enums.BehanceSDKCreativeFieldCategory;
import com.behance.sdk.google.listview.SectionalBaseAdapter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class BehanceSDKCreativeFieldFilterAdapter
  extends SectionalBaseAdapter
{
  Map<String, List<BehanceSDKCreativeFieldDTO>> all;
  private final Context context;
  private int pinnedHeaderViewLeftPadding;
  private List<BehanceSDKCreativeFieldDTO> selectedField;
  
  public BehanceSDKCreativeFieldFilterAdapter(Context paramContext, List<BehanceSDKCreativeFieldDTO> paramList1, List<BehanceSDKCreativeFieldDTO> paramList2)
  {
    context = paramContext;
    selectedField = paramList2;
    initializeHeaderViewPadding();
    initalizeData(paramList1, paramList2);
  }
  
  private String getStartingAlphabet(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {
      return String.valueOf(paramString.charAt(0));
    }
    return null;
  }
  
  private void initalizeData(List<BehanceSDKCreativeFieldDTO> paramList1, List<BehanceSDKCreativeFieldDTO> paramList2)
  {
    all = new LinkedHashMap();
    all.put(BehanceSDKCreativeFieldCategory.POPULAR.getString(context), new ArrayList());
    Iterator localIterator = paramList1.iterator();
    while (localIterator.hasNext())
    {
      BehanceSDKCreativeFieldDTO localBehanceSDKCreativeFieldDTO = (BehanceSDKCreativeFieldDTO)localIterator.next();
      String str = getStartingAlphabet(localBehanceSDKCreativeFieldDTO.getName());
      paramList2 = (List)all.get(str);
      paramList1 = paramList2;
      if (paramList2 == null)
      {
        paramList1 = new ArrayList();
        all.put(str, paramList1);
      }
      paramList1.add(localBehanceSDKCreativeFieldDTO);
      paramList1 = localBehanceSDKCreativeFieldDTO.getCategory();
      if (paramList1 != BehanceSDKCreativeFieldCategory.NONE)
      {
        str = paramList1.getString(context);
        paramList2 = (List)all.get(str);
        paramList1 = paramList2;
        if (paramList2 == null)
        {
          paramList1 = new ArrayList();
          all.put(str, paramList1);
        }
        paramList1.add(localBehanceSDKCreativeFieldDTO);
      }
    }
  }
  
  private void initializeHeaderViewPadding()
  {
    pinnedHeaderViewLeftPadding = context.getResources().getDimensionPixelSize(R.dimen.bsdk_search_filter_creative_field_left_padding);
  }
  
  private void setSelected(TextView paramTextView, ImageView paramImageView)
  {
    paramImageView.setVisibility(0);
    paramTextView.setTextColor(context.getResources().getColor(R.color.bsdk_search_filter_creative_fields_dialog_selected_text_color));
  }
  
  private void setUnselected(TextView paramTextView, ImageView paramImageView)
  {
    paramTextView.setTextColor(context.getResources().getColor(R.color.bsdk_search_filter_creative_fields_dialog_text_color));
    paramImageView.setVisibility(8);
  }
  
  protected void bindSectionHeader(View paramView, int paramInt, boolean paramBoolean)
  {
    View localView = paramView.findViewById(R.id.bsdkCreativeFieldGroupHeader);
    paramView = paramView.findViewById(R.id.bsdkCreativeFieldGroupItemDivider);
    if (paramBoolean)
    {
      localView.setVisibility(0);
      paramView.setVisibility(4);
      ((TextView)localView).setText(getSections()[getSectionForPosition(paramInt)]);
      return;
    }
    paramView.setVisibility(0);
    localView.setVisibility(8);
  }
  
  public void configurePinnedHeader(View paramView, int paramInt1, int paramInt2)
  {
    paramView = (TextView)paramView;
    paramView.setText(getSections()[getSectionForPosition(paramInt1)]);
    paramView.setPadding(pinnedHeaderViewLeftPadding, paramView.getPaddingTop(), paramView.getPaddingRight(), paramView.getPaddingBottom());
  }
  
  public View getAmazingView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject1 = paramView;
    Object localObject2 = (LayoutInflater)context.getSystemService("layout_inflater");
    paramView = (View)localObject1;
    if (localObject1 == null) {
      paramView = ((LayoutInflater)localObject2).inflate(R.layout.bsdk_adapter_publish_project_creative_field_item, paramViewGroup, false);
    }
    paramViewGroup = (TextView)paramView.findViewById(R.id.bsdkCreativeFieldFilterDialogItemTxtView);
    localObject1 = (ImageView)paramView.findViewById(R.id.bsdkCreativeFieldFilterDialogItemSelectedIdicatorImageView);
    localObject2 = paramView.findViewById(R.id.bsdkCreativeFieldGroupItemDivider);
    BehanceSDKCreativeFieldDTO localBehanceSDKCreativeFieldDTO = getItem(paramInt);
    paramViewGroup.setText(localBehanceSDKCreativeFieldDTO.getName());
    String str = localBehanceSDKCreativeFieldDTO.getId();
    if (selectedField.contains(localBehanceSDKCreativeFieldDTO)) {
      setSelected(paramViewGroup, (ImageView)localObject1);
    }
    while (str.equals("ALL_CREATIVE_FIELDS_ID"))
    {
      ((View)localObject2).setVisibility(8);
      if (selectedField.isEmpty()) {
        setSelected(paramViewGroup, (ImageView)localObject1);
      }
      return paramView;
      setUnselected(paramViewGroup, (ImageView)localObject1);
    }
    ((View)localObject2).setVisibility(0);
    return paramView;
  }
  
  public int getCount()
  {
    int i = 0;
    Iterator localIterator = all.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      i += ((List)all.get(str)).size();
    }
    return i;
  }
  
  public BehanceSDKCreativeFieldDTO getItem(int paramInt)
  {
    int i = 0;
    Iterator localIterator = all.keySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (String)localIterator.next();
      localObject = (List)all.get(localObject);
      if ((paramInt >= i) && (paramInt < ((List)localObject).size() + i)) {
        return (BehanceSDKCreativeFieldDTO)((List)localObject).get(paramInt - i);
      }
      i += ((List)localObject).size();
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getPositionForSection(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    Set localSet = all.keySet();
    paramInt = i;
    if (i >= localSet.size()) {
      paramInt = localSet.size() - 1;
    }
    int j = 0;
    Iterator localIterator = localSet.iterator();
    i = 0;
    while (i < localSet.size())
    {
      if (paramInt == i) {
        return j;
      }
      String str = (String)localIterator.next();
      j += ((List)all.get(str)).size();
      i += 1;
    }
    return 0;
  }
  
  public int getSectionForPosition(int paramInt)
  {
    int j = 0;
    Set localSet = all.keySet();
    Iterator localIterator = localSet.iterator();
    int i = 0;
    while (i < localSet.size())
    {
      Object localObject = (String)localIterator.next();
      localObject = (List)all.get(localObject);
      if ((paramInt >= j) && (paramInt < ((List)localObject).size() + j)) {
        return i;
      }
      j += ((List)localObject).size();
      i += 1;
    }
    return -1;
  }
  
  public String[] getSections()
  {
    Set localSet = all.keySet();
    return (String[])localSet.toArray(new String[localSet.size()]);
  }
  
  protected void onNextPageRequested(int paramInt) {}
}
