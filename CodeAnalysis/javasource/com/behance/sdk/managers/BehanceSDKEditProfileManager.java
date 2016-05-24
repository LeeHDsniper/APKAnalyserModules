package com.behance.sdk.managers;

import com.behance.sdk.IBehanceSDKEditProfileListener;
import com.behance.sdk.IBehanceSDKUserCredentials;

public class BehanceSDKEditProfileManager
{
  private static final BehanceSDKEditProfileManager INSTANCE = new BehanceSDKEditProfileManager();
  private IBehanceSDKEditProfileListener editProfileListener;
  private IBehanceSDKUserCredentials userCredentials;
  
  public BehanceSDKEditProfileManager() {}
  
  public static BehanceSDKEditProfileManager getInstance()
  {
    return INSTANCE;
  }
  
  public IBehanceSDKUserCredentials getUserCredentials()
  {
    return userCredentials;
  }
  
  public void onEditProfileSuccess()
  {
    editProfileListener.onEditProfileSuccess();
  }
}
