package com.adobe.creativesdk.foundation.internal.storage.model.util;

import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestExecutor;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMimeTypes;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.EnumSet;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeStorageUtils
{
  private static AdobeNetworkHttpRequestExecutor _queue = null;
  private static SimpleDateFormat[] _sDateFormats;
  
  public AdobeStorageUtils() {}
  
  public static JSONObject JSONObjectWithData(String paramString)
  {
    if (paramString != null) {
      try
      {
        paramString = new JSONObject(paramString);
        return paramString;
      }
      catch (JSONException paramString)
      {
        paramString.printStackTrace();
      }
    }
    return null;
  }
  
  public static String cacheKeyForAsset(AdobeAsset paramAdobeAsset, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, int paramInt)
  {
    return String.format("%s-%d_%d-%d-%d", new Object[] { paramAdobeAsset.getGUID(), Integer.valueOf(paramAdobeAssetFileRenditionType.getIntVal()), Integer.valueOf((int)width), Integer.valueOf((int)height), Integer.valueOf(paramInt) });
  }
  
  public static Date convertStringToDate(String paramString)
  {
    Date localDate2;
    try
    {
      if (_sDateFormats == null)
      {
        _sDateFormats = new SimpleDateFormat[6];
        _sDateFormats[0] = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        _sDateFormats[1] = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        _sDateFormats[2] = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z");
        _sDateFormats[3] = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
        _sDateFormats[4] = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
        _sDateFormats[5] = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
      }
      if (paramString != null)
      {
        Date localDate1 = null;
        int i = 0;
        for (;;)
        {
          localDate2 = localDate1;
          if (i >= _sDateFormats.length) {
            break;
          }
          localDate2 = localDate1;
          if (localDate1 != null) {
            break;
          }
          localDate1 = convertToDate(_sDateFormats[i], paramString);
          i += 1;
        }
      }
      localDate2 = null;
    }
    finally {}
    return localDate2;
  }
  
  private static Date convertToDate(SimpleDateFormat paramSimpleDateFormat, String paramString)
  {
    Date localDate = null;
    if (paramSimpleDateFormat != null) {}
    try
    {
      localDate = paramSimpleDateFormat.parse(paramString);
      return localDate;
    }
    catch (ParseException paramSimpleDateFormat) {}
    return null;
  }
  
  public static String generateUuid()
  {
    return UUID.randomUUID().toString().toUpperCase();
  }
  
  public static AdobeAssetMimeTypes getMimeTypeFromString(String paramString)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    AdobeAssetMimeTypes[] arrayOfAdobeAssetMimeTypes;
    int j;
    int i;
    if (paramString != null)
    {
      arrayOfAdobeAssetMimeTypes = AdobeAssetMimeTypes.values();
      j = arrayOfAdobeAssetMimeTypes.length;
      i = 0;
    }
    for (;;)
    {
      localObject1 = localObject2;
      if (i < j)
      {
        localObject1 = arrayOfAdobeAssetMimeTypes[i];
        if (!paramString.equalsIgnoreCase(localObject1.getMimeType())) {}
      }
      else
      {
        return localObject1;
      }
      i += 1;
    }
  }
  
  public static boolean isMimeTypeFilterPresent(EnumSet<AdobeAssetMimeTypes> paramEnumSet, String paramString)
  {
    paramString = getMimeTypeFromString(paramString);
    if (paramString != null) {
      return paramEnumSet.contains(paramString);
    }
    return false;
  }
  
  public static boolean shouldFilterAssetMimeType(EnumSet<AdobeAssetMimeTypes> paramEnumSet, String paramString, boolean paramBoolean)
  {
    boolean bool1;
    if ((paramEnumSet == null) || (paramEnumSet.size() == 0)) {
      bool1 = false;
    }
    boolean bool2;
    do
    {
      return bool1;
      bool2 = isMimeTypeFilterPresent(paramEnumSet, paramString);
      bool1 = bool2;
    } while (!paramBoolean);
    return !bool2;
  }
}
