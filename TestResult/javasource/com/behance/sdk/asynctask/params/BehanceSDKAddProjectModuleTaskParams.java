package com.behance.sdk.asynctask.params;

import java.io.File;

public class BehanceSDKAddProjectModuleTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private File imageFile;
  private String projectID;
  
  public BehanceSDKAddProjectModuleTaskParams() {}
  
  public File getImage()
  {
    return imageFile;
  }
  
  public String getProjectId()
  {
    return projectID;
  }
}
