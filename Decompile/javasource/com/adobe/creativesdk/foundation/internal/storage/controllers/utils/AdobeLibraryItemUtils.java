package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemCharacterStyle;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemLayoutStyle;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCache;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheOptions;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewUtils;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewBaseAbsListViewController;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemBrush;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemImage;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemLook;
import java.net.URI;
import java.util.EnumSet;

public class AdobeLibraryItemUtils
{
  public static void getImageRendition(AdobeAssetFile paramAdobeAssetFile, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, IAdobeGenericCompletionCallback paramIAdobeGenericCompletionCallback)
  {
    paramAdobeAssetFileRenditionType = Cache.getRenditionFromCacheWithType(paramAdobeAssetFile, paramAdobeAssetFileRenditionType, AdobeAssetsViewBaseAbsListViewController.adjustRenditionSizeBasedOnDeviceScale(paramAdobeAssetImageDimensions));
    if (paramAdobeAssetFileRenditionType != null)
    {
      AdobeAssetViewUtils.getBitmapFromData(paramAdobeAssetFileRenditionType, paramIAdobeGenericCompletionCallback);
      return;
    }
    AdobeAssetViewUtils.getAssetRenditionUtil(paramAdobeAssetFile, paramAdobeAssetImageDimensions, paramIAdobeGenericCompletionCallback);
  }
  
  public static AdobeAssetFile getRenditionFile(AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
  {
    if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemImage)) {
      return getRenditionFileForImageLibraryItem((AdobeAssetLibraryItemImage)paramAdobeAssetLibraryItem);
    }
    if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemBrush)) {
      return ((AdobeAssetLibraryItemBrush)paramAdobeAssetLibraryItem).getRendition();
    }
    if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemCharacterStyle)) {
      return ((AdobeAssetLibraryItemCharacterStyle)paramAdobeAssetLibraryItem).getRendition();
    }
    if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemLayoutStyle)) {
      return ((AdobeAssetLibraryItemLayoutStyle)paramAdobeAssetLibraryItem).getRendition();
    }
    if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemLook)) {
      return ((AdobeAssetLibraryItemLook)paramAdobeAssetLibraryItem).getRendition();
    }
    return null;
  }
  
  private static AdobeAssetFile getRenditionFileForImageLibraryItem(AdobeAssetLibraryItemImage paramAdobeAssetLibraryItemImage)
  {
    if (paramAdobeAssetLibraryItemImage.getPrimaryComponentType().equals("image/vnd.adobe.shape+svg")) {
      return paramAdobeAssetLibraryItemImage.getRendition();
    }
    return paramAdobeAssetLibraryItemImage.getImage();
  }
  
  public static class Cache
  {
    private static String cacheGUID(AdobeAssetFile paramAdobeAssetFile)
    {
      String str2 = paramAdobeAssetFile.getGUID();
      String str1 = str2;
      if (str2 == null)
      {
        paramAdobeAssetFile = paramAdobeAssetFile.getHref().getPath().split("/");
        str1 = paramAdobeAssetFile[(paramAdobeAssetFile.length - 1)];
      }
      return str1;
    }
    
    private static String cacheKey(AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, int paramInt)
    {
      return String.format("%d_%d-%d-%d", new Object[] { Integer.valueOf(paramAdobeAssetFileRenditionType.getIntVal()), Integer.valueOf((int)width), Integer.valueOf((int)height), Integer.valueOf(paramInt) });
    }
    
    public static byte[] getRenditionFromCacheWithType(AdobeAssetFile paramAdobeAssetFile, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions)
    {
      return getRenditionFromCacheWithType(paramAdobeAssetFile, paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, 0);
    }
    
    public static byte[] getRenditionFromCacheWithType(AdobeAssetFile paramAdobeAssetFile, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, int paramInt)
    {
      paramAdobeAssetFileRenditionType = cacheKey(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, 0);
      return (byte[])AdobeCommonCache.getSharedInstance().getDataFromGUID(cacheGUID(paramAdobeAssetFile), paramAdobeAssetFileRenditionType, EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache), "com.adobe.cc.storage");
    }
  }
}
