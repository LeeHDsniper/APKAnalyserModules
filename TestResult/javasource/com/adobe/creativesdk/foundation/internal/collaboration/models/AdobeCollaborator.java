package com.adobe.creativesdk.foundation.internal.collaboration.models;

public class AdobeCollaborator
  extends AdobeCollaboratorInvitation
{
  private String _email;
  private String _name;
  private boolean _owner;
  private String _userID;
  
  public AdobeCollaborator()
  {
    setIsInvite(false);
  }
  
  public String getEmail()
  {
    return _email;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public String getUserID()
  {
    return _userID;
  }
  
  public boolean isOwner()
  {
    return _owner;
  }
  
  public void setEmail(String paramString)
  {
    _email = paramString;
  }
  
  public void setName(String paramString)
  {
    _name = paramString;
  }
  
  public void setOwner(boolean paramBoolean)
  {
    _owner = paramBoolean;
  }
  
  public void setUserId(String paramString)
  {
    _userID = paramString;
  }
}
