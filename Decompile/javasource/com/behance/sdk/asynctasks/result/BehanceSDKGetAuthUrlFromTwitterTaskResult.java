package com.behance.sdk.asynctasks.result;

public class BehanceSDKGetAuthUrlFromTwitterTaskResult
{
  private String authURL;
  private Exception exception;
  private boolean exceptionOccurred;
  
  public BehanceSDKGetAuthUrlFromTwitterTaskResult() {}
  
  public String getAuthURL()
  {
    return authURL;
  }
  
  public Exception getException()
  {
    return exception;
  }
  
  public boolean isExceptionOccurred()
  {
    return exceptionOccurred;
  }
  
  public void setAuthURL(String paramString)
  {
    authURL = paramString;
  }
  
  public void setException(Exception paramException)
  {
    exception = paramException;
  }
  
  public void setExceptionOccurred(boolean paramBoolean)
  {
    exceptionOccurred = paramBoolean;
  }
}
