package com.behance.sdk;

import android.app.Activity;

public abstract class BehanceSDKAbstractPublishOptions
{
  private String facebookClientId;
  private boolean facebookShareEnabled = false;
  private Class<? extends Activity> notificationHandlerActivityClass;
  private String twitterConsumerKey;
  private String twitterConsumerSecretKey;
  private boolean twitterShareEnabled = false;
  
  public BehanceSDKAbstractPublishOptions() {}
  
  public String getFacebookClientId()
  {
    return facebookClientId;
  }
  
  public Class<? extends Activity> getNotificationHandlerActivityClass()
  {
    return notificationHandlerActivityClass;
  }
  
  public String getTwitterConsumerKey()
  {
    return twitterConsumerKey;
  }
  
  public String getTwitterConsumerSecretKey()
  {
    return twitterConsumerSecretKey;
  }
  
  public boolean isFacebookShareEnabled()
  {
    return facebookShareEnabled;
  }
  
  public boolean isTwitterShareEnabled()
  {
    return twitterShareEnabled;
  }
}
