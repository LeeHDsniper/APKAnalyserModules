package com.nostra13.universalimageloader.core.decode;

import android.annotation.TargetApi;
import android.graphics.BitmapFactory.Options;
import android.os.Build.VERSION;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader;

public class ImageDecodingInfo
{
  private final boolean considerExifParams;
  private final BitmapFactory.Options decodingOptions;
  private final ImageDownloader downloader;
  private final Object extraForDownloader;
  private final String imageKey;
  private final ImageScaleType imageScaleType;
  private final String imageUri;
  private final String originalImageUri;
  private final ImageSize targetSize;
  private final ViewScaleType viewScaleType;
  
  public ImageDecodingInfo(String paramString1, String paramString2, String paramString3, ImageSize paramImageSize, ViewScaleType paramViewScaleType, ImageDownloader paramImageDownloader, DisplayImageOptions paramDisplayImageOptions)
  {
    imageKey = paramString1;
    imageUri = paramString2;
    originalImageUri = paramString3;
    targetSize = paramImageSize;
    imageScaleType = paramDisplayImageOptions.getImageScaleType();
    viewScaleType = paramViewScaleType;
    downloader = paramImageDownloader;
    extraForDownloader = paramDisplayImageOptions.getExtraForDownloader();
    considerExifParams = paramDisplayImageOptions.isConsiderExifParams();
    decodingOptions = new BitmapFactory.Options();
    copyOptions(paramDisplayImageOptions.getDecodingOptions(), decodingOptions);
  }
  
  private void copyOptions(BitmapFactory.Options paramOptions1, BitmapFactory.Options paramOptions2)
  {
    inDensity = inDensity;
    inDither = inDither;
    inInputShareable = inInputShareable;
    inJustDecodeBounds = inJustDecodeBounds;
    inPreferredConfig = inPreferredConfig;
    inPurgeable = inPurgeable;
    inSampleSize = inSampleSize;
    inScaled = inScaled;
    inScreenDensity = inScreenDensity;
    inTargetDensity = inTargetDensity;
    inTempStorage = inTempStorage;
    if (Build.VERSION.SDK_INT >= 10) {
      copyOptions10(paramOptions1, paramOptions2);
    }
    if (Build.VERSION.SDK_INT >= 11) {
      copyOptions11(paramOptions1, paramOptions2);
    }
  }
  
  @TargetApi(10)
  private void copyOptions10(BitmapFactory.Options paramOptions1, BitmapFactory.Options paramOptions2)
  {
    inPreferQualityOverSpeed = inPreferQualityOverSpeed;
  }
  
  @TargetApi(11)
  private void copyOptions11(BitmapFactory.Options paramOptions1, BitmapFactory.Options paramOptions2)
  {
    inBitmap = inBitmap;
    inMutable = inMutable;
  }
  
  public BitmapFactory.Options getDecodingOptions()
  {
    return decodingOptions;
  }
  
  public ImageDownloader getDownloader()
  {
    return downloader;
  }
  
  public Object getExtraForDownloader()
  {
    return extraForDownloader;
  }
  
  public String getImageKey()
  {
    return imageKey;
  }
  
  public ImageScaleType getImageScaleType()
  {
    return imageScaleType;
  }
  
  public String getImageUri()
  {
    return imageUri;
  }
  
  public ImageSize getTargetSize()
  {
    return targetSize;
  }
  
  public ViewScaleType getViewScaleType()
  {
    return viewScaleType;
  }
  
  public boolean shouldConsiderExifParams()
  {
    return considerExifParams;
  }
}
