package com.adobe.creativesdk.foundation.internal.collaboration;

import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;

public class AdobeAssetFolderCollaboration
{
  AdobeAssetFolder _folder;
  
  public AdobeAssetFolderCollaboration()
  {
    _folder = null;
  }
  
  public AdobeAssetFolderCollaboration(AdobeAssetFolder paramAdobeAssetFolder)
  {
    _folder = paramAdobeAssetFolder;
  }
  
  public AdobeAssetFolder getCollaboratedFolder()
  {
    return _folder;
  }
  
  public void getCollaboration(IAdobeCollaborationGetCollaborationCallback paramIAdobeCollaborationGetCollaborationCallback)
  {
    if (_folder == null) {
      return;
    }
    AdobeCollaborationSession.getSharedSession().getCollaboration(_folder, paramIAdobeCollaborationGetCollaborationCallback);
  }
}
