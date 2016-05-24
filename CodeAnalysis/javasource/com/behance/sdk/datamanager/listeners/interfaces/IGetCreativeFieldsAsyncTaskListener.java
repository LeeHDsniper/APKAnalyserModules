package com.behance.sdk.datamanager.listeners.interfaces;

import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import java.util.List;

public abstract interface IGetCreativeFieldsAsyncTaskListener
{
  public abstract void onLoadCreativeFieldsFailure(Exception paramException);
  
  public abstract void onLoadCreativeFieldsSuccess(List<BehanceSDKCreativeFieldDTO> paramList);
}
