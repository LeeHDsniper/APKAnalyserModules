package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.DisplayMetrics;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.util.HashMap;

public abstract class AdobeAssetsViewBaseAbsListViewController
  extends AdobeAssetsViewBaseListViewController
  implements IAdobeAssetViewListCellDelegate
{
  private final HashMap<String, AdobeAssetsViewCellAssetData> _requestedThumbnails;
  
  public static AdobeAssetImageDimensions adjustRenditionSizeBasedOnDeviceScale(AdobeAssetImageDimensions paramAdobeAssetImageDimensions)
  {
    return new AdobeAssetImageDimensions((float)getAdjustedDimension(width), (float)getAdjustedDimension(height));
  }
  
  public static double getAdjustedDimension(float paramFloat)
  {
    DisplayMetrics localDisplayMetrics = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getResources().getDisplayMetrics();
    double d = paramFloat;
    if (densityDpi >= 320) {
      d = 2.0F * paramFloat;
    }
    while (densityDpi <= 160) {
      return d;
    }
    return paramFloat * 1.5D;
  }
  
  static abstract interface IThumbnailLoadCompletionHandler
  {
    public abstract void onComplete(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, Bitmap paramBitmap, boolean paramBoolean);
  }
}
