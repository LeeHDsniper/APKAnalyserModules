package com.adobe.creativesdk.foundation.adobeinternal.cloud;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public class AdobeCloudException
  extends AdobeCSDKException
{
  private final String _description;
  private final AdobeCloudErrorCode _errorCode;
  
  public AdobeCloudException(AdobeCloudErrorCode paramAdobeCloudErrorCode, String paramString, Exception paramException)
  {
    this(paramAdobeCloudErrorCode, paramString, null, paramException);
  }
  
  public AdobeCloudException(AdobeCloudErrorCode paramAdobeCloudErrorCode, String paramString, HashMap<String, Object> paramHashMap, Exception paramException)
  {
    super(paramHashMap, paramException);
    _errorCode = paramAdobeCloudErrorCode;
    _description = paramString;
  }
}
