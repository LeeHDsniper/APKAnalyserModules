package com.adobe.creativesdk.foundation.internal.notification;

import java.util.Map;

public class AdobeNotification
{
  private Map<String, Object> _info = null;
  private IAdobeNotificationID _notificationID = null;
  
  public AdobeNotification(IAdobeNotificationID paramIAdobeNotificationID, Map<String, Object> paramMap)
  {
    _notificationID = paramIAdobeNotificationID;
    _info = paramMap;
  }
  
  public final IAdobeNotificationID getId()
  {
    return _notificationID;
  }
  
  public final Map<String, Object> getInfo()
  {
    return _info;
  }
}
