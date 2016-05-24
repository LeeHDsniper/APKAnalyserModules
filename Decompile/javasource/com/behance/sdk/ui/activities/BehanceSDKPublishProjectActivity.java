package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.Window;
import android.widget.ViewFlipper;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.behance.sdk.BehanceSDKImageSelectorOptions;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.R.anim;
import com.behance.sdk.R.color;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.listeners.IPublishProjectNavigationListener;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment.Callbacks;
import com.behance.sdk.util.BehanceSDKLaunchUtil;
import com.behance.sdk.util.BehanceSDKUtils;
import java.util.List;

public class BehanceSDKPublishProjectActivity
  extends BehanceSDKBasePublishActivity
  implements IPublishProjectNavigationListener, BehanceSDKImageSelectorDialogFragment.Callbacks
{
  private ViewFlipper publishProjectScreens;
  
  public BehanceSDKPublishProjectActivity() {}
  
  private void addProjectDetailsToWFManager()
  {
    Intent localIntent = getIntent();
    BehanceSDKProjectPublishWFManager localBehanceSDKProjectPublishWFManager = BehanceSDKProjectPublishWFManager.getInstance();
    localBehanceSDKProjectPublishWFManager.initializeProject();
    localBehanceSDKProjectPublishWFManager.setProjectTitle(localIntent.getStringExtra("INTENT_SERIALIZABLE_EXTRA_PROJECT_TITLE"));
    localBehanceSDKProjectPublishWFManager.setProjectDescription(localIntent.getStringExtra("INTENT_SERIALIZABLE_EXTRA_PROJECT_DESC"));
    localBehanceSDKProjectPublishWFManager.setProjectTags(localIntent.getStringExtra("INTENT_SERIALIZABLE_EXTRA_PROJECT_TAGS"));
    BehanceSDKCopyrightOption localBehanceSDKCopyrightOption = (BehanceSDKCopyrightOption)localIntent.getSerializableExtra("INTENT_SERIALIZABLE_EXTRA_PROJECT_COPYRIGHT_SETTINGS");
    if (localBehanceSDKCopyrightOption != null) {
      localBehanceSDKProjectPublishWFManager.setCopyrightOption(localBehanceSDKCopyrightOption);
    }
    localBehanceSDKProjectPublishWFManager.setContainsAdultContent(localIntent.getBooleanExtra("INTENT_SERIALIZABLE_EXTRA_PROJECT_CONTAINS_ADULT_CONTENT", false));
  }
  
  private void addShowNextAnimations()
  {
    publishProjectScreens.setInAnimation(this, R.anim.bsdk_publish_project_open_enter_anim);
    publishProjectScreens.setOutAnimation(this, R.anim.bsdk_publish_project_open_exit_anim);
  }
  
  private void addShowPreviousAnimations()
  {
    publishProjectScreens.setInAnimation(this, R.anim.bsdk_publish_project_close_enter_anim);
    publishProjectScreens.setOutAnimation(this, R.anim.bsdk_publish_project_close_exit_anim);
  }
  
  private void addValidImageModulesToWFManager()
  {
    List localList = (List)getIntent().getSerializableExtra("INTENT_SERIALIZABLE_EXTRA_PROJECT_IMAGE_MODULES");
    if ((localList != null) && (!localList.isEmpty())) {
      BehanceSDKProjectPublishWFManager.getInstance().addImagesSelectedForProject(localList);
    }
  }
  
  private void showNextScreen()
  {
    if (publishProjectScreens.getDisplayedChild() != publishProjectScreens.getChildCount() - 1)
    {
      addShowNextAnimations();
      publishProjectScreens.showNext();
    }
  }
  
  private void showPreviousScreen()
  {
    onBackPressed();
  }
  
  public void closeThisActivity(boolean paramBoolean)
  {
    finish();
    if (paramBoolean) {
      overridePendingTransition(0, R.anim.bsdk_publish_wip_info_view_exit);
    }
  }
  
  public void continueWithWorkflow()
  {
    publishProjectScreens.setVisibility(0);
  }
  
  protected IBehanceSDKUserCredentials getBehanceSDKUserCredentials()
  {
    return BehanceSDKProjectPublishWFManager.getInstance().getUserCredentials();
  }
  
  public void launchImageSelectionDialogForEditScreen()
  {
    FragmentManager localFragmentManager = getSupportFragmentManager();
    BehanceSDKImageSelectorOptions localBehanceSDKImageSelectorOptions = BehanceSDKImageSelectorOptions.getUnlimitedImageSelectionOptions();
    localBehanceSDKImageSelectorOptions.setMaxImageSizeInBytes(8388608L);
    localBehanceSDKImageSelectorOptions.setAllowedFileExtensions(BehanceSDKUtils.getAllowedFileExtensionsForProjectImage());
    BehanceSDKLaunchUtil.launchAlbumsViewToPickPicture(this, localBehanceSDKImageSelectorOptions, localFragmentManager, "FRAGMENT_TAG_ADD_PROJECT_ALBUM_SELECTION_FRAGMENT");
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    getSupportFragmentManager().findFragmentById(R.id.bsdkPublishProjectPreviewFragment).onActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  public void onBackPressed()
  {
    if (publishProjectScreens.getDisplayedChild() != 0)
    {
      addShowPreviousAnimations();
      publishProjectScreens.showPrevious();
      return;
    }
    BehanceSDKProjectPublishWFManager.getInstance().cancelWorkflow();
    AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishUXCancel, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceProject);
    closeThisActivity(true);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    addValidImageModulesToWFManager();
    addProjectDetailsToWFManager();
    setContentView(R.layout.bsdk_activity_publish_project);
    overridePendingTransition(R.anim.bsdk_publish_wip_info_view_enter, 0);
    publishProjectScreens = ((ViewFlipper)findViewById(R.id.bsdkPublishProjectViewFlipper));
    if (paramBundle != null)
    {
      int i = paramBundle.getInt("BUNDLE_KEY_CURRENT_PAGE_NUMBER", 0);
      publishProjectScreens.setDisplayedChild(i);
    }
    if (CanContinueWithWokflow()) {
      publishProjectScreens.setVisibility(4);
    }
  }
  
  public void onImageSelectorOnError(Exception paramException) {}
  
  public void onImageSelectorSelectionBackPressed() {}
  
  public void onImageSelectorSelectionCanceled() {}
  
  public void onImageSelectorSelectionFinished(List<ImageModule> paramList)
  {
    BehanceSDKProjectPublishWFManager.getInstance().addImagesSelectedForProject(paramList);
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putInt("BUNDLE_KEY_CURRENT_PAGE_NUMBER", publishProjectScreens.getDisplayedChild());
  }
  
  protected void onStart()
  {
    super.onStart();
    getWindow().setBackgroundDrawableResource(R.color.bsdk_publish_project_view_bg_color);
  }
  
  public void showNext()
  {
    showNextScreen();
  }
  
  public void showPrevious()
  {
    showPreviousScreen();
  }
}
