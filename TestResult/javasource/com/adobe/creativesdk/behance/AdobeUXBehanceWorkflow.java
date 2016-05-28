package com.adobe.creativesdk.behance;

import android.content.Context;
import com.behance.sdk.BehanceSDK;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.exception.BehanceSDKInvalidArgumentException;
import com.behance.sdk.exception.BehanceSDKInvalidImageException;
import com.behance.sdk.exception.BehanceSDKUserNotAuthenticatedException;
import com.behance.sdk.exception.BehanceSDKUserNotEntitledException;

public class AdobeUXBehanceWorkflow
{
  private static AdobeUXBehanceWorkflow sharedInstance = null;
  protected IBehanceSDKUserCredentials mAdobeCSDKUserDetails = new AdobeBehanceUserDetails();
  protected BehanceSDK mBehanceSDK = null;
  
  private AdobeUXBehanceWorkflow()
  {
    mBehanceSDK.initialize(mAdobeCSDKUserDetails);
  }
  
  static AdobeUXBehanceWorkflow getInstance()
  {
    if (sharedInstance == null) {
      sharedInstance = new AdobeUXBehanceWorkflow();
    }
    return sharedInstance;
  }
  
  public static void launchPublishWIP(AdobeBehanceSDKPublishWIPOptions paramAdobeBehanceSDKPublishWIPOptions, Context paramContext)
    throws BehanceSDKInvalidArgumentException, BehanceSDKInvalidImageException, BehanceSDKUserNotEntitledException, BehanceSDKUserNotAuthenticatedException
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("Context cannot be null.");
    }
    if (paramAdobeBehanceSDKPublishWIPOptions == null) {
      throw new IllegalArgumentException("AdobeBehanceSDKPublishWIPOptions cannot be null.");
    }
    getInstancemBehanceSDK.launchPublishWIPView(paramContext, paramAdobeBehanceSDKPublishWIPOptions.getPublishWIPWorkflowOptions());
  }
}
