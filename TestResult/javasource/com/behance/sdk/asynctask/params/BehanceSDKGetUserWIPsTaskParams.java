package com.behance.sdk.asynctask.params;

public class BehanceSDKGetUserWIPsTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String userId;
  
  public BehanceSDKGetUserWIPsTaskParams() {}
  
  public String getUserId()
  {
    return userId;
  }
  
  public void setUserId(String paramString)
  {
    userId = paramString;
  }
}
