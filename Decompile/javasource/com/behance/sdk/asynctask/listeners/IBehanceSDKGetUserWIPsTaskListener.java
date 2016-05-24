package com.behance.sdk.asynctask.listeners;

import com.behance.sdk.asynctask.params.BehanceSDKGetUserWIPsTaskParams;
import com.behance.sdk.dto.BehanceSDKWIPDTO;
import java.util.List;

public abstract interface IBehanceSDKGetUserWIPsTaskListener
{
  public abstract void onGetUserWIPsTaskFailure(Exception paramException, BehanceSDKGetUserWIPsTaskParams paramBehanceSDKGetUserWIPsTaskParams);
  
  public abstract void onGetUserWIPsTaskSuccess(List<BehanceSDKWIPDTO> paramList, BehanceSDKGetUserWIPsTaskParams paramBehanceSDKGetUserWIPsTaskParams);
}
