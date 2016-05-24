package com.behance.sdk.ui.fragments;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;
import android.widget.ViewFlipper;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMimeTypes;
import com.adobe.creativesdk.foundation.storage.AdobeUXAssetBrowserOption;
import com.behance.sdk.R.anim;
import com.behance.sdk.R.fraction;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager.ProjectModuleChangeListener;
import com.behance.sdk.mobeta.android.dslv.DragSortListView;
import com.behance.sdk.mobeta.android.dslv.DragSortListView.DropListener;
import com.behance.sdk.mobeta.android.dslv.DragSortListView.RemoveListener;
import com.behance.sdk.project.modules.CreativeCloudAssetModule;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import com.behance.sdk.ui.activities.BehanceSDKCCLauncherActivity;
import com.behance.sdk.ui.activities.BehanceSDKPublishProjectActivity;
import com.behance.sdk.ui.adapters.BehanceSDKPublishProjectEditAdapter;
import com.behance.sdk.ui.adapters.BehanceSDKPublishProjectEditAdapter.Callbacks;
import com.behance.sdk.ui.adapters.BehanceSDKPublishProjectPreviewAdapter;
import com.behance.sdk.ui.adapters.BehanceSDKPublishProjectPreviewAdapter.Callbacks;
import com.behance.sdk.ui.dialogs.BehanceSDKEmbedModuleDialog;
import com.behance.sdk.util.BehanceSDKUtils;
import java.io.File;
import java.io.IOException;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;

