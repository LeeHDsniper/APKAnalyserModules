package com.adobe.creativesdk.foundation.internal.collaboration.models;

public abstract class AdobeCollaboratorInvitation
{
  private boolean isInvite;
  
  public AdobeCollaboratorInvitation() {}
  
  public abstract String getEmail();
  
  public boolean isInvite()
  {
    return isInvite;
  }
  
  public boolean isOwner()
  {
    if (isInvite() == true) {
      return false;
    }
    return ((AdobeCollaborator)this).isOwner();
  }
  
  public void setIsInvite(boolean paramBoolean)
  {
    isInvite = paramBoolean;
  }
}
