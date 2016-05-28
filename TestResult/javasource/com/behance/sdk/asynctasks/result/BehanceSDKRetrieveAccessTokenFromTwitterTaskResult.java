package com.behance.sdk.asynctasks.result;

public class BehanceSDKRetrieveAccessTokenFromTwitterTaskResult
{
  private Exception exception;
  private boolean exceptionOccurred;
  
  public BehanceSDKRetrieveAccessTokenFromTwitterTaskResult() {}
  
  public Exception getException()
  {
    return exception;
  }
  
  public boolean isExceptionOccurred()
  {
    return exceptionOccurred;
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
