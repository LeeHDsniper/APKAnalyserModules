package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypeFace;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypefaceSpan;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderBy;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderDirection;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.net.URI;
import java.net.URISyntaxException;

public class AdobeAssetViewUtils
{
  public static String ASSETVIEW_NAVIGATE_ISROOT_KEY = "isCollectionRoot";
  public static String ASSETVIEW_NAVIGATE_TARGETCOLLECTION_NAME = "targetCollectionName";
  public static int ASSET_ONE_UP_ACTIVITY_REQUEST;
  public static int LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST;
  public static int MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST;
  public static int PHOTO_ONE_UP_ACTIVITY_REQUEST;
  public static String TARGET_COLLECTION_KEY;
  private static String _appIdFromPreference = null;
  private static int _cameraCheckedResult = -1;
  private static int k_ONE_DP_TO_PIXELS = 0;
  
  static
  {
    ASSET_ONE_UP_ACTIVITY_REQUEST = 2134;
    PHOTO_ONE_UP_ACTIVITY_REQUEST = 2135;
    LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST = 2136;
    MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST = 2137;
    TARGET_COLLECTION_KEY = "TARGET_COLLECTION";
  }
  
  public static int convertDpToPx(int paramInt)
  {
    return (int)(paramInt * getSystemgetDisplayMetricsdensity);
  }
  
  public static boolean deviceHasCameraFeature(Context paramContext)
  {
    int j;
    if (_cameraCheckedResult == -1) {
      j = 1;
    }
    try
    {
      boolean bool = paramContext.getPackageManager().hasSystemFeature("android.hardware.camera.any");
      j = bool;
    }
    catch (Exception paramContext)
    {
      int i;
      for (;;) {}
    }
    if (j != 0) {}
    for (i = 1;; i = 2)
    {
      _cameraCheckedResult = i;
      if (_cameraCheckedResult != 1) {
        break;
      }
      return true;
    }
    return false;
  }
  
  public static SpannableString getAdobeFontFormattedString(String paramString, Activity paramActivity)
  {
    paramString = new SpannableString(paramString);
    paramString.setSpan(new AdobeCSDKTypefaceSpan(null, AdobeCSDKTypeFace.getTypeface(paramActivity)), 0, paramString.length(), 33);
    paramString.setSpan(new ForegroundColorSpan(paramActivity.getResources().getColor(R.color.asset_browser_dark_text)), 0, paramString.length(), 33);
    return paramString;
  }
  
  public static AdobeAssetFolder getAssetFolderFromHref(String paramString, boolean paramBoolean)
  {
    Object localObject2 = null;
    AdobeAssetFolderOrderBy localAdobeAssetFolderOrderBy = getLastOrderField();
    AdobeAssetFolderOrderDirection localAdobeAssetFolderOrderDirection = getLastOrderDirection();
    Object localObject1 = localObject2;
    if (paramString != null) {}
    for (;;)
    {
      try
      {
        paramString = new URI(paramString);
        paramString.printStackTrace();
      }
      catch (URISyntaxException paramString)
      {
        try
        {
          localObject1 = AdobeAssetFolder.getFolderFromDirectHref(paramString, localAdobeAssetFolderOrderBy, localAdobeAssetFolderOrderDirection);
          paramString = (String)localObject1;
          if (localObject1 == null)
          {
            paramString = (String)localObject1;
            if (paramBoolean) {
              paramString = AdobeAssetFolder.getRootOrderedByField(localAdobeAssetFolderOrderBy, localAdobeAssetFolderOrderDirection);
            }
          }
          return paramString;
        }
        catch (URISyntaxException paramString)
        {
          for (;;) {}
        }
        paramString = paramString;
      }
      localObject1 = localObject2;
    }
  }
  
  public static void getAssetRenditionUtil(AdobeAssetFile paramAdobeAssetFile, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, IAdobeGenericCompletionCallback<Bitmap> paramIAdobeGenericCompletionCallback)
  {
    paramAdobeAssetFile.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, AdobeAssetsViewBaseAbsListViewController.adjustRenditionSizeBasedOnDeviceScale(paramAdobeAssetImageDimensions), new IAdobeGenericRequestCallback()
    {
      public void onCancellation() {}
      
      public void onCompletion(byte[] paramAnonymousArrayOfByte)
      {
        AdobeAssetViewUtils.getBitmapFromData(paramAnonymousArrayOfByte, val$onCompleteCallBack);
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        val$onCompleteCallBack.onCompletion(null);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    });
  }
  
  public static void getBitmapFromData(byte[] paramArrayOfByte, IAdobeGenericCompletionCallback<Bitmap> paramIAdobeGenericCompletionCallback)
  {
    new AsyncTask()
    {
      protected Bitmap doInBackground(byte[]... paramAnonymousVarArgs)
      {
        paramAnonymousVarArgs = paramAnonymousVarArgs[0];
        if (paramAnonymousVarArgs != null) {
          return BitmapFactory.decodeByteArray(paramAnonymousVarArgs, 0, paramAnonymousVarArgs.length);
        }
        return null;
      }
      
      protected void onPostExecute(Bitmap paramAnonymousBitmap)
      {
        val$onCompleteCallBack.onCompletion(paramAnonymousBitmap);
      }
    }.execute(new byte[][] { paramArrayOfByte });
  }
  
  public static AdobeAssetFolderOrderDirection getLastOrderDirection()
  {
    if (AdobeCommonLearnedSettings.lastSortState() == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState.SORT_STATE_ASCENDING) {
      return AdobeAssetFolderOrderDirection.ADOBE_ASSET_FOLDER_ORDER_ASCENDING;
    }
    return AdobeAssetFolderOrderDirection.ADOBE_ASSET_FOLDER_ORDER_DESCENDING;
  }
  
  public static AdobeAssetFolderOrderBy getLastOrderField()
  {
    if (AdobeCommonLearnedSettings.lastSortType() == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA) {
      return AdobeAssetFolderOrderBy.ADOBE_ASSET_FOLDER_ORDER_BY_NAME;
    }
    return AdobeAssetFolderOrderBy.ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED;
  }
  
  public static boolean shouldEnableLokiSpecificFeatures(Context paramContext)
  {
    if (paramContext == null) {}
    do
    {
      return false;
      if (_appIdFromPreference == null) {}
      try
      {
        paramContext = paramContext.getSharedPreferences("com.adobe.ccsdk.ccAssetsContainer_private_preference", 0);
        if (paramContext != null) {
          _appIdFromPreference = paramContext.getString("ccfilescontainer_private_appId", null);
        }
      }
      catch (Exception paramContext)
      {
        for (;;) {}
      }
    } while ((_appIdFromPreference == null) || (!_appIdFromPreference.equalsIgnoreCase("com.adobe.cc.android.loki")));
    return true;
  }
}
