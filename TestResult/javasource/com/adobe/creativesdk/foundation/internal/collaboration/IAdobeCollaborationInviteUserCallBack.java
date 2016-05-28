package com.adobe.creativesdk.foundation.internal.collaboration;

import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;

public abstract interface IAdobeCollaborationInviteUserCallBack
  extends IAdobeCollaborationErrorCallback
{
  public abstract void onComplete(AdobeCollaborationInvite paramAdobeCollaborationInvite);
}
