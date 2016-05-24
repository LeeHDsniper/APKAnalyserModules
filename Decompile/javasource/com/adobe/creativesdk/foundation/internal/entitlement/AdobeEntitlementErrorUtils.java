package com.adobe.creativesdk.foundation.internal.entitlement;

import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementErrorCode;
import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementException;
import java.util.HashMap;

public class AdobeEntitlementErrorUtils
{
  public static AdobeEntitlementException errorWithCode(AdobeEntitlementErrorCode paramAdobeEntitlementErrorCode, Exception paramException, String paramString1, String paramString2)
  {
    HashMap localHashMap = new HashMap();
    if (paramString1 != null) {
      localHashMap.put("AdobeErrorPathKey", paramString1);
    }
    return new AdobeEntitlementException(paramAdobeEntitlementErrorCode, paramString2, localHashMap, paramException);
  }
}
