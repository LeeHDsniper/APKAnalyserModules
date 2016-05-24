package com.adobe.creativesdk.foundation.internal.collaboration;

import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaboration;

public abstract interface IAdobeCollaborationGetCollaborationCallback
  extends IAdobeCollaborationErrorCallback
{
  public abstract void onComplete(AdobeCollaboration paramAdobeCollaboration);
}
