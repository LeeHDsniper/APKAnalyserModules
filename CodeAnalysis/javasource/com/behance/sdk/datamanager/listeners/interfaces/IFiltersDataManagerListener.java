package com.behance.sdk.datamanager.listeners.interfaces;

import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import java.util.List;

public abstract interface IFiltersDataManagerListener
{
  public abstract void onCreativeFieldsLoadingFailure(Exception paramException);
  
  public abstract void onCreativeFieldsLoadingSuccess(List<BehanceSDKCreativeFieldDTO> paramList);
}
