package com.adobe.creativesdk.foundation.auth;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public final class AdobeAuthException
  extends AdobeCSDKException
{
  private final AdobeAuthErrorCode errorCode;
  
  public AdobeAuthException(AdobeAuthErrorCode paramAdobeAuthErrorCode)
  {
    this(paramAdobeAuthErrorCode, null);
  }
  
  public AdobeAuthException(AdobeAuthErrorCode paramAdobeAuthErrorCode, HashMap<String, Object> paramHashMap)
  {
    super(paramHashMap);
    errorCode = paramAdobeAuthErrorCode;
  }
  
  public AdobeAuthErrorCode getErrorCode()
  {
    return errorCode;
  }
}
