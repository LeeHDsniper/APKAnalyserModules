package com.adobe.creativesdk.foundation.adobeinternal.entitlement;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public class AdobeEntitlementException
  extends AdobeCSDKException
{
  private final String _description;
  private final AdobeEntitlementErrorCode _errorCode;
  
  public AdobeEntitlementException(AdobeEntitlementErrorCode paramAdobeEntitlementErrorCode)
  {
    this(paramAdobeEntitlementErrorCode, null, null, null);
  }
  
  public AdobeEntitlementException(AdobeEntitlementErrorCode paramAdobeEntitlementErrorCode, String paramString)
  {
    this(paramAdobeEntitlementErrorCode, paramString, null, null);
  }
  
  public AdobeEntitlementException(AdobeEntitlementErrorCode paramAdobeEntitlementErrorCode, String paramString, Exception paramException)
  {
    this(paramAdobeEntitlementErrorCode, paramString, null, paramException);
  }
  
  public AdobeEntitlementException(AdobeEntitlementErrorCode paramAdobeEntitlementErrorCode, String paramString, HashMap<String, Object> paramHashMap, Exception paramException)
  {
    super(paramHashMap, paramException);
    _errorCode = paramAdobeEntitlementErrorCode;
    _description = paramString;
  }
}
