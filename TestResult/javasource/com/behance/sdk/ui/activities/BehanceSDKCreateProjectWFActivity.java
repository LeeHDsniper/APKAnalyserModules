package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.behance.sdk.BehanceSDKImageSelectorOptions;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.fragments.BehanceSDKELWFragment;
import com.behance.sdk.ui.fragments.BehanceSDKELWFragment.EnterpriseUserWarningDialogCallbacks;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment.Callbacks;
import com.behance.sdk.util.BehanceSDKLaunchUtil;
import com.behance.sdk.util.BehanceSDKUtils;
import java.util.List;

public class BehanceSDKCreateProjectWFActivity
  extends BehanceSDKBasePublishActivity
  implements BehanceSDKELWFragment.EnterpriseUserWarningDialogCallbacks, BehanceSDKImageSelectorDialogFragment.Callbacks
{
  public BehanceSDKCreateProjectWFActivity() {}
  
  private void displayNoInternetConnectivity()
  {
    Toast.makeText(this, getString(R.string.bsdk_connection_error_msg), 1).show();
    finish();
  }
  
  private void startPublishProjectWorkflow()
  {
    startActivity(new Intent(this, BehanceSDKPublishProjectActivity.class));
    finish();
  }
  
  public void continueWithWorkflow()
  {
    launchImageSelectionDialog();
  }
  
  protected IBehanceSDKUserCredentials getBehanceSDKUserCredentials()
  {
    return BehanceSDKProjectPublishWFManager.getInstance().getUserCredentials();
  }
  
  public void launchImageSelectionDialog()
  {
    FragmentManager localFragmentManager = getSupportFragmentManager();
    BehanceSDKImageSelectorOptions localBehanceSDKImageSelectorOptions = BehanceSDKImageSelectorOptions.getUnlimitedImageSelectionOptions();
    localBehanceSDKImageSelectorOptions.setMaxImageSizeInBytes(8388608L);
    localBehanceSDKImageSelectorOptions.setAllowedFileExtensions(BehanceSDKUtils.getAllowedFileExtensionsForProjectImage());
    localBehanceSDKImageSelectorOptions.setImageValidatorType("PUBLISH_PROJECT_IMAGE_VALIDATOR");
    BehanceSDKLaunchUtil.launchAlbumsViewToPickPicture(this, localBehanceSDKImageSelectorOptions, localFragmentManager, "FRAGMENT_TAG_ADD_PROJECT_ALBUM_SELECTION_FRAGMENT");
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_publish_project_with_image_selection);
    if (paramBundle == null)
    {
      paramBundle = ((ConnectivityManager)getSystemService("connectivity")).getActiveNetworkInfo();
      if ((paramBundle == null) || (!paramBundle.isConnected())) {
        displayNoInternetConnectivity();
      }
      if (!CanContinueWithWokflow()) {
        launchImageSelectionDialog();
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
      paramBundle = paramBundle.findFragmentByTag("FRAGMENT_TAG_ADD_PROJECT_ALBUM_SELECTION_FRAGMENT");
    } while (!(paramBundle instanceof BehanceSDKImageSelectorDialogFragment));
    ((BehanceSDKImageSelectorDialogFragment)paramBundle).setCallbacks(this);
  }
  
  public void onImageSelectorOnError(Exception paramException)
  {
    finish();
  }
  
  public void onImageSelectorSelectionBackPressed()
  {
    AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishUXCancel, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceProject);
    finish();
  }
  
  public void onImageSelectorSelectionCanceled()
  {
    startPublishProjectWorkflow();
  }
  
  public void onImageSelectorSelectionFinished(List<ImageModule> paramList)
  {
    BehanceSDKProjectPublishWFManager.getInstance().addImagesSelectedForProject(paramList);
    startPublishProjectWorkflow();
  }
}
