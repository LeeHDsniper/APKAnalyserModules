package com.behance.sdk;

import com.behance.sdk.dto.search.BehanceSDKProjectDTO;
import java.util.List;

public abstract interface IBehanceSDKSearchProjectListener
{
  public abstract void onSearchProjectsFailure(Exception paramException);
  
  public abstract void onSearchProjectsSuccess(List<BehanceSDKProjectDTO> paramList);
}
