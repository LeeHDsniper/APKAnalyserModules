package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.KeyEvent;
import android.view.MenuItem;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionHelper;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionHelper.AdobeAuthStatus;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionHelper.IAdobeAuthStatusCallback;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionLauncher.Builder;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthConstants;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar.AdobeUxActionBarDropDownController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar.AdobeUxActionBarDropDownController.CCSection;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceFilterType;
import java.util.EnumSet;

public class AdobeUxAssetBrowserV2Activity
  extends ActionBarActivity
  implements IAdobeAssetViewBrowserFragmentHostActivity
{
  private final String DATASOURCES_WAIT_FRAGMENT_TAG = "AssetBrowserV2_dataSourcesWaitFragmentTag";
  private final String MAIN_BROWSER_FRAGMENT_TAG = "AssetBrowserV2_mainBrowserFragmentTag";
  private final int ROOT_ID = 65535;
  private Toolbar _actionBarToolbar;
  private AdobeUxActionBarDropDownController _actionBarUxDropDownController;
  private AdobeAuthSessionHelper _authSessionHelper = null;
  Bundle _clientArgsBundle;
  private int _currentOrientation;
  private boolean _isRestoredActivity;
  AdobeAssetViewMainBrowserFragment _mainBrowserFragment;
  private QueuedActivityResult _queuedActivityResult;
  private boolean _sessionHelperResumed = false;
  private AdobeAuthSessionHelper.IAdobeAuthStatusCallback _statusCallback = new AdobeAuthSessionHelper.IAdobeAuthStatusCallback()
  {
    public void call(AdobeAuthSessionHelper.AdobeAuthStatus paramAnonymousAdobeAuthStatus, AdobeAuthException paramAnonymousAdobeAuthException)
    {
      AdobeUXAuthManagerRestricted localAdobeUXAuthManagerRestricted = AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted();
      if (AdobeAuthSessionHelper.AdobeAuthStatus.AdobeAuthLoggedIn == paramAnonymousAdobeAuthStatus)
      {
        showAssetBroweserPageForCurrentUser();
        return;
      }
      if ((paramAnonymousAdobeAuthException == null) || (paramAnonymousAdobeAuthException.getErrorCode() != AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED))
      {
        localAdobeUXAuthManagerRestricted.login(new AdobeAuthSessionLauncher.Builder().withActivity(AdobeUxAssetBrowserV2Activity.this).withRequestCode(AdobeAuthConstants.DEFAULT_SIGN_IN_REQUEST_CODE).build());
        return;
      }
      finish();
    }
  };
  
  public AdobeUxAssetBrowserV2Activity() {}
  
  private void clearCurrentMainAssetBrowserFragment()
  {
    if (_mainBrowserFragment != null)
    {
      FragmentTransaction localFragmentTransaction = getSupportFragmentManager().beginTransaction();
      localFragmentTransaction.remove(_mainBrowserFragment);
      localFragmentTransaction.commit();
      _mainBrowserFragment = null;
    }
  }
  
  private EnumSet<AdobeUxActionBarDropDownController.CCSection> getCCSectionsBasedOnClientDatasourceTypes()
  {
    Bundle localBundle = getIntent().getExtras();
    if (localBundle == null) {
      return EnumSet.allOf(AdobeUxActionBarDropDownController.CCSection.class);
    }
    EnumSet localEnumSet = (EnumSet)localBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_ARRAY_KEY);
    if ((AdobeAssetDataSourceFilterType)localBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_TYPE_KEY) != AdobeAssetDataSourceFilterType.ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION) {}
    for (boolean bool = true;; bool = false) {
      return AdobeUxActionBarDropDownController.getCCSectionsListFromDataSource(localEnumSet, bool);
    }
  }
  
  private void processAnyQueuedActivityResult()
  {
    if ((_queuedActivityResult != null) && (_mainBrowserFragment != null))
    {
      _mainBrowserFragment.handleOnActivityResult(_queuedActivityResult.requestCode, _queuedActivityResult.resultCode, _queuedActivityResult.resultData);
      _queuedActivityResult = null;
    }
  }
  
  private void setUpDatasourceSectionActionBarDropdown()
  {
    EnumSet localEnumSet = getCCSectionsBasedOnClientDatasourceTypes();
    AdobeUxActionBarDropDownController.CCSection localCCSection;
    if (localEnumSet.contains(AdobeUxActionBarDropDownController.CCSection.myAssets))
    {
      localCCSection = AdobeUxActionBarDropDownController.CCSection.myAssets;
      _actionBarUxDropDownController = new AdobeUxActionBarDropDownController();
      AdobeUxActionBarDropDownController.setInstance(_actionBarUxDropDownController);
      localObject = getIntent().getExtras();
      if (localObject != null) {
        break label73;
      }
    }
    label73:
    for (Object localObject = null;; localObject = (AdobeCloud)((Bundle)localObject).getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY))
    {
      AdobeUxActionBarDropDownController.getInstance().setUpActionBar(this, _actionBarToolbar, localEnumSet, localCCSection, (AdobeCloud)localObject);
      return;
      localCCSection = AdobeUxActionBarDropDownController.CCSection.myLibraries;
      break;
    }
  }
  
  private void setupMainBrowserFragment()
  {
    Object localObject = getSupportFragmentManager();
    Fragment localFragment = ((FragmentManager)localObject).findFragmentById(R.id.assetbrowser_v2_frame);
    if (!(localFragment instanceof AdobeAssetViewMainBrowserFragment))
    {
      _mainBrowserFragment = new AdobeAssetViewMainBrowserFragment();
      _mainBrowserFragment.setArguments(getIntent().getExtras());
      localObject = ((FragmentManager)localObject).beginTransaction();
      ((FragmentTransaction)localObject).replace(R.id.assetbrowser_v2_frame, _mainBrowserFragment, "AssetBrowserV2_mainBrowserFragmentTag");
      ((FragmentTransaction)localObject).commit();
    }
    for (;;)
    {
      processAnyQueuedActivityResult();
      return;
      _mainBrowserFragment = ((AdobeAssetViewMainBrowserFragment)localFragment);
    }
  }
  
  boolean handleBackPress()
  {
    if ((_actionBarToolbar != null) && (!_actionBarToolbar.hasExpandedActionView()) && (_mainBrowserFragment != null))
    {
      if (_mainBrowserFragment.isAtRootFragment())
      {
        AdobeStorageAssetSelectionState.resetSelectedAssets();
        AdobeStoragePhotoAssetSelectionState.resetSelectedAssets();
        finish();
      }
      while (_mainBrowserFragment.handleOnBackPressed()) {
        return true;
      }
    }
    return false;
  }
  
  public void handleOpenSelectedFilesAction(Intent paramIntent)
  {
    setResult(-1, paramIntent);
    finish();
  }
  
  public void handleUserSignOutAction()
  {
    clearCurrentMainAssetBrowserFragment();
    AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().logout();
  }
  
  public void hideCollaborationFrameOnBackPressed() {}
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (_mainBrowserFragment != null) {
      _mainBrowserFragment.handleOnActivityResult(paramInt1, paramInt2, paramIntent);
    }
    for (;;)
    {
      _authSessionHelper.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
      _queuedActivityResult = new QueuedActivityResult(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void onBackPressed()
  {
    if (handleBackPress()) {
      return;
    }
    super.onBackPressed();
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if (orientation != _currentOrientation)
    {
      _currentOrientation = orientation;
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeAppOrientationConfigurationChanged, null));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    _currentOrientation = getResourcesgetConfigurationorientation;
    setContentView(R.layout.adobe_assetbrowser_v2_activity);
    setupActionBarCustomFont();
    _clientArgsBundle = getIntent().getExtras();
    _authSessionHelper = new AdobeAuthSessionHelper(_statusCallback);
    _authSessionHelper.onCreate(paramBundle);
    _sessionHelperResumed = false;
    _isRestoredActivity = false;
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    AdobeUxActionBarDropDownController.resetIfSameInstance(_actionBarUxDropDownController);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 82) {
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 16908332)
    {
      handleBackPress();
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  protected void onPause()
  {
    super.onPause();
    _authSessionHelper.onPause();
  }
  
  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
    _isRestoredActivity = true;
  }
  
  protected void onResume()
  {
    super.onResume();
    _authSessionHelper.onResume();
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
  
  protected void onStart()
  {
    super.onStart();
    _authSessionHelper.onStart();
  }
  
  protected void onStop()
  {
    super.onStop();
    _authSessionHelper.onStop();
  }
  
  public void setupActionBarCustomFont()
  {
    _actionBarToolbar = ((Toolbar)findViewById(R.id.adobe_actionbar_toolbar));
    setSupportActionBar(_actionBarToolbar);
    if (_actionBarToolbar != null) {
      _actionBarToolbar.setBackgroundResource(R.color.actionbar_background);
    }
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    getSupportActionBar().setHomeButtonEnabled(true);
    setUpDatasourceSectionActionBarDropdown();
  }
  
  public void showAssetBroweserPageForCurrentUser()
  {
    if (_actionBarToolbar.getVisibility() == 8) {
      _actionBarToolbar.setVisibility(0);
    }
    setupMainBrowserFragment();
  }
  
  class QueuedActivityResult
  {
    public int requestCode;
    public int resultCode;
    public Intent resultData;
    
    public QueuedActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
    {
      requestCode = paramInt1;
      resultData = paramIntent;
      resultCode = paramInt2;
    }
  }
}
