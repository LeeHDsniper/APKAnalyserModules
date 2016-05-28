package com.adobe.creativesdk.foundation.storage;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetMobileCreationSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageLibrarySelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetMainBrowserConfiguration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewBrowserSelectFilesHelper;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUxAssetBrowserV2Activity;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeCSDKInternalClientsPreferences;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileInfo;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;

public class AdobeUXAssetBrowser
{
  protected static EnumSet<AdobeAssetMimeTypes> AdobeUXAssetBrowserFilterWithAdobeContent = EnumSet.of(AdobeAssetMimeTypes.MIMETYPE_ILLUSTRATOR);
  protected static EnumSet<AdobeAssetMimeTypes> AdobeUXAssetBrowserFilterWithBasicImages = EnumSet.of(AdobeAssetMimeTypes.MIMETYPE_TIFF, AdobeAssetMimeTypes.MIMETYPE_JPEG, AdobeAssetMimeTypes.MIMETYPE_GIF, AdobeAssetMimeTypes.MIMETYPE_PNG, AdobeAssetMimeTypes.MIMETYPE_BMP);
  private static volatile AdobeUXAssetBrowser sharedBrowser = null;
  
  private AdobeUXAssetBrowser() {}
  
  public static AdobeUXAssetBrowser getSharedInstance()
  {
    if (sharedBrowser == null) {}
    try
    {
      if (sharedBrowser == null) {
        sharedBrowser = new AdobeUXAssetBrowser();
      }
      return sharedBrowser;
    }
    finally {}
  }
  
