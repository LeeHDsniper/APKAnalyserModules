package com.adobe.creativesdk.foundation.internal.photo.util;

import com.adobe.creativesdk.foundation.storage.AdobePhotoErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import java.net.URL;
import java.util.HashMap;

public class AdobePhotoErrUtils
{
  public static AdobePhotoException createPhotoError(AdobePhotoErrorCode paramAdobePhotoErrorCode, URL paramURL, Object paramObject1, int paramInt, Object paramObject2)
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
    return new AdobePhotoException(paramAdobePhotoErrorCode, paramObject1, null);
  }
}
