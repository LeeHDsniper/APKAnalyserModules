package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentManager.OnBackStackChangedListener;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewMainBrowserFragment;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewContainerConfiguration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewCommandsHandler;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.getbase.floatingactionbutton.FloatingActionButton;
import com.getbase.floatingactionbutton.FloatingActionsMenu;
import com.getbase.floatingactionbutton.FloatingActionsMenu.OnFloatingActionsMenuUpdateListener;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

public class AdobeAssetEditActivity
  extends ActionBarActivity
  implements IAdobeActionButtonController, IAdobeAssetViewBrowserFragmentExtraControlsHostActivity
{
  private static String DATA_SOURCE_FILTER_ARRAY_KEY = "DATA_SOURCE_FILTER_ARRAY";
  private static String EDIT_ACTIVITY_BUNDLE_KEY = "EDIT_ACTIVITY_BUNDLE";
  private Toolbar _actionBarToolbar;
  private AssetEditContainerCommandsHandler _assetContainerCommandsHandler = new AssetEditContainerCommandsHandler(null);
  private View _assetEditView;
  private View _assetMoveView;
  private View _contentView;
  private FloatingActionButton _deleteButton;
  private FloatingActionButton _editButton;
  private AdobeAssetViewEditActivityConfiguration _editConfiguration;
  private FloatingActionsMenu _floatingActionMenu;
  private View _floatingActionMenuContainer;
  private Menu _menu;
  private FloatingActionButton _moveButton;
  protected Fragment _moveFragment = null;
  protected Fragment _multiSelectFragment = null;
  private boolean _multiSelectStarted = false;
  private AdobeAssetViewEditFragmentExtraConfiguration configuration;
  private boolean isFloatingMenuExpanded = false;
  private boolean isFloatingMenuVisible = false;
  private String multiSelectSourceHref;
  
  public AdobeAssetEditActivity() {}
  
  private void OpenMoveFileBrowser()
  {
    startFileBrowser();
  }
  
  private void clearMenu()
  {
    if (_menu != null)
    {
      int i = 0;
      while (i < _menu.size())
      {
        int j = _menu.getItem(i).getItemId();
        _menu.removeItem(j);
        i += 1;
      }
    }
  }
  
  private Fragment createCCFilesMoveBrowserFragment()
  {
    AdobeAssetViewMainBrowserFragment localAdobeAssetViewMainBrowserFragment = new AdobeAssetViewMainBrowserFragment();
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(AdobeAssetsViewContainerConfiguration.ADOBE_CLOUD_KEY, AdobeCloudManager.getSharedCloudManager().getDefaultCloud());
    EnumSet localEnumSet = EnumSet.of(AdobeAssetDataSourceType.AdobeAssetDataSourceFiles);
    localBundle.putSerializable(DATA_SOURCE_FILTER_ARRAY_KEY, localEnumSet);
    localAdobeAssetViewMainBrowserFragment.setArguments(localBundle);
    return localAdobeAssetViewMainBrowserFragment;
  }
  
  private Fragment createEditMultiSelectFragment()
  {
    AdobeAssetViewNewCCFilesEditFragment localAdobeAssetViewNewCCFilesEditFragment = new AdobeAssetViewNewCCFilesEditFragment();
    localAdobeAssetViewNewCCFilesEditFragment.setActionButtonController(this);
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(AdobeAssetsViewContainerConfiguration.ADOBE_CLOUD_KEY, AdobeCloudManager.getSharedCloudManager().getDefaultCloud());
    localBundle.putString("EDIT_MULTI_SELECT_TARGET_HREF", multiSelectSourceHref);
    localAdobeAssetViewNewCCFilesEditFragment.setArguments(localBundle);
    return localAdobeAssetViewNewCCFilesEditFragment;
  }
  
  private boolean handleBackPress()
  {
    if (!_multiSelectStarted) {
      if (_moveFragment == null) {
        super.onBackPressed();
      }
    }
    for (;;)
    {
      return false;
      if (((AdobeAssetViewMainBrowserFragment)_moveFragment).isAtRootFragment())
      {
        finish();
        return true;
      }
      return ((AdobeAssetViewMainBrowserFragment)_moveFragment).handleOnBackPressed();
      if (_moveFragment != null)
      {
        if (((AdobeAssetViewMainBrowserFragment)_moveFragment).isAtRootFragment())
        {
          boolean bool = ((AdobeAssetViewMainBrowserFragment)_moveFragment).handleOnBackPressed();
          _moveFragment = null;
          setActionBarForMultiSelect();
          _assetMoveView.setVisibility(8);
          _assetEditView.setVisibility(0);
          handleFloatingMenuVisibilty();
          return bool;
        }
        return ((AdobeAssetViewMainBrowserFragment)_moveFragment).handleOnBackPressed();
      }
      if (!((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleBackPress()) {
        finish();
      }
    }
  }
  
  private void handleBackStackChange()
  {
    getSupportFragmentManager().getBackStackEntryCount();
  }
  
  private void handleDelete()
  {
    if (_multiSelectFragment != null) {
      ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleEraseButtonClick();
    }
  }
  
  private void handleMoveOperation()
  {
    if (_multiSelectFragment != null) {
      ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleMoveButtonClick();
    }
  }
  
  private void handleMoveOperation(String paramString)
  {
    AdobeCCFilesEditManager.createSession(paramString, getSupportFragmentManager(), AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE, new IAdobeEditAssetCallback()
    {
      public void onAbort() {}
      
      public void onComplete()
      {
        AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_COMPLETED);
      }
      
      public void onProgress(double paramAnonymousDouble)
      {
        AdobeLocalNotificationCenter localAdobeLocalNotificationCenter = AdobeLocalNotificationCenter.getDefaultNotificationCenter();
        HashMap localHashMap = new HashMap();
        localHashMap.put("EDIT_PROGRESS_KEY", Double.valueOf(paramAnonymousDouble));
        AdobeCCFilesEditManager.setProgressValue(paramAnonymousDouble);
        localAdobeLocalNotificationCenter.postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeAssetEditProgressChanged, localHashMap));
      }
    }, _editConfiguration.getCloud()).startEditSession();
    finish();
  }
  
  private boolean handleOutsideTouchForFloatingButton()
  {
    if ((_floatingActionMenu != null) && (_floatingActionMenu.isExpanded()))
    {
      _floatingActionMenu.collapse();
      return true;
    }
    return false;
  }
  
  private void handleRenameOperation()
  {
    if (_multiSelectFragment != null) {
      ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleRenameButtonClick();
    }
  }
  
  private void loadViewFromBundle()
  {
    if (_editConfiguration.getEditActivityOperationMode() == AdobeAssetViewEditActivityOperationMode.ADOBE_ASSET_VIEW_EDIT_ACTIVITY_OPERATION_MODE_MOVE)
    {
      startFileBrowser();
      return;
    }
    startEditMutiSelect();
  }
  
  private void setActionBarForMoveExplorer()
  {
    _actionBarToolbar.setNavigationIcon(R.drawable.asset_edit_home_as_up_back);
  }
  
  private void setActionBarForMultiSelect()
  {
    int i = AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size();
    _actionBarToolbar.setNavigationIcon(R.drawable.asset_edit_home_as_up_cross);
    AdobeCSDKActionBarController.setTitle(_contentView, "" + i);
    clearMenu();
  }
  
  private void setupActionBarCustomFont()
  {
    _actionBarToolbar = ((Toolbar)findViewById(R.id.actionbar_toolbar));
    _actionBarToolbar.setBackgroundColor(getResources().getColor(R.color.asset_browser_edit_actionbar_background));
    _contentView = findViewById(16908290);
    AdobeCSDKActionBarController.changeTextColor(_contentView, -1);
    setSupportActionBar(_actionBarToolbar);
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
  }
  
  private void startEditMutiSelect()
  {
    multiSelectSourceHref = _editConfiguration.getSourceHref();
    Object localObject = getSupportFragmentManager();
    int i = R.id.edit_frame;
    if (_multiSelectFragment == null)
    {
      _multiSelectFragment = createEditMultiSelectFragment();
      _assetMoveView.setVisibility(8);
      _assetEditView.setVisibility(0);
      ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).setActionBarToolbarAndContent(_actionBarToolbar, _contentView);
      localObject = ((FragmentManager)localObject).beginTransaction();
      ((FragmentTransaction)localObject).replace(i, _multiSelectFragment, "");
      _multiSelectStarted = true;
      ((FragmentTransaction)localObject).addToBackStack(null);
      ((FragmentTransaction)localObject).commit();
    }
  }
  
  private void startFileBrowser()
  {
    Object localObject = getSupportFragmentManager();
    int i = R.id.move_frame;
    if (_moveFragment == null)
    {
      _floatingActionMenuContainer.setVisibility(8);
      _moveFragment = createCCFilesMoveBrowserFragment();
      _assetEditView.setVisibility(8);
      _assetMoveView.setVisibility(0);
      setActionBarForMoveExplorer();
      localObject = ((FragmentManager)localObject).beginTransaction();
      ((FragmentTransaction)localObject).replace(i, _moveFragment, "");
      if (_multiSelectStarted) {
        ((FragmentTransaction)localObject).addToBackStack(null);
      }
      ((FragmentTransaction)localObject).commit();
    }
  }
  
  public AdobeAssetViewEditFragmentExtraConfiguration getExtraConfiguration()
  {
    if (configuration == null)
    {
      configuration = new AdobeAssetViewEditFragmentExtraConfiguration();
      configuration.setMoveButton(true);
      configuration.setShouldShowOnlyFolders(true);
    }
    return configuration;
  }
  
  public void handleFloatingMenuVisibilty()
  {
    View localView;
    if (_floatingActionMenuContainer != null)
    {
      localView = _floatingActionMenuContainer;
      if (!isFloatingMenuVisible) {
        break label27;
      }
    }
    label27:
    for (int i = 0;; i = 8)
    {
      localView.setVisibility(i);
      return;
    }
  }
  
  public void handleFloatingMenuVisibilty(boolean paramBoolean)
  {
    isFloatingMenuVisible = paramBoolean;
    if (!paramBoolean) {
      _floatingActionMenu.collapse();
    }
    View localView = _floatingActionMenuContainer;
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localView.setVisibility(i);
      if (isFloatingMenuExpanded) {
        ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleActionMenuButtonClick(true);
      }
      return;
    }
  }
  
  public boolean hasExtraControls()
  {
    return true;
  }
  
  public void onBackPressed()
  {
    handleBackPress();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.activity_edit_asset);
    _floatingActionMenuContainer = findViewById(R.id.adobe_edit_float_action_menu_container);
    if (_floatingActionMenuContainer != null) {
      _floatingActionMenuContainer.setOnTouchListener(new View.OnTouchListener()
      {
        public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
        {
          return AdobeAssetEditActivity.this.handleOutsideTouchForFloatingButton();
        }
      });
    }
    _floatingActionMenu = ((FloatingActionsMenu)findViewById(R.id.adobe_edit_floating_action_menu));
    _floatingActionMenu.setOnFloatingActionsMenuUpdateListener(new FloatingActionsMenu.OnFloatingActionsMenuUpdateListener()
    {
      public void onMenuCollapsed()
      {
        AdobeAssetEditActivity.access$202(AdobeAssetEditActivity.this, false);
        if (_multiSelectFragment != null) {
          ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleActionMenuButtonClick(false);
        }
      }
      
      public void onMenuExpanded()
      {
        AdobeAssetEditActivity.access$202(AdobeAssetEditActivity.this, true);
        if (_multiSelectFragment != null) {
          ((AdobeAssetViewNewCCFilesEditFragment)_multiSelectFragment).handleActionMenuButtonClick(true);
        }
      }
    });
    _deleteButton = ((FloatingActionButton)findViewById(R.id.adobe_edit_delete_button));
    _moveButton = ((FloatingActionButton)findViewById(R.id.adobe_edit_move_button));
    _editButton = ((FloatingActionButton)findViewById(R.id.adobe_edit_rename_button));
    _deleteButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAssetEditActivity.this.handleDelete();
      }
    });
    _moveButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAssetEditActivity.this.handleMoveOperation();
      }
    });
    _editButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAssetEditActivity.this.handleRenameOperation();
      }
    });
    _editConfiguration = AdobeAssetViewEditActivityConfiguration.getConfigurationFromBundle(getIntent().getExtras().getBundle("EDIT_ACTIVITY_CONFIGURATION"));
    _assetEditView = findViewById(R.id.edit_frame);
    _assetMoveView = findViewById(R.id.move_frame);
    setupActionBarCustomFont();
    loadViewFromBundle();
    getSupportFragmentManager().addOnBackStackChangedListener(new FragmentManager.OnBackStackChangedListener()
    {
      public void onBackStackChanged()
      {
        AdobeAssetEditActivity.this.handleBackStackChange();
      }
    });
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    return handleBackPress();
  }
  
  public boolean onPrepareOptionsMenu(Menu paramMenu)
  {
    _menu = paramMenu;
    return super.onPrepareOptionsMenu(paramMenu);
  }
  
  protected void onStart()
  {
    super.onStart();
    _assetContainerCommandsHandler.onStart();
    if ((_assetMoveView != null) && (_assetMoveView.getVisibility() == 0)) {
      _floatingActionMenuContainer.setVisibility(8);
    }
  }
  
  protected void onStop()
  {
    super.onStop();
    _assetContainerCommandsHandler.onStop();
  }
  
  public void setRenameButtonVisibilty(boolean paramBoolean)
  {
    FloatingActionButton localFloatingActionButton = _editButton;
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localFloatingActionButton.setVisibility(i);
      return;
    }
  }
  
  private class AssetEditContainerCommandsHandler
    extends AdobeAssetViewCommandsHandler
  {
    private AssetEditContainerCommandsHandler() {}
    
    protected void HandleCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject)
    {
      if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_MOVE_OPERATION) {
        AdobeAssetEditActivity.this.handleMoveOperation((String)paramObject);
      }
      if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_OPEN_MOVE_CCFILES_BROWSER) {
        AdobeAssetEditActivity.this.OpenMoveFileBrowser();
      }
    }
    
    protected EnumSet<AdobeAssetViewBrowserCommandName> getCommandsListToRegister()
    {
      return EnumSet.of(AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_MOVE_OPERATION, AdobeAssetViewBrowserCommandName.ACTION_ASSET_EDIT_OPEN_MOVE_CCFILES_BROWSER);
    }
  }
}
