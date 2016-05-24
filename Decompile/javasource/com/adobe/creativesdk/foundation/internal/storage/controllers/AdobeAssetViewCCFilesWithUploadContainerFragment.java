package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.menu;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.PushNotification.controller.AdobeNotificationManager;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource.DataSourceInternalFilters;
import com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar.AdobeUxActionBarDropDownController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewCommandsHandler;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeAssetViewEditFragmentExtraConfiguration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeAssetViewEditSelectedAssetsController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeCCFilesEditManager;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeCCFilesEditOperation;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeCCFilesEditSession;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeCCFilesEditSession.EditSummary;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeEditWindowDialogFragment;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.IAdobeAssetViewBrowserFragmentExtraControlsHostActivity;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.IAdobeEditAssetCallback;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeCCFilesUploadMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeCCFilesUploadSession;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeCCFilesUploadSession.UploadSummary;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeUxUtilMainUIThreadHandler;
import com.adobe.creativesdk.foundation.internal.utils.CreativeSDKTextView;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;
import java.util.EnumSet;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetViewCCFilesWithUploadContainerFragment
  extends AdobeAssetViewNewCCFilesContainerFragment
{
  IAdobeAssetViewBrowserFragmentExtraControlsHostActivity _adobeAssetViewBrowserFragmentExtraControls;
  private Menu _assetBrowserMenu;
  private Menu _ccFilesMenu;
  private Observer _ccfilesEditProgressObserver;
  private Observer _ccfilesUploadObserver;
  private Observer _collaborationVisibilityObserver;
  private MenuItem _collaboratorMenuItem;
  private boolean _editDialogVisible = false;
  private boolean _editMode = false;
  private ProgressDialog _editProgressDialogBar;
  private EditSummaryBanner _editSummaryBanner;
  private AdobeEditWindowDialogFragment _editWindow;
  private ProgressBar _folderLoadingProgressBar;
  private ImageButton _moveButton;
  private TextView _notificationCountTextView;
  private ImageView _notificationIcon;
  private MenuItem _notificationMenuItem;
  private View _notificationView;
  private ProgressBar _progressBar;
  private boolean _showNoFiles = true;
  private boolean _showUploadButton = true;
  private UploadDetails _uploadDetails;
  private UploadSummaryBanner _uploadSummaryBanner;
  protected CCFilesEditCommandsHandler ccFilesEditCommandsHandler;
  
  public AdobeAssetViewCCFilesWithUploadContainerFragment() {}
  
  private void action_editCompleted()
  {
    if (!AdobeCCFilesEditManager.hasEditCompletionHandled())
    {
      AdobeCCFilesEditManager.setEditCompletionHandled(true);
      if (_editWindow != null) {
        _editWindow.endDialogFragment();
      }
      AdobeCCFilesEditManager.setEditInProgress(false);
      AdobeAssetViewEditSelectedAssetsController.clearSelection();
      showEditSummaryBar(AdobeCCFilesEditManager.getLastSession());
    }
  }
  
  private void action_editStarted()
  {
    if (AdobeCCFilesEditManager.hasEditStarted())
    {
      AdobeCCFilesEditManager.setEditStarted(false);
      if ((_actionBarController instanceof CCFilesActionBarControllerWithUploadControls)) {
        ((CCFilesActionBarControllerWithUploadControls)_actionBarController).setEditMenuVisibilty(false);
      }
      showProgressDialogBar();
    }
  }
  
  private void action_forceRefresh()
  {
    reloadDataFromDataSource();
  }
  
  private void checkAndPrepareforAnyUploadsInContainer()
  {
    if (_uploadDetails != null) {}
    AdobeCCFilesUploadSession localAdobeCCFilesUploadSession;
    do
    {
      return;
      localAdobeCCFilesUploadSession = AdobeCCFilesUploadMgr.getInstance().getUploadSessionOfFolder(getTargetCollection());
    } while (localAdobeCCFilesUploadSession == null);
    prepareForUploadInContainer(localAdobeCCFilesUploadSession);
  }
  
  private ProgressDialog createEditProgressDialogBar()
  {
    _editProgressDialogBar = new ProgressDialog(getHostActivity());
    _editProgressDialogBar.setMessage(getResources().getString(R.string.adobe_asset_edit_in_progress));
    _editProgressDialogBar.setIndeterminate(true);
    _editProgressDialogBar.setCancelable(false);
    return _editProgressDialogBar;
  }
  
  private void createEditSummaryView()
  {
    if (_editSummaryBanner != null) {
      return;
    }
    RelativeLayout localRelativeLayout = new RelativeLayout(getHostActivity());
    localRelativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, getResources().getDimensionPixelSize(R.dimen.adobe_csdk_theme_actionbar_size)));
    localRelativeLayout.setGravity(17);
    CreativeSDKTextView localCreativeSDKTextView = new CreativeSDKTextView(getHostActivity());
    Object localObject = localCreativeSDKTextView.getLayoutParams();
    if (localObject == null) {
      localObject = new RelativeLayout.LayoutParams(-2, -2);
    }
    for (;;)
    {
      localCreativeSDKTextView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localCreativeSDKTextView.setTextColor(-1);
      localCreativeSDKTextView.setTextSize(0, getResources().getDimension(R.dimen.assetbrowser_grid_text_size));
      localRelativeLayout.addView(localCreativeSDKTextView);
      _editSummaryBanner = new EditSummaryBanner();
      _editSummaryBanner.bannerTitle = localCreativeSDKTextView;
      _editSummaryBanner.bannerView = localRelativeLayout;
      _editSummaryBanner.bannerView.setVisibility(8);
      getMainRootView().addView(_editSummaryBanner.bannerView);
      return;
      height = -2;
      width = -2;
    }
  }
  
  private void createFolderLoadingProgressBar()
  {
    _folderLoadingProgressBar = new ProgressBar(getHostActivity(), null, 16842872);
    _folderLoadingProgressBar.setProgressDrawable(getResources().getDrawable(R.drawable.asset_edit_progress_bar));
    _folderLoadingProgressBar.setVisibility(8);
    _folderLoadingProgressBar.setIndeterminateDrawable(getResources().getDrawable(R.drawable.asset_edit_progress_bar));
    _folderLoadingProgressBar.setIndeterminate(false);
    _folderLoadingProgressBar.setMax(100);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, getPixelsFromDP(getResources().getDimension(R.dimen.asset_edit_move_progress_bar_size)));
    _folderLoadingProgressBar.setProgress(0);
    localLayoutParams.addRule(10);
    _folderLoadingProgressBar.setLayoutParams(localLayoutParams);
    getMainRootView().addView(_folderLoadingProgressBar);
  }
  
  private void createMoveButton() {}
  
  private void createUploadSummaryBannerView()
  {
    if (_uploadSummaryBanner != null) {
      return;
    }
    RelativeLayout localRelativeLayout = new RelativeLayout(getHostActivity());
    localRelativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, getResources().getDimensionPixelSize(R.dimen.adobe_csdk_theme_actionbar_size)));
    localRelativeLayout.setGravity(17);
    CreativeSDKTextView localCreativeSDKTextView = new CreativeSDKTextView(getHostActivity());
    Object localObject = localCreativeSDKTextView.getLayoutParams();
    if (localObject == null) {
      localObject = new RelativeLayout.LayoutParams(-2, -2);
    }
    for (;;)
    {
      localCreativeSDKTextView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localCreativeSDKTextView.setTextColor(-1);
      localCreativeSDKTextView.setTextSize(0, getResources().getDimension(R.dimen.assetbrowser_grid_text_size));
      localRelativeLayout.addView(localCreativeSDKTextView);
      _uploadSummaryBanner = new UploadSummaryBanner();
      _uploadSummaryBanner.bannerTitle = localCreativeSDKTextView;
      _uploadSummaryBanner.bannerView = localRelativeLayout;
      _uploadSummaryBanner.bannerView.setVisibility(8);
      getMainRootView().addView(_uploadSummaryBanner.bannerView);
      return;
      height = -2;
      width = -2;
    }
  }
  
  private int getPixelsFromDP(float paramFloat)
  {
    return Math.round(paramFloat * getHostActivitygetApplicationContextgetResourcesgetDisplayMetricsdensity);
  }
  
  private void handleEditWindowNoNetwork()
  {
    if (_editWindow != null) {
      _editWindow.handleNoNetwork();
    }
  }
  
  private void handleMoveButtonClick()
  {
    AdobeAssetBrowserCommandMgr localAdobeAssetBrowserCommandMgr = AdobeAssetBrowserCommandMgr.getInstance();
    String str = getTargetCollection().getHref().toString();
    localAdobeAssetBrowserCommandMgr.postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_MOVE_OPERATION, str);
  }
  
  private void handleMoveButtonNetworkChange(boolean paramBoolean)
  {
    ImageButton localImageButton;
    if (_moveButton != null)
    {
      _moveButton.setEnabled(paramBoolean);
      localImageButton = _moveButton;
      if (!paramBoolean) {
        break label32;
      }
    }
    label32:
    for (float f = 1.0F;; f = 0.4F)
    {
      localImageButton.setAlpha(f);
      return;
    }
  }
  
  private void hideMenu()
  {
    if (_assetBrowserMenu != null) {
      hideMenuItemsUtil(_assetBrowserMenu);
    }
  }
  
  private boolean isAnyUploadInProgress()
  {
    return (_uploadDetails != null) && (_uploadDetails.isAnyUploadInProgress);
  }
  
  private void prepareForUploadInContainer(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
  {
    _uploadDetails = new UploadDetails();
    _uploadDetails.uploadSession = paramAdobeCCFilesUploadSession;
    _uploadDetails.isAnyUploadInProgress = true;
    _gridAssetsViewController.setUpListViewToTrackActiveUploads(paramAdobeCCFilesUploadSession);
    _listAssetsViewController.setUpListViewToTrackActiveUploads(paramAdobeCCFilesUploadSession);
  }
  
  private void setEditProgress(double paramDouble)
  {
    _progressBar.setVisibility(0);
    int i = (int)(100.0D * paramDouble);
    _progressBar.setProgress(i);
  }
  
  private void setNotificationCount(final int paramInt)
  {
    AdobeUxUtilMainUIThreadHandler.getHandler().post(new Runnable()
    {
      public void run()
      {
        if ((paramInt == 0) || (_assetViewConfiguration.getCloud().isPrivateCloud() == true))
        {
          _notificationCountTextView.setVisibility(4);
          return;
        }
        _notificationCountTextView.setVisibility(0);
        _notificationCountTextView.setText("" + paramInt);
      }
    });
  }
  
  private void setUploadInProgress(boolean paramBoolean)
  {
    if (_uploadDetails == null) {
      return;
    }
    _uploadDetails.isAnyUploadInProgress = paramBoolean;
  }
  
  private void showEditSummaryBar(final AdobeCCFilesEditSession paramAdobeCCFilesEditSession)
  {
    AdobeCCFilesEditSession.EditSummary localEditSummary = paramAdobeCCFilesEditSession.getEditSummary();
    if (localEditSummary.hasMoveOperationInSameLocation())
    {
      if (_editProgressDialogBar != null) {
        _editProgressDialogBar.dismiss();
      }
      Toast.makeText(getHostActivity(), R.string.adobe_asset_move_error_same_location, 1).show();
      return;
    }
    createEditSummaryView();
    int j = localEditSummary.getErrorCount();
    int i;
    String str;
    if (j > 0)
    {
      i = 1;
      str = "";
      if (i == 0) {
        break label359;
      }
      _editSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_error_banner_background);
      if (j != 1) {
        break label281;
      }
      if (operation != AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME) {
        break label229;
      }
      str = getResources().getString(R.string.IDS_EDIT_SINGLE_ERROR_MSG);
    }
    for (;;)
    {
      str = String.format(str, new Object[] { Integer.toString(j) });
      _editSummaryBanner.bannerView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_SHOW_ERROR_DETAILS, paramAdobeCCFilesEditSession.getEditSummary());
        }
      });
      paramAdobeCCFilesEditSession = str;
      reloadDataFromDataSource();
      if (_editProgressDialogBar != null) {
        _editProgressDialogBar.dismiss();
      }
      if (_progressBar != null) {
        _progressBar.setVisibility(8);
      }
      _editSummaryBanner.bannerTitle.setText(paramAdobeCCFilesEditSession);
      _editSummaryBanner.bannerView.setVisibility(0);
      AdobeUxUtilMainUIThreadHandler.getHandler().postDelayed(new Runnable()
      {
        public void run()
        {
          if ((_editSummaryBanner != null) && (_editSummaryBanner.bannerView != null)) {
            _editSummaryBanner.bannerView.setVisibility(8);
          }
        }
      }, 5000L);
      return;
      i = 0;
      break;
      label229:
      if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE)
      {
        str = getResources().getString(R.string.IDS_DELETE_SINGLE_ERROR_MSG);
      }
      else if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE)
      {
        str = getResources().getString(R.string.IDS_MOVE_SINGLE_ERROR_MSG);
        continue;
        label281:
        if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME) {
          str = getResources().getString(R.string.IDS_EDIT_ERROR_MSG);
        } else if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE) {
          str = getResources().getString(R.string.IDS_DELETE_ERROR_MSG);
        } else if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE) {
          str = getResources().getString(R.string.IDS_MOVE_ERROR_MSG);
        }
      }
    }
    label359:
    if (_progressBar != null)
    {
      _progressBar.setVisibility(0);
      _progressBar.setProgress(100);
    }
    _editSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_success_banner_background);
    if (localEditSummary.getSuccessCount() == 1) {
      if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME) {
        paramAdobeCCFilesEditSession = getResources().getString(R.string.IDS_EDIT_SINGLE_SUCCESS_MSG);
      }
    }
    for (;;)
    {
      paramAdobeCCFilesEditSession = String.format(paramAdobeCCFilesEditSession, new Object[] { Integer.toString(localEditSummary.getSuccessCount()) });
      break;
      if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE)
      {
        paramAdobeCCFilesEditSession = getResources().getString(R.string.IDS_DELETE_SINGLE_SUCCESS_MSG);
      }
      else
      {
        paramAdobeCCFilesEditSession = str;
        if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE)
        {
          paramAdobeCCFilesEditSession = getResources().getString(R.string.IDS_MOVE_SINGLE_SUCCESS_MSG);
          continue;
          if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME)
          {
            paramAdobeCCFilesEditSession = getResources().getString(R.string.IDS_EDIT_SUCCESS_MSG);
          }
          else if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE)
          {
            paramAdobeCCFilesEditSession = getResources().getString(R.string.IDS_DELETE_SUCCESS_MSG);
          }
          else
          {
            paramAdobeCCFilesEditSession = str;
            if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE) {
              paramAdobeCCFilesEditSession = getResources().getString(R.string.IDS_MOVE_SUCCESS_MSG);
            }
          }
        }
      }
    }
  }
  
  private void showMenu()
  {
    if (_assetBrowserMenu != null) {
      showMenuItemsUtil(_assetBrowserMenu);
    }
  }
  
  private void showProgressDialogBar()
  {
    _editProgressDialogBar = createEditProgressDialogBar();
    _editProgressDialogBar.show();
  }
  
  private void showUploadSummaryBar(final AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
  {
    createUploadSummaryBannerView();
    AdobeCCFilesUploadSession.UploadSummary localUploadSummary = paramAdobeCCFilesUploadSession.getUploadSummary();
    int j = 1;
    int k = localUploadSummary.getErrorCount();
    int i;
    if (k > 0)
    {
      i = 1;
      if (i == 0) {
        break label169;
      }
      _uploadSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_error_banner_background);
      if (k != 1) {
        break label154;
      }
    }
    label154:
    for (String str = getResources().getString(R.string.IDS_UPLOAD_SINGLE_ERROR_MSG);; str = getResources().getString(R.string.IDS_UPLOAD_ERROR_MSG))
    {
      str = String.format(str, new Object[] { Integer.toString(k) });
      _uploadSummaryBanner.bannerView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_UPLOAD_SHOW_ERROR_DETAILS, paramAdobeCCFilesUploadSession.getUploadSummary());
        }
      });
      i = j;
      paramAdobeCCFilesUploadSession = str;
      if (i != 0)
      {
        _uploadSummaryBanner.bannerTitle.setText(paramAdobeCCFilesUploadSession);
        _uploadSummaryBanner.bannerView.setVisibility(0);
        AdobeUxUtilMainUIThreadHandler.getHandler().postDelayed(new Runnable()
        {
          public void run()
          {
            if ((_uploadSummaryBanner != null) && (_uploadSummaryBanner.bannerView != null)) {
              _uploadSummaryBanner.bannerView.setVisibility(8);
            }
          }
        }, 7000L);
      }
      return;
      i = 0;
      break;
    }
    label169:
    _uploadSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_success_banner_background);
    if (localUploadSummary.getSuccessCount() == 1) {}
    for (paramAdobeCCFilesUploadSession = getResources().getString(R.string.IDS_UPLOAD_SINGLE_SUCCESS_MSG);; paramAdobeCCFilesUploadSession = getResources().getString(R.string.IDS_UPLOAD_SUCCESS_MSG))
    {
      str = String.format(paramAdobeCCFilesUploadSession, new Object[] { Integer.toString(localUploadSummary.getSuccessCount()) });
      paramAdobeCCFilesUploadSession = str;
      i = j;
      if (localUploadSummary.getSuccessCount() != 0) {
        break;
      }
      i = 0;
      paramAdobeCCFilesUploadSession = str;
      break;
    }
  }
  
  protected void cleanUpUploadRelatedSetup()
  {
    _gridAssetsViewController.cleanUpUploadRelatedSetup();
    _listAssetsViewController.cleanUpUploadRelatedSetup();
    _uploadDetails = null;
    reloadAssetItemsFromDataSourceDueToSwipeRefresh();
  }
  
  protected void configureEmptyStateView(View paramView)
  {
    int j = 0;
    View localView = paramView.findViewById(R.id.assetview_emptyfolder_upload_files_btn);
    paramView = (TextView)paramView.findViewById(R.id.adobe_storage_asset_browser_empty_state_message);
    if (_showNoFiles)
    {
      i = 0;
      paramView.setVisibility(i);
      if (localView != null) {
        if (!_showUploadButton) {
          break label75;
        }
      }
    }
    label75:
    for (int i = j;; i = 4)
    {
      localView.setVisibility(i);
      localView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_UPLOAD_FILES, getTargetCollection());
        }
      });
      return;
      i = 4;
      break;
    }
  }
  
  protected AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController createActionBarController()
  {
    return new CCFilesActionBarControllerWithUploadControls();
  }
  
  protected void ds_startedLoadingMoreFolders()
  {
    if (_folderLoadingProgressBar != null)
    {
      _folderLoadingProgressBar.setVisibility(0);
      _folderLoadingProgressBar.setIndeterminate(true);
    }
  }
  
  protected void ds_stoppedLoadingMoreFolders()
  {
    if (_folderLoadingProgressBar != null)
    {
      _folderLoadingProgressBar.setIndeterminate(false);
      _folderLoadingProgressBar.setProgress(100);
    }
  }
  
  protected AdobeStorageDataSource.DataSourceInternalFilters getInternalFilters()
  {
    if ((getHostActivity() instanceof IAdobeAssetViewBrowserFragmentExtraControlsHostActivity))
    {
      _adobeAssetViewBrowserFragmentExtraControls = ((IAdobeAssetViewBrowserFragmentExtraControlsHostActivity)getHostActivity());
      if ((_adobeAssetViewBrowserFragmentExtraControls.hasExtraControls()) && (_adobeAssetViewBrowserFragmentExtraControls.getExtraConfiguration().shouldShowOnlyFolders())) {
        return AdobeStorageDataSource.DataSourceInternalFilters.FilterOnlyFolders;
      }
      return null;
    }
    return super.getInternalFilters();
  }
  
  protected void handleCollaborationVisibilty(boolean paramBoolean)
  {
    boolean bool = true;
    paramBoolean = true;
    if (isContainerShowingRootCollection())
    {
      localMenuItem = _notificationMenuItem;
      if (!isSearchBarOpened()) {}
      for (;;)
      {
        localMenuItem.setVisible(paramBoolean);
        _collaboratorMenuItem.setVisible(false);
        return;
        paramBoolean = false;
      }
    }
    MenuItem localMenuItem = _collaboratorMenuItem;
    if (!isSearchBarOpened()) {}
    for (paramBoolean = bool;; paramBoolean = false)
    {
      localMenuItem.setVisible(paramBoolean);
      _notificationMenuItem.setVisible(false);
      return;
    }
  }
  
  public void handleCurrentNetworkStatusWithUpload(boolean paramBoolean)
  {
    if (isContainerShowingRootCollection()) {
      if (_notificationMenuItem != null) {
        _notificationMenuItem.setVisible(paramBoolean);
      }
    }
    while (_collaboratorMenuItem == null) {
      return;
    }
    _collaboratorMenuItem.setVisible(paramBoolean);
  }
  
  protected void handleExtraConfigurations(AdobeAssetViewEditFragmentExtraConfiguration paramAdobeAssetViewEditFragmentExtraConfiguration)
  {
    if (paramAdobeAssetViewEditFragmentExtraConfiguration.getMoveButton())
    {
      createMoveButton();
      createFolderLoadingProgressBar();
      _showUploadButton = false;
      _showNoFiles = false;
      _actionBarController = new CCFilesActionBarControllerWithEditControls(null);
      if (!isContainerShowingRootCollection()) {
        AdobeCSDKActionBarController.setTitle(getActivity().findViewById(16908290), getTargetCollection().getName());
      }
    }
    else
    {
      return;
    }
    AdobeCSDKActionBarController.setTitle(getActivity().findViewById(16908290), getResources().getString(R.string.adobe_asset_view_move_fragment_title));
  }
  
  public void handleLongClickOnAsset(AdobeAsset paramAdobeAsset)
  {
    if ((!AdobeCCFilesEditManager.isEditInProgress()) && (isNetworkOnline()))
    {
      _editWindow = new AdobeEditWindowDialogFragment(getActivity(), paramAdobeAsset.getName());
      _editWindow.setEditCallback(new IAdobeEditAssetCallback()
      {
        public void onAbort() {}
        
        public void onComplete()
        {
          postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_COMPLETED, null);
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      });
      AdobeAssetViewEditSelectedAssetsController.sharedController().setTargetAssets(paramAdobeAsset);
      paramAdobeAsset = getFragmentManager().beginTransaction();
      _editWindow.setCloud(_assetViewConfiguration.getCloud());
      _editWindow.setShowsDialog(true);
      _editWindow.show(paramAdobeAsset, "Edit");
    }
  }
  
  protected void handleNetworkStatusChange(boolean paramBoolean)
  {
    if (!paramBoolean) {
      handleEditWindowNoNetwork();
    }
    handleMoveButtonNetworkChange(paramBoolean);
  }
  
  protected void handlePostOnCreateView(Bundle paramBundle)
  {
    super.handlePostOnCreateView(paramBundle);
    _notificationView = getLayoutInflater(null).inflate(R.layout.adobe_notification_icon_view, null);
    _notificationIcon = ((ImageView)_notificationView.findViewById(R.id.notification_icon));
    _notificationCountTextView = ((TextView)_notificationView.findViewById(R.id.adobe_notification_count));
    if ((_notificationView != null) && (_assetViewConfiguration.getCloud() != null) && (_assetViewConfiguration.getCloud().isPrivateCloud()))
    {
      _notificationIcon.setImageResource(R.drawable.ic_notifications_black_24dp_disabled);
      _notificationView.setEnabled(false);
      if (_notificationCountTextView != null) {
        _notificationCountTextView.setVisibility(4);
      }
    }
    checkAndPrepareforAnyUploadsInContainer();
    if ((getHostActivity() instanceof IAdobeAssetViewBrowserFragmentExtraControlsHostActivity))
    {
      _adobeAssetViewBrowserFragmentExtraControls = ((IAdobeAssetViewBrowserFragmentExtraControlsHostActivity)getHostActivity());
      if (_adobeAssetViewBrowserFragmentExtraControls.hasExtraControls()) {
        handleExtraConfigurations(_adobeAssetViewBrowserFragmentExtraControls.getExtraConfiguration());
      }
    }
    _progressBar = new ProgressBar(getHostActivity(), null, 16842872);
    _progressBar.setProgressDrawable(getResources().getDrawable(R.drawable.asset_edit_progress_bar));
    _progressBar.setVisibility(8);
    _progressBar.setIndeterminateDrawable(getResources().getDrawable(R.drawable.asset_edit_progress_bar));
    _progressBar.setIndeterminate(false);
    _progressBar.setMax(100);
    paramBundle = new RelativeLayout.LayoutParams(-1, getPixelsFromDP(getResources().getDimension(R.dimen.asset_edit_progress_bar_size)));
    _progressBar.setProgress(0);
    paramBundle.addRule(10);
    _progressBar.setLayoutParams(paramBundle);
    getMainRootView().addView(_progressBar);
  }
  
  protected void handlePreOnStart() {}
  
  protected void hideCollaborationAndNotificationIcon()
  {
    if (_collaboratorMenuItem != null) {
      _collaboratorMenuItem.setVisible(false);
    }
    if (_notificationMenuItem != null) {
      _notificationMenuItem.setVisible(false);
    }
  }
  
  protected boolean isSearchBarOpened()
  {
    return super.isSearchBarOpened();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    ccFilesEditCommandsHandler = new CCFilesEditCommandsHandler(null);
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    if (_editWindow != null) {
      _editWindow.endDialogFragment();
    }
  }
  
  public void onStart()
  {
    super.onStart();
    if (!(getHostActivity() instanceof IAdobeAssetViewBrowserFragmentExtraControlsHostActivity))
    {
      ccFilesEditCommandsHandler.onStart();
      if (AdobeCCFilesEditManager.hasEditStarted()) {
        action_editStarted();
      }
      if (!AdobeCCFilesEditManager.hasEditCompletionHandled()) {
        action_editCompleted();
      }
    }
    if ((AdobeCCFilesEditManager.isEditInProgress()) && (_progressBar != null)) {
      setEditProgress(AdobeCCFilesEditManager.getProgressValue());
    }
  }
  
  public void onStop()
  {
    super.onStop();
    if (!(getHostActivity() instanceof IAdobeAssetViewBrowserFragmentExtraControlsHostActivity)) {
      ccFilesEditCommandsHandler.onStop();
    }
  }
  
  protected void registerLocalNofications()
  {
    super.registerLocalNofications();
    if (_ccfilesUploadObserver == null) {
      _ccfilesUploadObserver = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (AdobeNotification)paramAnonymousObject;
          paramAnonymousObject = (AdobeCCFilesUploadSession)paramAnonymousObservable.getInfo().get(AdobeCCFilesUploadMgr.UPLOAD_SESSION_KEY);
          AdobeCCFilesUploadMgr.getInstance();
          if (!AdobeCCFilesUploadMgr.isUploadSessionDestinationFolderEqual(paramAnonymousObject, getTargetCollection())) {}
          do
          {
            return;
            if (paramAnonymousObservable.getId() == AdobeInternalNotificationID.AdobeCCFilesUploadSessionStarted)
            {
              upload_handleUploadStartedNotification(paramAnonymousObject);
              return;
            }
            if (paramAnonymousObservable.getId() == AdobeInternalNotificationID.AdobeCCFilesUploadSessionComplete)
            {
              upload_handleUploadCompleteNotification(paramAnonymousObject);
              return;
            }
          } while (paramAnonymousObservable.getId() != AdobeInternalNotificationID.AdobeCCFilesUploadSessionCancelled);
          upload_handleUploadCancelledNotification(paramAnonymousObject);
        }
      };
    }
    if (_collaborationVisibilityObserver == null) {
      _collaborationVisibilityObserver = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = _assetViewConfiguration.getCloud();
          paramAnonymousObject = (AdobeNotification)paramAnonymousObject;
          if (paramAnonymousObject.getId() == AdobeInternalNotificationID.AdobeCCFilesCollaborationChangeTitleToCollaborator)
          {
            AdobeAssetViewCCFilesWithUploadContainerFragment.this.hideMenu();
            if (useDropDownActionBar()) {
              AdobeUxActionBarDropDownController.getInstance().setDropDownDetails(false, getResources().getString(R.string.collaborator), paramAnonymousObservable);
            }
          }
          while (paramAnonymousObject.getId() != AdobeInternalNotificationID.AdobeCCFilesCollaborationChangeTitleToTargetAsset)
          {
            return;
            AdobeCSDKActionBarController.setTitle(getActivity().findViewById(16908290), getResources().getString(R.string.collaborator));
            return;
          }
          if (useDropDownActionBar()) {
            AdobeUxActionBarDropDownController.getInstance().setDropDownDetails(false, getCurrentTargetCollectionName(), paramAnonymousObservable);
          }
          for (;;)
          {
            AdobeAssetViewCCFilesWithUploadContainerFragment.this.showMenu();
            return;
            AdobeCSDKActionBarController.setTitle(getActivity().findViewById(16908290), getCurrentTargetCollectionName());
          }
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesRefreshNotificationCount, new Observer()
    {
      public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
      {
        AdobeAssetViewCCFilesWithUploadContainerFragment.this.setNotificationCount(((Integer)((AdobeNotification)paramAnonymousObject).getInfo().get("unreadCount")).intValue());
      }
    });
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesCollaborationChangeTitleToCollaborator, _collaborationVisibilityObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesCollaborationChangeTitleToTargetAsset, _collaborationVisibilityObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesUploadSessionStarted, _ccfilesUploadObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesUploadSessionComplete, _ccfilesUploadObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesUploadSessionCancelled, _ccfilesUploadObserver);
    if (!(getHostActivity() instanceof IAdobeAssetViewBrowserFragmentExtraControlsHostActivity))
    {
      if (_ccfilesEditProgressObserver == null) {
        _ccfilesEditProgressObserver = new EditProgressNotificationObserver();
      }
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAssetEditProgressChanged, _ccfilesEditProgressObserver);
    }
  }
  
  public void reloadAssetItemsFromDataSourceDueToSwipeRefresh()
  {
    super.reloadAssetItemsFromDataSourceDueToSwipeRefresh();
    setNotificationCount(AdobeNotificationManager.getUnreadCount());
  }
  
  protected void showCollaborationAndNotificationIcon()
  {
    boolean bool2 = true;
    boolean bool1 = true;
    if (isContainerShowingRootCollection())
    {
      localMenuItem = _notificationMenuItem;
      if (!isSearchBarOpened()) {}
      for (;;)
      {
        localMenuItem.setVisible(bool1);
        getActionBarController().refreshOptionItems();
        return;
        bool1 = false;
      }
    }
    MenuItem localMenuItem = _collaboratorMenuItem;
    if (!isSearchBarOpened()) {}
    for (bool1 = bool2;; bool1 = false)
    {
      localMenuItem.setVisible(bool1);
      break;
    }
  }
  
  protected void unRegisterLocalNotifications()
  {
    super.unRegisterLocalNotifications();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesUploadSessionStarted, _ccfilesUploadObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesUploadSessionComplete, _ccfilesUploadObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesUploadSessionCancelled, _ccfilesUploadObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesCollaborationChangeTitleToCollaborator, _collaborationVisibilityObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesCollaborationChangeTitleToTargetAsset, _collaborationVisibilityObserver);
    if ((!(getHostActivity() instanceof IAdobeAssetViewBrowserFragmentExtraControlsHostActivity)) && (_ccfilesEditProgressObserver != null)) {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAssetEditProgressChanged, _ccfilesEditProgressObserver);
    }
  }
  
  protected void upload_handleUploadCancelledNotification(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
  {
    setUploadInProgress(false);
    cleanUpUploadRelatedSetup();
  }
  
  protected void upload_handleUploadCompleteNotification(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
  {
    setUploadInProgress(false);
    cleanUpUploadRelatedSetup();
    showUploadSummaryBar(paramAdobeCCFilesUploadSession);
  }
  
  protected void upload_handleUploadStartedNotification(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
  {
    prepareForUploadInContainer(paramAdobeCCFilesUploadSession);
    setUploadInProgress(true);
    hideProgressView();
    hideEmptyStateView();
  }
  
  private class CCFilesActionBarControllerWithEditControls
    extends AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController
  {
    protected MenuItem _moveMenuItem;
    
    private CCFilesActionBarControllerWithEditControls()
    {
      super();
    }
    
    protected boolean handleOptionItemSelect(int paramInt)
    {
      if (paramInt == R.id.adobe_uxassetbrowser_loki_assets_view_move_asset)
      {
        AdobeAssetViewCCFilesWithUploadContainerFragment.this.handleMoveButtonClick();
        return true;
      }
      return false;
    }
    
    public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
    {
      paramMenuInflater.inflate(R.menu.adobe_asset_edit_move_menu, paramMenu);
      _moveMenuItem = paramMenu.findItem(R.id.adobe_uxassetbrowser_loki_assets_view_move_asset);
      _moveMenuItem.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener()
      {
        public boolean onMenuItemClick(MenuItem paramAnonymousMenuItem)
        {
          AdobeAssetViewCCFilesWithUploadContainerFragment.this.handleMoveButtonClick();
          return true;
        }
      });
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu)
    {
      _moveMenuItem.setVisible(true);
      refreshOptionItems();
    }
    
    public void refreshOptionItems()
    {
      super.refreshOptionItems();
      if (!isNetworkOnline()) {
        _moveMenuItem.setVisible(false);
      }
    }
  }
  
  protected class CCFilesActionBarControllerWithUploadControls
    extends AdobeAssetViewNewCCFilesContainerFragment.CCFilesActionBarController
  {
    private MenuItem _createNewFolder;
    private MenuItem _editAssets;
    private MenuItem _takeCameraPhoto;
    private MenuItem _uploadBtn;
    
    protected CCFilesActionBarControllerWithUploadControls()
    {
      super();
    }
    
    private void refreshOptionsInternal()
    {
      boolean bool2 = true;
      if (_uploadBtn == null) {
        return;
      }
      AdobeAssetViewCCFilesWithUploadContainerFragment.this.setNotificationCount(AdobeNotificationManager.getUnreadCount());
      boolean bool3 = AdobeAssetViewCCFilesWithUploadContainerFragment.this.isAnyUploadInProgress();
      MenuItem localMenuItem = _uploadBtn;
      AdobeAssetViewCCFilesWithUploadContainerFragment localAdobeAssetViewCCFilesWithUploadContainerFragment = AdobeAssetViewCCFilesWithUploadContainerFragment.this;
      int i;
      if (bool3)
      {
        i = R.string.CANCEL_UPLOAD_ASSET_BROWSER_BUTTON;
        label50:
        localMenuItem.setTitle(localAdobeAssetViewCCFilesWithUploadContainerFragment.getAdobeFormattedString(i));
        localMenuItem = _uploadBtn;
        if (isSearchBarOpened()) {
          break label409;
        }
        bool1 = true;
        label82:
        localMenuItem.setVisible(bool1);
        _createNewFolder.setTitle(getAdobeFormattedString(R.string.CREATE_NEW_FOLDER_TITLE));
        localMenuItem = _createNewFolder;
        if ((!isSearchBarOpened()) && (!bool3)) {
          break label414;
        }
        bool1 = false;
        label134:
        localMenuItem.setVisible(bool1);
        _takeCameraPhoto.setTitle(getAdobeFormattedString(R.string.UPLOAD_ASSET_FROM_CAMERA_BUTTON));
        localMenuItem = _takeCameraPhoto;
        if ((!isSearchBarOpened()) && (!bool3)) {
          break label419;
        }
        bool1 = false;
        label186:
        localMenuItem.setVisible(bool1);
        _editAssets.setTitle(getAdobeFormattedString(R.string.adobe_uxassetbrowser_action_edit_asset));
        localMenuItem = _editAssets;
        if ((!isSearchBarOpened()) && (!bool3)) {
          break label424;
        }
      }
      label236:
      for (boolean bool1 = false;; bool1 = bool2)
      {
        localMenuItem.setVisible(bool1);
        if (_notificationView != null)
        {
          _notificationMenuItem.setActionView(_notificationView);
          _notificationView.setOnClickListener(new View.OnClickListener()
          {
            public void onClick(View paramAnonymousView)
            {
              postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_MENU_NOTIFICATION, null);
            }
          });
        }
        if (!isNetworkOnline())
        {
          _notificationMenuItem.setVisible(false);
          _collaboratorMenuItem.setVisible(false);
          _uploadBtn.setVisible(false);
          _takeCameraPhoto.setVisible(false);
          _createNewFolder.setVisible(false);
          _editAssets.setVisible(false);
        }
        if (AdobeAssetViewUtils.deviceHasCameraFeature(getHostActivity())) {
          break;
        }
        _takeCameraPhoto.setVisible(false);
        return;
        i = R.string.UPLOAD_ASSET_BROWSER_BUTTON;
        break label50;
        label409:
        bool1 = false;
        break label82;
        label414:
        bool1 = true;
        break label134;
        label419:
        bool1 = true;
        break label186;
        label424:
        if ((AdobeCCFilesEditManager.isEditInProgress()) || (!isAssetsMainFrameVisible()) || (!isNetworkOnline())) {
          break label236;
        }
      }
    }
    
    public boolean handleOptionItemSelect(int paramInt)
    {
      if (paramInt == R.id.adobe_uxassetbrowser_loki_upload_btn)
      {
        if (AdobeAssetViewCCFilesWithUploadContainerFragment.this.isAnyUploadInProgress())
        {
          postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_CANCEL_UPLOAD, getTargetCollection());
          return true;
        }
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_UPLOAD_FILES, getTargetCollection());
        return true;
      }
      if (paramInt == R.id.adobe_uxassetbrowser_loki_createnewfolder)
      {
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_MENU_CREATE_NEWFOLDER, getTargetCollection());
        return true;
      }
      if (paramInt == R.id.adobe_uxassetbrowser_assets_view_edit_asset)
      {
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_OPEN_MULTI_SELECT_EDIT_WINDOW, getTargetCollection().getHref().toString());
        return true;
      }
      if (paramInt == R.id.adobe_uxassetbrowser_loki_upload_from_camera)
      {
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_UPLOAD_PHOTO_FROM_CAMERA, getTargetCollection());
        return true;
      }
      if (paramInt == R.id.asset_browser_adobe_notification)
      {
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_MENU_NOTIFICATION, null);
        return true;
      }
      if (paramInt == R.id.asset_browser_add_collaborator)
      {
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_MENU_COLLABORATION, getTargetCollection());
        return true;
      }
      return super.handleOptionItemSelect(paramInt);
    }
    
    public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
    {
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
      AdobeAssetViewCCFilesWithUploadContainerFragment.access$902(AdobeAssetViewCCFilesWithUploadContainerFragment.this, paramMenu);
      paramMenuInflater.inflate(R.menu.adobe_assetview_loki_upload_menu, paramMenu);
      _uploadBtn = paramMenu.findItem(R.id.adobe_uxassetbrowser_loki_upload_btn);
      _createNewFolder = paramMenu.findItem(R.id.adobe_uxassetbrowser_loki_createnewfolder);
      _takeCameraPhoto = paramMenu.findItem(R.id.adobe_uxassetbrowser_loki_upload_from_camera);
      _editAssets = paramMenu.findItem(R.id.adobe_uxassetbrowser_assets_view_edit_asset);
      AdobeAssetViewCCFilesWithUploadContainerFragment.access$1002(AdobeAssetViewCCFilesWithUploadContainerFragment.this, paramMenu.findItem(R.id.asset_browser_adobe_notification));
      AdobeAssetViewCCFilesWithUploadContainerFragment.access$1102(AdobeAssetViewCCFilesWithUploadContainerFragment.this, paramMenu.findItem(R.id.asset_browser_add_collaborator));
      if ((_collaboratorMenuItem != null) && (_assetViewConfiguration.getCloud().isPrivateCloud()))
      {
        _collaboratorMenuItem.setEnabled(false);
        _collaboratorMenuItem.setIcon(R.drawable.ic_people_black_24dp_disabled);
      }
      AdobeAssetViewCCFilesWithUploadContainerFragment.access$1202(AdobeAssetViewCCFilesWithUploadContainerFragment.this, paramMenu);
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu)
    {
      super.onPrepareOptionsMenu(paramMenu);
      refreshOptionsInternal();
    }
    
    public void refreshOptionItems()
    {
      super.refreshOptionItems();
      refreshOptionsInternal();
    }
    
    public void setEditMenuVisibilty(boolean paramBoolean)
    {
      if (_editAssets != null) {
        _editAssets.setVisible(paramBoolean);
      }
    }
  }
  
  private class CCFilesEditCommandsHandler
    extends AdobeAssetViewCommandsHandler
  {
    private CCFilesEditCommandsHandler() {}
    
    protected void HandleCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject)
    {
      if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ASSETVIEW_BROWSER_CCFILES_FORCE_REFRESH_LIST) {
        AdobeAssetViewCCFilesWithUploadContainerFragment.this.action_forceRefresh();
      }
      do
      {
        return;
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_STARTED)
        {
          AdobeAssetViewCCFilesWithUploadContainerFragment.this.action_editStarted();
          return;
        }
      } while (paramAdobeAssetViewBrowserCommandName != AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_COMPLETED);
      AdobeAssetViewCCFilesWithUploadContainerFragment.this.action_editCompleted();
    }
    
    protected EnumSet<AdobeAssetViewBrowserCommandName> getCommandsListToRegister()
    {
      return EnumSet.of(AdobeAssetViewBrowserCommandName.ASSETVIEW_BROWSER_CCFILES_FORCE_REFRESH_LIST, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_COMPLETED, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_STARTED);
    }
  }
  
  class EditProgressNotificationObserver
    implements Observer
  {
    EditProgressNotificationObserver() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if (paramObservable.getId() == AdobeInternalNotificationID.AdobeAssetEditProgressChanged)
      {
        paramObservable = paramObservable.getInfo();
        if (paramObservable.containsKey("EDIT_PROGRESS_KEY"))
        {
          double d = ((Double)paramObservable.get("EDIT_PROGRESS_KEY")).doubleValue();
          AdobeAssetViewCCFilesWithUploadContainerFragment.this.setEditProgress(d);
        }
      }
    }
  }
  
  class EditSummaryBanner
  {
    public TextView bannerTitle;
    public View bannerView;
    
    EditSummaryBanner() {}
  }
  
  class UploadDetails
  {
    public boolean isAnyUploadInProgress;
    public AdobeCCFilesUploadSession uploadSession;
    
    UploadDetails() {}
  }
  
  class UploadSummaryBanner
  {
    public TextView bannerTitle;
    public View bannerView;
    
    UploadSummaryBanner() {}
  }
}
