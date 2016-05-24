package com.adobe.creativesdk.foundation.internal.PushNotification.model;

import android.util.Pair;
import com.adobe.creativesdk.foundation.internal.PushNotification.utils.AdobePushNotificationQueue;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobePushNotificationModel
{
  private static boolean populateSharedPreferences = true;
  private HashMap<String, AdobePushNotification> _activitiesList = new HashMap();
  private HashMap<String, ArrayList<AdobePushNotification>> _assetCommentsCount = new HashMap();
  private HashMap<String, AdobeCollaborationInvite> _invitationList = new HashMap();
  private AdobePushNotificationDataModel pushNotificationDataModel = AdobePushNotificationDataModel.getSharedNotificationDataModel();
  
  public AdobePushNotificationModel()
  {
    pushNotificationDataModel.clearSharedPreferences();
  }
  
  public static void clearSharedPreference()
  {
    AdobePushNotificationDataModel localAdobePushNotificationDataModel = AdobePushNotificationDataModel.getSharedNotificationDataModel();
    if (localAdobePushNotificationDataModel != null) {
      localAdobePushNotificationDataModel.clearSharedPreferences();
    }
  }
  
  private static AdobeCommentPushNotification getCommentNotification(JSONObject paramJSONObject)
  {
    AdobeCommentPushNotification localAdobeCommentPushNotification = new AdobeCommentPushNotification();
    JSONObject localJSONObject = paramJSONObject.optJSONObject("asset");
    if (localJSONObject != null)
    {
      localAdobeCommentPushNotification.setRegion(localJSONObject.optString("region"));
      localAdobeCommentPushNotification.setResourceName(localJSONObject.optString("name"));
      localAdobeCommentPushNotification.setResourceURL(localJSONObject.optString("url"));
    }
    paramJSONObject = paramJSONObject.optJSONObject("user");
    if (paramJSONObject != null)
    {
      localAdobeCommentPushNotification.setFirstName(paramJSONObject.optString("firstName"));
      localAdobeCommentPushNotification.setLastName(paramJSONObject.optString("lastName"));
      localAdobeCommentPushNotification.setAdobeID(paramJSONObject.optString("userId"));
      localAdobeCommentPushNotification.setDisplayName(localAdobeCommentPushNotification.getFirstName() + " " + localAdobeCommentPushNotification.getLastName());
    }
    return localAdobeCommentPushNotification;
  }
  
  private long getCurrentTime()
  {
    return System.currentTimeMillis();
  }
  
  private static AdobeInvitationAcceptPushNotification getInvitationNotification(JSONObject paramJSONObject)
  {
    AdobeInvitationAcceptPushNotification localAdobeInvitationAcceptPushNotification = new AdobeInvitationAcceptPushNotification();
    JSONObject localJSONObject = paramJSONObject.optJSONObject("folder");
    if (localJSONObject != null)
    {
      localAdobeInvitationAcceptPushNotification.setRegion(localJSONObject.optString("region"));
      localAdobeInvitationAcceptPushNotification.setResourceName(localJSONObject.optString("name"));
      localAdobeInvitationAcceptPushNotification.setResourceURL(localJSONObject.optString("url"));
    }
    paramJSONObject = paramJSONObject.optJSONObject("user");
    if (paramJSONObject != null)
    {
      localAdobeInvitationAcceptPushNotification.setFirstName(paramJSONObject.optString("firstName"));
      localAdobeInvitationAcceptPushNotification.setLastName(paramJSONObject.optString("lastName"));
      localAdobeInvitationAcceptPushNotification.setAdobeID(paramJSONObject.optString("userId"));
      localAdobeInvitationAcceptPushNotification.setDisplayName(paramJSONObject.optString("displayName"));
    }
    return localAdobeInvitationAcceptPushNotification;
  }
  
  private JSONObject getPayloadObjectForSharedPref(AdobePushNotification paramAdobePushNotification)
  {
    JSONObject localJSONObject = new JSONObject();
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType[paramAdobePushNotification.getNotificationType().ordinal()])
    {
    default: 
      return null;
    case 3: 
      try
      {
        localJSONObject.put("state", paramAdobePushNotification.getLocalState().toString());
        localJSONObject.put("region", paramAdobePushNotification.getRegion());
        localJSONObject.put("assetUrl", paramAdobePushNotification.getResourceURL());
        localJSONObject.put("assetName", paramAdobePushNotification.getResourceName());
        localJSONObject.put("senderName", paramAdobePushNotification.getDisplayName());
        localJSONObject.put("user-Id", paramAdobePushNotification.getAdobeID());
        localJSONObject.put("timestamp", paramAdobePushNotification.getTimestamp());
        localJSONObject.put("comment", ((AdobeCommentPushNotification)paramAdobePushNotification).getComment());
        return localJSONObject;
      }
      catch (JSONException paramAdobePushNotification)
      {
        paramAdobePushNotification.printStackTrace();
        return localJSONObject;
      }
    }
    try
    {
      localJSONObject.put("UserName", paramAdobePushNotification.getDisplayName());
      try
      {
        localJSONObject.put("state", paramAdobePushNotification.getLocalState().toString());
        localJSONObject.put("region", paramAdobePushNotification.getRegion());
        localJSONObject.put("folderUrl", paramAdobePushNotification.getResourceURL());
        localJSONObject.put("folderName", paramAdobePushNotification.getResourceName());
        localJSONObject.put("user-Id", paramAdobePushNotification.getAdobeID());
        localJSONObject.put("timestamp", paramAdobePushNotification.getTimestamp());
        return localJSONObject;
      }
      catch (JSONException paramAdobePushNotification)
      {
        paramAdobePushNotification.printStackTrace();
        return localJSONObject;
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
  }
  
  private String getSelfAdobeID()
  {
    return AdobeAuthIdentityManagementService.getSharedInstance().getAdobeID();
  }
  
  private void insertNewActivityIntoSharedPref(AdobePushNotification paramAdobePushNotification)
  {
    if ((!isSelfComment(paramAdobePushNotification)) && (!pushNotificationDataModel.contains(paramAdobePushNotification.getNotificationID(), paramAdobePushNotification.getNotificationType())))
    {
      JSONObject localJSONObject = getPayloadObjectForSharedPref(paramAdobePushNotification);
      pushNotificationDataModel.insertCommentOrInviteAccept(paramAdobePushNotification.getNotificationID(), localJSONObject.toString(), paramAdobePushNotification.getNotificationType());
    }
  }
  
  private void insertNewInviteIntoSharedPref(AdobeCollaborationInvite paramAdobeCollaborationInvite)
  {
    JSONObject localJSONObject = new JSONObject();
    if (!pushNotificationDataModel.contains(paramAdobeCollaborationInvite.getInviteID(), AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED)) {}
    try
    {
      localJSONObject.put("state", AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_NEW.toString());
      localJSONObject.put("senderName", paramAdobeCollaborationInvite.getSenderUserName());
      localJSONObject.put("folderName", paramAdobeCollaborationInvite.getResourceName());
      localJSONObject.put("acceptRequest", paramAdobeCollaborationInvite.getInviteID());
      pushNotificationDataModel.insertInvite(paramAdobeCollaborationInvite.getInviteID(), localJSONObject.toString());
      return;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
  }
  
  private boolean isSelfComment(AdobePushNotification paramAdobePushNotification)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramAdobePushNotification.getNotificationType() == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT)
    {
      bool1 = bool2;
      if (getSelfAdobeID() != null)
      {
        bool1 = bool2;
        if (getSelfAdobeID().equals(paramAdobePushNotification.getAdobeID())) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  private void removeActivityFromSharedPref(String paramString, AdobePushNotificationSubType paramAdobePushNotificationSubType)
  {
    pushNotificationDataModel.deleteCommentOrInviteAccept(paramString, paramAdobePushNotificationSubType);
  }
  
  public void clearActivitiesList()
  {
    if (_activitiesList != null) {
      _activitiesList.clear();
    }
  }
  
  public void clearInvitationList()
  {
    if (_invitationList != null) {
      _invitationList.clear();
    }
  }
  
  public ArrayList<AdobePushNotification> getActivitiesList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = _activitiesList.values().iterator();
    while (localIterator.hasNext())
    {
      AdobePushNotification localAdobePushNotification = (AdobePushNotification)localIterator.next();
      localAdobePushNotification.recalculateTimeStampMessage(getCurrentTime());
      localArrayList.add(localAdobePushNotification);
    }
    Collections.sort(localArrayList, new NotificationComparator());
    return localArrayList;
  }
  
  public int getAssetCommentCount(String paramString)
  {
    if (paramString == null) {}
    while (!_assetCommentsCount.containsKey(paramString)) {
      return 0;
    }
    return ((ArrayList)_assetCommentsCount.get(paramString)).size();
  }
  
  public ArrayList<AdobeCollaborationInvite> getInvitationList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = _invitationList.values().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((AdobeCollaborationInvite)localIterator.next());
    }
    return localArrayList;
  }
  
  public int getInvitationListSize()
  {
    if (_invitationList != null) {
      return _invitationList.size();
    }
    return 0;
  }
  
  public int markNotificationsForAssetsAsRead(String paramString, boolean paramBoolean)
  {
    int j = 0;
    if (_assetCommentsCount.containsKey(paramString))
    {
      ArrayList localArrayList = (ArrayList)_assetCommentsCount.get(paramString);
      int k = localArrayList.size();
      AdobePushNotificationQueue.getPushNotificationQueue().putNotificationInQueue(localArrayList);
      _assetCommentsCount.remove(paramString);
      j = k;
      if (paramBoolean)
      {
        int i = 0;
        for (;;)
        {
          j = k;
          if (i >= localArrayList.size()) {
            break;
          }
          removeActivityFromSharedPref(((AdobePushNotification)localArrayList.get(i)).getNotificationID(), AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT);
          i += 1;
        }
      }
    }
    return j;
  }
  
  public Pair<Long, Integer> populateActivitiesList(JSONArray paramJSONArray)
  {
    long l3 = 0L;
    int k = 0;
    int m = 0;
    for (;;)
    {
      int j;
      long l2;
      if (m < paramJSONArray.length())
      {
        int i = k;
        long l1 = l3;
        Object localObject2;
        Object localObject3;
        for (;;)
        {
          try
          {
            Object localObject1 = paramJSONArray.getJSONObject(m);
            i = k;
            l1 = l3;
            j = k;
            l2 = l3;
            if (!((JSONObject)localObject1).optString("type").equals("com.adobe.stormcloud.v1")) {
              break label918;
            }
            i = k;
            l1 = l3;
            l3 = ((JSONObject)localObject1).optLong("timestamp");
            i = k;
            l1 = l3;
            localObject2 = AdobePushNotificationSubType.getValue(((JSONObject)localObject1).optString("sub-type"));
            i = k;
            l1 = l3;
            if (localObject2 == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER)
            {
              j = k + 1;
              i = j;
              l1 = l3;
              localObject3 = new JSONObject(((JSONObject)localObject1).optString("payload"));
              i = j;
              l1 = l3;
              localObject2 = ((JSONObject)localObject1).optString("notification-id");
              i = j;
              l1 = l3;
              localObject3 = getInvitationNotification((JSONObject)localObject3);
              i = j;
              l1 = l3;
              ((AdobePushNotification)localObject3).setNotificationType(AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER);
              i = j;
              l1 = l3;
              ((AdobePushNotification)localObject3).setTimestamp(l3);
              i = j;
              l1 = l3;
              ((AdobePushNotification)localObject3).setNotificationID((String)localObject2);
              i = j;
              l1 = l3;
              localObject1 = AdobePushNotificationState.getValue(((JSONObject)localObject1).optString("state"));
              i = j;
              l1 = l3;
              ((AdobePushNotification)localObject3).recalculateTimeStampMessage(getCurrentTime());
              i = j;
              l1 = l3;
              ((AdobePushNotification)localObject3).setLocalState((AdobePushNotificationState)localObject1);
              i = j;
              l1 = l3;
              ((AdobePushNotification)localObject3).setServerState((AdobePushNotificationState)localObject1);
              i = j;
              l1 = l3;
              _activitiesList.put(localObject2, localObject3);
              l2 = l3;
            }
            else
            {
              i = k;
              l1 = l3;
              if (localObject2 == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT)
              {
                j = k + 1;
                i = j;
                l1 = l3;
                localObject3 = new JSONObject(((JSONObject)localObject1).optString("payload"));
                i = j;
                l1 = l3;
                localObject2 = ((JSONObject)localObject1).optString("notification-id");
                i = j;
                l1 = l3;
                localObject3 = getCommentNotification((JSONObject)localObject3);
                i = j;
                l1 = l3;
                ((AdobePushNotification)localObject3).setNotificationType(AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT);
                i = j;
                l1 = l3;
                ((AdobePushNotification)localObject3).setTimestamp(l3);
                i = j;
                l1 = l3;
                ((AdobePushNotification)localObject3).setNotificationID((String)localObject2);
                i = j;
                l1 = l3;
                ((AdobePushNotification)localObject3).recalculateTimeStampMessage(getCurrentTime());
                i = j;
                l1 = l3;
                localObject1 = AdobePushNotificationState.getValue(((JSONObject)localObject1).optString("state"));
                if (localObject1 != null)
                {
                  i = j;
                  l1 = l3;
                  if (localObject1 == AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_NEW)
                  {
                    i = j;
                    l1 = l3;
                    ((AdobePushNotification)localObject3).setLocalState(AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_NEW);
                    i = j;
                    l1 = l3;
                    ((AdobePushNotification)localObject3).setServerState(AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_NEW);
                    i = j;
                    l1 = l3;
                    localObject1 = ((AdobePushNotification)localObject3).getRegion() + "/" + ((AdobePushNotification)localObject3).getResourceURL().substring(((AdobePushNotification)localObject3).getResourceURL().lastIndexOf('/') + 1);
                    i = j;
                    l1 = l3;
                    if (_assetCommentsCount.containsKey(localObject1))
                    {
                      i = j;
                      l1 = l3;
                      ((ArrayList)_assetCommentsCount.get(localObject1)).add(localObject3);
                      i = j;
                      l1 = l3;
                      _activitiesList.put(localObject2, localObject3);
                      l2 = l3;
                    }
                  }
                }
              }
            }
          }
          catch (JSONException localJSONException)
          {
            localJSONException.printStackTrace();
            j = i;
            l2 = l1;
          }
          i = j;
          l1 = l3;
          ArrayList localArrayList = new ArrayList();
          i = j;
          l1 = l3;
          localArrayList.add(localObject3);
          i = j;
          l1 = l3;
          _assetCommentsCount.put(localJSONException, localArrayList);
          continue;
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject3).setLocalState(AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED);
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject3).setServerState(AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED);
        }
        i = k;
        l1 = l3;
        j = k;
        l2 = l3;
        if (localObject2 == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF)
        {
          j = k + 1;
          i = j;
          l1 = l3;
          localObject2 = getInvitationNotification(new JSONObject(localJSONException.optString("payload")));
          i = j;
          l1 = l3;
          localObject3 = localJSONException.optString("notification-id");
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject2).setNotificationType(AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF);
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject2).setTimestamp(l3);
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject2).setNotificationID((String)localObject3);
          i = j;
          l1 = l3;
          AdobePushNotificationState localAdobePushNotificationState = AdobePushNotificationState.getValue(localJSONException.optString("state"));
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject2).recalculateTimeStampMessage(getCurrentTime());
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject2).setServerState(localAdobePushNotificationState);
          i = j;
          l1 = l3;
          ((AdobePushNotification)localObject2).setLocalState(localAdobePushNotificationState);
          i = j;
          l1 = l3;
          _activitiesList.put(localObject3, localObject2);
          l2 = l3;
        }
      }
      else
      {
        return new Pair(Long.valueOf(l3), Integer.valueOf(k));
      }
      label918:
      m += 1;
      k = j;
      l3 = l2;
    }
  }
  
  public void populateSharedPref(int paramInt)
  {
    if (populateSharedPreferences)
    {
      populateSharedPreferences = false;
      pushNotificationDataModel.clearSharedPreferences();
      ArrayList localArrayList = getInvitationList();
      int i = 0;
      while (i < localArrayList.size())
      {
        insertNewInviteIntoSharedPref((AdobeCollaborationInvite)localArrayList.get(i));
        i += 1;
      }
      i = paramInt - localArrayList.size();
      localArrayList = getActivitiesList();
      paramInt = i;
      if (i > localArrayList.size()) {
        paramInt = localArrayList.size();
      }
      i = 0;
      while (i < paramInt)
      {
        if ((((AdobePushNotification)localArrayList.get(i)).getLocalState() == AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_NEW) && (!isSelfComment((AdobePushNotification)localArrayList.get(i)))) {
          insertNewActivityIntoSharedPref((AdobePushNotification)localArrayList.get(i));
        }
        i += 1;
      }
    }
  }
  
  public void setInvitations(ArrayList<AdobeCollaborationInvite> paramArrayList)
  {
    int i = 0;
    while (i < paramArrayList.size())
    {
      _invitationList.put(((AdobeCollaborationInvite)paramArrayList.get(i)).getInviteID(), paramArrayList.get(i));
      i += 1;
    }
  }
  
  class NotificationComparator
    implements Comparator<AdobePushNotification>
  {
    NotificationComparator() {}
    
    public int compare(AdobePushNotification paramAdobePushNotification1, AdobePushNotification paramAdobePushNotification2)
    {
      int j = 0;
      int i;
      if (paramAdobePushNotification1.getTimestamp() > paramAdobePushNotification2.getTimestamp())
      {
        i = 1;
        if (i == 0) {
          break label32;
        }
        j = -1;
      }
      for (;;)
      {
        return j;
        i = 0;
        break;
        label32:
        if (paramAdobePushNotification1.getTimestamp() == paramAdobePushNotification2.getTimestamp()) {}
        for (i = 1; i == 0; i = 0) {
          return 1;
        }
      }
    }
  }
}
