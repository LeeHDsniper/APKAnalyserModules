package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public class AdobeDCXException
  extends AdobeCSDKException
{
  private final String _description;
  private final AdobeDCXErrorCode _errorCode;
  
  public AdobeDCXException(AdobeDCXErrorCode paramAdobeDCXErrorCode, String paramString, Exception paramException)
  {
    this(paramAdobeDCXErrorCode, paramString, null, paramException);
  }
  
  public AdobeDCXException(AdobeDCXErrorCode paramAdobeDCXErrorCode, String paramString, HashMap<String, Object> paramHashMap, Exception paramException)
  {
    super(paramHashMap, paramException);
    _errorCode = paramAdobeDCXErrorCode;
    _description = paramString;
  }
}
