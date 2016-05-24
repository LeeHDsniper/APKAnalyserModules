package com.behance.sdk.dto.search;

public class BehanceSDKProjectFeaturedDTO
  extends BehanceSDKFeaturedDTO
{
  private long featuredDate;
  private String projectUrl;
  
  public BehanceSDKProjectFeaturedDTO() {}
  
  public void setFeaturedDate(long paramLong)
  {
    featuredDate = paramLong;
  }
  
  public void setProjectUrl(String paramString)
  {
    projectUrl = paramString;
  }
}
