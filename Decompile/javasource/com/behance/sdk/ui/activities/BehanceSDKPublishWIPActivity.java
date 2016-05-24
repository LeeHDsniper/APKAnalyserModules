package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.widget.Toast;
import com.behance.sdk.BehanceSDKPublishWIPOptions;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.managers.AddWIPManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.fragments.BehanceSDKPublishWIPDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKPublishWIPDialogFragment.Callbacks;
import com.behance.sdk.util.BehanceSDKPublishImageValidationResult;
import com.behance.sdk.util.BehanceSDKUtils;

public class BehanceSDKPublishWIPActivity
  extends BehanceSDKBasePublishActivity
  implements BehanceSDKPublishWIPDialogFragment.Callbacks
{
  public BehanceSDKPublishWIPActivity() {}
  
  private void closeThisActivity()
  {
    finish();
  }
  
  private void displayNoInternetConnectivity()
  {
    Toast.makeText(this, getString(R.string.bsdk_add_wip_view_connection_error_msg), 1).show();
    closeThisActivity();
  }
  
  private void displayToastMessage(String paramString)
  {
    if (paramString != null) {
      Toast.makeText(this, paramString, 1).show();
    }
  }
  
  private void loadPublishWIPFragment()
  {
    Object localObject1 = validateParamsAndGetOptions();
    if (localObject1 != null)
    {
      localObject1 = BehanceSDKPublishWIPDialogFragment.getInstance(this, (BehanceSDKPublishWIPOptions)localObject1);
      Object localObject2 = getSupportFragmentManager();
      FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject2).beginTransaction();
      localObject2 = ((FragmentManager)localObject2).findFragmentByTag("BEHANCE_SDK_PUBLISH_WIP_ACTIVITY_FRAGMENT_TAG_PUBLISH_WIP");
      if (localObject2 != null) {
        localFragmentTransaction.remove((Fragment)localObject2);
      }
      localFragmentTransaction.addToBackStack(null);
      ((BehanceSDKPublishWIPDialogFragment)localObject1).show(localFragmentTransaction, "BEHANCE_SDK_PUBLISH_WIP_ACTIVITY_FRAGMENT_TAG_PUBLISH_WIP");
      return;
    }
    closeThisActivity();
  }
  
  private BehanceSDKPublishWIPOptions validateParamsAndGetOptions()
  {
    Object localObject2 = getIntent();
    int j = ((Intent)localObject2).getIntExtra("INTENT_INT_EXTRA_EXISTING_WIP_ID", 0);
    String str1 = ((Intent)localObject2).getStringExtra("INTENT_STRING_EXTRA_WIP_DESCRIPTION");
    Object localObject1 = (ImageModule)((Intent)localObject2).getSerializableExtra("INTENT_SERIALIZABLE_EXTRA_WIP_REVISION_IMAGE_MODULE");
    String str2 = ((Intent)localObject2).getStringExtra("INTENT_STRING_EXTRA_WIP_TITLE");
    localObject2 = ((Intent)localObject2).getStringExtra("INTENT_STRING_EXTRA_WIP_TAGS");
    int i;
    if (localObject1 != null) {
      if (BehanceSDKPublishImageValidationResult.VALID == BehanceSDKUtils.validateImageForWIP((ImageModule)localObject1)) {
        i = 1;
      }
    }
    while (i != 0)
    {
      localObject1 = new BehanceSDKPublishWIPOptions((ImageModule)localObject1);
      ((BehanceSDKPublishWIPOptions)localObject1).setWipTitle(str2);
      ((BehanceSDKPublishWIPOptions)localObject1).setExistingWIPId(j);
      ((BehanceSDKPublishWIPOptions)localObject1).setWipDescription(str1);
      ((BehanceSDKPublishWIPOptions)localObject1).setWipTags((String)localObject2);
      return localObject1;
      displayToastMessage(getString(R.string.bsdk_publish_wip_image_required_error_msg));
      i = 0;
      continue;
      displayToastMessage(getString(R.string.bsdk_publish_wip_image_required_error_msg));
      i = 0;
    }
    return null;
  }
  
  public void continueWithWorkflow()
  {
    loadPublishWIPFragment();
  }
  
  protected IBehanceSDKUserCredentials getBehanceSDKUserCredentials()
  {
    return AddWIPManager.getInstance().getUserCredentials();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_publish_wip);
    if (paramBundle == null)
    {
      paramBundle = ((ConnectivityManager)getSystemService("connectivity")).getActiveNetworkInfo();
      if ((paramBundle == null) || (!paramBundle.isConnected())) {
        displayNoInternetConnectivity();
      }
      if (!CanContinueWithWokflow()) {
        loadPublishWIPFragment();
      }
    }
    do
    {
      return;
      paramBundle = getSupportFragmentManager().findFragmentByTag("BEHANCE_SDK_PUBLISH_WIP_ACTIVITY_FRAGMENT_TAG_PUBLISH_WIP");
    } while (!(paramBundle instanceof BehanceSDKPublishWIPDialogFragment));
    ((BehanceSDKPublishWIPDialogFragment)paramBundle).setCallbacks(this);
  }
  
  public void onPublishWIPViewClose()
  {
    closeThisActivity();
  }
}
