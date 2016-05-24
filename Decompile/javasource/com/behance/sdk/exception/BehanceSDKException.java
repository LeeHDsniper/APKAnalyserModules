package com.behance.sdk.exception;

public class BehanceSDKException
  extends Exception
{
  private static final long serialVersionUID = 4460485212019462046L;
  
  public BehanceSDKException() {}
  
  public BehanceSDKException(String paramString)
  {
    super(paramString);
  }
  
  public BehanceSDKException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}
