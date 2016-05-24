package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeAssetBrowserActionBarController;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageSessionQuotaCallback;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;

public class AdobeStorageSettingsFragment
  extends Fragment
{
  private LinearLayout _editCCSettings;
  private boolean _fragmentStopped;
  private LinearLayout _switchAccounts;
  
  public AdobeStorageSettingsFragment() {}
  
  private void OpenURLinBrowser(View paramView, String paramString)
  {
    try
    {
      startActivity(new Intent("android.intent.action.VIEW", Uri.parse(paramString)));
      return;
    }
    catch (ActivityNotFoundException paramView) {}
  }
  
  private void getUserAccountInfo(final View paramView)
  {
    Object localObject = AdobeUXAuthManager.getSharedAuthManager().getUserProfile();
    String str = ((AdobeAuthUserProfile)localObject).getDisplayName();
    ((TextView)paramView.findViewById(R.id.storage_settings_userName)).setText(str);
    ((TextView)paramView.findViewById(R.id.storage_settings_userEmailId)).setText(((AdobeAuthUserProfile)localObject).getEmail());
    localObject = (AdobeCloud)getArguments().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY);
    if (((AdobeCloud)localObject).isQuotaEnabled()) {
      ((AdobeStorageSession)((AdobeCloud)localObject).getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypeStorage)).getQuotaInformationOnCompletion(new IAdobeStorageSessionQuotaCallback()new Handler
      {
        public void onCompletion(Number paramAnonymousNumber1, Number paramAnonymousNumber2, Number paramAnonymousNumber3)
        {
          if (_fragmentStopped) {}
          while ((paramAnonymousNumber1 == null) || (paramAnonymousNumber2 == null) || (paramAnonymousNumber3 == null)) {
            return;
          }
          paramAnonymousNumber2 = (TextView)paramView.findViewById(R.id.storage_settings_storageUsage);
          double d2 = 100.0D * (paramAnonymousNumber1.doubleValue() / paramAnonymousNumber3.doubleValue());
          double d1 = d2;
          if (d2 > 100.0D) {
            d1 = 100.0D;
          }
          d2 = d1;
          if (d1 < 0.0D) {
            d2 = 0.0D;
          }
          String str = getString(R.string.storage_settings_storage_usage);
          paramAnonymousNumber1 = String.format("%.2f", new Object[] { Double.valueOf(paramAnonymousNumber1.doubleValue()) });
          paramAnonymousNumber3 = String.format("%.2f", new Object[] { Double.valueOf(paramAnonymousNumber3.doubleValue()) });
          paramAnonymousNumber2.setText(String.format(str, new Object[] { String.format("%.2f%%", new Object[] { Double.valueOf(d2) }), paramAnonymousNumber1, paramAnonymousNumber3 }));
        }
        
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException) {}
      }, new Handler());
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setHasOptionsMenu(false);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
    paramMenu.clear();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramBundle = (AdobeCloud)getArguments().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY);
    AdobeAssetBrowserActionBarController.setTitle(getResources().getString(R.string.adobe_uxassetbrowser_myacount), paramBundle);
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_storage_settings_fragment, paramViewGroup, false);
    setHasOptionsMenu(true);
    _switchAccounts = ((LinearLayout)paramLayoutInflater.findViewById(R.id.storage_settings_switchAccounts));
    _switchAccounts.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView.setEnabled(false);
        AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ASSET_BROWSER_USER_SIGNOUT);
      }
    });
    _editCCSettings = ((LinearLayout)paramLayoutInflater.findViewById(R.id.storage_settings_editCCSettings));
    _editCCSettings.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeStorageSettingsFragment.this.OpenURLinBrowser(paramAnonymousView, "https://accounts.adobe.com");
      }
    });
    getUserAccountInfo(paramLayoutInflater);
    return paramLayoutInflater;
  }
  
  public void onPrepareOptionsMenu(Menu paramMenu)
  {
    super.onPrepareOptionsMenu(paramMenu);
    AdobeCSDKActionBarController.setTitle(getActivity().findViewById(16908290), getString(R.string.adobe_uxassetbrowser_sdk_myaccount));
  }
  
  public void onStart()
  {
    super.onStart();
    _fragmentStopped = false;
  }
  
  public void onStop()
  {
    super.onStop();
    _fragmentStopped = true;
  }
}