  private void setBrowserConfigurationDetails(Intent paramIntent, AdobeUXAssetBrowserConfiguration paramAdobeUXAssetBrowserConfiguration)
    throws AdobeNetworkException
  {
    if (paramAdobeUXAssetBrowserConfiguration == null) {
      return;
    }
    if (mimeTypeFilter != null)
    {
      paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.MIME_TYPE_FILTER_ARRAY_KEY, mimeTypeFilter.getMimeTypes());
      paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.MIME_TYPE_FILTER_TYPE_KEY, mimeTypeFilter.getFilterType());
    }
    if (dataSourceFilter != null)
    {
      paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_ARRAY_KEY, dataSourceFilter.getInclusiveDataSources());
      paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.DATA_SOURCE_FILTER_TYPE_KEY, AdobeAssetDataSourceFilterType.ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION);
    }
    if (designLibraryItemFilter != null)
    {
      paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY, designLibraryItemFilter.getInclusiveDesignLibraryItems());
      paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.DESIGNLIBRARYITEMS_FILTER_TYPE_KEY, AdobeAssetDesignLibraryItemFilterType.ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION);
    }
    if (cloud == null)
    {
      paramAdobeUXAssetBrowserConfiguration = AdobeCloudManager.getSharedCloudManager().getDefaultCloud();
      if (paramAdobeUXAssetBrowserConfiguration != null)
      {
        paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, paramAdobeUXAssetBrowserConfiguration);
        return;
      }
      throw new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
    }
    paramIntent.putExtra(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, cloud);
  }
  
  public void popupFileBrowser(final Activity paramActivity, final int paramInt, final AdobeUXAssetBrowserConfiguration paramAdobeUXAssetBrowserConfiguration)
    throws AdobeCSDKException
  {
    Object localObject1;
    Object localObject2;
    boolean bool1;
    label129:
    label153:
    boolean bool2;
    if (paramAdobeUXAssetBrowserConfiguration != null)
    {
      localObject1 = options;
      AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(paramActivity.getApplicationContext());
      Object localObject3;
      if (!AdobeCommonLearnedSettings.lastSortTypeSetByUser())
      {
        localObject3 = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_TIME;
        localObject2 = localObject3;
        if (localObject1 != null)
        {
          localObject2 = localObject3;
          if (((EnumSet)localObject1).contains(AdobeUXAssetBrowserOption.SORT_ALPHABETICALLY_ON_POPUP)) {
            localObject2 = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA;
          }
        }
        AdobeCommonLearnedSettings.setLastSortType((AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType)localObject2);
      }
      if (!AdobeCommonLearnedSettings.lastVisualSetByUser())
      {
        localObject3 = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL;
        localObject2 = localObject3;
        if (localObject1 != null)
        {
          localObject2 = localObject3;
          if (((EnumSet)localObject1).contains(AdobeUXAssetBrowserOption.SHOW_LIST_VIEW_ON_POPUP)) {
            localObject2 = AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW;
          }
        }
        AdobeCommonLearnedSettings.setLastVisualLayout((AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout)localObject2);
      }
      if ((localObject1 == null) || (!((EnumSet)localObject1).contains(AdobeUXAssetBrowserOption.ENABLE_MYACCOUNT_OPTION))) {
        break label312;
      }
      bool1 = true;
      AdobeCSDKInternalClientsPreferences.setClientPreferenceEnableMyAccount(bool1);
      if ((localObject1 == null) || (!((EnumSet)localObject1).contains(AdobeUXAssetBrowserOption.ENABLE_MULTI_SELECT))) {
        break label318;
      }
      bool1 = true;
      if ((localObject1 == null) || (!((EnumSet)localObject1).contains(AdobeUXAssetBrowserOption.SHOW_MULTI_SELECT_ON_POPUP))) {
        break label324;
      }
      bool2 = true;
      label172:
      AdobeStorageAssetSelectionState.setIsMultiSelectModeSupported(bool1);
      if (!AdobeStorageAssetSelectionState.isMultiSelectModeSupported()) {
        break label330;
      }
      AdobeStorageAssetSelectionState.setIsMultiSelectModeActive(bool2);
      label188:
      if ((localObject1 == null) || (!((EnumSet)localObject1).contains(AdobeUXAssetBrowserOption.ENABLE_MULTI_SELECT))) {
        break label337;
      }
      AdobeStoragePhotoAssetSelectionState.setIsMultiSelectModeActive(true);
    }
    for (;;)
    {
      localObject1 = null;
      try
      {
        localObject2 = new Handler();
        localObject1 = localObject2;
        AdobeStorageLibrarySelectionState.resetSelection();
      }
      catch (RuntimeException localRuntimeException)
      {
        for (;;)
        {
          localRuntimeException.printStackTrace();
        }
        localObject1 = new Intent(paramActivity, AdobeUxAssetBrowserV2Activity.class);
        setBrowserConfigurationDetails((Intent)localObject1, paramAdobeUXAssetBrowserConfiguration);
        paramActivity.startActivityForResult((Intent)localObject1, paramInt);
      }
      AdobeStorageLibrarySelectionState.setSelectModeActive(true);
      if ((paramAdobeUXAssetBrowserConfiguration != null) && ((cloud != null) || (!AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().isAdobeApplication()))) {
        break label354;
      }
      localObject2 = new Object()
      {
        AdobeCSDKException _error = null;
      };
      AdobeCloudManager.getSharedCloudManager().refreshClouds(new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion(ArrayList<AdobeCloud> paramAnonymousArrayList)
        {
          paramAnonymousArrayList = new Intent(paramActivity, AdobeUxAssetBrowserV2Activity.class);
          try
          {
            AdobeUXAssetBrowser.this.setBrowserConfigurationDetails(paramAnonymousArrayList, paramAdobeUXAssetBrowserConfiguration);
            paramActivity.startActivityForResult(paramAnonymousArrayList, paramInt);
            return;
          }
          catch (AdobeNetworkException localAdobeNetworkException)
          {
            for (;;)
            {
              val$op._error = localAdobeNetworkException;
            }
          }
        }
      }, new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
        {
          val$op._error = paramAnonymousAdobeCSDKException;
        }
      }, (Handler)localObject1);
      if (_error == null) {
        return;
      }
      throw _error;
      localObject1 = null;
      break;
      label312:
      bool1 = false;
      break label129;
      label318:
      bool1 = false;
      break label153;
      label324:
      bool2 = false;
      break label172;
      label330:
      AdobeStorageAssetSelectionState.setIsMultiSelectModeActive(false);
      break label188;
      label337:
      AdobeStoragePhotoAssetSelectionState.setIsMultiSelectModeActive(false);
    }
    label354:
  }
  
  public static class ResultProvider
  {
    private final Intent _intent;
    
    public ResultProvider(Intent paramIntent)
    {
      _intent = paramIntent;
    }
    
    public ArrayList<AdobeSelection> getSelectionAssetArray()
    {
      ArrayList localArrayList = null;
      Object localObject1 = null;
      if (_intent != null) {}
      for (Object localObject5 = _intent.getExtras();; localObject5 = null)
      {
        if (localObject5 != null) {
          localObject1 = localArrayList;
        }
        try
        {
          localObject4 = (ArrayList)((Bundle)localObject5).getSerializable(AdobeAssetViewBrowserSelectFilesHelper.ASSETBROWSER_ASSETS_SELECTION_LIST);
          if (localObject4 == null) {
            break;
          }
          localObject1 = localArrayList;
          if (((ArrayList)localObject4).size() <= 0) {
            break;
          }
          localObject1 = localArrayList;
          localArrayList = new ArrayList();
          localObject1 = localArrayList;
          try
          {
            localObject6 = ((ArrayList)localObject4).iterator();
            for (;;)
            {
              localObject1 = localArrayList;
              localObject4 = localArrayList;
              if (!((Iterator)localObject6).hasNext()) {
                break;
              }
              localObject1 = localArrayList;
              localArrayList.add(new AdobeSelectionAssetFile(AdobeAssetFile.AdobeAssetFileFromInfo((AdobeStorageAssetFileInfo)((Iterator)localObject6).next())));
            }
            localClassCastException1.printStackTrace();
          }
          catch (ClassCastException localClassCastException1) {}
        }
        catch (ClassCastException localClassCastException2)
        {
          Object localObject2;
          for (;;) {}
          localObject1 = localClassCastException2;
          Object localObject6 = ((Bundle)localObject5).getString(AdobeAssetViewBrowserSelectFilesHelper.ASSETBROWSER_LIBRARY_SELECTION_LIST, null);
          localObject4 = localClassCastException2;
          if (localObject6 == null) {
            break label293;
          }
          localObject1 = localClassCastException2;
          localObject4 = localClassCastException2;
          if (!AdobeStorageLibrarySelectionState.isLibraryItemSame((String)localObject6)) {
            break label293;
          }
          localObject1 = localClassCastException2;
          localObject4 = AdobeStorageLibrarySelectionState.creationSelectionLibraryFromCurrentSelection();
          if (localClassCastException2 != null) {
            break label362;
          }
          localObject1 = localClassCastException2;
          localObject3 = new ArrayList();
          localObject1 = localObject3;
          ((ArrayList)localObject3).add(localObject4);
          localObject4 = localObject3;
          localObject1 = localObject3;
          AdobeStorageLibrarySelectionState.resetSelection();
          localObject1 = localObject4;
          localObject3 = ((Bundle)localObject5).getString(AdobeAssetViewBrowserSelectFilesHelper.ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM, null);
          if (localObject3 == null) {
            break label360;
          }
          localObject1 = localObject4;
          if (!AdobeAssetMobileCreationSelectionState.isPackageItemSame((String)localObject3)) {
            break label360;
          }
          localObject1 = localObject4;
          localObject5 = AdobeAssetMobileCreationSelectionState.creationSelectionPackageFromCurrentSelection();
          if (localObject4 != null) {
            break label355;
          }
          localObject1 = localObject4;
          for (localObject3 = new ArrayList();; localObject3 = localObject4)
          {
            localObject1 = localObject3;
            ((ArrayList)localObject3).add(localObject5);
            localObject1 = localObject3;
            AdobeAssetMobileCreationSelectionState.resetSelection();
            return localObject3;
          }
          return localObject4;
        }
        return localObject1;
      }
      Object localObject4 = null;
      localObject1 = localObject4;
      localObject6 = (ArrayList)((Bundle)localObject5).getSerializable(AdobeAssetViewBrowserSelectFilesHelper.ASSETBROWSER_PHOTOS_SELECTION_LIST);
      localObject2 = localObject4;
      if (localObject6 != null)
      {
        localObject1 = localObject4;
        localObject2 = localObject4;
        if (((ArrayList)localObject6).size() > 0)
        {
          if (localObject4 != null) {
            break label365;
          }
          localObject1 = localObject4;
        }
      }
      Object localObject3;
      label293:
      label355:
      label360:
      label362:
      label365:
      for (localObject2 = new ArrayList();; localObject3 = localObject4)
      {
        localObject1 = localObject2;
        localObject4 = ((ArrayList)localObject6).iterator();
        for (;;)
        {
          localObject1 = localObject2;
          if (!((Iterator)localObject4).hasNext()) {
            break;
          }
          localObject1 = localObject2;
          ((ArrayList)localObject2).add(new AdobeSelectionPhotoAsset((AdobePhotoAsset)((Iterator)localObject4).next()));
        }
        for (;;) {}
      }
    }
  }
}
