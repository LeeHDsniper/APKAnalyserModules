package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.text.SpannableString;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability.AdobeNetworkStatus;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.menu;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeAssetBrowserActionBarController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeCSDKInternalClientsPreferences;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeListIndexPath;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeListSectionsIndexSet;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.internal.utils.CreativeSDKTextView;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public abstract class AdobeAssetViewBaseContainerFragment
  extends AdobeAssetViewAssetsContainerFragment
  implements IAdobeAssetContainerListViewDelegate
{
  private final String ORIENTATION_KEY = "orientation";
  protected AssetsViewBaseActionBarController _actionBarController;
  private Observer _app_orientation_changed_observer;
  protected AdobeAssetsViewContainerConfiguration _assetViewConfiguration;
  private FrameLayout _assetsMainRootFrame;
  private LinearLayout _cancelSelectionBtn;
  private View _cloud_not_reachable_view;
  private boolean _containerIsVisibleRunning;
  protected AdobeAssetsViewBaseListViewController _currentAssetsViewController;
  private boolean _dataLoaded = false;
  private View _emptyFolderView;
  private AssetsViewContainerInstanceState _fragmentStateWhenStopped;
  private boolean _isFragmentStopped = false;
  private boolean _isNetworkOnline = true;
  protected boolean _isRestoredFragment = false;
  AdobeAssetsViewBaseListViewController.InstanceState _listControllerSavedInstanceState;
  private LinearLayout _mainContentView;
  private RelativeLayout _mainRootView;
  private boolean[] _menuStates;
  private Observer _network_reachability_observer;
  private View _no_network_full_view;
  private View _no_network_notification_bar;
  private LinearLayout _openFileBtn;
  private TextView _openFileBtnTextView;
  private int _orientationOnPause;
  private View _progressSpinner = null;
  private View _selectionBottomBarView;
  private boolean _suppressFooterSpinner = false;
  private boolean _supressProgress = false;
  
  public AdobeAssetViewBaseContainerFragment() {}
  
  private void checkForAnyOrientationChange(Bundle paramBundle)
  {
    if ((paramBundle != null) || (_fragmentStateWhenStopped != null)) {
      if (paramBundle == null) {
        break label41;
      }
    }
    label41:
    for (int i = paramBundle.getInt("orientation", -1);; i = _fragmentStateWhenStopped.orientation)
    {
      if ((i != -1) && (i != getAppCurrentOrientation())) {
        handleAppOrientationChange();
      }
      return;
    }
  }
  
  private void checkMultiSelectionState()
  {
    if ((_selectionBottomBarView != null) && (_selectionBottomBarView.getVisibility() == 4) && (getAssetSelectionCount() > 0)) {
      _selectionBottomBarView.setVisibility(0);
    }
  }
  
  private void clearAllAccessoryViews()
  {
    _no_network_notification_bar = null;
    _no_network_full_view = null;
    _emptyFolderView = null;
  }
  
  private int getAppCurrentOrientation()
  {
    return getResourcesgetConfigurationorientation;
  }
  
  private void handleFolderDataCommon(boolean paramBoolean)
  {
    boolean bool = false;
    if (_emptyFolderView == null)
    {
      _emptyFolderView = LayoutInflater.from(getActivity()).inflate(getEmptyStateViewId(), _assetsMainRootFrame, false);
      configureEmptyStateView(_emptyFolderView);
      getMainRootView().addView(_emptyFolderView);
    }
    View localView = _emptyFolderView;
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localView.setVisibility(i);
      if (!paramBoolean) {
        bool = true;
      }
      setAssetMainRootFrameVisibility(bool);
      getActionBarController().refreshOptionItems();
      return;
    }
  }
  
  private void hideCloudNotReachable()
  {
    _cloud_not_reachable_view.setVisibility(8);
  }
  
  private void initializeOtherAccessoryViews()
  {
    getActionBarController().handleOnStart();
    prepareActionBarForCurrentCollection();
    configureMultiSelectViews();
  }
  
  private boolean isNetworkViewSetuped()
  {
    return _no_network_full_view != null;
  }
  
  private void prepareActionBarForCurrentCollection()
  {
    ActionBar localActionBar = ((ActionBarActivity)getActivity()).getSupportActionBar();
    if (localActionBar == null) {
      return;
    }
    if (isContainerShowingRootCollection())
    {
      setActionBarDropDownDetails(true, getContainerNameForRoot());
      return;
    }
    localActionBar.setDisplayHomeAsUpEnabled(true);
    setActionBarDropDownDetails(false, getCurrentTargetCollectionName());
  }
  
  private void refreshAssetsListViewVisualLayout()
  {
    resetAssetsListViewVisualLayout();
    restoreCurrentAssetsListControllerState();
  }
  
  private void saveContainerState(AssetsViewContainerInstanceState paramAssetsViewContainerInstanceState)
  {
    if (getDataSource() != null) {}
    for (int i = getDataSource().getCount();; i = -1)
    {
      _dataSourceCount = i;
      orientation = getAppCurrentOrientation();
      return;
    }
  }
  
  private void setActionBarDropDownDetails(boolean paramBoolean, String paramString)
  {
    if (!useDropDownActionBar())
    {
      AdobeCSDKActionBarController.setTitle(getActivity().findViewById(16908290), paramString);
      return;
    }
    AdobeAssetBrowserActionBarController.setActionBarDropDownDetails(paramBoolean, paramString, _assetViewConfiguration.getCloud());
  }
  
  private void setAssetMainRootFrameVisibility(boolean paramBoolean)
  {
    FrameLayout localFrameLayout = _assetsMainRootFrame;
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localFrameLayout.setVisibility(i);
      return;
    }
  }
  
  private void setContainerLoadingAssetsFromScratch()
  {
    showProgressView();
    setAssetMainRootFrameVisibility(false);
    getActionBarController().refreshOptionItems();
  }
  
  private void setMultiSelectContainerVisibility(boolean paramBoolean)
  {
    View localView;
    if ((_selectionBottomBarView != null) && (_selectionBottomBarView.getVisibility() != 8))
    {
      localView = _selectionBottomBarView;
      if (!paramBoolean) {
        break label36;
      }
    }
    label36:
    for (int i = 0;; i = 4)
    {
      localView.setVisibility(i);
      return;
    }
  }
  
  private void setUpSelectionBottomBar()
  {
    if (_selectionBottomBarView != null) {
      return;
    }
    _selectionBottomBarView = LayoutInflater.from(getActivity()).inflate(R.layout.adobe_assetview_container_selection_bottom_bar, _mainRootView, false);
    _openFileBtn = ((LinearLayout)_selectionBottomBarView.findViewById(R.id.storage_selection_open_file_btn));
    _cancelSelectionBtn = ((LinearLayout)_selectionBottomBarView.findViewById(R.id.storage_selection_cancel_btn));
    _openFileBtnTextView = ((TextView)_selectionBottomBarView.findViewById(R.id.storage_selection_open_file_btn_title));
    _openFileBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        handleOpenCurrentSelectedFilesUserAction();
      }
    });
    _cancelSelectionBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        handleCancelSelectionUserAction();
      }
    });
    _selectionBottomBarView.setVisibility(8);
    _mainRootView.addView(_selectionBottomBarView);
  }
  
  private void setupNetworkRelatedViews()
  {
    if (_no_network_full_view != null) {
      return;
    }
    _no_network_full_view = LayoutInflater.from(getActivity()).inflate(R.layout.adobe_common_errorview, _assetsMainRootFrame, false);
    _no_network_notification_bar = LayoutInflater.from(getActivity()).inflate(R.layout.adobe_common_popup_bannerview, _assetsMainRootFrame, false);
    _cloud_not_reachable_view = LayoutInflater.from(getActivity()).inflate(R.layout.adobe_cloud_not_reachable, _assetsMainRootFrame, false);
    _no_network_full_view.setVisibility(8);
    _no_network_notification_bar.setVisibility(8);
    _cloud_not_reachable_view.setVisibility(8);
    getMainRootView().addView(_no_network_full_view);
    getMainRootView().addView(_no_network_notification_bar);
    getMainRootView().addView(_cloud_not_reachable_view);
    getMainRootView().findViewById(R.id.adobe_cloud_not_reachable_retry_btn).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        retryClickHandler(paramAnonymousView);
      }
    });
  }
  
  private void showCloudNotReachable()
  {
    setupNetworkRelatedViews();
    CreativeSDKTextView localCreativeSDKTextView = (CreativeSDKTextView)getMainRootView().findViewById(R.id.adobe_cloud_not_reachable_error_message);
    if ((_assetViewConfiguration.getCloud() != null) && (!_assetViewConfiguration.getCloud().isPrivateCloud())) {
      localCreativeSDKTextView.setText(R.string.adobe_cloud_not_reachable_public_cloud);
    }
    _cloud_not_reachable_view.setVisibility(0);
  }
  
  private void showLoadingFooter()
  {
    if ((!_suppressFooterSpinner) && (_currentAssetsViewController != null)) {
      _currentAssetsViewController.showLoadingFooter();
    }
  }
  
  private void wentOffline(boolean paramBoolean)
  {
    _isNetworkOnline = false;
    setupNetworkRelatedViews();
    if ((isAssetsMainFrameVisible()) || (isEmptyFolderViewVisible())) {
      _no_network_notification_bar.setVisibility(0);
    }
    for (;;)
    {
      stopRefreshAnimationOnCurrentListController();
      handlePostOffline();
      handleNetworkStatusChange(false);
      return;
      hideProgressView();
      setAssetMainRootFrameVisibility(false);
      _no_network_full_view.setVisibility(0);
      _no_network_notification_bar.setVisibility(8);
      getActionBarController().handleCurrentNetworkStatus(false);
    }
  }
  
  private void wentOnline(boolean paramBoolean)
  {
    _isNetworkOnline = true;
    if ((!isAssetsMainFrameVisible()) && (isNetworkViewSetuped()) && (_no_network_full_view.getVisibility() == 0))
    {
      setAssetMainRootFrameVisibility(true);
      _no_network_full_view.setVisibility(8);
      getActionBarController().handleCurrentNetworkStatus(true);
      showProgressView();
    }
    if (isNetworkViewSetuped()) {
      _no_network_notification_bar.setVisibility(8);
    }
    if (paramBoolean) {
      reloadAssetItemsFromDataSourceDueToSwipeRefresh();
    }
    handleNetworkStatusChange(true);
  }
  
  protected void configureEmptyStateView(View paramView) {}
  
  protected void configureMultiSelectViews()
  {
    setUpSelectionBottomBar();
    int j = getAssetSelectionCount();
    Object localObject = _selectionBottomBarView;
    int i;
    if (j > 0)
    {
      i = 0;
      ((View)localObject).setVisibility(i);
      if (j > 1) {
        break label52;
      }
      localObject = AdobeLocalizedMgr.getLocalizedString(R.string.storage_open_files);
    }
    for (;;)
    {
      _openFileBtnTextView.setText((CharSequence)localObject);
      return;
      i = 8;
      break;
      label52:
      if (j > 99) {
        localObject = AdobeLocalizedMgr.getLocalizedString(R.string.storage_open_multiple_files_99);
      } else {
        localObject = String.format(AdobeLocalizedMgr.getLocalizedString(R.string.storage_open_multiple_files), new Object[] { Integer.toString(j) });
      }
    }
  }
  
  protected AssetsViewBaseActionBarController createActionBarController()
  {
    return new AssetsViewBaseActionBarController();
  }
  
  protected void ds_didClearFilterString()
  {
    refreshCurrentListViewController();
  }
  
  protected void ds_didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException)
  {
    ds_handleLoadDataErrorCommon();
    if (paramAdobeAssetException.getErrorCode() == AdobeAssetErrorCode.AdobeAssetErrorOffline) {
      wentOffline(true);
    }
    while (paramAdobeAssetException.getErrorCode() != AdobeAssetErrorCode.AdobeAssetErrorTimeout) {
      return;
    }
    showCloudNotReachable();
  }
  
  protected void ds_didFinishLoading(int paramInt)
  {
    _supressProgress = false;
    hideProgressView();
    if (paramInt > 0)
    {
      hideEmptyStateView();
      return;
    }
    _dataLoaded = false;
    showEmptyAssetsStateView();
  }
  
  protected void ds_didLoadMoreDataWithCount(int paramInt, AdobeListSectionsIndexSet paramAdobeListSectionsIndexSet, ArrayList<AdobeListIndexPath> paramArrayList)
  {
    stopRefreshAnimationOnCurrentListController();
    _supressProgress = false;
    hideProgressView();
    if (paramInt > 0)
    {
      hideEmptyStateView();
      refreshAssetsListViewVisualLayout();
      if (_containerIsVisibleRunning) {
        if (_dataLoaded)
        {
          _currentAssetsViewController.refreshDueToNewItemsInsertion();
          _dataLoaded = true;
        }
      }
    }
    for (;;)
    {
      checkMultiSelectionState();
      return;
      refreshCurrentListViewController();
      break;
      refreshCurrentListViewController();
      break;
      if (getDataSource().getCount() == 0)
      {
        _dataLoaded = false;
        showEmptyAssetsStateView();
      }
    }
  }
  
  protected void ds_handleLoadDataErrorCommon()
  {
    _supressProgress = false;
    hideProgressView();
    stopRefreshAnimationOnCurrentListController();
  }
  
  protected void ds_handleLoadDataErrorShowEmptyAssetsView()
  {
    _dataLoaded = false;
    showEmptyAssetsStateView();
  }
  
  protected void ds_willLoadDataFromScratch()
  {
    _dataLoaded = false;
    _suppressFooterSpinner = true;
    if ((_currentAssetsViewController != null) && (!_supressProgress)) {
      refreshCurrentListViewController();
    }
    setContainerLoadingAssetsFromScratch();
  }
  
  protected void ds_willLoadNextPageForExistingCollection()
  {
    if ((getDataSource().getCount() <= 0) && (!_supressProgress))
    {
      showProgressView();
      setAssetMainRootFrameVisibility(false);
    }
    showLoadingFooter();
    refreshAssetsListViewVisualLayout();
  }
  
  protected void ds_willLoadNextPageForNonExistingCollection()
  {
    if (!_supressProgress)
    {
      showProgressView();
      setAssetMainRootFrameVisibility(false);
    }
    showLoadingFooter();
  }
  
  protected AssetsViewBaseActionBarController getActionBarController()
  {
    if (_actionBarController == null) {
      _actionBarController = createActionBarController();
    }
    return _actionBarController;
  }
  
  protected SpannableString getAdobeFormattedString(int paramInt)
  {
    return getAdobeFormattedString(getLocalizedStringUtil(paramInt));
  }
  
  protected SpannableString getAdobeFormattedString(String paramString)
  {
    return AdobeAssetViewUtils.getAdobeFontFormattedString(paramString, getActivity());
  }
  
  protected abstract int getAssetSelectionCount();
  
  protected abstract AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle);
  
  protected FrameLayout getAssetsMainRootFrame()
  {
    return _assetsMainRootFrame;
  }
  
  protected abstract String getContainerNameForRoot();
  
  protected abstract String getCurrentTargetCollectionName();
  
  protected abstract IAdobeAssetDataSource getDataSource();
  
  protected int getEmptyStateViewId()
  {
    return R.layout.adobe_storage_assetbrowser_empty_state_view;
  }
  
  public FragmentActivity getHostActivity()
  {
    return getActivity();
  }
  
  protected String getLocalizedStringUtil(int paramInt)
  {
    return getResources().getString(paramInt);
  }
  
  protected RelativeLayout getMainRootView()
  {
    return _mainRootView;
  }
  
  protected void handleAnyListCellViewsRefresh() {}
  
  protected boolean handleAnyListConfigChange()
  {
    return false;
  }
  
  protected void handleAppOrientationChange() {}
  
  protected abstract void handleCancelSelectionUserAction();
  
  protected void handleNetworkStatusChange(boolean paramBoolean) {}
  
  protected void handleOnStop()
  {
    _fragmentStateWhenStopped = new AssetsViewContainerInstanceState();
    saveContainerState(_fragmentStateWhenStopped);
  }
  
  protected abstract void handleOpenCurrentSelectedFilesUserAction();
  
  protected void handlePostOffline() {}
  
  protected void handlePostOnCreate(Bundle paramBundle) {}
  
  protected void handlePostOnCreateView(Bundle paramBundle)
  {
    Object localObject = new HashMap();
    ((Map)localObject).put(AdobeAssetViewUtils.ASSETVIEW_NAVIGATE_ISROOT_KEY, Boolean.valueOf(isContainerShowingRootCollection()));
    localObject = new AdobeNotification(AdobeInternalNotificationID.AdobeAssetViewNavigateToCollectionNotification, (Map)localObject);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification((AdobeNotification)localObject);
    checkForAnyOrientationChange(paramBundle);
  }
  
  protected void handlePreOnStart() {}
  
  protected abstract boolean hasActionBarOptions();
  
  protected void hideEmptyStateView()
  {
    if (_emptyFolderView == null)
    {
      setAssetMainRootFrameVisibility(true);
      getActionBarController().refreshOptionItems();
      return;
    }
    handleFolderDataCommon(false);
  }
  
  protected void hideMenuItemsUtil(Menu paramMenu)
  {
    int j = paramMenu.size();
    _menuStates = new boolean[j];
    int i = 0;
    while (i < j)
    {
      MenuItem localMenuItem = paramMenu.getItem(i);
      _menuStates[i] = localMenuItem.isVisible();
      localMenuItem.setVisible(false);
      i += 1;
    }
  }
  
  protected void hideProgressView()
  {
    _progressSpinner.setVisibility(4);
  }
  
  protected abstract void hookUpDataSourceDelegate(boolean paramBoolean);
  
  protected abstract void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration);
  
  protected boolean isAssetsMainFrameVisible()
  {
    return _assetsMainRootFrame.getVisibility() == 0;
  }
  
  protected boolean isContainerShowingRootCollection()
  {
    return true;
  }
  
  protected boolean isEmptyFolderViewVisible()
  {
    return (_emptyFolderView != null) && (_emptyFolderView.getVisibility() == 0);
  }
  
  protected boolean isNetworkOnline()
  {
    return _isNetworkOnline;
  }
  
  protected boolean isRestoredDataSourceChanged()
  {
    return false;
  }
  
  public void loadMoreItemsFromDataSource()
  {
    getDataSource().loadNextPageOfData();
  }
  
  protected void markAsWentOffline()
  {
    wentOffline(true);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setHasOptionsMenu(hasActionBarOptions());
    _assetViewConfiguration = getAssetViewConfiguration(getArguments());
    if (paramBundle != null) {
      restoreContainerFromSavedInstance(paramBundle);
    }
    for (;;)
    {
      handlePostOnCreate(paramBundle);
      return;
      initializeFromViewConfiguration(_assetViewConfiguration);
    }
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    getActionBarController().onCreateOptionsMenu(paramMenu, paramMenuInflater);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    setHasOptionsMenu(hasActionBarOptions());
    _mainRootView = ((RelativeLayout)paramLayoutInflater.inflate(R.layout.adobe_assetview_main_container, paramViewGroup, false));
    _progressSpinner = _mainRootView.findViewById(R.id.adobe_assetview_container_progressBar);
    _assetsMainRootFrame = ((FrameLayout)_mainRootView.findViewById(R.id.adobe_assetview_container_content_assetsview));
    _mainContentView = ((LinearLayout)_mainRootView.findViewById(R.id.adobe_assetview_container_content_rootview));
    if (getDataSource() != null) {}
    for (boolean bool = true;; bool = false)
    {
      _isRestoredFragment = bool;
      setupAssetsDataSourceAndListViewControllers();
      _orientationOnPause = getAppCurrentOrientation();
      handlePostOnCreateView(paramBundle);
      return _mainRootView;
    }
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    saveCurrentAssetsListControllerState();
    _selectionBottomBarView = null;
    getDataSource().resetDelegate();
    clearAllAccessoryViews();
    _assetsMainRootFrame.removeAllViews();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (getActionBarController().onOptionsItemSelected(paramMenuItem)) {
      return true;
    }
    if ((paramMenuItem.getItemId() == 16908332) && (isContainerShowingRootCollection()))
    {
      postActionCommand(AdobeAssetViewBrowserCommandName.NAVIGATE_BACK, null);
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onPause()
  {
    _containerIsVisibleRunning = false;
    _orientationOnPause = getAppCurrentOrientation();
    super.onPause();
  }
  
  public void onPrepareOptionsMenu(Menu paramMenu)
  {
    super.onPrepareOptionsMenu(paramMenu);
    getActionBarController().onPrepareOptionsMenu(paramMenu);
  }
  
  public void onResume()
  {
    if (_orientationOnPause != getAppCurrentOrientation()) {
      handleAppOrientationChange();
    }
    _containerIsVisibleRunning = true;
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    storeInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    super.onStart();
    handlePreOnStart();
    _isFragmentStopped = false;
    hookUpDataSourceDelegate(true);
    registerLocalNofications();
    initializeOtherAccessoryViews();
    boolean bool2 = AdobeNetworkReachabilityUtil.getSharedInstance().isOnline();
    boolean bool1 = false;
    if (bool2)
    {
      wentOnline(false);
      refreshAssetsListViewVisualLayout();
      handleAnyListCellViewsRefresh();
      bool1 = handleAnyListConfigChange();
    }
    for (;;)
    {
      if ((_isRestoredFragment) && (!bool1))
      {
        hideProgressView();
        if (((getDataSource().getCount() == 0) || (!_dataLoaded) || (isRestoredDataSourceChanged())) && (bool2))
        {
          _dataLoaded = false;
          reloadDataFromDataSource();
        }
      }
      return;
      wentOffline(true);
    }
  }
  
  public void onStop()
  {
    getDataSource().resetDelegate();
    getActionBarController().saveActionBarInstanceState();
    AdobeNetworkReachabilityUtil.destorySharedInstance();
    unRegisterLocalNotifications();
    _isFragmentStopped = true;
    handleOnStop();
    super.onStop();
  }
  
  protected void postActionCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject)
  {
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(paramAdobeAssetViewBrowserCommandName, paramObject);
  }
  
  protected void refreshCurrentListViewController()
  {
    _currentAssetsViewController.refreshDueToDataChange();
  }
  
  protected void registerLocalNofications()
  {
    if (_network_reachability_observer == null) {
      _network_reachability_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (AdobeNetworkReachability.AdobeNetworkStatus)((AdobeNotification)paramAnonymousObject).getInfo().get("AdobeNetworkReachabilityStatusKey");
          switch (AdobeAssetViewBaseContainerFragment.6.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode[networkStatusCode.ordinal()])
          {
          default: 
            AdobeAssetViewBaseContainerFragment.this.wentOffline(false);
            return;
          }
          AdobeAssetViewBaseContainerFragment.this.wentOnline(true);
        }
      };
    }
    if (_app_orientation_changed_observer == null) {
      _app_orientation_changed_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          handleAppOrientationChange();
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAppOrientationConfigurationChanged, _app_orientation_changed_observer);
  }
  
  public void reloadAssetItemsFromDataSourceDueToSwipeRefresh()
  {
    boolean bool = _supressProgress;
    _supressProgress = true;
    if (!getDataSource().loadItemsFromScratch())
    {
      stopRefreshAnimationOnCurrentListController();
      _supressProgress = bool;
      return;
    }
    setMultiSelectContainerVisibility(false);
  }
  
  protected void reloadDataFromDataSource()
  {
    getDataSource().loadItemsFromScratch();
  }
  
  protected abstract void resetAssetsListViewVisualLayout();
  
  protected void restoreContainerFromSavedInstance(Bundle paramBundle)
  {
    initializeFromViewConfiguration(_assetViewConfiguration);
  }
  
  protected void restoreCurrentAssetsListControllerState()
  {
    if (_listControllerSavedInstanceState != null)
    {
      _currentAssetsViewController.restoreFromState(_listControllerSavedInstanceState);
      _listControllerSavedInstanceState = null;
    }
  }
  
  public void retryClickHandler(View paramView)
  {
    hideCloudNotReachable();
    reloadAssetItemsFromDataSourceDueToSwipeRefresh();
  }
  
  protected void saveCurrentAssetsListControllerState()
  {
    if (_currentAssetsViewController != null) {}
    for (AdobeAssetsViewBaseListViewController.InstanceState localInstanceState = _currentAssetsViewController.getInstanceState();; localInstanceState = null)
    {
      _listControllerSavedInstanceState = localInstanceState;
      return;
    }
  }
  
  protected void setContainerFragmentTitle(String paramString)
  {
    setActionBarDropDownDetails(false, paramString);
  }
  
  protected abstract void setupAssetsDataSourceAndListViewControllers();
  
  protected void showEmptyAssetsStateView()
  {
    handleFolderDataCommon(true);
  }
  
  protected void showMenuItemsUtil(Menu paramMenu)
  {
    if (_menuStates == null) {
      return;
    }
    int j = paramMenu.size();
    int i = 0;
    label17:
    MenuItem localMenuItem;
    if (i < j)
    {
      localMenuItem = paramMenu.getItem(i);
      if ((_menuStates[i] == 0) || (!isNetworkOnline())) {
        break label67;
      }
    }
    label67:
    for (boolean bool = true;; bool = false)
    {
      localMenuItem.setVisible(bool);
      i += 1;
      break label17;
      break;
    }
  }
  
  protected void showProgressView()
  {
    _progressSpinner.setVisibility(0);
  }
  
  protected void stopRefreshAnimationOnCurrentListController()
  {
    if (_currentAssetsViewController != null) {
      _currentAssetsViewController.stopRefreshAnimation();
    }
  }
  
  protected void storeInstanceState(Bundle paramBundle)
  {
    paramBundle.putInt("orientation", getAppCurrentOrientation());
  }
  
  protected void unRegisterLocalNotifications()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAppOrientationConfigurationChanged, _app_orientation_changed_observer);
  }
  
  protected class AssetsViewBaseActionBarController
  {
    protected MenuItem _myAccountMenuItem;
    
    protected AssetsViewBaseActionBarController() {}
    
    public void handleCurrentNetworkStatus(boolean paramBoolean) {}
    
    public void handleOnStart() {}
    
    protected boolean handleOptionItemSelect(int paramInt)
    {
      if (paramInt == R.id.adobe_uxassetbrowser_sdk_common_menu_myaccount)
      {
        postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_MENU_SHOW_MY_ACCOUNT, null);
        return true;
      }
      return false;
    }
    
    public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
    {
      paramMenuInflater.inflate(R.menu.adobe_assetview_common_menu, paramMenu);
      _myAccountMenuItem = paramMenu.findItem(R.id.adobe_uxassetbrowser_sdk_common_menu_myaccount);
    }
    
    public boolean onOptionsItemSelected(MenuItem paramMenuItem)
    {
      return handleOptionItemSelect(paramMenuItem.getItemId());
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu)
    {
      paramMenu = getResources().getString(R.string.adobe_uxassetbrowser_sdk_myaccount);
      _myAccountMenuItem.setTitle(AdobeAssetViewUtils.getAdobeFontFormattedString(paramMenu, getActivity()));
      _myAccountMenuItem.setVisible(shouldEnableMyAccountMenu());
    }
    
    public void refreshOptionItems() {}
    
    public void saveActionBarInstanceState() {}
    
    protected boolean shouldEnableMyAccountMenu()
    {
      boolean bool1 = AdobeAssetViewUtils.shouldEnableLokiSpecificFeatures(getHostActivity());
      boolean bool2 = AdobeCSDKInternalClientsPreferences.hasClientPreferenceToEnableMyAccountOption();
      return (!bool1) && (bool2);
    }
  }
  
  protected class AssetsViewContainerInstanceState
  {
    public int _dataSourceCount;
    public int orientation;
    
    protected AssetsViewContainerInstanceState() {}
  }
}
