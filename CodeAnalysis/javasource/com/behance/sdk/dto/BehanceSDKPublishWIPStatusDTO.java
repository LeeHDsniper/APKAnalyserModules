package com.behance.sdk.dto;

import com.behance.sdk.enums.BehanceSDKPublishWIPProgressState;
import java.io.Serializable;

public class BehanceSDKPublishWIPStatusDTO
  implements Serializable
{
  private static final long serialVersionUID = 5416163312006141443L;
  private String errorMessage;
  private Throwable exception;
  private int progressPercentage;
  private BehanceSDKPublishWIPProgressState progressState;
  private String publishRequestId;
  private int wipId;
  private String wipRevisionDescription;
  private int wipRevisionId;
  private String wipRevisionImageUrl;
  private String wipRevisionUrl;
  private String wipTitle;
  
  public BehanceSDKPublishWIPStatusDTO() {}
  
  public BehanceSDKPublishWIPProgressState getProgressState()
  {
    return progressState;
  }
  
  public void setErrorMessage(String paramString)
  {
    errorMessage = paramString;
  }
  
  public void setException(Throwable paramThrowable)
  {
    exception = paramThrowable;
  }
  
  public void setProgressPercentage(int paramInt)
  {
    progressPercentage = paramInt;
  }
  
  public void setProgressState(BehanceSDKPublishWIPProgressState paramBehanceSDKPublishWIPProgressState)
  {
    progressState = paramBehanceSDKPublishWIPProgressState;
  }
  
  public void setPublishRequestId(String paramString)
  {
    publishRequestId = paramString;
  }
  
  public void setWipId(int paramInt)
  {
    wipId = paramInt;
  }
  
  public void setWipRevisionDescription(String paramString)
  {
    wipRevisionDescription = paramString;
  }
  
  public void setWipRevisionId(int paramInt)
  {
    wipRevisionId = paramInt;
  }
  
  public void setWipRevisionImageUrl(String paramString)
  {
    wipRevisionImageUrl = paramString;
  }
  
  public void setWipRevisionUrl(String paramString)
  {
    wipRevisionUrl = paramString;
  }
  
  public void setWipTitle(String paramString)
  {
    wipTitle = paramString;
  }
}
