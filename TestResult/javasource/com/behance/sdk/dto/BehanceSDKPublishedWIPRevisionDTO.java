package com.behance.sdk.dto;

public class BehanceSDKPublishedWIPRevisionDTO
{
  private String revisionDescription;
  private int revisionId;
  private String revisionURL;
  private int wipId;
  private String wipImageURL;
  private String wipTitle;
  
  public BehanceSDKPublishedWIPRevisionDTO() {}
  
  public String getRevisionDescription()
  {
    return revisionDescription;
  }
  
  public int getRevisionId()
  {
    return revisionId;
  }
  
  public String getRevisionURL()
  {
    return revisionURL;
  }
  
  public int getWipId()
  {
    return wipId;
  }
  
  public String getWipImageURL()
  {
    return wipImageURL;
  }
  
  public String getWipTitle()
  {
    return wipTitle;
  }
  
  public void setRevisionDescription(String paramString)
  {
    revisionDescription = paramString;
  }
  
  public void setRevisionId(int paramInt)
  {
    revisionId = paramInt;
  }
  
  public void setRevisionURL(String paramString)
  {
    revisionURL = paramString;
  }
  
  public void setWipId(int paramInt)
  {
    wipId = paramInt;
  }
  
  public void setWipImageURL(String paramString)
  {
    wipImageURL = paramString;
  }
  
  public void setWipTitle(String paramString)
  {
    wipTitle = paramString;
  }
}
