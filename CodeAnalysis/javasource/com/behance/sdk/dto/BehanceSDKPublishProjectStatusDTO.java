package com.behance.sdk.dto;

import com.behance.sdk.enums.BehanceSDKPublishProjectProgressState;
import java.io.Serializable;

public class BehanceSDKPublishProjectStatusDTO
  implements Serializable
{
  private static final long serialVersionUID = 8406969591550157485L;
  private Throwable exception;
  private int progressPercentage;
  private BehanceSDKPublishProjectProgressState progressState;
  private String projectCoverImageUrl;
  private String projectId;
  private String projectTitle;
  private String projectUrl;
  private String publishRequestId;
  private String reasonPhrase;
  
  public BehanceSDKPublishProjectStatusDTO() {}
  
  public BehanceSDKPublishProjectProgressState getProgressState()
  {
    return progressState;
  }
  
  public String getProjectUrl()
  {
    return projectUrl;
  }
  
  public void setException(Throwable paramThrowable)
  {
    exception = paramThrowable;
  }
  
  public void setProgressPercentage(int paramInt)
  {
    progressPercentage = paramInt;
  }
  
  public void setProgressState(BehanceSDKPublishProjectProgressState paramBehanceSDKPublishProjectProgressState)
  {
    progressState = paramBehanceSDKPublishProjectProgressState;
  }
  
  public void setProjectCoverImageUrl(String paramString)
  {
    projectCoverImageUrl = paramString;
  }
  
  public void setProjectId(String paramString)
  {
    projectId = paramString;
  }
  
  public void setProjectTitle(String paramString)
  {
    projectTitle = paramString;
  }
  
  public void setProjectUrl(String paramString)
  {
    projectUrl = paramString;
  }
  
  public void setPublishRequestId(String paramString)
  {
    publishRequestId = paramString;
  }
  
  public void setReasonPhrase(String paramString)
  {
    reasonPhrase = paramString;
  }
}