public class BehanceSDKPublishProjectPreviewFragment
  extends BehanceSDKPublishProjectBaseFragment
  implements View.OnKeyListener, BehanceSDKProjectPublishWFManager.ProjectModuleChangeListener, DragSortListView.RemoveListener, BehanceSDKPublishProjectEditAdapter.Callbacks, BehanceSDKPublishProjectPreviewAdapter.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKPublishProjectPreviewFragment.class);
  private View editEmptyProjectMessage;
  private BehanceSDKPublishProjectEditAdapter editImageAdapter;
  private DragSortListView editModulesDragSortListView;
  private ViewFlipper previewEditViewFlipper;
  private BehanceSDKPublishProjectPreviewAdapter previewImageAdapter;
  private ListView previewModulesListView;
  private ProgressBar progressBar;
  private BehanceSDKProjectPublishWFManager publishProjectManager = BehanceSDKProjectPublishWFManager.getInstance();
  private Uri selectedCameraImageUri;
  
  public BehanceSDKPublishProjectPreviewFragment() {}
  
  private void displayEditModulesView(List<ProjectModule> paramList, boolean paramBoolean)
  {
    if ((paramList == null) || (paramList.isEmpty()))
    {
      showEmptyProjectMessage();
      if (!paramBoolean) {
        break label87;
      }
      previewEditViewFlipper.setInAnimation(getActivity(), R.anim.bsdk_publish_project_edit_enter_anim);
      previewEditViewFlipper.setOutAnimation(getActivity(), R.anim.bsdk_publish_project_preview_exit_anim);
    }
    for (;;)
    {
      previewEditViewFlipper.setDisplayedChild(1);
      updateNavigationControls();
      return;
      editEmptyProjectMessage.setVisibility(8);
      editModulesDragSortListView.setVisibility(0);
      initializeListView(paramList);
      break;
      label87:
      previewEditViewFlipper.setInAnimation(null);
      previewEditViewFlipper.setOutAnimation(null);
    }
  }
  
  private void displayEditModulesView(boolean paramBoolean)
  {
    displayEditModulesView(publishProjectManager.getProjectModules(), paramBoolean);
  }
  
  private void displayPreviewModulesView(boolean paramBoolean1, boolean paramBoolean2)
  {
    List localList = publishProjectManager.getProjectModules();
    if ((previewImageAdapter == null) || (paramBoolean2))
    {
      previewImageAdapter = new BehanceSDKPublishProjectPreviewAdapter(getActivity(), R.layout.bsdk_adapter_publish_project_preview_project_fragment_list_item, localList);
      previewModulesListView.setAdapter(previewImageAdapter);
      previewImageAdapter.setCallbacks(this);
      float f = getResources().getFraction(R.fraction.bsdk_add_project_preview_fragment_screen_width_percentage, 1, 1);
      BehanceSDKUtils.setContentViewPaddings(getActivity(), previewModulesListView, f);
      previewModulesListView.setVisibility(4);
    }
    if (paramBoolean1)
    {
      previewEditViewFlipper.setInAnimation(getActivity(), R.anim.bsdk_publish_project_preview_enter_anim);
      previewEditViewFlipper.setOutAnimation(getActivity(), R.anim.bsdk_publish_project_edit_exit_anim);
    }
    for (;;)
    {
      previewEditViewFlipper.setDisplayedChild(0);
      updateNavigationControls();
      return;
      previewEditViewFlipper.setInAnimation(null);
      previewEditViewFlipper.setOutAnimation(null);
    }
  }
  
  private void initializeEditProjectScreen()
  {
    editModulesDragSortListView = ((DragSortListView)rootView.findViewById(R.id.bsdkPublishProjectEditProjectModulesListView));
    editEmptyProjectMessage = rootView.findViewById(R.id.bsdkPublishProjectEditEmptyProjectMessageLayout);
    rootView.findViewById(R.id.bsdkPublishProjectEditOptionAlbums).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ((BehanceSDKPublishProjectActivity)getActivity()).launchImageSelectionDialogForEditScreen();
      }
    });
    rootView.findViewById(R.id.bsdkPublishProjectEditOptionCamera).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKPublishProjectPreviewFragment.this.launchCameraToCapturePicture();
      }
    });
    rootView.findViewById(R.id.bsdkPublishProjectEditOptionEmbed).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKEmbedModuleDialog.getInstance(getActivity()).show();
      }
    });
    View localView = rootView.findViewById(R.id.bsdkPublishProjectEditOptionCreativeCloud);
    if (AdobeCloudManager.getSharedCloudManager().getDefaultCloud() == null)
    {
      localView.setVisibility(8);
      return;
    }
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKPublishProjectPreviewFragment.this.launchCreativeCloudAssetBrowser();
      }
    });
  }
  
  private void initializeListView(List<ProjectModule> paramList)
  {
    editImageAdapter = new BehanceSDKPublishProjectEditAdapter(getActivity(), R.layout.bsdk_adapter_publish_project_edit_fragment_grid_item, paramList);
    editModulesDragSortListView.setAdapter(editImageAdapter);
    editModulesDragSortListView.setRemoveListener(this);
    editImageAdapter.setCallBack(this);
    paramList = new DragSortListView.DropListener()
    {
      public void drop(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        publishProjectManager.reorderSelectedModules(paramAnonymousInt1, paramAnonymousInt2);
        editModulesDragSortListView.moveCheckState(paramAnonymousInt1, paramAnonymousInt2);
        editImageAdapter.notifyDataSetChanged();
        BehanceSDKPublishProjectPreviewFragment.this.notifyPreviewViewGridAdapter();
      }
    };
    editModulesDragSortListView.setDropListener(paramList);
  }
  
  private void initializePreviewProjectScreen()
  {
    previewModulesListView = ((ListView)rootView.findViewById(R.id.bsdkPublishProjectPreviewProjectModulesListView));
    progressBar = ((ProgressBar)rootView.findViewById(R.id.bsdkPublishProjectPreviewPrgressBar));
  }
  
  private boolean isEmptyProject()
  {
    List localList = publishProjectManager.getProjectModules();
    return (localList == null) || (localList.isEmpty());
  }
  
  private boolean isPreviewScreen()
  {
    return (previewEditViewFlipper != null) && (previewEditViewFlipper.getDisplayedChild() == 0);
  }
  
  private void launchCameraToCapturePicture()
  {
    try
    {
      File localFile = BehanceSDKUtils.createTempImageFile();
      Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
      if (localIntent.resolveActivity(getActivity().getPackageManager()) != null)
      {
        if (localFile != null)
        {
          selectedCameraImageUri = Uri.fromFile(localFile);
          localIntent.putExtra("output", selectedCameraImageUri);
          startActivityForResult(localIntent, 1);
        }
      }
      else
      {
        logger.error("Camera intent not found", new Object[0]);
        Toast.makeText(getActivity(), R.string.bsdk_add_wip_pick_source_view_camera_launch_error, 1).show();
        return;
      }
    }
    catch (IOException localIOException)
    {
      logger.error(localIOException, "Problem creating temp file to capture image", new Object[0]);
      Toast.makeText(getActivity(), R.string.bsdk_add_wip_pick_source_view_camera_launch_error, 1).show();
    }
  }
  
  private void launchCreativeCloudAssetBrowser()
  {
    FragmentActivity localFragmentActivity = getActivity();
    Intent localIntent = new Intent(localFragmentActivity, BehanceSDKCCLauncherActivity.class);
    EnumSet localEnumSet1 = EnumSet.of(AdobeAssetMimeTypes.MIMETYPE_GIF, AdobeAssetMimeTypes.MIMETYPE_JPEG, AdobeAssetMimeTypes.MIMETYPE_PNG);
    EnumSet localEnumSet2 = EnumSet.of(AdobeUXAssetBrowserOption.ENABLE_MULTI_SELECT, AdobeUXAssetBrowserOption.SHOW_MULTI_SELECT_ON_POPUP);
    localIntent.putExtra("ARGS_ALLOWED_MIME_TYPES", localEnumSet1);
    localIntent.putExtra("ARGS_ASSET_BROWSER_OPTIONS", localEnumSet2);
    localIntent.putExtra("ARGS_IMAGE_VALIDATOR_TYPE", "PUBLISH_PROJECT_IMAGE_VALIDATOR");
    localFragmentActivity.startActivityForResult(localIntent, 6787);
  }
  
  private void notifyEditViewGridAdapter(List<ProjectModule> paramList)
  {
    if (editImageAdapter != null)
    {
      editImageAdapter.notifyDataSetChanged();
      return;
    }
    displayEditModulesView(paramList, false);
  }
  
  private void notifyPreviewViewGridAdapter()
  {
    if (previewImageAdapter != null) {
      previewImageAdapter.notifyDataSetChanged();
    }
  }
  
  private void showEmptyProjectMessage()
  {
    disableActionBarRightNav();
    editEmptyProjectMessage.setVisibility(0);
    editModulesDragSortListView.setVisibility(8);
    editImageAdapter = null;
  }
  
  protected void backButtonPressed()
  {
    if ((previewEditViewFlipper.getDisplayedChild() == 1) && (!isEmptyProject()))
    {
      displayPreviewModulesView(true, false);
      return;
    }
    super.backButtonPressed();
  }
  
  protected void enableActionBarRightNav()
  {
    if (!isEmptyProject()) {
      super.enableActionBarRightNav();
    }
  }
  
  protected int getBackButtonID()
  {
    if (isPreviewScreen()) {
      return R.id.bsdkPublishProjectPreviewFragmentTitlebarBackBtnLayout;
    }
    return super.getBackButtonID();
  }
  
  protected int getForwardButtonID()
  {
    if (isPreviewScreen()) {
      return R.id.bsdkPublishProjectPreviewFragmentTitlebarActionBtnTxtView;
    }
    return super.getForwardButtonID();
  }
  
  protected int getForwardButtonText()
  {
    if (isPreviewScreen()) {
      return super.getForwardButtonText();
    }
    return R.string.bsdk_add_project_edit_project_fragment_right_navigation;
  }
  
  protected int getLayout()
  {
    return R.layout.bsdk_dialog_fragment_publish_project_preview;
  }
  
  protected int getTitle()
  {
    if (isPreviewScreen()) {
      return R.string.bsdk_add_project_preview_project_fragment_title;
    }
    return R.string.bsdk_add_project_edit_project_fragment_title;
  }
  
  protected int getTitleViewID()
  {
    if (isPreviewScreen()) {
      return R.id.bsdkPublishProjectPreviewFragmentTitlebarTitleTxtView;
    }
    return super.getTitleViewID();
  }
  
  protected void nextButtonPressed()
  {
    if (previewEditViewFlipper.getDisplayedChild() == 0)
    {
      super.nextButtonPressed();
      return;
    }
    displayPreviewModulesView(true, false);
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    }
    do
    {
      do
      {
        do
        {
          return;
          if (paramInt2 != -1) {
            break;
          }
          logger.debug("Camera Activity returned with ok result. [Photo Uri - %s]", new Object[] { selectedCameraImageUri });
        } while (selectedCameraImageUri == null);
        paramIntent = new File(selectedCameraImageUri.getPath());
        publishProjectManager.addImageSelectedForProject(paramIntent);
        BehanceSDKUtils.addImageToGallery(getActivity(), paramIntent.getAbsolutePath());
        notifyEditViewGridAdapter(publishProjectManager.getProjectModules());
        enableActionBarRightNav();
        return;
        logger.debug("Camera Activity returned with not ok result. [Result - %s]", new Object[] { Integer.valueOf(paramInt2) });
        return;
      } while (paramInt2 != -1);
      paramIntent = (List)paramIntent.getExtras().getSerializable("ACTIVITY_CC_SUCCESSFULLY_DOWNLOADED_FILES");
    } while ((paramIntent == null) || (paramIntent.isEmpty()));
    paramIntent = paramIntent.iterator();
    while (paramIntent.hasNext())
    {
      CreativeCloudAssetModule localCreativeCloudAssetModule = new CreativeCloudAssetModule((File)paramIntent.next());
      publishProjectManager.addModuleToCurrentProject(localCreativeCloudAssetModule);
    }
    notifyEditViewGridAdapter(publishProjectManager.getProjectModules());
    enableActionBarRightNav();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    publishProjectManager.addProjectModuleChangeListener(this);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
    previewEditViewFlipper = ((ViewFlipper)rootView.findViewById(R.id.bsdkPublishProjectPreviewAndEditViewFlipper));
    initializePreviewProjectScreen();
    initializeEditProjectScreen();
    int i = 0;
    if (paramBundle != null)
    {
      selectedCameraImageUri = ((Uri)paramBundle.getParcelable("BUNDLE_KEY_CAMERA_IMAGE_URI_EDIT_FRAGMENT"));
      i = paramBundle.getInt("BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX_EDIT_PREVIEW_FRAGMENT", 0);
      if (i != 0) {
        break label113;
      }
      displayPreviewModulesView(false, true);
      enableActionBarRightNav();
    }
    for (;;)
    {
      rootView.setFocusableInTouchMode(true);
      rootView.setOnKeyListener(this);
      return rootView;
      if (!isEmptyProject()) {
        break;
      }
      i = 1;
      break;
      label113:
      displayEditModulesView(false);
    }
  }
  
  public void onDetach()
  {
    super.onDetach();
    publishProjectManager.removeProjectModuleChangeListener(this);
  }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (paramKeyEvent.getAction() != 0))
    {
      backButtonPressed();
      return true;
    }
    return false;
  }
  
  public void onRotate(ImageModule paramImageModule)
  {
    publishProjectManager.rotateImage(paramImageModule);
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (previewEditViewFlipper != null) {
      paramBundle.putInt("BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX_EDIT_PREVIEW_FRAGMENT", previewEditViewFlipper.getDisplayedChild());
    }
    if (selectedCameraImageUri != null) {
      paramBundle.putParcelable("BUNDLE_KEY_CAMERA_IMAGE_URI_EDIT_FRAGMENT", selectedCameraImageUri);
    }
  }
  
  public void onViewLoadingComplete()
  {
    progressBar.setVisibility(8);
    previewModulesListView.setVisibility(0);
  }
  
  public void projectModulesChanged(List<ProjectModule> paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      disableActionBarRightNav();
    }
    for (;;)
    {
      notifyPreviewViewGridAdapter();
      return;
      enableActionBarRightNav();
      notifyEditViewGridAdapter(paramList);
    }
  }
  
  public void remove(int paramInt)
  {
    ProjectModule localProjectModule = (ProjectModule)editImageAdapter.getItem(paramInt);
    if (localProjectModule.getType().equals(ProjectModuleTypes.IMAGE)) {
      ((ImageModule)localProjectModule).clearRotation();
    }
    publishProjectManager.removeProjectModule(localProjectModule);
    if (publishProjectManager.isEmptyProject())
    {
      showEmptyProjectMessage();
      return;
    }
    editImageAdapter.notifyDataSetChanged();
  }
  
  public void rotateImage(ImageModule paramImageModule)
  {
    notifyPreviewViewGridAdapter();
  }
  
  protected void updateNavigationControls()
  {
    super.updateNavigationControls();
    View localView = rootView.findViewById(R.id.bsdkPublishProjectPreviewFragmentTitlebarEditActionBtnTxtView);
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKPublishProjectPreviewFragment.this.displayEditModulesView(true);
      }
    });
    if (previewEditViewFlipper != null)
    {
      if (previewEditViewFlipper.getDisplayedChild() == 0) {
        localView.setVisibility(0);
      }
    }
    else {
      return;
    }
    localView.setVisibility(8);
  }
}
