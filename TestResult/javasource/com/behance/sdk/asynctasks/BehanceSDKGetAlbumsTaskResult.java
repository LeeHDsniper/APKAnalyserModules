package com.behance.sdk.asynctasks;

import com.behance.sdk.dto.BehanceSDKAlbumDTO;
import java.util.List;

public class BehanceSDKGetAlbumsTaskResult
{
  private List<BehanceSDKAlbumDTO> albumsList;
  private Exception exception;
  private boolean exceptionOccurred;
  
  public BehanceSDKGetAlbumsTaskResult() {}
  
  public List<BehanceSDKAlbumDTO> getAlbumsList()
  {
    return albumsList;
  }
  
  public Exception getException()
  {
    return exception;
  }
  
  public boolean isExceptionOccurred()
  {
    return exceptionOccurred;
  }
  
  public void setAlbumsList(List<BehanceSDKAlbumDTO> paramList)
  {
    albumsList = paramList;
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
