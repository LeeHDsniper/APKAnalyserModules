package com.adobe.creativesdk.foundation.internal.collaboration;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public class AdobeCollaborationException
  extends AdobeCSDKException
{
  private final String description;
  private final AdobeCollaborationErrorCode errorCode;
  
  public AdobeCollaborationException(AdobeCollaborationErrorCode paramAdobeCollaborationErrorCode, HashMap<String, Object> paramHashMap, String paramString)
  {
    this(paramAdobeCollaborationErrorCode, paramHashMap, paramString, null);
  }
  
  public AdobeCollaborationException(AdobeCollaborationErrorCode paramAdobeCollaborationErrorCode, HashMap<String, Object> paramHashMap, String paramString, Exception paramException)
  {
    super(paramHashMap, paramException);
    errorCode = paramAdobeCollaborationErrorCode;
    description = paramString;
  }
  
  public Integer getHttpStatusCode()
  {
    if ((_data == null) || (!_data.containsKey("AdobeNetworkHTTPStatus"))) {
      return Integer.valueOf(0);
    }
    return (Integer)_data.get("AdobeNetworkHTTPStatus");
  }
}
