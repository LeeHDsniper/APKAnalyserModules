package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.MobileCreationsDataSourceFactory;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeCCFilesEditSession.EditSummary;
import com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeEditErrorSummaryFragment;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeCCFilesUploadSession.UploadSummary;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeUploadCreateNewFolderMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeUploadErrorSummaryFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceFilterType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMIMETypeFilterType;
import java.util.EnumSet;
import java.util.Iterator;

public class AdobeAssetViewBrowserControllerFactory
{
  private static String _appIdFromPreference = null;
  
  private static EnumSet<AdobeAssetDataSourceType> getAllSupportedDataSourcesList()
  {
    EnumSet localEnumSet = EnumSet.of(AdobeAssetDataSourceType.AdobeAssetDataSourceFiles, AdobeAssetDataSourceType.AdobeAssetDataSourcePhotos, AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix);
    Iterator localIterator = MobileCreationsDataSourceFactory.getDataSourceTypes().iterator();
    while (localIterator.hasNext())
    {
      AdobeAssetDataSourceType localAdobeAssetDataSourceType = (AdobeAssetDataSourceType)localIterator.next();
      AdobeAssetDataSource localAdobeAssetDataSource = MobileCreationsDataSourceFactory.getInstance().getDataSourceByType(localAdobeAssetDataSourceType);
      if ((localAdobeAssetDataSource != null) && (localAdobeAssetDataSource.getCount() != 0)) {
        localEnumSet.add(localAdobeAssetDataSourceType);
      }
    }
    return localEnumSet;
  }
  
