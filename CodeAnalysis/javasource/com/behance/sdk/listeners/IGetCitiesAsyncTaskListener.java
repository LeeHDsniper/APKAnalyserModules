package com.behance.sdk.listeners;

import com.behance.sdk.asynctask.params.BehanceSDKGetCitiesAsyncTaskParams;
import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import java.util.List;

public abstract interface IGetCitiesAsyncTaskListener
{
  public abstract void onGetCitiesFailure(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, Exception paramException);
  
  public abstract void onGetCitiesSuccess(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, List<BehanceSDKCityDTO> paramList);
}
