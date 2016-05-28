package com.adobe.creativesdk.foundation.internal.common;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout;

public class AdobeCommonLearnedSettings
{
  private static void CommitPreference(String paramString1, String paramString2)
  {
    SharedPreferences.Editor localEditor = getCommonLearnedPreference().edit();
    localEditor.putString(paramString1, paramString2);
    localEditor.commit();
  }
  
  private static SharedPreferences getCommonLearnedPreference()
  {
    return getContext().getSharedPreferences("CommonLearnedSettings", 0);
  }
  
  private static Context getContext()
  {
    return AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
  }
  
  public static String getFileProvideAuthority()
  {
    return getPreference("shareFileProvider", null);
  }
  
  private static String getPreference(String paramString1, String paramString2)
  {
    return getCommonLearnedPreference().getString(paramString1, paramString2);
  }
  
  public static AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType lastCollectionSortType()
  {
    return AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType.valueOf(getPreference("lastCollectionSortType", AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType.ADOBE_PHOTO_SORT_TYPE_TIME.toString()));
  }
  
  public static AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState lastSortState()
  {
    if (lastSortType() == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_TIME) {}
    for (String str = getPreference("lastSortState", AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState.SORT_STATE_DESCENDING.toString());; str = getPreference("lastSortState", AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState.SORT_STATE_ASCENDING.toString())) {
      return AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState.valueOf(str);
    }
  }
  
  public static AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType lastSortType()
  {
    return AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.valueOf(getPreference("lastSortType", AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_TIME.toString()));
  }
  
  public static boolean lastSortTypeSetByUser()
  {
    return getPreference("lastSortType", null) != null;
  }
  
  public static AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout lastVisualLayout()
  {
    return AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.valueOf(getPreference("VisualLayout", AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout.ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL.toString()));
  }
  
  public static boolean lastVisualSetByUser()
  {
    return getPreference("VisualLayout", null) != null;
  }
  
  public static void setLastSortState(AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState paramAdobeUXAssetBrowserSortState)
  {
    CommitPreference("lastSortState", paramAdobeUXAssetBrowserSortState.toString());
  }
  
  public static void setLastSortType(AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType paramAdobeUXAssetBrowserSortType)
  {
    CommitPreference("lastSortType", paramAdobeUXAssetBrowserSortType.toString());
  }
  
  public static void setLastVisualLayout(AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserVisualLayout paramAdobeUXAssetBrowserVisualLayout)
  {
    CommitPreference("VisualLayout", paramAdobeUXAssetBrowserVisualLayout.toString());
  }
}
