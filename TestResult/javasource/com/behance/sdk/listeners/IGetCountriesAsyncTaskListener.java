package com.behance.sdk.listeners;

import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import java.util.List;

public abstract interface IGetCountriesAsyncTaskListener
{
  public abstract void onGetCountriesFailure(Exception paramException);
  
  public abstract void onGetCountriesSuccess(List<BehanceSDKCountryDTO> paramList);
}