  public static Bundle getAssetViewConfigurationBundle(AdobeAssetDataSourceType paramAdobeAssetDataSourceType, Bundle paramBundle, String paramString)
  {
    Bundle localBundle = new Bundle();
    localBundle.putSerializable("ASSET_CONTAINER_DATA_SOURCE_TYPE", paramAdobeAssetDataSourceType);
    if (paramBundle != null)
    {
      paramAdobeAssetDataSourceType = (EnumSet)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.MIME_TYPE_FILTER_ARRAY_KEY);
      if (paramAdobeAssetDataSourceType != null) {
        localBundle.putSerializable("ASSET_CONTAINER_MIME_FILTERS", paramAdobeAssetDataSourceType);
      }
      if ((AdobeAssetMIMETypeFilterType)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.MIME_TYPE_FILTER_TYPE_KEY) == AdobeAssetMIMETypeFilterType.ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION) {
        break label100;
      }
    }
    label100:
    for (boolean bool = true;; bool = false)
    {
      localBundle.putBoolean("ASSET_CONTAINER_MIME_TYPES_FILTER", bool);
      localBundle.putSerializable(AdobeAssetsViewContainerConfiguration.ADOBE_CLOUD_KEY, paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
      if (paramString != null) {
        localBundle.putString("ASSET_CONTAINER_TARGET_COLLECTION_HREF", paramString);
      }
      return localBundle;
    }
  }
  
  public static AdobeAssetViewFragmentDetails getAssetViewFragmentDetails(Context paramContext, AdobeAssetDataSourceType paramAdobeAssetDataSourceType, Bundle paramBundle, String paramString)
  {
    AdobeAssetViewFragmentDetails localAdobeAssetViewFragmentDetails = new AdobeAssetViewFragmentDetails();
    if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceFiles) {
      classTag = getCCFilesContainerFragmentClass(paramContext);
    }
    for (;;)
    {
      argumentsBundle = getAssetViewConfigurationBundle(paramAdobeAssetDataSourceType, paramBundle, paramString);
      return localAdobeAssetViewFragmentDetails;
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePhotos) {
        classTag = AdobeAssetsViewPhotoCollectionContainerFragment.class;
      } else if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary) {
        classTag = AdobeAssetsViewDesignLibraryCollectionContainerFragment.class;
      } else if ((paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceDraw) || (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLine) || (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceSketches)) {
        classTag = AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment.class;
      } else if ((paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix) || (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions)) {
        classTag = AdobeAssetsViewCompositionsContainerFragment.class;
      }
    }
  }
  
  public static AdobeAssetViewBaseHostFragment getBaseHostFragmentFromClientBundle(Context paramContext, Bundle paramBundle, AdobeAssetMainBrowserConfiguration paramAdobeAssetMainBrowserConfiguration)
  {
    return getBaseHostFragmentFromClientBundle(paramContext, paramBundle, paramAdobeAssetMainBrowserConfiguration, null, true);
  }
  
  public static AdobeAssetViewBaseHostFragment getBaseHostFragmentFromClientBundle(Context paramContext, Bundle paramBundle, AdobeAssetMainBrowserConfiguration paramAdobeAssetMainBrowserConfiguration, String paramString, boolean paramBoolean)
  {
    paramAdobeAssetMainBrowserConfiguration = getDataSourcesListToDisplayFromBundle(paramBundle);
    if ((paramAdobeAssetMainBrowserConfiguration == null) || (paramAdobeAssetMainBrowserConfiguration.size() > 1))
    {
      paramContext = new AdobeAssetViewDataAssetsTabsHostFragment();
      paramContext.setArguments(paramBundle);
    }
    for (;;)
    {
      if (!paramBoolean) {
        paramContext.setShouldUseDropDownActionBar(false);
      }
      return paramContext;
      paramContext = getHostFragmentForDataSource(paramContext, getFirstDataSource(paramAdobeAssetMainBrowserConfiguration), paramBundle, paramString);
    }
  }
  
  private static Class getCCFilesContainerFragmentClass(Context paramContext)
  {
    if (AdobeAssetViewUtils.shouldEnableLokiSpecificFeatures(paramContext)) {
      return AdobeAssetViewCCFilesWithUploadContainerFragment.class;
    }
    return AdobeAssetViewNewCCFilesContainerFragment.class;
  }
  
  public static AdobeAssetMainBrowserConfiguration getConfigurationFromBundle(Bundle paramBundle)
  {
    if (paramBundle == null) {
      return new AdobeAssetMainBrowserConfiguration(null, true, null, true, AdobeCloudManager.getSharedCloudManager().getDefaultCloud());
    }
    EnumSet localEnumSet1 = (EnumSet)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_ARRAY_KEY);
    boolean bool1;
    EnumSet localEnumSet2;
    if ((AdobeAssetDataSourceFilterType)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_TYPE_KEY) != AdobeAssetDataSourceFilterType.ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION)
    {
      bool1 = true;
      localEnumSet2 = (EnumSet)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.MIME_TYPE_FILTER_ARRAY_KEY);
      if ((AdobeAssetMIMETypeFilterType)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.MIME_TYPE_FILTER_TYPE_KEY) == AdobeAssetMIMETypeFilterType.ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION) {
        break label109;
      }
    }
    label109:
    for (boolean bool2 = true;; bool2 = false)
    {
      return new AdobeAssetMainBrowserConfiguration(localEnumSet1, bool1, localEnumSet2, bool2, (AdobeCloud)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
      bool1 = false;
      break;
    }
  }
  
  public static DialogFragment getCreateNewFolderDialogFragment(AdobeAssetFolder paramAdobeAssetFolder)
  {
    return AdobeUploadCreateNewFolderMgr.getCreateNewFolderDialogFragment(paramAdobeAssetFolder);
  }
  
  static EnumSet<AdobeAssetDataSourceType> getDataSourcesListToDisplayFromBundle(Bundle paramBundle)
  {
    if (paramBundle == null) {
      paramBundle = getAllSupportedDataSourcesList();
    }
    int i;
    do
    {
      return paramBundle;
      localObject = (EnumSet)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_ARRAY_KEY);
      if ((AdobeAssetDataSourceFilterType)paramBundle.getSerializable(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_TYPE_KEY) != AdobeAssetDataSourceFilterType.ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION) {}
      for (i = 1; localObject == null; i = 0) {
        return getAllSupportedDataSourcesList();
      }
      paramBundle = (Bundle)localObject;
    } while (i != 0);
    paramBundle = getAllSupportedDataSourcesList();
    EnumSet localEnumSet = getAllSupportedDataSourcesList();
    Object localObject = ((EnumSet)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      AdobeAssetDataSourceType localAdobeAssetDataSourceType = (AdobeAssetDataSourceType)((Iterator)localObject).next();
      if (paramBundle.contains(localAdobeAssetDataSourceType)) {
        localEnumSet.remove(localAdobeAssetDataSourceType);
      }
    }
    return localEnumSet;
  }
  
  public static AdobeAssetMainBrowserExtraConfiguration getExtraConfigurationFromBundle(Bundle paramBundle)
  {
    if (paramBundle == null) {
      return new AdobeAssetMainBrowserExtraConfiguration(null, true);
    }
    return new AdobeAssetMainBrowserExtraConfiguration(paramBundle.getString(AdobeAssetMainBrowserExtraConfiguration.START_WITH_COLLECTION_HREF_KEY), paramBundle.getBoolean(AdobeAssetMainBrowserExtraConfiguration.SHOULD_USE_DROP_DOWN_KEY, true));
  }
  
  private static AdobeAssetDataSourceType getFirstDataSource(EnumSet<AdobeAssetDataSourceType> paramEnumSet)
  {
    paramEnumSet = paramEnumSet.iterator();
    if (paramEnumSet.hasNext()) {
      return (AdobeAssetDataSourceType)paramEnumSet.next();
    }
    return null;
  }
  
  public static AdobeAssetViewBaseHostFragment getHostFragmentForDataSource(Context paramContext, AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    return getHostFragmentForDataSource(paramContext, paramAdobeAssetDataSourceType, null, null);
  }
  
  public static AdobeAssetViewBaseHostFragment getHostFragmentForDataSource(Context paramContext, AdobeAssetDataSourceType paramAdobeAssetDataSourceType, Bundle paramBundle, String paramString)
  {
    paramAdobeAssetDataSourceType = getAssetViewFragmentDetails(paramContext, paramAdobeAssetDataSourceType, paramBundle, paramString);
    return (AdobeAssetViewBaseHostFragment)Fragment.instantiate(paramContext, classTag.getName(), argumentsBundle);
  }
  
  public static DialogFragment getHostFragmentForEditErrorSummary(Object paramObject)
  {
    AdobeEditErrorSummaryFragment localAdobeEditErrorSummaryFragment = new AdobeEditErrorSummaryFragment();
    localAdobeEditErrorSummaryFragment.setEditFailedList(_errorAssets);
    return localAdobeEditErrorSummaryFragment;
  }
  
  public static DialogFragment getHostFragmentForUploadErrorSummary(Object paramObject)
  {
    AdobeUploadErrorSummaryFragment localAdobeUploadErrorSummaryFragment = new AdobeUploadErrorSummaryFragment();
    localAdobeUploadErrorSummaryFragment.setUploadFailedList(_errorAssets);
    return localAdobeUploadErrorSummaryFragment;
  }
  
  public static boolean shouldShowComponent(AdobeAssetDataSourceType paramAdobeAssetDataSourceType, AdobeCloud paramAdobeCloud)
  {
    boolean bool = false;
    if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePhotos) {
      bool = AdobeEntitlementServices.getSharedServices().isEntitledToService("lightroom", paramAdobeCloud);
    }
    do
    {
      return bool;
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary) {
        return AdobeEntitlementServices.getSharedServices().isEntitledToService("libraries", paramAdobeCloud);
      }
    } while ((paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceFiles) && (paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceDraw) && (paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceLine) && (paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceSketches) && (paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix) && (paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions));
    return AdobeEntitlementServices.getSharedServices().isEntitledToService("cc_storage", paramAdobeCloud);
  }
  
  public static class AdobeAssetViewFragmentDetails
  {
    public Bundle argumentsBundle;
    public Class classTag;
    
    public AdobeAssetViewFragmentDetails() {}
  }
}
