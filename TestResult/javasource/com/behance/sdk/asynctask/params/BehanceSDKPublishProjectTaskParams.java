package com.behance.sdk.asynctask.params;

public class BehanceSDKPublishProjectTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String projectID;
  
  public BehanceSDKPublishProjectTaskParams() {}
  
  public String getProjectId()
  {
    return projectID;
  }
}
