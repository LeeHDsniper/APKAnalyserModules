package com.adobe.creativesdk.foundation.internal.utils;

import java.util.HashMap;

public abstract class AdobeCSDKException
  extends Exception
{
  protected HashMap<String, Object> _data;
  
  public AdobeCSDKException(HashMap<String, Object> paramHashMap)
  {
    _data = paramHashMap;
  }
  
  public AdobeCSDKException(HashMap<String, Object> paramHashMap, Exception paramException)
  {
    super(paramException);
    _data = paramHashMap;
  }
  
  public HashMap<String, Object> getData()
  {
    return _data;
  }
}
