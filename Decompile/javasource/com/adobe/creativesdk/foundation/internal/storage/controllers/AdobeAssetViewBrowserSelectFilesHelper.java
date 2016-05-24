package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetMobileCreationSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageLibrarySelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileInfo;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;

public class AdobeAssetViewBrowserSelectFilesHelper
{
  public static String ASSETBROWSER_ASSETS_SELECTION_LIST = "ADOBE_ASSETBROWSER_ASSETFILE_SELECTION_LIST";
  public static String ASSETBROWSER_LIBRARY_SELECTION_LIST = "ADOBE_ASSETBROWSER_LIBRARY_SELECTION_LIST";
  public static String ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM = "ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM";
  public static String ASSETBROWSER_PHOTOS_SELECTION_LIST = "ADOBE_ASSETBROWSER_PHOTOASSET_SELECTION_LIST";
  
  public static Intent getCurrentSelectedFilesAsIntentResultData()
  {
    Object localObject2 = AdobeStorageAssetSelectionState.selectedAssets();
    Object localObject1 = new ArrayList();
    if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
    {
      localObject2 = ((ArrayList)localObject2).iterator();
      while (((Iterator)localObject2).hasNext()) {
        ((ArrayList)localObject1).add(new AdobeStorageAssetFileInfo((AdobeAssetFile)((Iterator)localObject2).next()));
      }
    }
    AdobeStorageAssetSelectionState.resetSelectedAssets();
    AdobeStoragePhotoAssetSelectionState.resetSelectedAssets();
    localObject2 = new Intent();
    ((Intent)localObject2).putExtra(ASSETBROWSER_ASSETS_SELECTION_LIST, (Serializable)localObject1);
    if (AdobeStorageLibrarySelectionState.hasSelection())
    {
      localObject1 = AdobeStorageLibrarySelectionState.getSelectedLibraryItem();
      ((Intent)localObject2).putExtra(ASSETBROWSER_LIBRARY_SELECTION_LIST, ((AdobeAssetLibraryItem)localObject1).getItemID());
    }
    if (AdobeAssetMobileCreationSelectionState.hasSelection())
    {
      localObject1 = AdobeAssetMobileCreationSelectionState.getSelectedPackageItem();
      ((Intent)localObject2).putExtra(ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM, ((AdobeAssetFile)localObject1).getGUID());
    }
    return localObject2;
  }
  
  public static Intent getCurrentSelectedPhotosAsIntentResultData()
  {
    AdobeStorageAssetSelectionState.resetSelectedAssets();
    Intent localIntent = new Intent();
    ArrayList localArrayList = AdobeStoragePhotoAssetSelectionState.selectedAssets();
    AdobeStoragePhotoAssetSelectionState.resetSelectedAssets();
    AdobeStorageAssetSelectionState.resetSelectedAssets();
    localIntent.putExtra(ASSETBROWSER_PHOTOS_SELECTION_LIST, localArrayList);
    return localIntent;
  }
}
