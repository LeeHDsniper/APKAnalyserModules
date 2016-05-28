package com.adobe.creativesdk.foundation.internal.PushNotification.model;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobePushNotificationDataModel
{
  public static String ASSET_COUNT = "ASSET_COUNT";
  private static AdobePushNotificationDataModel _dataModel;
  private Context mContext = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
  String preference_file_comment_key = "com.adobe.creativecloud.NotificationsCommentDatabase";
  String preference_file_invite_accept_key = "com.adobe.creativecloud.NotificationsInviteAcceptDatabase";
  String preference_file_invite_key = "com.adobe.creativecloud.NotificationsInviteDatabase";
  SharedPreferences sharedCommentPref = mContext.getSharedPreferences(preference_file_comment_key, 0);
  SharedPreferences sharedInviteAcceptPref = mContext.getSharedPreferences(preference_file_invite_accept_key, 0);
  SharedPreferences sharedInvitePref = mContext.getSharedPreferences(preference_file_invite_key, 0);
  
  private AdobePushNotificationDataModel() {}
  
  public static AdobePushNotificationDataModel getSharedNotificationDataModel()
  {
    try
    {
      if (_dataModel == null) {
        _dataModel = new AdobePushNotificationDataModel();
      }
      AdobePushNotificationDataModel localAdobePushNotificationDataModel = _dataModel;
      return localAdobePushNotificationDataModel;
    }
    finally {}
  }
  
  private String getURLFromPayload(String paramString, AdobePushNotificationSubType paramAdobePushNotificationSubType)
  {
    try
    {
      paramString = new JSONObject(paramString);
      if ((paramAdobePushNotificationSubType == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER) || (paramAdobePushNotificationSubType == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF)) {
        return paramString.getString("folderUrl");
      }
      if (paramAdobePushNotificationSubType.equals(AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT))
      {
        paramString = paramString.getString("assetUrl");
        return paramString;
      }
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public void clearSharedPreferences()
  {
    SharedPreferences.Editor localEditor = sharedCommentPref.edit();
    localEditor.clear();
    localEditor.commit();
    localEditor = sharedInviteAcceptPref.edit();
    localEditor.clear();
    localEditor.commit();
    localEditor = sharedInvitePref.edit();
    localEditor.clear();
    localEditor.commit();
  }
  
  public boolean contains(String paramString, AdobePushNotificationSubType paramAdobePushNotificationSubType)
  {
    boolean bool = true;
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType[paramAdobePushNotificationSubType.ordinal()])
    {
    default: 
      bool = false;
    }
    do
    {
      do
      {
        do
        {
          return bool;
        } while ((sharedCommentPref != null) && (sharedCommentPref.contains(paramString)));
        return false;
      } while ((sharedInviteAcceptPref != null) && (sharedInviteAcceptPref.contains(paramString)));
      return false;
    } while ((sharedInvitePref != null) && (sharedInvitePref.contains(paramString)));
    return false;
  }
  
  public boolean deleteCommentOrInviteAccept(String paramString, AdobePushNotificationSubType paramAdobePushNotificationSubType)
  {
    boolean bool2 = false;
    SharedPreferences.Editor localEditor;
    boolean bool1;
    int i;
    if (paramAdobePushNotificationSubType == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT)
    {
      paramAdobePushNotificationSubType = sharedCommentPref;
      localEditor = paramAdobePushNotificationSubType.edit();
      bool1 = bool2;
      if (paramAdobePushNotificationSubType.contains(paramString))
      {
        i = paramAdobePushNotificationSubType.getInt(ASSET_COUNT, 0);
        if (paramAdobePushNotificationSubType.getAll().size() != 3) {
          break label124;
        }
        localEditor.putInt(ASSET_COUNT, 0);
      }
    }
    for (;;)
    {
      localEditor.remove(paramString);
      localEditor.commit();
      bool1 = true;
      do
      {
        return bool1;
        if (paramAdobePushNotificationSubType == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF) {
          break;
        }
        bool1 = bool2;
      } while (paramAdobePushNotificationSubType != AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER);
      paramAdobePushNotificationSubType = sharedInviteAcceptPref;
      break;
      label124:
      if ((i == 1) && (paramAdobePushNotificationSubType.getAll().size() > 3)) {
        localEditor.putInt(ASSET_COUNT, 1);
      } else {
        localEditor.putInt(ASSET_COUNT, 2);
      }
    }
  }
  
  public boolean insertCommentOrInviteAccept(String paramString1, String paramString2, AdobePushNotificationSubType paramAdobePushNotificationSubType)
  {
    boolean bool2 = false;
    Object localObject;
    SharedPreferences.Editor localEditor;
    boolean bool1;
    int i;
    if (paramAdobePushNotificationSubType == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT)
    {
      localObject = sharedCommentPref;
      localEditor = ((SharedPreferences)localObject).edit();
      bool1 = bool2;
      if (!((SharedPreferences)localObject).contains(paramString1))
      {
        i = ((SharedPreferences)localObject).getInt(ASSET_COUNT, 0);
        paramAdobePushNotificationSubType = getURLFromPayload(paramString2, paramAdobePushNotificationSubType);
        if (i != 0) {
          break label139;
        }
        localEditor.putString("assetUrl", paramAdobePushNotificationSubType);
        localEditor.putInt(ASSET_COUNT, 1);
      }
    }
    for (;;)
    {
      localEditor.putString(paramString1, paramString2);
      localEditor.commit();
      bool1 = true;
      do
      {
        return bool1;
        if (paramAdobePushNotificationSubType == AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF) {
          break;
        }
        bool1 = bool2;
      } while (paramAdobePushNotificationSubType != AdobePushNotificationSubType.ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER);
      localObject = sharedInviteAcceptPref;
      break;
      label139:
      if (i == 1)
      {
        localObject = ((SharedPreferences)localObject).getString("assetUrl", null);
        if ((localObject != null) && (!((String)localObject).equals(paramAdobePushNotificationSubType))) {
          localEditor.putInt(ASSET_COUNT, 2);
        }
      }
      else
      {
        localEditor.putInt(ASSET_COUNT, i + 1);
      }
    }
  }
  
  public boolean insertInvite(String paramString1, String paramString2)
  {
    SharedPreferences.Editor localEditor = sharedInvitePref.edit();
    if (!sharedInvitePref.contains(paramString1))
    {
      localEditor.putString(paramString1, paramString2);
      localEditor.commit();
      return true;
    }
    return false;
  }
}
