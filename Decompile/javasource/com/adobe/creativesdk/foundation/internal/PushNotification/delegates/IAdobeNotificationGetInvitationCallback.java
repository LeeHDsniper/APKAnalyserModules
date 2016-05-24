package com.adobe.creativesdk.foundation.internal.PushNotification.delegates;

import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import java.util.ArrayList;

public abstract interface IAdobeNotificationGetInvitationCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(ArrayList<AdobeCollaborationInvite> paramArrayList);
}
