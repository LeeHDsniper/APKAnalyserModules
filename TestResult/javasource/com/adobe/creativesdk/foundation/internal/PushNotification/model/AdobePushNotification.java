package com.adobe.creativesdk.foundation.internal.PushNotification.model;

import com.adobe.creativesdk.foundation.assets.R.string;

public abstract class AdobePushNotification
{
  private String adobeID;
  private String displayName;
  private String firstName;
  private long formattingData;
  private boolean formattingNeeded;
  private String lastName;
  private long lastTimeStamp;
  private AdobePushNotificationState local_state;
  private boolean needToRecalculate = true;
  private String notificationID;
  private AdobePushNotificationSubType notificationType;
  private String region;
  private String resourceName;
  private String resourceURL;
  private AdobePushNotificationState server_state;
  private long timeRemainingForNextChange;
  private int timeStampMessage;
  private long timestamp;
  
  public AdobePushNotification() {}
  
  private long getDiffInMinutes(long paramLong)
  {
    return (paramLong - lastTimeStamp) / 60000L;
  }
  
  private void setTimeStampString(long paramLong)
  {
    lastTimeStamp = paramLong;
    paramLong = (lastTimeStamp - timestamp) / 60000L;
    if (paramLong <= 1L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_less_than_minute;
      timeRemainingForNextChange = 1L;
      formattingNeeded = false;
      needToRecalculate = true;
      return;
    }
    if (paramLong < 60L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_minute;
      formattingNeeded = true;
      formattingData = paramLong;
      timeRemainingForNextChange = (60L - paramLong);
      needToRecalculate = true;
      return;
    }
    if (paramLong < 120L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_hour_single;
      timeRemainingForNextChange = (120L - paramLong);
      formattingNeeded = false;
      needToRecalculate = true;
      return;
    }
    long l1 = paramLong / 60L;
    long l2 = l1 / 24L;
    long l3 = l2 / 365L;
    if (l1 < 24L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_hours_multiple;
      formattingNeeded = true;
      formattingData = l1;
      timeRemainingForNextChange = (60L * (1L + l1) - paramLong);
      needToRecalculate = true;
      return;
    }
    if (l2 < 2L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_day_single;
      formattingNeeded = false;
      needToRecalculate = false;
      return;
    }
    if (l2 < 365L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_days_multiple;
      formattingNeeded = true;
      formattingData = l2;
      needToRecalculate = false;
      return;
    }
    if (l3 < 2L)
    {
      timeStampMessage = R.string.adobe_notification_activity_timestamp_year_single;
      formattingNeeded = false;
      needToRecalculate = false;
      return;
    }
    timeStampMessage = R.string.adobe_notification_activity_timestamp_year_multiple;
    formattingNeeded = true;
    formattingData = l3;
    needToRecalculate = false;
  }
  
  public String getAdobeID()
  {
    return adobeID;
  }
  
  public String getDisplayName()
  {
    return displayName;
  }
  
  public String getFirstName()
  {
    return firstName;
  }
  
  public String getLastName()
  {
    return lastName;
  }
  
  public AdobePushNotificationState getLocalState()
  {
    return local_state;
  }
  
  public String getNotificationID()
  {
    return notificationID;
  }
  
  public AdobePushNotificationSubType getNotificationType()
  {
    return notificationType;
  }
  
  public String getRegion()
  {
    return region;
  }
  
  public String getResourceName()
  {
    return resourceName;
  }
  
  public String getResourceURL()
  {
    return resourceURL;
  }
  
  public long getTimestamp()
  {
    return timestamp;
  }
  
  public void recalculateTimeStampMessage(long paramLong)
  {
    long l = getDiffInMinutes(paramLong);
    if ((needToRecalculate == true) && (l > timeRemainingForNextChange)) {
      setTimeStampString(paramLong);
    }
  }
  
  public void setAdobeID(String paramString)
  {
    adobeID = paramString;
  }
  
  public void setDisplayName(String paramString)
  {
    displayName = paramString;
  }
  
  public void setFirstName(String paramString)
  {
    firstName = paramString;
  }
  
  public void setLastName(String paramString)
  {
    lastName = paramString;
  }
  
  public void setLocalState(AdobePushNotificationState paramAdobePushNotificationState)
  {
    local_state = paramAdobePushNotificationState;
  }
  
  public void setNotificationID(String paramString)
  {
    notificationID = paramString;
  }
  
  public void setNotificationType(AdobePushNotificationSubType paramAdobePushNotificationSubType)
  {
    notificationType = paramAdobePushNotificationSubType;
  }
  
  public void setRegion(String paramString)
  {
    region = paramString;
  }
  
  public void setResourceName(String paramString)
  {
    resourceName = paramString;
  }
  
  public void setResourceURL(String paramString)
  {
    resourceURL = paramString;
  }
  
  public void setServerState(AdobePushNotificationState paramAdobePushNotificationState)
  {
    server_state = paramAdobePushNotificationState;
  }
  
  public void setTimestamp(long paramLong)
  {
    timestamp = paramLong;
  }
}
