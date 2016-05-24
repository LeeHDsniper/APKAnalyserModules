package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.util.ArrayList;
import java.util.HashMap;

public class AdobeStorageAssetSelectionState
{
  static int _selectionStateTimeStamp = 1;
  static boolean isMultiSelectModeActive = false;
  static boolean isMultiSelectModeSupported = false;
  static HashMap<String, AdobeAsset> sharedSelectedAssetsCollection = null;
  
  public static void addSelectedAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    if (paramAdobeAssetFile == null) {
      return;
    }
    setSelectionStateChanged();
    sharedSelectedAssets().put(paramAdobeAssetFile.getGUID(), paramAdobeAssetFile);
    paramAdobeAssetFile = new AdobeNotification(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, null);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAdobeAssetFile);
  }
  
  public static boolean containsAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    return sharedSelectedAssets().containsKey(paramAdobeAssetFile.getGUID());
  }
  
  public static int getCurrentSelectionTimeStamp()
  {
    return _selectionStateTimeStamp;
  }
  
  public static boolean isMultiSelectModeActive()
  {
    return isMultiSelectModeActive;
  }
  
  public static boolean isMultiSelectModeSupported()
  {
    return isMultiSelectModeSupported;
  }
  
  public static void removeSelectedAsset(AdobeAssetFile paramAdobeAssetFile)
  {
    if (paramAdobeAssetFile == null) {
      return;
    }
    setSelectionStateChanged();
    sharedSelectedAssets().remove(paramAdobeAssetFile.getGUID());
    paramAdobeAssetFile = new AdobeNotification(AdobeInternalNotificationID.AdobeStorageSelectedAssetAssetCountChangeNotification, null);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAdobeAssetFile);
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
  
  public static ArrayList<AdobeAsset> selectedAssets()
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
  
  public static void setIsMultiSelectModeSupported(boolean paramBoolean)
  {
    if (isMultiSelectModeSupported == paramBoolean) {
      return;
    }
    if ((isMultiSelectModeSupported) && (!paramBoolean)) {
      resetSelectedAssets();
    }
    isMultiSelectModeSupported = paramBoolean;
  }
  
  private static void setSelectionStateChanged()
  {
    _selectionStateTimeStamp += 1;
  }
  
  public static HashMap<String, AdobeAsset> sharedSelectedAssets()
  {
    if (sharedSelectedAssetsCollection == null) {
      sharedSelectedAssetsCollection = new HashMap();
    }
    return sharedSelectedAssetsCollection;
  }
}
