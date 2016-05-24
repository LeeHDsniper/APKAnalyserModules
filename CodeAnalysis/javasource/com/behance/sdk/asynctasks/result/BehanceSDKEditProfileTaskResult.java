package com.behance.sdk.asynctasks.result;

import java.util.ArrayList;
import java.util.List;

public class BehanceSDKEditProfileTaskResult
{
  private boolean exceptionOccurred;
  private List<Exception> exceptions = new ArrayList();
  private boolean profileAvatarUpdateFailed;
  private boolean profileUpdateFailed;
  
  public BehanceSDKEditProfileTaskResult() {}
  
  public void addException(Exception paramException)
  {
    exceptions.add(paramException);
  }
  
  public List<Exception> getExceptions()
  {
    return exceptions;
  }
  
  public boolean isExceptionOccurred()
  {
    return exceptionOccurred;
  }
  
  public boolean isProfileAvatarUpdateFailed()
  {
    return profileAvatarUpdateFailed;
  }
  
  public boolean isProfileUpdateFailed()
  {
    return profileUpdateFailed;
  }
  
  public void setExceptionOccurred(boolean paramBoolean)
  {
    exceptionOccurred = paramBoolean;
  }
  
  public void setProfileAvatarUpdateFailed(boolean paramBoolean)
  {
    profileAvatarUpdateFailed = paramBoolean;
  }
  
  public void setProfileUpdateFailed(boolean paramBoolean)
  {
    profileUpdateFailed = paramBoolean;
  }
}
