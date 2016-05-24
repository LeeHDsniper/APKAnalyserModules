package com.behance.sdk.listeners;

import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import java.util.List;

public abstract interface IGetStatesOfCountryAsyncTaskListener
{
  public abstract void onGetStatesFailure(String paramString, Exception paramException);
  
  public abstract void onGetStatesSuccess(String paramString, List<BehanceSDKStateDTO> paramList);
}
