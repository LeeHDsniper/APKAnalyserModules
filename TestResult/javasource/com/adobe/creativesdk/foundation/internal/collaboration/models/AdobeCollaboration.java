package com.adobe.creativesdk.foundation.internal.collaboration.models;

import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import java.util.ArrayList;
import java.util.Collections;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeCollaboration
{
  private static ArrayList<AdobeCollaborator> _collaborators;
  private static ArrayList<AdobeCollaborationInvite> _invites;
  private static ArrayList<AdobeCollaboratorInvitation> _invitesCollaborators;
  private static String _ownerId;
  private static String _selfAdobeID = null;
  
  private AdobeCollaboration()
  {
    _ownerId = null;
    _collaborators = new ArrayList();
    _invites = new ArrayList();
    _invitesCollaborators = new ArrayList();
  }
  
  public static AdobeCollaboration collaborationWithDictionary(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null)
    {
      paramJSONObject = null;
      return paramJSONObject;
    }
    for (;;)
    {
      try
      {
        AdobeCollaboration localAdobeCollaboration = new AdobeCollaboration();
        int k = -1;
        int j = -1;
        _ownerId = paramJSONObject.getString("ownerId");
        Object localObject1 = getSelfAdobeID();
        Object localObject2 = paramJSONObject.getJSONArray("collaborators");
        int i = 0;
        if (i < ((JSONArray)localObject2).length())
        {
          JSONObject localJSONObject = ((JSONArray)localObject2).getJSONObject(i);
          AdobeCollaborator localAdobeCollaborator = new AdobeCollaborator();
          localAdobeCollaborator.setEmail(localJSONObject.getString("email"));
          localAdobeCollaborator.setName(localJSONObject.getString("name"));
          localAdobeCollaborator.setUserId(localJSONObject.getString("userId"));
          if (localAdobeCollaborator.getUserID().equals(_ownerId))
          {
            bool = true;
            localAdobeCollaborator.setOwner(bool);
            int m = k;
            if (k == -1)
            {
              m = k;
              if (localAdobeCollaborator.getUserID().equals(_ownerId)) {
                m = i;
              }
            }
            int n = j;
            if (j == -1)
            {
              n = j;
              if (localAdobeCollaborator.getUserID().equals(localObject1)) {
                n = i;
              }
            }
            _collaborators.add(localAdobeCollaborator);
            _invitesCollaborators.add(localAdobeCollaborator);
            i += 1;
            k = m;
            j = n;
          }
        }
        else
        {
          if ((k != -1) && (j != -1))
          {
            i = j;
            if (k != 0)
            {
              Collections.swap(_invitesCollaborators, 0, k);
              i = j;
              if (j == 0)
              {
                j = k;
                i = j;
                if (j != 1)
                {
                  Collections.swap(_invitesCollaborators, 1, j);
                  i = j;
                }
              }
            }
            if (i != k) {
              Collections.swap(_invitesCollaborators, 1, i);
            }
          }
          localObject1 = paramJSONObject.getJSONArray("invites");
          i = 0;
          paramJSONObject = localAdobeCollaboration;
          if (i >= ((JSONArray)localObject1).length()) {
            break;
          }
          paramJSONObject = ((JSONArray)localObject1).getJSONObject(i);
          localObject2 = new AdobeCollaborationInvite();
          ((AdobeCollaborationInvite)localObject2).setCreatedDate(paramJSONObject.getString("created"));
          ((AdobeCollaborationInvite)localObject2).setInviteID(paramJSONObject.getString("id"));
          ((AdobeCollaborationInvite)localObject2).setSenderUserName(paramJSONObject.getString("senderName"));
          ((AdobeCollaborationInvite)localObject2).setEmail(paramJSONObject.getString("recipientEmail"));
          _invites.add(localObject2);
          _invitesCollaborators.add(localObject2);
          i += 1;
          continue;
        }
        boolean bool = false;
      }
      catch (JSONException paramJSONObject)
      {
        paramJSONObject.printStackTrace();
        return null;
      }
    }
  }
  
  private static String getSelfAdobeID()
  {
    if (_selfAdobeID == null) {
      _selfAdobeID = AdobeUXAuthManager.getSharedAuthManager().getUserProfile().getAdobeID();
    }
    return _selfAdobeID;
  }
  
  public ArrayList<AdobeCollaboratorInvitation> getCollaboratorsAndInvites()
  {
    return _invitesCollaborators;
  }
}
