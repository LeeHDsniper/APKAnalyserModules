package com.adobe.creativesdk.foundation.internal.collaboration.models;

import org.json.JSONException;
import org.json.JSONObject;

public class AdobeCollaborationInvite
  extends AdobeCollaboratorInvitation
{
  private String _createdDate;
  private String _inviteID;
  private String _recipientEmail;
  private String _resourceName;
  private String _senderUserName;
  private boolean isInProgressMode = false;
  
  public AdobeCollaborationInvite()
  {
    setIsInvite(true);
  }
  
  public static AdobeCollaborationInvite inviteWithDictionary(JSONObject paramJSONObject)
  {
    try
    {
      AdobeCollaborationInvite localAdobeCollaborationInvite = new AdobeCollaborationInvite();
      localAdobeCollaborationInvite.setInviteID(paramJSONObject.getString("id"));
      localAdobeCollaborationInvite.setResourceName(paramJSONObject.getString("resourceName"));
      try
      {
        localAdobeCollaborationInvite.setSenderUserName(paramJSONObject.getString("senderName"));
        localAdobeCollaborationInvite.setCreatedDate(paramJSONObject.getString("created"));
      }
      catch (JSONException localJSONException1)
      {
        for (;;)
        {
          try
          {
            localAdobeCollaborationInvite.setEmail(paramJSONObject.getString("recipientEmail"));
            return localAdobeCollaborationInvite;
          }
          catch (JSONException paramJSONObject)
          {
            localAdobeCollaborationInvite.setEmail(null);
            return localAdobeCollaborationInvite;
          }
          localJSONException1 = localJSONException1;
          localAdobeCollaborationInvite.setSenderUserName(null);
          try
          {
            localAdobeCollaborationInvite.setSenderUserName(paramJSONObject.getString("senderLastName"));
          }
          catch (JSONException localJSONException2)
          {
            localJSONException1.printStackTrace();
          }
        }
      }
      return null;
    }
    catch (JSONException paramJSONObject) {}
  }
  
  public String getEmail()
  {
    return _recipientEmail;
  }
  
  public String getInviteID()
  {
    return _inviteID;
  }
  
  public String getResourceName()
  {
    return _resourceName;
  }
  
  public String getSenderUserName()
  {
    return _senderUserName;
  }
  
  public void setCreatedDate(String paramString)
  {
    _createdDate = paramString;
  }
  
  public void setEmail(String paramString)
  {
    _recipientEmail = paramString;
  }
  
  public void setInviteID(String paramString)
  {
    _inviteID = paramString;
  }
  
  public void setResourceName(String paramString)
  {
    _resourceName = paramString;
  }
  
  public void setSenderUserName(String paramString)
  {
    _senderUserName = paramString;
  }
}
