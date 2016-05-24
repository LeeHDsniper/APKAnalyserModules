package com.behance.sdk.ui.fragments;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.behance.sdk.R.bool;
import com.behance.sdk.R.dimen;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.style;
import com.behance.sdk.datamanager.FiltersDataManager;
import com.behance.sdk.datamanager.listeners.interfaces.IFiltersDataManagerListener;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.google.listview.SectionalListView;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager;
import com.behance.sdk.ui.adapters.BehanceSDKCreativeFieldFilterAdapter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKCreativeFieldsFilterDialog
  extends DialogFragment
  implements IFiltersDataManagerListener
{
  private Callbacks callbacks;
  private Context context;
  private View progressSpinner;
  private View rootView;
  private BehanceSDKCreativeFieldFilterAdapter sectionalAdapter;
  private int selectable_field_count = -1;
  private List<BehanceSDKCreativeFieldDTO> selectedFields;
  
  public BehanceSDKCreativeFieldsFilterDialog()
  {
    FiltersDataManager.getInstance().addListener(this);
  }
  
  private void handleCreativeFieldSelection(AdapterView<?> paramAdapterView, int paramInt)
  {
    paramAdapterView = paramAdapterView.getItemAtPosition(paramInt);
    if ((paramAdapterView instanceof BehanceSDKCreativeFieldDTO))
    {
      paramAdapterView = (BehanceSDKCreativeFieldDTO)paramAdapterView;
      if (!selectedFields.contains(paramAdapterView)) {
        break label50;
      }
      selectedFields.remove(paramAdapterView);
    }
    for (;;)
    {
      sectionalAdapter.notifyDataSetChanged();
      return;
      label50:
      if ((selectable_field_count < 0) || (selectedFields.size() < selectable_field_count))
      {
        selectedFields.add(paramAdapterView);
        if (selectedFields.size() == selectable_field_count) {
          notifyListenersAndCloseDialog();
        }
      }
    }
  }
  
  private void hideProgressSpinner()
  {
    progressSpinner.setVisibility(4);
  }
  
  private void notifyListenersAndCloseDialog()
  {
    if (callbacks != null) {
      callbacks.onCreativeFieldsSelected(selectedFields);
    }
    getDialog().dismiss();
  }
  
  private void populateListView(List<BehanceSDKCreativeFieldDTO> paramList, LayoutInflater paramLayoutInflater)
  {
    if (rootView != null)
    {
      hideProgressSpinner();
      SectionalListView localSectionalListView = (SectionalListView)rootView.findViewById(R.id.bsdkPublishProjectcreativeFieldFilterDialogSectionalListView);
      localSectionalListView.setPinnedHeaderView(paramLayoutInflater.inflate(R.layout.bsdk_adapter_publish_project_creative_field_item_header, localSectionalListView, false));
      sectionalAdapter = new BehanceSDKCreativeFieldFilterAdapter(context, paramList, selectedFields);
      localSectionalListView.setAdapter(sectionalAdapter);
      localSectionalListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          BehanceSDKCreativeFieldsFilterDialog.this.handleCreativeFieldSelection(paramAnonymousAdapterView, paramAnonymousInt);
        }
      });
    }
  }
  
  private void showProgressSpinner()
  {
    progressSpinner.setVisibility(0);
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    context = paramActivity;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(2, R.style.BsdkFilterDialogTheme);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      selectedFields = ((List)paramBundle.getSerializable("BUNDLE_KEY_FIELD_ID"));
      selectable_field_count = paramBundle.getInt("BUNDLE_KEY_SELECTABLE_FIELD_COUNT", -1);
    }
    if (selectedFields == null) {
      selectedFields = new ArrayList();
    }
    rootView = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_creative_field_filter, paramViewGroup, false);
    rootView.findViewById(R.id.bsdkPublishProjectcreativeFieldFilterDialogHeaderLayout).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        dismiss();
      }
    });
    progressSpinner = rootView.findViewById(R.id.bsdkPublishProjectcreativeFieldFilterDialogProgressSpinner);
    paramLayoutInflater = FiltersDataManager.getInstance();
    if (!paramLayoutInflater.isLoadCreativeFieldsTaskInProgress())
    {
      showProgressSpinner();
      paramLayoutInflater.loadCreativeFields(BehanceSDKProjectPublishWFManager.getInstance().getUserCredentials());
    }
    rootView.findViewById(R.id.bsdkPublishProjectcreativeFieldFilterDialogCloseDialogBtnBottom).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKCreativeFieldsFilterDialog.this.notifyListenersAndCloseDialog();
        dismiss();
      }
    });
    return rootView;
  }
  
  public void onCreativeFieldsLoadingFailure(Exception paramException) {}
  
  public void onCreativeFieldsLoadingSuccess(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    populateListView(paramList, LayoutInflater.from(context));
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (selectedFields != null) {
      paramBundle.putSerializable("BUNDLE_KEY_FIELD_ID", (Serializable)selectedFields);
    }
    paramBundle.putInt("BUNDLE_KEY_SELECTABLE_FIELD_COUNT", selectable_field_count);
  }
  
  public void onStart()
  {
    super.onStart();
    if ((getDialog() != null) && (getActivity() != null))
    {
      if (getActivity().getResources().getBoolean(R.bool.bsdk_big_screen))
      {
        i = getActivity().getResources().getDimensionPixelSize(R.dimen.global_filter_dialog_width);
        j = getActivity().getResources().getDimensionPixelSize(R.dimen.global_filter_dialog_height);
        getDialog().getWindow().setLayout(i, j);
      }
    }
    else {
      return;
    }
    int i = getResources().getDimensionPixelOffset(R.dimen.bsdk_creative_field_dialog_vertical_padding);
    int j = getResources().getDimensionPixelOffset(R.dimen.bsdk_creative_field_dialog_horizontal_padding);
    DisplayMetrics localDisplayMetrics = getResources().getDisplayMetrics();
    int k = heightPixels;
    int m = widthPixels;
    getDialog().getWindow().setLayout(m - j, k - i);
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public void setSelectableFieldCount(int paramInt)
  {
    selectable_field_count = paramInt;
  }
  
  public void setSelectedCreativeField(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    if (paramList != null)
    {
      selectedFields = new ArrayList();
      selectedFields.addAll(paramList);
    }
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onCreativeFieldsSelected(List<BehanceSDKCreativeFieldDTO> paramList);
  }
}
