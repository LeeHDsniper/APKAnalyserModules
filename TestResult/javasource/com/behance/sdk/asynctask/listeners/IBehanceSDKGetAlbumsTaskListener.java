package com.behance.sdk.asynctask.listeners;

import com.behance.sdk.dto.BehanceSDKAlbumDTO;
import java.util.List;

public abstract interface IBehanceSDKGetAlbumsTaskListener
{
  public abstract void onGetAlbumsTaskFailure(Exception paramException);
  
  public abstract void onGetAlbumsTaskSuccess(List<BehanceSDKAlbumDTO> paramList);
}
