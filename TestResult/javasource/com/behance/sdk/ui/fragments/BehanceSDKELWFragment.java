package com.behance.sdk.ui.fragments;

import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.R.style;

public class BehanceSDKELWFragment
  extends DialogFragment
{
  private ImageView backButton;
  private EnterpriseUserWarningDialogCallbacks callbacks;
  private View cancelButton;
  private View continueButton;
  private View rootView;
  
  public BehanceSDKELWFragment() {}
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(2, R.style.BsdkEnterpriseLoginWarningTheme);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    rootView = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_enterprise_login_warning_for_publish, paramViewGroup, false);
    continueButton = rootView.findViewById(R.id.bsdkEnterpriseLoginWarningContinueButton);
    cancelButton = rootView.findViewById(R.id.bsdkEnterpriseLoginWarningCancelButton);
    backButton = ((ImageView)rootView.findViewById(R.id.bsdkPublishProjectTitlebarBackBtnImageView));
    continueButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        dismiss();
        if (callbacks != null) {
          callbacks.onContinueButtonPressed();
        }
      }
    });
    cancelButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        dismiss();
        if (callbacks != null) {
          callbacks.onCancelButtonPressed();
        }
      }
    });
    backButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        dismiss();
        if (callbacks != null) {
          callbacks.onBackButtonPressed();
        }
      }
    });
    ((TextView)rootView.findViewById(R.id.bsdkPublishProjectTitlebarTitleTxtView)).setText(R.string.bsdk_enterprise_login_warning_actionbar_title);
    rootView.findViewById(R.id.bsdkPublishProjectTitlebarActionBtnTxtView).setVisibility(8);
    return rootView;
  }
  
  public void setCallbacks(EnterpriseUserWarningDialogCallbacks paramEnterpriseUserWarningDialogCallbacks)
  {
    callbacks = paramEnterpriseUserWarningDialogCallbacks;
  }
  
  public static abstract interface EnterpriseUserWarningDialogCallbacks
  {
    public abstract void onBackButtonPressed();
    
    public abstract void onCancelButtonPressed();
    
    public abstract void onContinueButtonPressed();
  }
}
