package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.MobileCreationsDataSourceFactory;
import com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar.AdobeUxActionBarDropDownController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar.AdobeUxActionBarDropDownController.CCSection;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewCommandsHandler;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateToCollectionCommand;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateToDesignLibraryCollectionCommand;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateToPhotoCollectionCommand;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;
import java.util.EnumSet;

public class AdobeAssetViewMainBrowserFragment
  extends Fragment
{
  public static int COLLABORATION_INTENT_REQUEST_CODE = 10;
  public static int NOTIFICATION_INTENT_REQUEST_CODE = 11;
  public final String BASE_FRAGMENT_TAG = "assetBrowser_baseFragmentTab";
  private final int ROOT_VIEW_ID_CONST = 4660;
  private IAdobeAssetViewBrowserFragmentHostActivity _assetViewFragmentHostActivity;
  private AdobeAssetMainBrowserConfiguration _browserConfiguration;
  private BrowserCommandsHandler _commandsHandler;
  private AdobeAssetMainBrowserExtraConfiguration _extraConfiguration;
  private boolean _popToRootOnResume = false;
  private int _rootViewId = 0;
  
  public AdobeAssetViewMainBrowserFragment() {}
  
  private void action_handleCreateNewFolder(AdobeAssetFolder paramAdobeAssetFolder)
  {
    AdobeAssetViewBrowserControllerFactory.getCreateNewFolderDialogFragment(paramAdobeAssetFolder).show(getChildFragmentManager(), "upload_create_new_folder");
  }
  
  private void action_handleNewFolderCreated(AdobeAssetFolder paramAdobeAssetFolder)
  {
    navigateToCollection(AdobeAssetDataSourceType.AdobeAssetDataSourceFiles, paramAdobeAssetFolder.getHref().toString());
  }
  
  private void action_moveToRootCollection()
  {
    performPopToRoot();
  }
  
  private void fixDatasourceArgumentsForAssets()
  {
    Bundle localBundle = getArguments();
    if (localBundle == null) {}
    EnumSet localEnumSet;
    do
    {
      return;
      localEnumSet = (EnumSet)localBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_ARRAY_KEY);
    } while ((localEnumSet == null) || (localEnumSet.size() <= 0));
    localEnumSet.remove(AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary);
    localBundle.putSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_ARRAY_KEY, localEnumSet);
  }
  
  private void handleShowEditErrorDetails(Object paramObject)
  {
    AdobeAssetViewBrowserControllerFactory.getHostFragmentForEditErrorSummary(paramObject).show(getChildFragmentManager(), "edit_error_details");
  }
  
  private void handleShowUploadErrorDetails(Object paramObject)
  {
    AdobeAssetViewBrowserControllerFactory.getHostFragmentForUploadErrorSummary(paramObject).show(getChildFragmentManager(), "upload_error_details");
  }
  
  private void navigateToLibraryDesignCollection(AdobeAssetViewNavigateToDesignLibraryCollectionCommand paramAdobeAssetViewNavigateToDesignLibraryCollectionCommand)
  {
    AdobeAssetsViewDesignLibraryItemsContainerFragment localAdobeAssetsViewDesignLibraryItemsContainerFragment = new AdobeAssetsViewDesignLibraryItemsContainerFragment();
    Bundle localBundle = new Bundle();
    localBundle.putString("designCollectionHref", collectionHref);
    localBundle.putString("designCollectionParentHref", parentHref);
    paramAdobeAssetViewNavigateToDesignLibraryCollectionCommand = getArguments();
    if ((paramAdobeAssetViewNavigateToDesignLibraryCollectionCommand != null) && (paramAdobeAssetViewNavigateToDesignLibraryCollectionCommand.containsKey(AdobeAssetMainBrowserConfiguration.DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY)))
    {
      localBundle.putSerializable("design_library_items_key", paramAdobeAssetViewNavigateToDesignLibraryCollectionCommand.getSerializable(AdobeAssetMainBrowserConfiguration.DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY));
      localBundle.putSerializable("design_library_items_filtertype", paramAdobeAssetViewNavigateToDesignLibraryCollectionCommand.getSerializable(AdobeAssetMainBrowserConfiguration.DESIGNLIBRARYITEMS_FILTER_TYPE_KEY));
    }
    localAdobeAssetsViewDesignLibraryItemsContainerFragment.setArguments(localBundle);
    PushHostFragment(localAdobeAssetsViewDesignLibraryItemsContainerFragment, "");
  }
  
  private void navigateToMobileCreationCollection(AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData paramNavToMobileCreationPackageCollectionData)
  {
    AdobeAssetsViewMobileCreationPackageItemsContainerFragment localAdobeAssetsViewMobileCreationPackageItemsContainerFragment = new AdobeAssetsViewMobileCreationPackageItemsContainerFragment();
    Bundle localBundle = new Bundle();
    localBundle.putString("mobilePackageCollectionHref", collectionHref);
    localBundle.putString("mobilePackageCollectionParentHref", parentHref);
    localAdobeAssetsViewMobileCreationPackageItemsContainerFragment.setArguments(localBundle);
    PushHostFragment(localAdobeAssetsViewMobileCreationPackageItemsContainerFragment, "");
  }
  
  private void performPopToRoot()
  {
    for (;;)
    {
      Object localObject = getChildFragmentManager();
      if (((FragmentManager)localObject).getBackStackEntryCount() == 1)
      {
        localObject = new AdobeNotification(AdobeInternalNotificationID.AdobeCCFilesForceRefreshAssetsList, null);
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification((AdobeNotification)localObject);
        return;
      }
      ((FragmentManager)localObject).popBackStackImmediate();
    }
  }
  
  private void returnCurrentSelectedFilesToClient()
  {
    Intent localIntent = AdobeAssetViewBrowserSelectFilesHelper.getCurrentSelectedFilesAsIntentResultData();
    ((IAdobeAssetViewBrowserFragmentHostActivity)getActivity()).handleOpenSelectedFilesAction(localIntent);
  }
  
  private void returnCurrentSelectedPhotosToClient()
  {
    Intent localIntent = AdobeAssetViewBrowserSelectFilesHelper.getCurrentSelectedPhotosAsIntentResultData();
    ((IAdobeAssetViewBrowserFragmentHostActivity)getActivity()).handleOpenSelectedFilesAction(localIntent);
  }
  
  private void showCCSection_MyAssets()
  {
    fixDatasourceArgumentsForAssets();
    showFragmentAsRoot(AdobeAssetViewBrowserControllerFactory.getBaseHostFragmentFromClientBundle(getActivity(), getArguments(), _browserConfiguration));
  }
  
  private void showCCSection_MyAssetsCollection(String paramString, boolean paramBoolean)
  {
    fixDatasourceArgumentsForAssets();
    showFragmentAsRoot(AdobeAssetViewBrowserControllerFactory.getBaseHostFragmentFromClientBundle(getActivity(), getArguments(), _browserConfiguration, paramString, paramBoolean));
  }
  
  private void showCCSection_MyLibraries()
  {
    showFragmentAsRoot(AdobeAssetViewBrowserControllerFactory.getHostFragmentForDataSource(getActivity(), AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary));
  }
  
  private void showMyAccountView()
  {
    AdobeStorageSettingsFragment localAdobeStorageSettingsFragment = new AdobeStorageSettingsFragment();
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, getBrowserConfiguration().getCloud());
    localAdobeStorageSettingsFragment.setArguments(localBundle);
    PushHostFragment(localAdobeStorageSettingsFragment, null);
  }
  
  private void signOutCurrentUser()
  {
    ((IAdobeAssetViewBrowserFragmentHostActivity)getActivity()).handleUserSignOutAction();
  }
  
  private void startWithClientArguments(Bundle paramBundle)
  {
    paramBundle = _extraConfiguration.startWithCollectionHref();
    boolean bool = _extraConfiguration.useDropDownActionBar();
    if (paramBundle == null)
    {
      int i = 1;
      if (AdobeUxActionBarDropDownController.getInstance() != null) {
        if (AdobeUxActionBarDropDownController.getInstance().getCurrentCCSection() != AdobeUxActionBarDropDownController.CCSection.myLibraries) {
          break label51;
        }
      }
      label51:
      for (i = 1; i != 0; i = 0)
      {
        showCCSection_MyLibraries();
        return;
      }
      showCCSection_MyAssets();
      return;
    }
    showCCSection_MyAssetsCollection(paramBundle, bool);
  }
  
  void PushHostFragment(Fragment paramFragment, String paramString)
  {
    paramString = getChildFragmentManager().beginTransaction();
    paramString.replace(_rootViewId, paramFragment);
    paramString.addToBackStack(null);
    paramString.commit();
  }
  
  public AdobeAssetMainBrowserConfiguration getBrowserConfiguration()
  {
    return _browserConfiguration;
  }
  
  public void handleOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt2 == -1) && ((paramInt1 == AdobeAssetViewUtils.ASSET_ONE_UP_ACTIVITY_REQUEST) || (paramInt1 == AdobeAssetViewUtils.PHOTO_ONE_UP_ACTIVITY_REQUEST) || (paramInt1 == AdobeAssetViewUtils.MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST) || (paramInt1 == AdobeAssetViewUtils.LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST)))
    {
      if (paramInt1 == AdobeAssetViewUtils.PHOTO_ONE_UP_ACTIVITY_REQUEST) {
        returnCurrentSelectedPhotosToClient();
      }
    }
    else {
      return;
    }
    returnCurrentSelectedFilesToClient();
  }
  
  public boolean handleOnBackPressed()
  {
    getChildFragmentManager().popBackStack();
    return true;
  }
  
  public boolean isAtRootFragment()
  {
    return getChildFragmentManager().getBackStackEntryCount() == 0;
  }
  
  public void navigateToCollection(AdobeAssetDataSourceType paramAdobeAssetDataSourceType, String paramString)
  {
    if (_assetViewFragmentHostActivity != null) {
      _assetViewFragmentHostActivity.hideCollaborationFrameOnBackPressed();
    }
    PushHostFragment(AdobeAssetViewBrowserControllerFactory.getHostFragmentForDataSource(getActivity(), paramAdobeAssetDataSourceType, getArguments(), paramString), "");
  }
  
  public void navigateToPhotoCollection(AdobeAssetDataSourceType paramAdobeAssetDataSourceType, AdobeAssetViewNavigateToPhotoCollectionCommand paramAdobeAssetViewNavigateToPhotoCollectionCommand)
  {
    AdobeAssetsViewPhotoAssetsContainerFragment localAdobeAssetsViewPhotoAssetsContainerFragment = new AdobeAssetsViewPhotoAssetsContainerFragment();
    paramAdobeAssetDataSourceType = AdobeAssetViewBrowserControllerFactory.getAssetViewConfigurationBundle(paramAdobeAssetDataSourceType, getArguments(), null);
    paramAdobeAssetDataSourceType.putString("ASSET_CONTAINER_TARGET_COLLECTION_GUID", collectionGUID);
    paramAdobeAssetDataSourceType.putString("ASSET_CONTAINER_TARGET_COLLECTION_NAME", collectionName);
    paramAdobeAssetDataSourceType.putString("ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_GUID", catalogGUID);
    paramAdobeAssetDataSourceType.putString("ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_NAME", catalogName);
    localAdobeAssetsViewPhotoAssetsContainerFragment.setArguments(paramAdobeAssetDataSourceType);
    PushHostFragment(localAdobeAssetsViewPhotoAssetsContainerFragment, "");
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (paramBundle == null) {
      startWithClientData();
    }
    while (getChildFragmentManager().getBackStackEntryCount() != 0) {
      return;
    }
    startWithClientData();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    if ((paramActivity instanceof IAdobeAssetViewBrowserFragmentHostActivity)) {
      _assetViewFragmentHostActivity = ((IAdobeAssetViewBrowserFragmentHostActivity)paramActivity);
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    _commandsHandler = new BrowserCommandsHandler(null);
    setRetainInstance(true);
    paramBundle = getArguments();
    _browserConfiguration = AdobeAssetViewBrowserControllerFactory.getConfigurationFromBundle(paramBundle);
    _extraConfiguration = AdobeAssetViewBrowserControllerFactory.getExtraConfigurationFromBundle(paramBundle);
    if ((_browserConfiguration.getDataSourcesFilter() == null) || (_browserConfiguration.getDataSourcesFilter().size() == 0))
    {
      MobileCreationsDataSourceFactory.getInstance().setCloud(_browserConfiguration.getCloud());
      MobileCreationsDataSourceFactory.getInstance().loadDataSources(true);
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = new FrameLayout(getActivity());
    paramLayoutInflater.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
    _rootViewId = 4660;
    paramLayoutInflater.setId(_rootViewId);
    AdobeNetworkReachabilityUtil.getSharedInstance();
    return paramLayoutInflater;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    AdobeNetworkReachabilityUtil.destorySharedInstance();
    super.onDestroyView();
  }
  
  public void onResume()
  {
    super.onResume();
    if (_popToRootOnResume)
    {
      _popToRootOnResume = false;
      performPopToRoot();
    }
  }
  
  public void onStart()
  {
    _commandsHandler.onStart();
    super.onStart();
  }
  
  public void onStop()
  {
    _commandsHandler.onStop();
    super.onStop();
  }
  
  void showFragmentAsRoot(Fragment paramFragment)
  {
    FragmentTransaction localFragmentTransaction = getChildFragmentManager().beginTransaction();
    localFragmentTransaction.replace(_rootViewId, paramFragment);
    localFragmentTransaction.commit();
  }
  
  public void startWithClientData()
  {
    startWithClientArguments(getArguments());
  }
  
  private class BrowserCommandsHandler
    extends AdobeAssetViewCommandsHandler
  {
    private BrowserCommandsHandler() {}
    
    protected void HandleCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject)
    {
      if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.NAVIGATE_TO_COLLECTION)
      {
        paramAdobeAssetViewBrowserCommandName = (AdobeAssetViewNavigateToCollectionCommand)paramObject;
        navigateToCollection(dataSourceType, collectionHref);
      }
      do
      {
        do
        {
          return;
          if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.NAVIGATE_TO_DESIGNLIBRARY_COLLECTION)
          {
            paramAdobeAssetViewBrowserCommandName = (AdobeAssetViewNavigateToDesignLibraryCollectionCommand)paramObject;
            AdobeAssetViewMainBrowserFragment.this.navigateToLibraryDesignCollection(paramAdobeAssetViewBrowserCommandName);
            return;
          }
          if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.NAVIGATE_TO_MOBILECREATION_COLLECTION)
          {
            paramAdobeAssetViewBrowserCommandName = (AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData)paramObject;
            AdobeAssetViewMainBrowserFragment.this.navigateToMobileCreationCollection(paramAdobeAssetViewBrowserCommandName);
            return;
          }
        } while (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.NAVIGATE_BACK);
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_MENU_SHOW_MY_ACCOUNT)
        {
          AdobeAssetViewMainBrowserFragment.this.showMyAccountView();
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_FILES)
        {
          AdobeAssetViewMainBrowserFragment.this.returnCurrentSelectedFilesToClient();
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_PHOTOS)
        {
          AdobeAssetViewMainBrowserFragment.this.returnCurrentSelectedPhotosToClient();
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.NAVIGATE_TO_PHOTO_COLLECTION)
        {
          paramAdobeAssetViewBrowserCommandName = (AdobeAssetViewNavigateToPhotoCollectionCommand)paramObject;
          navigateToPhotoCollection(AdobeAssetDataSourceType.AdobeAssetDataSourcePhotos, paramAdobeAssetViewBrowserCommandName);
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ASSET_BROWSER_USER_SIGNOUT)
        {
          AdobeAssetViewMainBrowserFragment.this.signOutCurrentUser();
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_UPLOAD_SHOW_ERROR_DETAILS)
        {
          AdobeAssetViewMainBrowserFragment.this.handleShowUploadErrorDetails(paramObject);
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_SHOW_ERROR_DETAILS)
        {
          AdobeAssetViewMainBrowserFragment.this.handleShowEditErrorDetails(paramObject);
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_MENU_CREATE_NEWFOLDER)
        {
          AdobeAssetViewMainBrowserFragment.this.action_handleCreateNewFolder((AdobeAssetFolder)paramObject);
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_NEWFOLDER_CREATED)
        {
          AdobeAssetViewMainBrowserFragment.this.action_handleNewFolderCreated((AdobeAssetFolder)paramObject);
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_SHOW_CC_DATASOURCE_MYASSETS)
        {
          AdobeAssetViewMainBrowserFragment.this.showCCSection_MyAssets();
          return;
        }
        if (paramAdobeAssetViewBrowserCommandName == AdobeAssetViewBrowserCommandName.ACTION_SHOW_CC_DATASOURCE_MYLIBRARIES)
        {
          AdobeAssetViewMainBrowserFragment.this.showCCSection_MyLibraries();
          return;
        }
      } while (paramAdobeAssetViewBrowserCommandName != AdobeAssetViewBrowserCommandName.ACTION_ASSET_VIEW_COLLABORATOR_SELF_DELETE_MOVE_TO_ROOT);
      AdobeAssetViewMainBrowserFragment.this.action_moveToRootCollection();
    }
    
    protected EnumSet<AdobeAssetViewBrowserCommandName> getCommandsListToRegister()
    {
      return EnumSet.of(AdobeAssetViewBrowserCommandName.NAVIGATE_TO_COLLECTION, new AdobeAssetViewBrowserCommandName[] { AdobeAssetViewBrowserCommandName.NAVIGATE_TO_DESIGNLIBRARY_COLLECTION, AdobeAssetViewBrowserCommandName.NAVIGATE_TO_MOBILECREATION_COLLECTION, AdobeAssetViewBrowserCommandName.NAVIGATE_BACK, AdobeAssetViewBrowserCommandName.ACTION_MENU_SHOW_MY_ACCOUNT, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_FILES, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_OPEN_SELECTED_PHOTOS, AdobeAssetViewBrowserCommandName.NAVIGATE_TO_PHOTO_COLLECTION, AdobeAssetViewBrowserCommandName.ASSET_BROWSER_USER_SIGNOUT, AdobeAssetViewBrowserCommandName.ACTION_MENU_CREATE_NEWFOLDER, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_NEWFOLDER_CREATED, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_UPLOAD_SHOW_ERROR_DETAILS, AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_SHOW_ERROR_DETAILS, AdobeAssetViewBrowserCommandName.ACTION_SHOW_CC_DATASOURCE_MYASSETS, AdobeAssetViewBrowserCommandName.ACTION_SHOW_CC_DATASOURCE_MYLIBRARIES, AdobeAssetViewBrowserCommandName.ACTION_ASSET_VIEW_COLLABORATOR_SELF_DELETE_MOVE_TO_ROOT });
    }
  }
}
