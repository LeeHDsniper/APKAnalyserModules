package com.adobe.creativesdk.behance;

import com.behance.sdk.BehanceSDKAbstractPublishOptions;

public class AdobeBehanceSDKAbstractPublishOptions
{
  private BehanceSDKAbstractPublishOptions mBehanceSDKAbstractPublishOptions;
  
  public AdobeBehanceSDKAbstractPublishOptions(BehanceSDKAbstractPublishOptions paramBehanceSDKAbstractPublishOptions)
  {
    mBehanceSDKAbstractPublishOptions = paramBehanceSDKAbstractPublishOptions;
  }
  
  protected BehanceSDKAbstractPublishOptions getBehanceSDKPublishOptions()
  {
    return mBehanceSDKAbstractPublishOptions;
  }
}
