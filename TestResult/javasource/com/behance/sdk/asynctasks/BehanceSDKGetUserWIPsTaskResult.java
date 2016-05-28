package com.behance.sdk.asynctasks;

import com.behance.sdk.dto.BehanceSDKWIPDTO;
import java.util.List;

public class BehanceSDKGetUserWIPsTaskResult
{
  private Exception exception;
  private boolean exceptionOccurred;
  private List<BehanceSDKWIPDTO> wipsList;
  
  public BehanceSDKGetUserWIPsTaskResult() {}
  
  public Exception getException()
  {
    return exception;
  }
  
  public List<BehanceSDKWIPDTO> getWipsList()
  {
    return wipsList;
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
  
  public void setWipsList(List<BehanceSDKWIPDTO> paramList)
  {
    wipsList = paramList;
  }
}
