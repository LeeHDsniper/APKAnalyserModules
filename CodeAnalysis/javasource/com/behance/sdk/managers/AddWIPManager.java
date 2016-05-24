package com.behance.sdk.managers;

import android.app.Activity;
import com.behance.sdk.IBehanceSDKUserCredentials;

public class AddWIPManager
{
  private static final AddWIPManager INSTANCE = new AddWIPManager();
  private boolean hideFacebookSharing;
  private boolean hideTwitterSharing;
  private Class<? extends Activity> notificationHandlerActivityClass;
  private IBehanceSDKUserCredentials userCredentials;
  
  private AddWIPManager() {}
  
  public static AddWIPManager getInstance()
  {
    return INSTANCE;
  }
  
  public Class<? extends Activity> getNotificationHandlerActivityClass()
  {
    return notificationHandlerActivityClass;
  }
  
  public IBehanceSDKUserCredentials getUserCredentials()
  {
    return userCredentials;
  }
  
  public boolean isHideFacebookSharing()
  {
    return hideFacebookSharing;
  }
  
  public boolean isHideTwitterSharing()
  {
    return hideTwitterSharing;
  }
  
  public void setHideFacebookSharing(boolean paramBoolean)
  {
    hideFacebookSharing = paramBoolean;
  }
  
  public void setHideTwitterSharing(boolean paramBoolean)
  {
    hideTwitterSharing = paramBoolean;
  }
  
  public void setNotificationHandlerActivityClass(Class<? extends Activity> paramClass)
  {
    notificationHandlerActivityClass = paramClass;
  }
  
  public void setUserCredentials(IBehanceSDKUserCredentials paramIBehanceSDKUserCredentials)
  {
    userCredentials = paramIBehanceSDKUserCredentials;
  }
}
