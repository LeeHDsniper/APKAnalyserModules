package com.adobe.creativesdk.foundation.internal.storage.model.util;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXErrorCode;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import java.net.URL;
import java.util.HashMap;

public class AdobeStorageErrorUtils
{
  public static AdobeDCXException createDCXError(AdobeDCXErrorCode paramAdobeDCXErrorCode, String paramString)
  {
    return new AdobeDCXException(paramAdobeDCXErrorCode, paramString, null);
  }
  
  public static AdobeDCXException createDCXError(AdobeDCXErrorCode paramAdobeDCXErrorCode, String paramString, Exception paramException)
  {
    return new AdobeDCXException(paramAdobeDCXErrorCode, paramString, paramException);
  }
  
  public static AdobeAssetException createStorageError(AdobeAssetErrorCode paramAdobeAssetErrorCode, String paramString)
  {
    if (paramString != null)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("ADOBE_ASSET_DETAILS_STRING_KEY", paramString);
      return new AdobeAssetException(paramAdobeAssetErrorCode, localHashMap, null);
    }
    return new AdobeAssetException(paramAdobeAssetErrorCode);
  }
  
  public static AdobeAssetException createStorageError(AdobeAssetErrorCode paramAdobeAssetErrorCode, URL paramURL, Object paramObject1, int paramInt, Object paramObject2)
  {
    Object localObject = paramObject1;
    if (paramObject1 == null) {
      localObject = "[no data]";
    }
    paramObject1 = new HashMap();
    if (paramURL != null) {
      paramObject1.put("AdobeAssetRequestURLString", paramURL);
    }
    paramObject1.put("AdobeNetworkHTTPStatus", Integer.valueOf(paramInt));
    paramObject1.put("AdobeAssetResponseData", localObject);
    if (paramObject2 != null) {
      paramObject1.put("AdobeAssetResponseHeaders", paramObject2);
    }
    return new AdobeAssetException(paramAdobeAssetErrorCode, paramObject1, null);
  }
}
