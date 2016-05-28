package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.MenuItemCompat;
import android.support.v4.view.MenuItemCompat.OnActionExpandListener;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.support.v7.widget.SearchView.OnQueryTextListener;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextWatcher;
import android.text.style.ForegroundColorSpan;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.menu;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource.DataSourceInternalFilters;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.IAdobeStorageDataSourceDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToAssetFolderData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateToCollectionCommand;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeListIndexPath;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeListSectionsIndexSet;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypeFace;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetViewNewCCFilesContainerFragment
  extends AdobeAssetViewBaseContainerFragment
{
  private AdobeCloud _cloud;
  private StorageDataSourceDelegate _dataSourceDelegate;
  private Observer _forceRefreshAssetsListObserver;
  protected AdobeAssetsViewCCFilesGridViewController _gridAssetsViewController;
  private CCFilesFragmentState _lastSavedInstanceState;
  protected AdobeAssetsViewCCFilesSectionListViewController _listAssetsViewController;
  private boolean _searchBarOpened;
  private int _selectionTimeStampAtStop = -1;
  private Observer _storageAssetsSelectionCountChange;
  private AdobeStorageDataSource _storageDataSource;
  private Observer _tabDataSourceChangedObserver;
  private AdobeAssetFolder _targetCollection;
  
  public AdobeAssetViewNewCCFilesContainerFragment() {}
  
  private void changeVisualDisplay(AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout paramAdobeUXAssetBrowserVisualLayout)
  {
    if (paramAdobeUXAssetBrowserVisualLayout == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL) {
      showAssetsAsGrid();
    }
    for (;;)
    {
      _currentAssetsViewController.refreshDueToDataChange();
      AdobeCommonLearnedSettings.setLastVisualLayout(paramAdobeUXAssetBrowserVisualLayout);
      return;
      showAssetsAsList();
    }
  }
  
  private void closeSearchBarIfOpen()
  {
    if ((_actionBarController instanceof CCFilesActionBarController)) {
      ((CCFilesActionBarController)_actionBarController).closeSearchViewIfOpen();
    }
  }
  
  private void showAssetsAsGrid()
  {
    showAssetsAsGridAnimate(false);
  }
  
  private void showAssetsAsGridAnimate(boolean paramBoolean)
  {
    FrameLayout localFrameLayout = getAssetsMainRootFrame();
    localFrameLayout.removeView(_listAssetsViewController.getMainView());
    View localView = _gridAssetsViewController.getMainView();
    if (localFrameLayout.indexOfChild(localView) == -1) {
      localFrameLayout.addView(localView);
    }
    setCurrentAssetViewController(_gridAssetsViewController);
  }
  
  private void showAssetsAsList()
  {
    showAssetsAsListAnimate(false);
  }
  
  private void showAssetsAsListAnimate(boolean paramBoolean)
  {
    FrameLayout localFrameLayout = getAssetsMainRootFrame();
    localFrameLayout.removeView(_gridAssetsViewController.getMainView());
    View localView = _listAssetsViewController.getMainView();
    if (localFrameLayout.indexOfChild(localView) == -1) {
      localFrameLayout.addView(localView);
    }
    setCurrentAssetViewController(_listAssetsViewController);
  }
  
  private void showAssetsOfCurrentVisualLayout(boolean paramBoolean)
  {
    if (AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW == AdobeCommonLearnedSettings.lastVisualLayout())
    {
      showAssetsAsListAnimate(paramBoolean);
      return;
    }
    showAssetsAsGridAnimate(paramBoolean);
  }
  
  protected AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController createActionBarController()
  {
    return new CCFilesActionBarController();
  }
  
  protected void ds_startedLoadingMoreFolders() {}
  
  protected void ds_stoppedLoadingMoreFolders() {}
  
  protected int getAssetSelectionCount()
  {
    return AdobeStorageAssetSelectionState.selectedAssetCount();
  }
  
  protected AdobeAssetsViewContainerConfiguration getAssetViewConfiguration(Bundle paramBundle)
  {
    AdobeAssetsViewContainerConfiguration localAdobeAssetsViewContainerConfiguration = new AdobeAssetsViewContainerConfiguration();
    localAdobeAssetsViewContainerConfiguration.createFromBundle(paramBundle);
    _cloud = localAdobeAssetsViewContainerConfiguration.getCloud();
    return localAdobeAssetsViewContainerConfiguration;
  }
  
  protected String getContainerNameForRoot()
  {
    return getString(R.string.adobe_uxassetbrowser_csdk_myassets_main);
  }
  
  protected String getCurrentTargetCollectionName()
  {
    return _targetCollection.getName();
  }
  
  protected IAdobeAssetDataSource getDataSource()
  {
    return _storageDataSource;
  }
  
  protected AdobeStorageDataSource.DataSourceInternalFilters getInternalFilters()
  {
    return null;
  }
  
  protected AdobeAssetFolder getTargetCollection()
  {
    return _targetCollection;
  }
  
  protected void handleAnyListCellViewsRefresh()
  {
    if ((_selectionTimeStampAtStop != -1) && (_currentAssetsViewController != null) && (_selectionTimeStampAtStop != AdobeStorageAssetSelectionState.getCurrentSelectionTimeStamp())) {
      ((AdobeAssetsViewCCFilesBaseListViewController)_currentAssetsViewController).refreshOnlyListView();
    }
    _selectionTimeStampAtStop = -1;
  }
  
  protected boolean handleAnyListConfigChange()
  {
    return _storageDataSource.resetSortIndexCollator();
  }
  
  public void handleAppOrientationChange()
  {
    if ((_currentAssetsViewController != null) && ((_currentAssetsViewController instanceof AdobeAssetsViewCCFilesGridViewController)))
    {
      if (_gridAssetsViewController == null) {
        break label32;
      }
      _gridAssetsViewController.refreshLayoutDueToOrientationChange();
    }
    label32:
    while ((_currentAssetsViewController == null) || (!(_currentAssetsViewController instanceof AdobeAssetsViewCCFilesSectionListViewController)) || (_listAssetsViewController == null)) {
      return;
    }
    _listAssetsViewController.refreshLayoutDueToOrientationChange();
  }
  
  public void handleAssetClickAction(Object paramObject)
  {
    if (!(paramObject instanceof AdobeAssetFile)) {
      return;
    }
    openOneUpViewActivityFromAsset((AdobeAssetFile)paramObject);
  }
  
  protected void handleCancelSelectionUserAction() {}
  
  protected void handleCollaborationVisibilty(boolean paramBoolean) {}
  
  public void handleCurrentNetworkStatusWithUpload(boolean paramBoolean) {}
  
  public void handleLongClickOnAsset(AdobeAsset paramAdobeAsset) {}
  
  protected void handleOnStop()
  {
    super.handleOnStop();
    _selectionTimeStampAtStop = AdobeStorageAssetSelectionState.getCurrentSelectionTimeStamp();
  }
  
  protected void handleOpenCurrentSelectedFilesUserAction()
  {
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_FILES);
  }
  
  protected void handlePostOffline() {}
  
  protected boolean hasActionBarOptions()
  {
    return true;
  }
  
  protected void hideCollaborationAndNotificationIcon() {}
  
  protected void hookUpDataSourceDelegate(boolean paramBoolean)
  {
    _storageDataSource.setAdobeStorageDataSourceDelegate(_dataSourceDelegate);
  }
  
  protected void initializeCCFilesContainerFromCollectionHref(String paramString)
  {
    _targetCollection = AdobeAssetViewUtils.getAssetFolderFromHref(paramString, true);
  }
  
  protected void initializeFromViewConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration)
  {
    initializeCCFilesContainerFromCollectionHref(_assetViewConfiguration.getTargetCollectionHref());
  }
  
  protected boolean isContainerShowingRootCollection()
  {
    return (_targetCollection == null) || (AdobeStorageAssetFileUtils.isRootCollection(_targetCollection));
  }
  
  protected boolean isRestoredDataSourceChanged()
  {
    return AdobeAssetDataSourceMgr.getInstance().isFolderMarkedAsChanged(getTargetCollection(), true);
  }
  
  protected boolean isSearchBarOpened()
  {
    return _searchBarOpened;
  }
  
  public void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData)
  {
    paramNavBaseCommandData = (AdobeAssetViewNavigateCommands.NavToAssetFolderData)paramNavBaseCommandData;
    AdobeAssetViewNavigateToCollectionCommand localAdobeAssetViewNavigateToCollectionCommand = new AdobeAssetViewNavigateToCollectionCommand();
    collectionHref = collectionHref;
    dataSourceType = dataSourceType;
    postActionCommand(AdobeAssetViewBrowserCommandName.NAVIGATE_TO_COLLECTION, localAdobeAssetViewNavigateToCollectionCommand);
  }
  
  protected void openOneUpViewActivityFromAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    AdobeAssetViewerController.generateAssetArray(_storageDataSource, paramAdobeAssetFile);
    if (AdobeAssetViewerController.isDataSourceValidForAssetViewerLaunch())
    {
      paramAdobeAssetFile = new Intent();
      paramAdobeAssetFile.setClass(getHostActivity(), AdobeUXAssetOneUpViewerActivity.class);
      paramAdobeAssetFile.putExtra(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, _assetViewConfiguration.getCloud());
      getHostActivity().startActivityForResult(paramAdobeAssetFile, AdobeAssetViewUtils.ASSET_ONE_UP_ACTIVITY_REQUEST);
    }
  }
  
  protected void registerLocalNofications()
  {
    super.registerLocalNofications();
    if (_storageAssetsSelectionCountChange == null) {
      _storageAssetsSelectionCountChange = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          configureMultiSelectViews();
        }
      };
    }
    if (_forceRefreshAssetsListObserver == null) {
      _forceRefreshAssetsListObserver = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          reloadAssetItemsFromDataSourceDueToSwipeRefresh();
        }
      };
    }
    if (_tabDataSourceChangedObserver == null) {
      _tabDataSourceChangedObserver = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          AdobeAssetViewNewCCFilesContainerFragment.this.closeSearchBarIfOpen();
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _storageAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _storageAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesForceRefreshAssetsList, _forceRefreshAssetsListObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeUxTabDataSourceChanged, _tabDataSourceChangedObserver);
  }
  
  public void reloadAssetItemsFromDataSourceDueToSwipeRefresh()
  {
    closeSearchBarIfOpen();
    super.reloadAssetItemsFromDataSourceDueToSwipeRefresh();
  }
  
  protected void resetAssetsListViewVisualLayout()
  {
    showAssetsOfCurrentVisualLayout(false);
  }
  
  protected void restoreCurrentAssetsListControllerState()
  {
    if ((_lastSavedInstanceState == null) || (AdobeCommonLearnedSettings.lastVisualLayout() != _lastSavedInstanceState._visualLayout)) {
      return;
    }
    super.restoreCurrentAssetsListControllerState();
    _lastSavedInstanceState = null;
  }
  
  protected void saveCurrentAssetsListControllerState()
  {
    super.saveCurrentAssetsListControllerState();
    _lastSavedInstanceState = new CCFilesFragmentState();
    _lastSavedInstanceState._visualLayout = AdobeCommonLearnedSettings.lastVisualLayout();
  }
  
  protected void setCurrentAssetViewController(AdobeAssetsViewCCFilesBaseListViewController paramAdobeAssetsViewCCFilesBaseListViewController)
  {
    _currentAssetsViewController = paramAdobeAssetsViewCCFilesBaseListViewController;
  }
  
  protected void setupAssetsDataSourceAndListViewControllers()
  {
    if (_gridAssetsViewController != null) {
      return;
    }
    _dataSourceDelegate = new StorageDataSourceDelegate();
    _storageDataSource = new AdobeStorageDataSource();
    _storageDataSource.setTargetCollection(_targetCollection);
    _storageDataSource.setAdobeStorageDataSourceDelegate(_dataSourceDelegate);
    _storageDataSource.setFilter(_assetViewConfiguration.getMimeTypesFilter());
    _storageDataSource.setInclusiveFilter(_assetViewConfiguration.getIsMimeTypeFilterInclusive());
    _storageDataSource.SetDataInternalFilters(getInternalFilters());
    _gridAssetsViewController = setupGridViewController();
    _gridAssetsViewController.setContainerController(this);
    _listAssetsViewController = setupSectionalListViewController();
    _listAssetsViewController.setContainerController(this);
    _gridAssetsViewController.setAssetListViewerConfiguration(_assetViewConfiguration);
    _listAssetsViewController.setAssetListViewerConfiguration(_assetViewConfiguration);
    _gridAssetsViewController.performInitialization(getActivity());
    _listAssetsViewController.performInitialization(getActivity());
    _gridAssetsViewController.setStorageDataSource(_storageDataSource);
    _listAssetsViewController.setStorageDataSource(_storageDataSource);
    _storageDataSource.loadItemsFromScratch(true);
  }
  
  protected AdobeAssetsViewCCFilesGridViewController setupGridViewController()
  {
    return new AdobeAssetsViewCCFilesGridViewController(getActivity());
  }
  
  protected AdobeAssetsViewCCFilesSectionListViewController setupSectionalListViewController()
  {
    return new AdobeAssetsViewCCFilesSectionListViewController(getActivity());
  }
  
  protected void showCollaborationAndNotificationIcon() {}
  
  protected void unRegisterLocalNotifications()
  {
    super.unRegisterLocalNotifications();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, _storageAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, _storageAssetsSelectionCountChange);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesForceRefreshAssetsList, _forceRefreshAssetsListObserver);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeUxTabDataSourceChanged, _tabDataSourceChangedObserver);
  }
  
  protected class CCFilesActionBarController
    extends AdobeAssetViewBaseContainerFragment.AssetsViewBaseActionBarController
  {
    private final String EMPTY_STRING = "";
    AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout _currentFileListSelectionType;
    AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState _currentSortState;
    AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType _currentSortType;
    private String _lastSearchString = "";
    private boolean _restoreActionBar;
    FragmentActionBarInstanceData _savedFragmentActionBarInstanceData;
    private MenuItem _searchView;
    private MenuItem _sortTypeMenuItem;
    private MenuItem _viewTypeMenuItem;
    
    protected CCFilesActionBarController()
    {
      super();
    }
    
    private void toggleSortType()
    {
      if (_currentSortType == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA) {
        _currentSortType = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_TIME;
      }
      for (_currentSortState = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState.SORT_STATE_DESCENDING;; _currentSortState = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState.SORT_STATE_ASCENDING)
      {
        AdobeCommonLearnedSettings.setLastSortType(_currentSortType);
        AdobeCommonLearnedSettings.setLastSortState(_currentSortState);
        _storageDataSource.sortCollectionByType(_currentSortType, _currentSortState);
        return;
        _currentSortType = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA;
      }
    }
    
    private void toggleViewType()
    {
      if (_currentFileListSelectionType == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW) {}
      for (_currentFileListSelectionType = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL;; _currentFileListSelectionType = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW)
      {
        AdobeAssetViewNewCCFilesContainerFragment.this.changeVisualDisplay(_currentFileListSelectionType);
        return;
      }
    }
    
    public void closeSearchViewIfOpen()
    {
      if ((_searchView != null) && (MenuItemCompat.isActionViewExpanded(_searchView))) {
        MenuItemCompat.collapseActionView(_searchView);
      }
    }
    
    public void handleCurrentNetworkStatus(boolean paramBoolean)
    {
      boolean bool2 = true;
      if (_searchView != null) {
        _searchView.setVisible(paramBoolean);
      }
      MenuItem localMenuItem;
      if (_viewTypeMenuItem != null)
      {
        localMenuItem = _viewTypeMenuItem;
        if ((paramBoolean) && (!isSearchBarOpened()))
        {
          bool1 = true;
          localMenuItem.setVisible(bool1);
        }
      }
      else if (_sortTypeMenuItem != null)
      {
        localMenuItem = _sortTypeMenuItem;
        if ((!paramBoolean) || (isSearchBarOpened())) {
          break label110;
        }
      }
      label110:
      for (boolean bool1 = bool2;; bool1 = false)
      {
        localMenuItem.setVisible(bool1);
        handleCurrentNetworkStatusWithUpload(paramBoolean);
        return;
        bool1 = false;
        break;
      }
    }
    
    public void handleOnStart()
    {
      resetButtonState();
    }
    
    public boolean handleOptionItemSelect(int paramInt)
    {
      if (paramInt == R.id.adobe_uxassetbrowser_assets_viewtype)
      {
        toggleViewType();
        if (_currentFileListSelectionType == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW) {
          AdobeAnalyticsSDKReporter.trackAssetBrowserAction("View As List");
        }
        for (;;)
        {
          return true;
          AdobeAnalyticsSDKReporter.trackAssetBrowserAction("View As Grid");
        }
      }
      if (paramInt == R.id.adobe_uxassetbrowser_assets_view_sorttype)
      {
        toggleSortType();
        if (_currentSortType == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA) {
          AdobeAnalyticsSDKReporter.trackAssetBrowserAction("Sort Alphabetically");
        }
        for (;;)
        {
          _currentAssetsViewController)._recyclerView.scrollToPosition(0);
          return true;
          AdobeAnalyticsSDKReporter.trackAssetBrowserAction("Sort By Date");
        }
      }
      if (paramInt == R.id.search)
      {
        AdobeAnalyticsSDKReporter.trackAssetBrowserAction("Search Button Tapped");
        ((SearchView)MenuItemCompat.getActionView(_searchView)).setOnSearchClickListener(new View.OnClickListener()
        {
          private boolean extended = false;
          
          public void onClick(View paramAnonymousView)
          {
            if (!extended)
            {
              extended = true;
              getLayoutParamswidth = -1;
            }
          }
        });
      }
      while (paramInt != R.id.adobe_uxassetbrowser_sdk_photos_myaccount) {
        return super.handleOptionItemSelect(paramInt);
      }
      postActionCommand(AdobeAssetViewBrowserCommandName.ACTION_MENU_SHOW_MY_ACCOUNT, null);
      return true;
    }
    
    public void onCreateOptionsMenu(final Menu paramMenu, MenuInflater paramMenuInflater)
    {
      paramMenuInflater.inflate(R.menu.adobe_asset_browser_menu, paramMenu);
      Object localObject1 = paramMenu.findItem(R.id.search);
      final SearchView localSearchView = (SearchView)MenuItemCompat.getActionView((MenuItem)localObject1);
      Object localObject2 = localSearchView.findViewById(R.id.search_plate);
      if (localObject2 != null) {
        ((View)localObject2).setBackgroundResource(R.drawable.search_box_appearance);
      }
      final EditText localEditText = (EditText)localSearchView.findViewById(R.id.search_src_text);
      MenuItemCompat.setOnActionExpandListener((MenuItem)localObject1, new MenuItemCompat.OnActionExpandListener()
      {
        public boolean onMenuItemActionCollapse(MenuItem paramAnonymousMenuItem)
        {
          if ((_searchBarOpened) && (isContainerShowingRootCollection()))
          {
            AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeStorageUxAssetBrowserGlobalSearchBarClosed, null));
            AdobeAssetViewNewCCFilesContainerFragment.access$102(AdobeAssetViewNewCCFilesContainerFragment.this, false);
          }
          for (;;)
          {
            showMenuItemsUtil(paramMenu);
            showCollaborationAndNotificationIcon();
            localSearchView.setQuery("", false);
            localSearchView.setIconified(false);
            return true;
            if (_searchBarOpened) {
              AdobeAssetViewNewCCFilesContainerFragment.access$102(AdobeAssetViewNewCCFilesContainerFragment.this, false);
            }
          }
        }
        
        public boolean onMenuItemActionExpand(MenuItem paramAnonymousMenuItem)
        {
          AdobeAssetViewNewCCFilesContainerFragment.access$102(AdobeAssetViewNewCCFilesContainerFragment.this, true);
          if (isContainerShowingRootCollection())
          {
            localEditText.requestFocus();
            AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeStorageUxAssetBrowserGlobalSearchBarOpened, null));
          }
          hideMenuItemsUtil(paramMenu);
          hideCollaborationAndNotificationIcon();
          return true;
        }
      });
      localObject1 = new SearchView.OnQueryTextListener()
      {
        public boolean onQueryTextSubmit(String paramAnonymousString)
        {
          ((InputMethodManager)val$activity.getSystemService("input_method")).hideSoftInputFromWindow(val$activity.getCurrentFocus().getWindowToken(), 0);
          return true;
        }
      };
      if (localEditText != null) {}
      try
      {
        localEditText.setTypeface(AdobeCSDKTypeFace.getTypeface(getActivity()));
        localEditText.setTextColor(getResources().getColor(R.color.asset_browser_dark_text));
        localEditText.setTextSize(21.0F);
        localEditText.addTextChangedListener(new TextWatcher()
        {
          public void afterTextChanged(Editable paramAnonymousEditable)
          {
            if (!paramAnonymousEditable.toString().equals(new String("")))
            {
              val$searchPlate.setBackgroundResource(R.drawable.search_box_appearance_query);
              return;
            }
            val$searchPlate.setBackgroundResource(R.drawable.search_box_appearance);
          }
          
          public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
          
          public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
        });
        localObject2 = Class.forName("android.widget.SearchView$SearchAutoComplete");
        SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder("");
        localSpannableStringBuilder.append(getAdobeFormattedString(getResources().getString(R.string.search_query_hint)));
        localSpannableStringBuilder.setSpan(new ForegroundColorSpan(getResources().getColor(R.color.asset_browser_light_text)), 0, localSpannableStringBuilder.length(), 33);
        ((Class)localObject2).getMethod("setHint", new Class[] { CharSequence.class }).invoke(localEditText, new Object[] { localSpannableStringBuilder });
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        for (;;)
        {
          localIllegalAccessException.printStackTrace();
        }
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        for (;;)
        {
          localInvocationTargetException.printStackTrace();
        }
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        for (;;)
        {
          localClassNotFoundException.printStackTrace();
        }
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        for (;;)
        {
          localNoSuchMethodException.printStackTrace();
        }
      }
      localSearchView.setOnQueryTextListener((SearchView.OnQueryTextListener)localObject1);
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu)
    {
      super.onPrepareOptionsMenu(paramMenu);
      int i;
      boolean bool;
      if (getAssetsMainRootFrame() != null)
      {
        _viewTypeMenuItem = paramMenu.findItem(R.id.adobe_uxassetbrowser_assets_viewtype);
        _sortTypeMenuItem = paramMenu.findItem(R.id.adobe_uxassetbrowser_assets_view_sorttype);
        _searchView = paramMenu.findItem(R.id.search);
        if ((!_isRestoredFragment) && (!_restoreActionBar)) {
          break label123;
        }
        i = 1;
        bool = MenuItemCompat.isActionViewExpanded(_searchView);
        if ((!bool) && (i != 0) && (_savedFragmentActionBarInstanceData == null)) {
          AdobeAssetViewNewCCFilesContainerFragment.access$102(AdobeAssetViewNewCCFilesContainerFragment.this, false);
        }
        refreshOptionItems();
        if (i == 0) {
          break label128;
        }
        restoreFragmentActionBarFromSavedData();
        _restoreActionBar = false;
      }
      label123:
      label128:
      while (!bool)
      {
        return;
        i = 0;
        break;
      }
      MenuItemCompat.collapseActionView(_searchView);
    }
    
    public void refreshOptionItems()
    {
      boolean bool2 = true;
      if (_viewTypeMenuItem == null) {
        return;
      }
      Object localObject;
      if (_currentFileListSelectionType == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW)
      {
        localObject = getLocalizedStringUtil(R.string.adobe_uxassetbrowser_action_asgrid);
        _viewTypeMenuItem.setTitleCondensed((CharSequence)localObject);
        _viewTypeMenuItem.setTitle(getAdobeFormattedString((String)localObject));
        if (_currentSortType != AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA) {
          break label302;
        }
        localObject = getLocalizedStringUtil(R.string.adobe_uxassetbrowser_action_sort_date);
        label85:
        _sortTypeMenuItem.setTitleCondensed((CharSequence)localObject);
        _sortTypeMenuItem.setTitle(getAdobeFormattedString((String)localObject));
        _myAccountMenuItem.setTitle(getAdobeFormattedString(getLocalizedStringUtil(R.string.adobe_uxassetbrowser_sdk_myaccount)));
        localObject = _myAccountMenuItem;
        if ((isSearchBarOpened()) || (!shouldEnableMyAccountMenu())) {
          break label317;
        }
        bool1 = true;
        label168:
        ((MenuItem)localObject).setVisible(bool1);
        boolean bool3 = isAssetsMainFrameVisible();
        localObject = _viewTypeMenuItem;
        if ((isSearchBarOpened()) || (!bool3)) {
          break label322;
        }
        bool1 = true;
        label207:
        ((MenuItem)localObject).setVisible(bool1);
        localObject = _sortTypeMenuItem;
        if ((isSearchBarOpened()) || (!bool3)) {
          break label327;
        }
        bool1 = true;
        label238:
        ((MenuItem)localObject).setVisible(bool1);
        _searchView.setVisible(bool3);
        localObject = AdobeAssetViewNewCCFilesContainerFragment.this;
        if ((isSearchBarOpened()) || (!bool3)) {
          break label332;
        }
      }
      label302:
      label317:
      label322:
      label327:
      label332:
      for (boolean bool1 = bool2;; bool1 = false)
      {
        ((AdobeAssetViewNewCCFilesContainerFragment)localObject).handleCollaborationVisibilty(bool1);
        return;
        localObject = getLocalizedStringUtil(R.string.adobe_uxassetbrowser_action_aslist);
        break;
        localObject = getLocalizedStringUtil(R.string.adobe_uxassetbrowser_action_sort_alpha);
        break label85;
        bool1 = false;
        break label168;
        bool1 = false;
        break label207;
        bool1 = false;
        break label238;
      }
    }
    
    public void resetButtonState()
    {
      _currentFileListSelectionType = AdobeCommonLearnedSettings.lastVisualLayout();
      _currentSortState = AdobeCommonLearnedSettings.lastSortState();
      _currentSortType = AdobeCommonLearnedSettings.lastSortType();
    }
    
    protected void restoreFragmentActionBarFromSavedData()
    {
      if (_savedFragmentActionBarInstanceData == null) {
        return;
      }
      SearchView localSearchView = (SearchView)MenuItemCompat.getActionView(_searchView);
      if (!_savedFragmentActionBarInstanceData.isLastFilteredBySearch) {}
      for (boolean bool = true;; bool = false)
      {
        localSearchView.setIconified(bool);
        if (_savedFragmentActionBarInstanceData.isLastFilteredBySearch)
        {
          MenuItemCompat.expandActionView(_searchView);
          localSearchView.setQuery(_savedFragmentActionBarInstanceData.lastSearchedText, false);
        }
        _savedFragmentActionBarInstanceData = null;
        return;
      }
    }
    
    public void saveActionBarInstanceState()
    {
      _savedFragmentActionBarInstanceData = new FragmentActionBarInstanceData();
      FragmentActionBarInstanceData localFragmentActionBarInstanceData = _savedFragmentActionBarInstanceData;
      if (!_lastSearchString.equalsIgnoreCase("")) {}
      for (boolean bool = true;; bool = false)
      {
        isLastFilteredBySearch = bool;
        _savedFragmentActionBarInstanceData.lastSearchedText = _lastSearchString;
        return;
      }
    }
    
    class FragmentActionBarInstanceData
    {
      public boolean isLastFilteredBySearch;
      public String lastSearchedText;
      
      FragmentActionBarInstanceData() {}
    }
  }
  
  protected class CCFilesFragmentState
  {
    public AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout _visualLayout;
    
    protected CCFilesFragmentState() {}
  }
  
  protected class StorageDataSourceDelegate
    implements IAdobeStorageDataSourceDelegate
  {
    protected StorageDataSourceDelegate() {}
    
    public void didClearFilterString()
    {
      ds_didClearFilterString();
    }
    
    public void didFailToLoadMoreDataWithError(AdobeAssetException paramAdobeAssetException)
    {
      ds_didFailToLoadMoreDataWithError(paramAdobeAssetException);
    }
    
    public void didLoadMoreDataWithCount(int paramInt, AdobeListSectionsIndexSet paramAdobeListSectionsIndexSet, ArrayList<AdobeListIndexPath> paramArrayList)
    {
      ds_didLoadMoreDataWithCount(paramInt, paramAdobeListSectionsIndexSet, paramArrayList);
    }
    
    public void didSortByType(AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType paramAdobeUXAssetBrowserSortType, AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState paramAdobeUXAssetBrowserSortState) {}
    
    public void didStartLoadingMorePagesToFilter() {}
    
    public void didStopLoadingMorePagesToFilter() {}
    
    public void startedLoadingMoreFolders()
    {
      ds_startedLoadingMoreFolders();
    }
    
    public void stoppedLoadingMoreFolders()
    {
      ds_stoppedLoadingMoreFolders();
    }
    
    public void willLoadDataFromScratch()
    {
      ds_willLoadDataFromScratch();
    }
    
    public void willLoadNextPageForExistingCollection()
    {
      ds_willLoadNextPageForExistingCollection();
    }
    
    public void willLoadNextPageForNonExistingCollection()
    {
      ds_willLoadNextPageForNonExistingCollection();
    }
  }
}
