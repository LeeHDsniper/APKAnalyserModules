package com.behance.sdk.dto;

public class BehanceSDKPublishedProjectDTO
{
  private String projectId;
  private String projectImageUrl;
  private String projectTitle;
  private String projectUrl;
  
  public BehanceSDKPublishedProjectDTO() {}
  
  public String getProjectId()
  {
    return projectId;
  }
  
  public String getProjectImageUrl()
  {
    return projectImageUrl;
  }
  
  public String getProjectTitle()
  {
    return projectTitle;
  }
  
  public String getProjectUrl()
  {
    return projectUrl;
  }
  
  public void setProjectId(String paramString)
  {
    projectId = paramString;
  }
  
  public void setProjectImageUrl(String paramString)
  {
    projectImageUrl = paramString;
  }
  
  public void setProjectTitle(String paramString)
  {
    projectTitle = paramString;
  }
  
  public void setProjectUrl(String paramString)
  {
    projectUrl = paramString;
  }
}
