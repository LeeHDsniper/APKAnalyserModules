package com.behance.sdk.listeners;

import com.behance.sdk.asynctask.params.BehanceSDKGetCitiesAsyncTaskParams;
import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import java.util.List;

public abstract interface ILocationFiltersDataManagerListener
{
  public abstract void onCitiesLoadingFailure(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, Exception paramException);
  
  public abstract void onCitiesLoadingSuccess(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, List<BehanceSDKCityDTO> paramList);
  
  public abstract void onCountriesLoadingFailure(Exception paramException);
  
  public abstract void onCountriesLoadingSuccess(List<BehanceSDKCountryDTO> paramList);
  
  public abstract void onStatesLoadingFailure(String paramString, Exception paramException);
  
  public abstract void onStatesLoadingSuccess(String paramString, List<BehanceSDKStateDTO> paramList);
}
