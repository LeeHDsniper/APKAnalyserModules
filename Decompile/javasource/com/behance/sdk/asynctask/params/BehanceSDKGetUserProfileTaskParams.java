package com.behance.sdk.asynctask.params;

public class BehanceSDKGetUserProfileTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String userId;
  
  public BehanceSDKGetUserProfileTaskParams() {}
  
  public String getUserId()
  {
    return userId;
  }
  
  public void setUserId(String paramString)
  {
    userId = paramString;
  }
}
