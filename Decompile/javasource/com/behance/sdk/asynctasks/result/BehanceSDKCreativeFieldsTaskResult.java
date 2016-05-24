package com.behance.sdk.asynctasks.result;

public class BehanceSDKCreativeFieldsTaskResult<T>
{
  private Exception exception;
  private boolean exceptionOccurred;
  private T result;
  
  public BehanceSDKCreativeFieldsTaskResult() {}
  
  public Exception getException()
  {
    return exception;
  }
  
  public T getResult()
  {
    return result;
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
  
  public void setResult(T paramT)
  {
    result = paramT;
  }
}
