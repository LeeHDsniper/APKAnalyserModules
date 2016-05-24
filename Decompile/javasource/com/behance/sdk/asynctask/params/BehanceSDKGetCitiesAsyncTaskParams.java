package com.behance.sdk.asynctask.params;

public class BehanceSDKGetCitiesAsyncTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String citySearchStr;
  private String countryId;
  private String stateId;
  
  public BehanceSDKGetCitiesAsyncTaskParams() {}
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof BehanceSDKGetCitiesAsyncTaskParams))
    {
      paramObject = (BehanceSDKGetCitiesAsyncTaskParams)paramObject;
      if ((getCountryId() != null) || (paramObject.getCountryId() == null)) {
        break label28;
      }
    }
    label28:
    while (((getCountryId() != null) && (!getCountryId().equals(paramObject.getCountryId()))) || ((getStateId() == null) && (paramObject.getStateId() != null)) || ((getStateId() != null) && (!getStateId().equals(paramObject.getStateId()))) || ((getCitySearchStr() == null) && (paramObject.getCitySearchStr() != null)) || ((getCitySearchStr() != null) && (!getCitySearchStr().equals(paramObject.getCitySearchStr())))) {
      return false;
    }
    return true;
  }
  
  public String getCitySearchStr()
  {
    return citySearchStr;
  }
  
  public String getCountryId()
  {
    return countryId;
  }
  
  public String getStateId()
  {
    return stateId;
  }
  
  public void setCitySearchStr(String paramString)
  {
    citySearchStr = paramString;
  }
  
  public void setCountryId(String paramString)
  {
    countryId = paramString;
  }
  
  public void setStateId(String paramString)
  {
    stateId = paramString;
  }
}
