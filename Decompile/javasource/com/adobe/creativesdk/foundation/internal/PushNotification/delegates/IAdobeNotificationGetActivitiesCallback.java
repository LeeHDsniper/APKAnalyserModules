package com.adobe.creativesdk.foundation.internal.PushNotification.delegates;

import com.adobe.creativesdk.foundation.internal.PushNotification.model.AdobePushNotification;
import java.util.ArrayList;

public abstract interface IAdobeNotificationGetActivitiesCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(ArrayList<AdobePushNotification> paramArrayList);
}
