package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource.DataSourceInternalFilters;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewCCFilesWithUploadContainerFragment;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewNewCCFilesContainerFragment.CCFilesActionBarController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCCFilesGridViewController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCCFilesSectionListViewController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewContainerConfiguration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AdobeAssetViewNewCCFilesEditFragment
  extends AdobeAssetViewCCFilesWithUploadContainerFragment
  implements IAdobeAssetViewEditFragmentControllerCallback
{
  private Toolbar _actionBarToolbar;
  private IAdobeActionButtonController _actionButtonController;
  private int _assetCount;
  private Drawable _backButton;
  private View _content;
  private Drawable _crossButton;
  private boolean _isGridView = false;
  protected AlertDialog alertDialog;
  protected View alertNegativeButton;
  protected View alertPositiveButton;
  protected TextView alertText;
  protected AlertDialog.Builder builder;
  public View dialogView;
  private boolean expandedMode = true;
  private boolean isRootViewEnabled = true;
  String targetCollectionHref;
  
  public AdobeAssetViewNewCCFilesEditFragment() {}
  
  private void clearAndDisableButtons()
  {
    if (isGridView()) {
      ((AdobeAssetViewEditGridViewController)_gridAssetsViewController).clearSelection();
    }
    for (;;)
    {
      _assetCount = 0;
      handleNoAssetSelection();
      return;
      ((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).clearSelection();
    }
  }
  
  private void deleteItems()
  {
    getSelectedAssets();
    AdobeCCFilesEditManager.createSession(getHostActivity().getSupportFragmentManager(), AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE, new IAdobeEditAssetCallback()
    {
      public void onAbort() {}
      
      public void onComplete()
      {
        AdobeAssetBrowserCommandMgr localAdobeAssetBrowserCommandMgr = AdobeAssetBrowserCommandMgr.getInstance();
        AdobeCCFilesEditManager.setEditCompletionHandled(false);
        localAdobeAssetBrowserCommandMgr.postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_COMPLETED);
      }
      
      public void onProgress(double paramAnonymousDouble)
      {
        AdobeLocalNotificationCenter localAdobeLocalNotificationCenter = AdobeLocalNotificationCenter.getDefaultNotificationCenter();
        HashMap localHashMap = new HashMap();
        localHashMap.put("EDIT_PROGRESS_KEY", Double.valueOf(paramAnonymousDouble));
        AdobeCCFilesEditManager.setProgressValue(paramAnonymousDouble);
        localAdobeLocalNotificationCenter.postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeAssetEditProgressChanged, localHashMap));
      }
    }, _assetViewConfiguration.getCloud()).startEditSession();
    getHostActivity().finish();
  }
  
  private void disableRootView()
  {
    if (isGridView()) {
      ((AdobeAssetViewEditGridViewController)_gridAssetsViewController).disableController();
    }
    for (;;)
    {
      getAssetsMainRootFrame().setAlpha(0.5F);
      isRootViewEnabled = false;
      return;
      ((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).disableController();
    }
  }
  
  private void enableRootView()
  {
    if (isGridView()) {
      ((AdobeAssetViewEditGridViewController)_gridAssetsViewController).enableController();
    }
    for (;;)
    {
      getAssetsMainRootFrame().setAlpha(1.0F);
      isRootViewEnabled = true;
      return;
      ((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).enableController();
    }
  }
  
  private int getCount()
  {
    if (isGridView()) {
      return ((AdobeAssetViewEditGridViewController)_gridAssetsViewController).getSelectedAssets().size();
    }
    return ((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).getSelectedAssets().size();
  }
  
  private String getResourceString(int paramInt)
  {
    return getResources().getString(paramInt);
  }
  
  private void getSelectedAssets()
  {
    AdobeAssetViewEditSelectedAssetsController localAdobeAssetViewEditSelectedAssetsController = AdobeAssetViewEditSelectedAssetsController.sharedController();
    if (isGridView())
    {
      localAdobeAssetViewEditSelectedAssetsController.setTargetAssets(((AdobeAssetViewEditGridViewController)_gridAssetsViewController).getSelectedAssets());
      return;
    }
    localAdobeAssetViewEditSelectedAssetsController.setTargetAssets(((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).getSelectedAssets());
  }
  
  private boolean isGridView()
  {
    return _isGridView;
  }
  
  private boolean isSingleAssetFile()
  {
    if (isGridView()) {
      return ((AdobeAssetViewEditGridViewController)_gridAssetsViewController).getSelectedAssets().get(0) instanceof AdobeAssetFile;
    }
    return ((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).getSelectedAssets().get(0) instanceof AdobeAssetFile;
  }
  
  private void setRenameButtonVisibilty(boolean paramBoolean)
  {
    if (_actionButtonController != null) {
      _actionButtonController.setRenameButtonVisibilty(paramBoolean);
    }
  }
  
  private void setupActionBarCustomFont()
  {
    _actionBarToolbar.setBackgroundColor(getResources().getColor(R.color.asset_browser_edit_actionbar_background));
    ((AdobeAssetEditActivity)getHostActivity()).setSupportActionBar(_actionBarToolbar);
    ((AdobeAssetEditActivity)getHostActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    ((AdobeAssetEditActivity)getHostActivity()).getSupportActionBar().setHomeButtonEnabled(true);
  }
  
  protected AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController createActionBarController()
  {
    return new CCFilesActionBarControllerWithEditControls();
  }
  
  protected AdobeStorageDataSource.DataSourceInternalFilters getInternalFilters()
  {
    return null;
  }
  
  protected void handleActionMenuButtonClick(boolean paramBoolean)
  {
    if (paramBoolean == true)
    {
      disableRootView();
      return;
    }
    enableRootView();
  }
  
  protected boolean handleBackPress()
  {
    boolean bool = false;
    if (_assetCount > 0)
    {
      _assetCount = 0;
      enableRootView();
      handleNoAssetSelection();
      if (!isGridView()) {
        break label43;
      }
      ((AdobeAssetViewEditGridViewController)_gridAssetsViewController).clearSelection();
    }
    for (;;)
    {
      bool = true;
      return bool;
      label43:
      ((AdobeAssetViewEditSectionalListViewController)_listAssetsViewController).clearSelection();
    }
  }
  
  protected void handleEraseButtonClick()
  {
    if (dialogView == null)
    {
      dialogView = getLayoutInflater(null).inflate(R.layout.adobe_alert_dialog_view, null);
      builder = new AlertDialog.Builder(getActivity());
      builder.setView(dialogView);
      alertText = ((TextView)dialogView.findViewById(R.id.alert_dialog_box_title_text));
      alertPositiveButton = dialogView.findViewById(R.id.alert_dialog_box_positive_button);
      alertNegativeButton = dialogView.findViewById(R.id.alert_dialog_box_negative_button);
      alertDialog = builder.create();
    }
    ((TextView)alertPositiveButton).setText(getResources().getString(R.string.adobe_asset_view_edit_delete_dialog_positive_button));
    ((TextView)alertNegativeButton).setText(getResources().getString(R.string.adobe_asset_view_edit_delete_dialog_negative_button));
    String str;
    if (getCount() > 1) {
      str = String.format(getResourceString(R.string.adobe_asset_view_edit_delete_dialog_message_multi_select), new Object[] { Integer.valueOf(getCount()) });
    }
    for (;;)
    {
      alertText.setText(str);
      alertPositiveButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          AdobeAssetViewNewCCFilesEditFragment.this.deleteItems();
          alertDialog.dismiss();
        }
      });
      alertNegativeButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          alertDialog.dismiss();
        }
      });
      alertDialog.show();
      return;
      if (isSingleAssetFile()) {
        str = getResourceString(R.string.adobe_asset_view_edit_delete_dialog_message_file);
      } else {
        str = getResourceString(R.string.adobe_asset_view_edit_delete_dialog_message_folder);
      }
    }
  }
  
  protected void handleExtraConfigurations(AdobeAssetViewEditFragmentExtraConfiguration paramAdobeAssetViewEditFragmentExtraConfiguration)
  {
    handleNoAssetSelection();
  }
  
  public void handleMoveButtonClick()
  {
    getSelectedAssets();
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_OPEN_MOVE_CCFILES_BROWSER);
  }
  
  public void handleMultipleAssetSelection(int paramInt)
  {
    setRenameButtonVisibilty(false);
    _assetCount = paramInt;
    AdobeCSDKActionBarController.setTitleWithColor(_content, "" + paramInt, -1);
  }
  
  protected void handleNetworkStatusChange(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      isRootViewEnabled = true;
      disableRootView();
      clearAndDisableButtons();
      return;
    }
    if (isRootViewEnabled)
    {
      enableRootView();
      return;
    }
    disableRootView();
  }
  
  public void handleNoAssetSelection()
  {
    expandedMode = false;
    if (_actionButtonController != null) {
      _actionButtonController.handleFloatingMenuVisibilty(false);
    }
    enableRootView();
    _actionBarToolbar.setNavigationIcon(_backButton);
    _assetCount = 0;
    AdobeCSDKActionBarController.setTitleWithColor(_content, getResourceString(R.string.adobe_asset_view_edit_fragment_title), -1);
  }
  
  protected void handleRenameButtonClick()
  {
    getSelectedAssets();
    AdobeCCFilesEditManager.createSession(getHostActivity().getSupportFragmentManager(), AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME, new IAdobeEditAssetCallback()
    {
      public void onAbort() {}
      
      public void onComplete()
      {
        AdobeAssetBrowserCommandMgr localAdobeAssetBrowserCommandMgr = AdobeAssetBrowserCommandMgr.getInstance();
        AdobeCCFilesEditManager.setEditCompletionHandled(false);
        localAdobeAssetBrowserCommandMgr.postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_COMPLETED);
      }
      
      public void onProgress(double paramAnonymousDouble)
      {
        AdobeLocalNotificationCenter localAdobeLocalNotificationCenter = AdobeLocalNotificationCenter.getDefaultNotificationCenter();
        HashMap localHashMap = new HashMap();
        localHashMap.put("EDIT_PROGRESS_KEY", Double.valueOf(paramAnonymousDouble));
        AdobeCCFilesEditManager.setProgressValue(paramAnonymousDouble);
        localAdobeLocalNotificationCenter.postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeAssetEditProgressChanged, localHashMap));
      }
    }, _assetViewConfiguration.getCloud()).startEditSession(new IAdobeCCFilesRenameDialogDismissController()
    {
      public void dialogClosed()
      {
        if (AdobeCCFilesEditManager.isEditInProgress()) {
          getHostActivity().finish();
        }
      }
    });
  }
  
  public void handleSingleAssetSelection()
  {
    if (_actionButtonController != null) {
      _actionButtonController.handleFloatingMenuVisibilty(true);
    }
    _actionBarToolbar.setNavigationIcon(_crossButton);
    _assetCount = 1;
    AdobeCSDKActionBarController.setTitleWithColor(_content, "" + _assetCount, -1);
    setRenameButtonVisibilty(true);
  }
  
  protected void initializeCCFilesContainerFromCollectionHref(String paramString)
  {
    super.initializeCCFilesContainerFromCollectionHref(targetCollectionHref);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    Bundle localBundle = getArguments();
    setRetainInstance(true);
    targetCollectionHref = localBundle.getString("EDIT_MULTI_SELECT_TARGET_HREF");
    super.onCreate(paramBundle);
    _crossButton = getResources().getDrawable(R.drawable.asset_edit_home_as_up_cross);
    _backButton = getResources().getDrawable(R.drawable.asset_edit_home_as_up_back);
    setupActionBarCustomFont();
    if (AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW == AdobeCommonLearnedSettings.lastVisualLayout())
    {
      _isGridView = false;
      return;
    }
    _isGridView = true;
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater) {}
  
  public void onHiddenChanged(boolean paramBoolean)
  {
    super.onHiddenChanged(paramBoolean);
  }
  
  public void onStart()
  {
    super.onStart();
  }
  
  public void onStop()
  {
    super.onStop();
  }
  
  protected void setActionBarToolbarAndContent(Toolbar paramToolbar, View paramView)
  {
    _actionBarToolbar = paramToolbar;
    _content = paramView;
  }
  
  protected void setActionButtonController(IAdobeActionButtonController paramIAdobeActionButtonController)
  {
    _actionButtonController = paramIAdobeActionButtonController;
  }
  
  protected AdobeAssetsViewCCFilesGridViewController setupGridViewController()
  {
    AdobeAssetViewEditGridViewController localAdobeAssetViewEditGridViewController = new AdobeAssetViewEditGridViewController(getActivity());
    localAdobeAssetViewEditGridViewController.setControllerCallback(this);
    return localAdobeAssetViewEditGridViewController;
  }
  
  protected AdobeAssetsViewCCFilesSectionListViewController setupSectionalListViewController()
  {
    AdobeAssetViewEditSectionalListViewController localAdobeAssetViewEditSectionalListViewController = new AdobeAssetViewEditSectionalListViewController(getActivity());
    localAdobeAssetViewEditSectionalListViewController.setControllerCallback(this);
    return localAdobeAssetViewEditSectionalListViewController;
  }
  
  protected class CCFilesActionBarControllerWithEditControls
    extends AdobeAssetViewNewCCFilesContainerFragment.CCFilesActionBarController
  {
    protected CCFilesActionBarControllerWithEditControls()
    {
      super();
    }
    
    public void handleCurrentNetworkStatus(boolean paramBoolean) {}
    
    public void handleOnStart()
    {
      if (_actionButtonController != null) {
        _actionButtonController.handleFloatingMenuVisibilty();
      }
    }
    
    public boolean handleOptionItemSelect(int paramInt)
    {
      return true;
    }
    
    public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater) {}
    
    public boolean onOptionsItemSelected(MenuItem paramMenuItem)
    {
      return true;
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu) {}
    
    public void refreshOptionItems() {}
    
    public void resetButtonState() {}
    
    protected void restoreFragmentActionBarFromSavedData() {}
    
    public void saveActionBarInstanceState() {}
  }
}
