package com.tencent.theme;

public class UnSupportPlatformException
  extends Exception
{
  public UnSupportPlatformException() {}
  
  public UnSupportPlatformException(String paramString)
  {
    super(paramString);
  }
  
  public UnSupportPlatformException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public UnSupportPlatformException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}
