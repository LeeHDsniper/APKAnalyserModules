package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public final class AdobeAssetException
  extends AdobeCSDKException
{
  private final AdobeAssetErrorCode errorCode;
  
  public AdobeAssetException(AdobeAssetErrorCode paramAdobeAssetErrorCode)
  {
    this(paramAdobeAssetErrorCode, null, null);
  }
  
  public AdobeAssetException(AdobeAssetErrorCode paramAdobeAssetErrorCode, HashMap<String, Object> paramHashMap)
  {
    this(paramAdobeAssetErrorCode, paramHashMap, null);
  }
  
  public AdobeAssetException(AdobeAssetErrorCode paramAdobeAssetErrorCode, HashMap<String, Object> paramHashMap, Exception paramException)
  {
    super(paramHashMap, paramException);
    errorCode = paramAdobeAssetErrorCode;
  }
  
  public AdobeAssetErrorCode getErrorCode()
  {
    return errorCode;
  }
  
  public Integer getHttpStatusCode()
  {
    if ((_data == null) || (!_data.containsKey("AdobeNetworkHTTPStatus"))) {
      return Integer.valueOf(0);
    }
    return (Integer)_data.get("AdobeNetworkHTTPStatus");
  }
}
