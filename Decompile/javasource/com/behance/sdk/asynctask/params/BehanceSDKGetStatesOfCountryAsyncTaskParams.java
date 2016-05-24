package com.behance.sdk.asynctask.params;

public class BehanceSDKGetStatesOfCountryAsyncTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String countryId;
  
  public BehanceSDKGetStatesOfCountryAsyncTaskParams() {}
  
  public String getCountryId()
  {
    return countryId;
  }
  
  public void setCountryId(String paramString)
  {
    countryId = paramString;
  }
}
