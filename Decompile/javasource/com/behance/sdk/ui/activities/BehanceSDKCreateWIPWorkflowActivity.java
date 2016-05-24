package com.behance.sdk.ui.activities;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.widget.Toast;
import com.behance.sdk.BehanceSDKImageDimensions;
import com.behance.sdk.BehanceSDKImageSelectorOptions;
import com.behance.sdk.BehanceSDKPublishWIPOptions;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.R.anim;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.AddWIPManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.fragments.BehanceSDKELWFragment;
import com.behance.sdk.ui.fragments.BehanceSDKELWFragment.EnterpriseUserWarningDialogCallbacks;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment.Callbacks;
import com.behance.sdk.ui.fragments.BehanceSDKPublishWIPDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKPublishWIPDialogFragment.Callbacks;
import com.behance.sdk.util.BehanceSDKUtils;
import java.util.List;

public class BehanceSDKCreateWIPWorkflowActivity
  extends BehanceSDKBasePublishActivity
  implements BehanceSDKELWFragment.EnterpriseUserWarningDialogCallbacks, BehanceSDKImageSelectorDialogFragment.Callbacks, BehanceSDKPublishWIPDialogFragment.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKCreateWIPWorkflowActivity.class);
  
  public BehanceSDKCreateWIPWorkflowActivity() {}
  
  private void closeThisActivity(boolean paramBoolean)
  {
    finish();
    if (paramBoolean) {
      overridePendingTransition(0, R.anim.bsdk_publish_wip_info_view_exit);
    }
  }
  
  private void displayNoInternetConnectivity()
  {
    Toast.makeText(this, getString(R.string.bsdk_add_wip_view_connection_error_msg), 1).show();
    closeThisActivity(false);
  }
  
  private void launchAlbumsViewToPickPicture()
  {
    Object localObject1 = BehanceSDKImageSelectorOptions.getSingleImageSelectionOptions(BehanceSDKImageDimensions.getInstance(640, 320), null);
    ((BehanceSDKImageSelectorOptions)localObject1).setMaxImageSizeInBytes(12582912L);
    ((BehanceSDKImageSelectorOptions)localObject1).setAllowedFileExtensions(BehanceSDKUtils.getAllowedFileExtensionsForWIPImage());
    ((BehanceSDKImageSelectorOptions)localObject1).setImageValidatorType("PUBLISH_WIP_IMAGE_VALIDATOR");
    localObject1 = BehanceSDKImageSelectorDialogFragment.getInstance(this, (BehanceSDKImageSelectorOptions)localObject1);
    Object localObject2 = getSupportFragmentManager();
    FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject2).beginTransaction();
    localObject2 = ((FragmentManager)localObject2).findFragmentByTag("FRAGMENT_TAG_CREATE_WIP_WORKFLOW_SELECT_IMAGE");
    if (localObject2 != null) {
      localFragmentTransaction.remove((Fragment)localObject2);
    }
    localFragmentTransaction.addToBackStack(null);
    ((BehanceSDKImageSelectorDialogFragment)localObject1).show(localFragmentTransaction, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_SELECT_IMAGE");
  }
  
  private void launchPublishView(ImageModule paramImageModule)
  {
    paramImageModule = BehanceSDKPublishWIPDialogFragment.getInstance(this, new BehanceSDKPublishWIPOptions(paramImageModule));
    Object localObject = getSupportFragmentManager();
    FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject).beginTransaction();
    localObject = ((FragmentManager)localObject).findFragmentByTag("FRAGMENT_TAG_CREATE_WIP_WORKFLOW_PUBLISH_WIP");
    if (localObject != null) {
      localFragmentTransaction.remove((Fragment)localObject);
    }
    localFragmentTransaction.addToBackStack(null);
    paramImageModule.show(localFragmentTransaction, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_PUBLISH_WIP");
  }
  
  public void continueWithWorkflow()
  {
    launchAlbumsViewToPickPicture();
  }
  
  protected IBehanceSDKUserCredentials getBehanceSDKUserCredentials()
  {
    return AddWIPManager.getInstance().getUserCredentials();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_create_wip_workflow);
    if (paramBundle == null)
    {
      paramBundle = ((ConnectivityManager)getSystemService("connectivity")).getActiveNetworkInfo();
      if ((paramBundle == null) || (!paramBundle.isConnected())) {
        displayNoInternetConnectivity();
      }
      if (!CanContinueWithWokflow()) {
        launchAlbumsViewToPickPicture();
      }
    }
    do
    {
      return;
      paramBundle = getSupportFragmentManager();
      Fragment localFragment = paramBundle.findFragmentByTag("FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT");
      if ((localFragment instanceof BehanceSDKELWFragment)) {
        ((BehanceSDKELWFragment)localFragment).setCallbacks(this);
      }
      localFragment = paramBundle.findFragmentByTag("FRAGMENT_TAG_CREATE_WIP_WORKFLOW_SELECT_IMAGE");
      if ((localFragment instanceof BehanceSDKImageSelectorDialogFragment)) {
        ((BehanceSDKImageSelectorDialogFragment)localFragment).setCallbacks(this);
      }
      paramBundle = paramBundle.findFragmentByTag("FRAGMENT_TAG_CREATE_WIP_WORKFLOW_PUBLISH_WIP");
    } while (!(paramBundle instanceof BehanceSDKPublishWIPDialogFragment));
    ((BehanceSDKPublishWIPDialogFragment)paramBundle).setCallbacks(this);
  }
  
  public void onImageSelectorOnError(Exception paramException)
  {
    closeThisActivity(false);
  }
  
  public void onImageSelectorSelectionBackPressed()
  {
    closeThisActivity(false);
  }
  
  public void onImageSelectorSelectionCanceled()
  {
    closeThisActivity(false);
  }
  
  public void onImageSelectorSelectionFinished(List<ImageModule> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      paramList = (ImageModule)paramList.get(0);
      logger.debug("Image selected from album. [Name - %s]", new Object[] { paramList.getName() });
      launchPublishView(paramList);
    }
  }
  
  public void onPublishWIPViewClose()
  {
    closeThisActivity(true);
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
}
