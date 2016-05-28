package com.behance.sdk.dto.search;

import java.io.Serializable;

public class BehanceSDKProjectStatsDTO
  implements Serializable
{
  private static final long serialVersionUID = 5631348234776278534L;
  private int appreciationsCount;
  private int commentsCount;
  private int viewsCount;
  
  public BehanceSDKProjectStatsDTO() {}
  
  public void setAppreciationsCount(int paramInt)
  {
    appreciationsCount = paramInt;
  }
  
  public void setCommentsCount(int paramInt)
  {
    commentsCount = paramInt;
  }
  
  public void setViewsCount(int paramInt)
  {
    viewsCount = paramInt;
  }
}
