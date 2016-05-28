package com.behance.sdk.asynctask.params;

import com.behance.sdk.BehanceSDKProjectDraftOptions;

public class BehanceSDKCreateProjectDraftTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private BehanceSDKProjectDraftOptions options;
  
  public BehanceSDKCreateProjectDraftTaskParams() {}
  
  public BehanceSDKProjectDraftOptions getBehanceSDKProjectDraftOptions()
  {
    return options;
  }
}
