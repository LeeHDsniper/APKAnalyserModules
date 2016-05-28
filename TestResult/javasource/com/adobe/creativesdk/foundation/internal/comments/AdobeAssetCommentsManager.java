package com.adobe.creativesdk.foundation.internal.comments;

import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationSession;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;

public class AdobeAssetCommentsManager
{
  AdobeAsset targetAsset;
  
  public AdobeAssetCommentsManager(AdobeAsset paramAdobeAsset)
  {
    targetAsset = paramAdobeAsset;
  }
  
  public void addComments(String paramString, IAdobeAddCommentCallback paramIAdobeAddCommentCallback)
  {
    AdobeCollaborationSession localAdobeCollaborationSession = AdobeCollaborationSession.getSharedSession();
    Object localObject = AdobeUXAuthManager.getSharedAuthManager();
    String str = ((AdobeUXAuthManager)localObject).getUserProfile().getDisplayName();
    localObject = ((AdobeUXAuthManager)localObject).getUserProfile().getEmail();
    localAdobeCollaborationSession.createComment(targetAsset, str, (String)localObject, paramString, paramIAdobeAddCommentCallback);
  }
  
  public void deleteComment(String paramString, IAdobeDeleteCommentCallback paramIAdobeDeleteCommentCallback)
  {
    AdobeCollaborationSession.getSharedSession().deleteComment(paramString, paramIAdobeDeleteCommentCallback);
  }
  
  public void getComments(IAdobeGetCommentsCallback paramIAdobeGetCommentsCallback)
  {
    AdobeCollaborationSession.getSharedSession().getComments(targetAsset, paramIAdobeGetCommentsCallback);
  }
}
