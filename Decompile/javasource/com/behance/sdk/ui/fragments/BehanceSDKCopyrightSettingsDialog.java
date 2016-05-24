package com.behance.sdk.ui.fragments;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
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
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.google.listview.SectionalListView;
import com.behance.sdk.ui.adapters.BehanceSDKCopyrightSettingsAdapter;

public class BehanceSDKCopyrightSettingsDialog
  extends DialogFragment
{
  private Callbacks callbacks;
  private Context context;
  private View rootView;
  private BehanceSDKCopyrightSettingsAdapter sectionalAdapter;
  private BehanceSDKCopyrightOption selectedCopyrightSetting;
  
  public BehanceSDKCopyrightSettingsDialog() {}
  
  private void handleCopyrightSettingSelection(AdapterView<?> paramAdapterView, int paramInt)
  {
    selectedCopyrightSetting = ((BehanceSDKCopyrightOption)paramAdapterView.getItemAtPosition(paramInt));
    sectionalAdapter.setSelectedCopyRight(selectedCopyrightSetting);
    sectionalAdapter.notifyDataSetChanged();
    notifyListenersAndCloseDialog();
  }
  
  private void notifyListenersAndCloseDialog()
  {
    if (callbacks != null) {
      callbacks.onCopyrightSettingSelected(selectedCopyrightSetting);
    }
    getDialog().dismiss();
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
      selectedCopyrightSetting = BehanceSDKCopyrightOption.getCopyrightOptionFromValue(paramBundle.getString("BUNDLE_KEY_COPYRIGHT_ID", ""));
      if (selectedCopyrightSetting == null) {
        selectedCopyrightSetting = BehanceSDKCopyrightOption.getDefaultValue();
      }
    }
    rootView = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_copyright_settings, paramViewGroup, false);
    rootView.findViewById(R.id.bsdkPublishProjectCopyrightSettingsDialogHeaderLayout).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        dismiss();
      }
    });
    paramViewGroup = (SectionalListView)rootView.findViewById(R.id.bsdkPublishProjectCopyrightSettingsDialogSectionalListView);
    paramViewGroup.setPinnedHeaderView(paramLayoutInflater.inflate(R.layout.bsdk_adapter_publish_project_copyright_settings_item_header, paramViewGroup, false));
    sectionalAdapter = new BehanceSDKCopyrightSettingsAdapter(context, selectedCopyrightSetting);
    paramViewGroup.setAdapter(sectionalAdapter);
    paramViewGroup.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        BehanceSDKCopyrightSettingsDialog.this.handleCopyrightSettingSelection(paramAnonymousAdapterView, paramAnonymousInt);
      }
    });
    return rootView;
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (selectedCopyrightSetting != null) {
      paramBundle.putString("BUNDLE_KEY_COPYRIGHT_ID", selectedCopyrightSetting.getValue());
    }
  }
  
  public void onStart()
  {
    super.onStart();
    if ((getDialog() != null) && (getActivity() != null) && (getActivity().getResources().getBoolean(R.bool.bsdk_big_screen)))
    {
      int i = getActivity().getResources().getDimensionPixelSize(R.dimen.global_filter_dialog_width);
      int j = getActivity().getResources().getDimensionPixelSize(R.dimen.global_filter_dialog_height);
      getDialog().getWindow().setLayout(i, j);
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public void setSelectedCopyright(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption)
  {
    selectedCopyrightSetting = paramBehanceSDKCopyrightOption;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onCopyrightSettingSelected(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption);
  }
}
