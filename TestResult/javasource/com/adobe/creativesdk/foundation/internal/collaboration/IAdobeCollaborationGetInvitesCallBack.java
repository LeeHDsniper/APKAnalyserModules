package com.adobe.creativesdk.foundation.internal.collaboration;

import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import java.util.ArrayList;

public abstract interface IAdobeCollaborationGetInvitesCallBack
  extends IAdobeCollaborationErrorCallback
{
  public abstract void onComplete(ArrayList<AdobeCollaborationInvite> paramArrayList);
}
