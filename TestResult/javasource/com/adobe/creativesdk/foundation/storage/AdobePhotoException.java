package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.HashMap;

public class AdobePhotoException
  extends AdobeCSDKException
{
  private final String description;
  private final AdobePhotoErrorCode errorCode;
  
  public AdobePhotoException(AdobePhotoErrorCode paramAdobePhotoErrorCode)
  {
    this(paramAdobePhotoErrorCode, null, null);
  }
  
  public AdobePhotoException(AdobePhotoErrorCode paramAdobePhotoErrorCode, HashMap<String, Object> paramHashMap, String paramString)
  {
    this(paramAdobePhotoErrorCode, paramHashMap, paramString, null);
  }
  
  public AdobePhotoException(AdobePhotoErrorCode paramAdobePhotoErrorCode, HashMap<String, Object> paramHashMap, String paramString, Exception paramException)
  {
    super(paramHashMap, paramException);
    errorCode = paramAdobePhotoErrorCode;
    description = paramString;
  }
}
