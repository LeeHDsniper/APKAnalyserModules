package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import java.util.ArrayList;
import java.util.HashMap;

public class AdobeStoragePhotoAssetSelectionState
{
  static int _selectionStateTimeStamp = -1;
  static boolean isMultiSelectModeActive = false;
  static boolean isMultiSelectModeSupported = false;
  static HashMap<String, AdobePhotoAsset> sharedSelectedAssetsCollection = null;
  
  public static void addSelectedAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    if (paramAdobePhotoAsset == null) {
      return;
    }
    setSelectionStateChanged();
    sharedSelectedAssets().put(paramAdobePhotoAsset.getGUID(), paramAdobePhotoAsset);
    paramAdobePhotoAsset = new AdobeNotification(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, null);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAdobePhotoAsset);
  }
  
  public static boolean containsAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    return sharedSelectedAssets().containsKey(paramAdobePhotoAsset.getGUID());
  }
  
  public static int getCurrentSelectionTimeStamp()
  {
    return _selectionStateTimeStamp;
  }
  
  public static boolean isMultiSelectModeActive()
  {
    return isMultiSelectModeActive;
  }
  
  public static void removeSelectedAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    if (paramAdobePhotoAsset == null) {
      return;
    }
    setSelectionStateChanged();
    sharedSelectedAssets().remove(paramAdobePhotoAsset.getGUID());
    paramAdobePhotoAsset = new AdobeNotification(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, null);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAdobePhotoAsset);
  }
  
  public static void resetSelectedAssets()
  {
    sharedSelectedAssetsCollection = new HashMap();
    setSelectionStateChanged();
    AdobeNotification localAdobeNotification = new AdobeNotification(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, null);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(localAdobeNotification);
  }
  
  public static int selectedAssetCount()
  {
    return sharedSelectedAssets().size();
  }
  
  public static ArrayList<AdobePhotoAsset> selectedAssets()
  {
    return new ArrayList(sharedSelectedAssets().values());
  }
  
  public static void setIsMultiSelectModeActive(boolean paramBoolean)
  {
    if (isMultiSelectModeActive == paramBoolean) {
      return;
    }
    if ((isMultiSelectModeActive) && (!paramBoolean)) {
      resetSelectedAssets();
    }
    isMultiSelectModeActive = paramBoolean;
    AdobeNotification localAdobeNotification = new AdobeNotification(AdobeInternalNotificationID.AdobeStorageSelectedAssetMultiselectModeDidChangeNotification, null);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(localAdobeNotification);
  }
  
  private static void setSelectionStateChanged()
  {
    _selectionStateTimeStamp += 1;
  }
  
  public static HashMap<String, AdobePhotoAsset> sharedSelectedAssets()
  {
    if (sharedSelectedAssetsCollection == null) {
      sharedSelectedAssetsCollection = new HashMap();
    }
    return sharedSelectedAssetsCollection;
  }
}
