package com.behance.sdk.asynctasks.result;

import com.behance.sdk.BehanceSDKUserProfile;

public class BehanceSDKGetUserProfileTaskResult
{
  private Exception exception;
  private boolean exceptionOccurred;
  private BehanceSDKUserProfile userProfile;
  
  public BehanceSDKGetUserProfileTaskResult() {}
  
  public BehanceSDKUserProfile getBehanceUserProfile()
  {
    return userProfile;
  }
  
  public Exception getException()
  {
    return exception;
  }
  
  public boolean isExceptionOccurred()
  {
    return exceptionOccurred;
  }
  
  public void setBehanceUserProfile(BehanceSDKUserProfile paramBehanceSDKUserProfile)
  {
    userProfile = paramBehanceSDKUserProfile;
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
