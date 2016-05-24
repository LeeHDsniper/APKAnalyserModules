package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.ui.fragments.BehanceSDKELWFragment;
import com.behance.sdk.ui.fragments.BehanceSDKELWFragment.EnterpriseUserWarningDialogCallbacks;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

public abstract class BehanceSDKBasePublishActivity
  extends FragmentActivity
  implements BehanceSDKELWFragment.EnterpriseUserWarningDialogCallbacks
{
  private volatile boolean isCloudPickerLaunched = false;
  private volatile boolean isWarningScreenVisible = false;
  
  public BehanceSDKBasePublishActivity() {}
  
  private SharedPreferences getSharedPreference()
  {
    ApplicationInfo localApplicationInfo = getApplicationInfo();
    return getSharedPreferences("BEHANCE_SDK_PUBLISH_ENTERPRISE_WARNING_SHARED_PREFERENES_KEY_" + name, 0);
  }
  
  private void initializeImageLoader()
  {
    if (!ImageLoader.getInstance().isInited())
    {
      ImageLoaderConfiguration localImageLoaderConfiguration = ImageLoaderConfiguration.createDefault(this);
      ImageLoader.getInstance().init(localImageLoaderConfiguration);
    }
  }
  
  private boolean isDefaultCloudSet()
  {
    return AdobeCloudManager.getSharedCloudManager().getDefaultCloud() != null;
  }
  
  private void launchCloudPicker()
  {
    isCloudPickerLaunched = true;
    startActivityForResult(new Intent(this, BehanceSDKAdobeCloudSelectionActivity.class), 6778);
  }
  
  private void showEnterpriseUserWarningScreen(SharedPreferences paramSharedPreferences, String paramString)
  {
    isWarningScreenVisible = true;
    Object localObject = getSupportFragmentManager();
    FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject).beginTransaction();
    localObject = ((FragmentManager)localObject).findFragmentByTag("FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT");
    if (localObject != null) {
      localFragmentTransaction.remove((Fragment)localObject);
    }
    localFragmentTransaction.addToBackStack(null);
    localObject = new BehanceSDKELWFragment();
    ((BehanceSDKELWFragment)localObject).setCallbacks(this);
    ((BehanceSDKELWFragment)localObject).show(localFragmentTransaction, "FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT");
    paramSharedPreferences = paramSharedPreferences.edit();
    paramSharedPreferences.putBoolean(paramString, true);
    paramSharedPreferences.commit();
  }
  
  public boolean CanContinueWithWokflow()
  {
    return (isWarningScreenVisible) || (isCloudPickerLaunched);
  }
  
  public void continueWithWorkflow() {}
  
  protected abstract IBehanceSDKUserCredentials getBehanceSDKUserCredentials();
  
  protected String getUserBehanceAccountId()
  {
    return getBehanceSDKUserCredentials().getUserBehanceAccountId();
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt1 == 6778)
    {
      isCloudPickerLaunched = false;
      continueWithWorkflow();
    }
  }
  
  public void onBackButtonPressed()
  {
    finish();
  }
  
  public void onCancelButtonPressed()
  {
    finish();
  }
  
  public void onContinueButtonPressed()
  {
    isWarningScreenVisible = false;
    if (!isDefaultCloudSet())
    {
      launchCloudPicker();
      return;
    }
    continueWithWorkflow();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    initializeImageLoader();
    if (paramBundle != null)
    {
      isWarningScreenVisible = paramBundle.getBoolean("KEY_ENTERPRISE_USER_WARNING_VIEW_VISIBLE", false);
      paramBundle = getSupportFragmentManager().findFragmentByTag("FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT");
      if ((paramBundle instanceof BehanceSDKELWFragment)) {
        ((BehanceSDKELWFragment)paramBundle).setCallbacks(this);
      }
    }
    do
    {
      do
      {
        return;
      } while (!BehanceSDKUserManager.getInstance().isUserAnEnterpriseUser());
      paramBundle = getSharedPreference();
      String str = "SP_KEY_ENTERPRISE_USER_WARNING_SHOWN" + getUserBehanceAccountId();
      if (!paramBundle.getBoolean(str, false)) {
        showEnterpriseUserWarningScreen(paramBundle, str);
      }
    } while ((isWarningScreenVisible) || (isDefaultCloudSet()));
    launchCloudPicker();
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("KEY_ENTERPRISE_USER_WARNING_VIEW_VISIBLE", isWarningScreenVisible);
    paramBundle.putBoolean("KEY_ENTERPRISE_USER_WARNING_VIEW_VISIBLE", isCloudPickerLaunched);
  }
}
