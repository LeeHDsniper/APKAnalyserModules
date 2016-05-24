package com.adobe.creativesdk.foundation.internal.storage.model.util;

import com.adobe.creativesdk.foundation.storage.AdobeAssetException;

public class ParsingDataException
  extends Exception
{
  private AdobeAssetException _error;
  
  public ParsingDataException(AdobeAssetException paramAdobeAssetException)
  {
    _error = paramAdobeAssetException;
  }
  
  public AdobeAssetException getError()
  {
    return _error;
  }
}
