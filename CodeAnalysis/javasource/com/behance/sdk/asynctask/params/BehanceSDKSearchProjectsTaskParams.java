package com.behance.sdk.asynctask.params;

import com.behance.sdk.enums.BehanceSDKProjectsSortOption;
import com.behance.sdk.enums.BehanceSDKProjectsTimeSpan;

public class BehanceSDKSearchProjectsTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String city;
  private String country;
  private String field;
  private int pageNumber;
  private int pageSize;
  private String searchString;
  private BehanceSDKProjectsSortOption sortOption;
  private String state;
  private BehanceSDKProjectsTimeSpan timeSpan;
  
  public BehanceSDKSearchProjectsTaskParams() {}
  
  public String getCity()
  {
    return city;
  }
  
  public String getCountry()
  {
    return country;
  }
  
  public String getField()
  {
    return field;
  }
  
  public int getPageNumber()
  {
    return pageNumber;
  }
  
  public int getPageSize()
  {
    if (pageSize > 0) {
      return pageSize;
    }
    return 8;
  }
  
  public String getSearchString()
  {
    return searchString;
  }
  
  public BehanceSDKProjectsSortOption getSortOption()
  {
    return sortOption;
  }
  
  public String getState()
  {
    return state;
  }
  
  public BehanceSDKProjectsTimeSpan getTimeSpan()
  {
    return timeSpan;
  }
}
