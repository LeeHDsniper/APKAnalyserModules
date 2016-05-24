package com.adobe.creativesdk.behance;

import com.behance.sdk.BehanceSDKPublishWIPOptions;
import java.io.File;

public class AdobeBehanceSDKPublishWIPOptions
  extends AdobeBehanceSDKAbstractPublishOptions
{
  private BehanceSDKPublishWIPOptions mBehanceSDKPublishWIPOptions = (BehanceSDKPublishWIPOptions)getBehanceSDKPublishOptions();
  
  public AdobeBehanceSDKPublishWIPOptions(File paramFile)
  {
    super(new BehanceSDKPublishWIPOptions(paramFile));
  }
  
  protected BehanceSDKPublishWIPOptions getPublishWIPWorkflowOptions()
  {
    return mBehanceSDKPublishWIPOptions;
  }
}
