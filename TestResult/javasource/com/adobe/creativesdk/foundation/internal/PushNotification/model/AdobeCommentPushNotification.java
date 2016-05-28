package com.adobe.creativesdk.foundation.internal.PushNotification.model;

public class AdobeCommentPushNotification
  extends AdobePushNotification
{
  private String comment;
  
  public AdobeCommentPushNotification()
  {
    setNotificationType(AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT);
  }
  
  public String getComment()
  {
    return comment;
  }
}
