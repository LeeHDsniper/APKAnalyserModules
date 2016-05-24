package com.adobe.creativesdk.foundation.internal.collaboration;

import java.net.URL;
import java.util.HashMap;

public class AdobeCollaborationErrUtils
{
  public static AdobeCollaborationException createCollaborationError(AdobeCollaborationErrorCode paramAdobeCollaborationErrorCode, String paramString1, String paramString2)
  {
    if (paramString1 != null)
    {
      paramString2 = new HashMap();
      paramString2.put("ADOBE_ASSET_DETAILS_STRING_KEY", paramString1);
      return new AdobeCollaborationException(paramAdobeCollaborationErrorCode, paramString2, null);
    }
    return new AdobeCollaborationException(paramAdobeCollaborationErrorCode, null, paramString2);
  }
  
  public static AdobeCollaborationException createCollaborationError(AdobeCollaborationErrorCode paramAdobeCollaborationErrorCode, URL paramURL, Object paramObject1, int paramInt, Object paramObject2)
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
    return new AdobeCollaborationException(paramAdobeCollaborationErrorCode, paramObject1, null);
  }
}
