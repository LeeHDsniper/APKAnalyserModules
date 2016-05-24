package com.adobe.creativesdk.foundation.internal.PushNotification.controller;

import android.util.Pair;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability.AdobeNetworkStatus;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeDeviceRegistrationCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeDeviceUnregisterCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeGoogleRegistrationCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeNotificationGetActivitiesCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeNotificationGetInvitationCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeNotificationInterface;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeUpdateNotificationCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.model.AdobePushNotification;
import com.adobe.creativesdk.foundation.internal.PushNotification.model.AdobePushNotificationModel;
import com.adobe.creativesdk.foundation.internal.PushNotification.model.AdobePushNotificationState;
import com.adobe.creativesdk.foundation.internal.PushNotification.utils.AdobePushNotificationQueue;
import com.adobe.creativesdk.foundation.internal.ans.delegates.IAdobeNotificationQueryCallback;
import com.adobe.creativesdk.foundation.internal.ans.delegates.IAdobeNotificationUnreadCountCallback;
import com.adobe.creativesdk.foundation.internal.ans.service.AdobeANSSession;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationException;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationSession;
import com.adobe.creativesdk.foundation.internal.collaboration.IAdobeCollaborationGetInvitesCallBack;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeNotificationManager
{
  private static String _adobeAppID;
  private static String _deviceID;
  private static String _googleRegistrationID;
  private static String _pacakageName;
  private static AdobePushNotificationModel _pushNotificationDataModel;
  private static int _unReadCount = -1;
  private static boolean isCurrentCloudPublic;
  private static boolean isNotificationSwitchedOn = true;
  private static long lastTimeStampFetched;
  public static IAdobeNotificationInterface mNotificationInterface;
  private static AdobeNotificationManager mSharedManager = null;
  static AdobeNetworkHttpService service = null;
  private final int MAX_READ_ACTIVITIES_ALLOWED = 100;
  private ArrayList<IAdobeNotificationGetActivitiesCallback> _activitiesRequestQueue = new ArrayList();
  private Observer _cloud_switching_observer;
  private ArrayList<IAdobeNotificationGetInvitationCallback> _invitationsRequestQueue = new ArrayList();
  private Observer _login_notification_observer;
  private Observer _network_reachability_observer;
  private Observer _notification_switch_observer;
  private boolean hasErrorOccuredWhileFetchingActivities = false;
  private boolean hasErrorOccuredWhileFetchingInvitations = false;
  private boolean isCurrentlyFetchingActivities = false;
  private boolean isCurrentlyFetchingInvitations = false;
  
  private AdobeNotificationManager()
  {
    _pushNotificationDataModel = new AdobePushNotificationModel();
    registerLocalNofications();
  }
  
  private ArrayList<AdobePushNotification> getActivitiesList()
  {
    return _pushNotificationDataModel.getActivitiesList();
  }
  
  public static int getAssetCommentCount(String paramString)
  {
    if (_pushNotificationDataModel != null) {
      return _pushNotificationDataModel.getAssetCommentCount(paramString);
    }
    return 0;
  }
  
  private ArrayList<AdobeCollaborationInvite> getInvitationList()
  {
    return _pushNotificationDataModel.getInvitationList();
  }
  
  public static AdobeNotificationManager getNotificationManager()
  {
    if (mSharedManager == null) {
      startNotificationManager();
    }
    return mSharedManager;
  }
  
  public static int getUnreadCount()
  {
    if (_unReadCount != -1) {
      return _unReadCount;
    }
    return 0;
  }
  
  private void handleActivitiesRequests(boolean paramBoolean)
  {
    isCurrentlyFetchingActivities = false;
    int i;
    if (paramBoolean)
    {
      ArrayList localArrayList = getActivitiesList();
      i = 0;
      while (i < _activitiesRequestQueue.size())
      {
        ((IAdobeNotificationGetActivitiesCallback)_activitiesRequestQueue.get(i)).onSuccess(localArrayList);
        i += 1;
      }
    }
    for (hasErrorOccuredWhileFetchingActivities = false;; hasErrorOccuredWhileFetchingActivities = true)
    {
      _activitiesRequestQueue.clear();
      handleSharedPreferences();
      return;
      i = 0;
      while (i < _activitiesRequestQueue.size())
      {
        ((IAdobeNotificationGetActivitiesCallback)_activitiesRequestQueue.get(i)).onError();
        i += 1;
      }
    }
  }
  
  private void handleInvitationRequests(boolean paramBoolean)
  {
    isCurrentlyFetchingInvitations = false;
    int i;
    if (paramBoolean)
    {
      ArrayList localArrayList = getInvitationList();
      i = 0;
      while (i < _invitationsRequestQueue.size())
      {
        ((IAdobeNotificationGetInvitationCallback)_invitationsRequestQueue.get(i)).onSuccess(localArrayList);
        i += 1;
      }
    }
    for (hasErrorOccuredWhileFetchingInvitations = false;; hasErrorOccuredWhileFetchingInvitations = true)
    {
      _invitationsRequestQueue.clear();
      handleSharedPreferences();
      return;
      i = 0;
      while (i < _invitationsRequestQueue.size())
      {
        ((IAdobeNotificationGetInvitationCallback)_invitationsRequestQueue.get(i)).onError();
        i += 1;
      }
    }
  }
  
  private void handleSharedPreferences()
  {
    if ((!isCurrentlyFetchingActivities) && (!isCurrentlyFetchingInvitations)) {
      _pushNotificationDataModel.populateSharedPref(_unReadCount);
    }
  }
  
  private void handleSwitchToPrivateCloud()
  {
    if (isCurrentCloudPublic()) {
      setCurrentCloudStatus(false);
    }
  }
  
  private void handleSwitchToPublicCloud()
  {
    if (!isCurrentCloudPublic())
    {
      setCurrentCloudStatus(true);
      startFetchingData();
    }
  }
  
  public static boolean isCurrentCloudPublic()
  {
    return isCurrentCloudPublic;
  }
  
  public static boolean isNotificationSwitchedOn()
  {
    return isNotificationSwitchedOn;
  }
  
  private void loadAppData(IAdobeNotificationInterface paramIAdobeNotificationInterface)
  {
    mNotificationInterface = paramIAdobeNotificationInterface;
    _pacakageName = mNotificationInterface.getFullPackageName();
    _adobeAppID = mNotificationInterface.getAdobeAppID();
    mNotificationInterface.registerGCM(new IAdobeGoogleRegistrationCallback() {});
  }
  
  private static void logout()
  {
    AdobeANSSession.resetSharedSession();
    service = null;
    _deviceID = null;
    if (_pushNotificationDataModel != null)
    {
      _pushNotificationDataModel.clearActivitiesList();
      _pushNotificationDataModel.clearInvitationList();
    }
  }
  
  private void queryActivitiesFromANS()
  {
    int i = 30;
    if (isCurrentCloudPublic())
    {
      isCurrentlyFetchingActivities = true;
      _pushNotificationDataModel.clearActivitiesList();
      if (_unReadCount > 30) {
        i = _unReadCount;
      }
      queryNotifications(0L, 0L, i);
    }
  }
  
  private void queryInvitationFromCollaborator()
  {
    if (isCurrentCloudPublic())
    {
      isCurrentlyFetchingInvitations = true;
      _pushNotificationDataModel.clearInvitationList();
      AdobeCollaborationSession.getSharedSession().getInvites(new IAdobeCollaborationGetInvitesCallBack()
      {
        public void onComplete(ArrayList<AdobeCollaborationInvite> paramAnonymousArrayList)
        {
          AdobeNotificationManager._pushNotificationDataModel.setInvitations(paramAnonymousArrayList);
          AdobeNotificationManager.this.handleInvitationRequests(true);
        }
        
        public void onError(AdobeCollaborationException paramAnonymousAdobeCollaborationException)
        {
          AdobeNotificationManager.this.handleInvitationRequests(false);
        }
      });
    }
  }
  
  private void queryNotifications(long paramLong1, long paramLong2, int paramInt)
  {
    if ((_deviceID != null) && (_deviceID.length() > 0))
    {
      queryNotificationsByPage(paramLong1, paramLong2, paramInt);
      return;
    }
    handleActivitiesRequests(false);
  }
  
  private void queryNotificationsByPage(final long paramLong1, long paramLong2, final int paramInt)
  {
    int i = 10;
    if (paramInt > 10) {}
    for (;;)
    {
      AdobeANSSession localAdobeANSSession = AdobeANSSession.sharedSession();
      if (localAdobeANSSession != null)
      {
        IAdobeNotificationQueryCallback local10 = new IAdobeNotificationQueryCallback()
        {
          public void onError()
          {
            AdobeNotificationManager.this.handleActivitiesRequests(false);
          }
          
          public void onSuccess(JSONObject paramAnonymousJSONObject)
          {
            int i;
            try
            {
              paramAnonymousJSONObject = (JSONArray)((JSONObject)paramAnonymousJSONObject.get("notifications")).opt("notification");
              if ((paramAnonymousJSONObject == null) || (paramAnonymousJSONObject.length() == 0)) {
                break label130;
              }
              paramAnonymousJSONObject = AdobeNotificationManager._pushNotificationDataModel.populateActivitiesList(paramAnonymousJSONObject);
              AdobeNotificationManager.access$1102(((Long)first).longValue());
              i = ((Integer)second).intValue();
              if (AdobeNotificationManager.lastTimeStampFetched == 0L)
              {
                AdobeNotificationManager.this.handleActivitiesRequests(true);
                return;
              }
              if (paramInt - i == 0)
              {
                AdobeNotificationManager.this.handleActivitiesRequests(true);
                return;
              }
            }
            catch (JSONException paramAnonymousJSONObject)
            {
              paramAnonymousJSONObject.printStackTrace();
              onError();
              return;
            }
            AdobeNotificationManager.this.queryNotificationsByPage(paramLong1, AdobeNotificationManager.lastTimeStampFetched - 1L, paramInt - i);
            return;
            label130:
            AdobeNotificationManager.this.handleActivitiesRequests(true);
          }
        };
        localAdobeANSSession.queryNotifications(_adobeAppID, _deviceID, paramLong1, paramLong2, i, local10);
      }
      return;
      i = paramInt;
    }
  }
  
  private void registerDevice()
  {
    if ((_googleRegistrationID != null) && (_googleRegistrationID.length() > 0) && ((_deviceID == null) || (_deviceID.length() == 0)))
    {
      isCurrentlyFetchingInvitations = true;
      isCurrentlyFetchingActivities = true;
      AdobeANSSession localAdobeANSSession = AdobeANSSession.sharedSession();
      if (localAdobeANSSession != null)
      {
        IAdobeDeviceRegistrationCallback local3 = new IAdobeDeviceRegistrationCallback()
        {
          public void onError() {}
          
          public void onSuccess(JSONObject paramAnonymousJSONObject)
          {
            AdobeNotificationManager.access$202(paramAnonymousJSONObject.optString("device-id"));
            AdobeNotificationManager.this.startFetchingData();
          }
        };
        localAdobeANSSession.registerDevice(_adobeAppID, _googleRegistrationID, _pacakageName, local3);
      }
    }
  }
  
  private static void sendNewCountToAssetBrowser(int paramInt)
  {
    _unReadCount = paramInt;
    HashMap localHashMap = new HashMap();
    localHashMap.put("unreadCount", Integer.valueOf(paramInt));
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeCCFilesRefreshNotificationCount, localHashMap));
  }
  
  public static void setCurrentCloudStatus(boolean paramBoolean)
  {
    isCurrentCloudPublic = paramBoolean;
  }
  
  public static void setNotificationSwitchStatus(boolean paramBoolean)
  {
    isNotificationSwitchedOn = paramBoolean;
  }
  
  private void startFetchingData()
  {
    queryUnreadNotificationsCount(new IAdobeNotificationUnreadCountCallback()
    {
      public void onError()
      {
        AdobeNotificationManager.this.queryInvitationFromCollaborator();
        AdobeNotificationManager.this.queryActivitiesFromANS();
      }
      
      public void onSuccess(int paramAnonymousInt)
      {
        AdobeNotificationManager.access$402(paramAnonymousInt);
        AdobeNotificationManager.sendNewCountToAssetBrowser(paramAnonymousInt);
        AdobeNotificationManager.this.queryInvitationFromCollaborator();
        AdobeNotificationManager.this.queryActivitiesFromANS();
      }
    });
  }
  
  public static void startNotificationManager()
  {
    if (mSharedManager == null) {
      mSharedManager = new AdobeNotificationManager();
    }
    if (isNotificationSwitchedOn()) {
      mSharedManager.loadAppData(mNotificationInterface);
    }
  }
  
  public static void unRegisterDevice()
  {
    if (mSharedManager != null) {
      mSharedManager.unRegisterDevice(new IAdobeDeviceUnregisterCallback()
      {
        public void onError() {}
        
        public void onSuccess()
        {
          AdobeNotificationManager.access$202(null);
        }
      });
    }
  }
  
  private void updateNotification(AdobePushNotificationState paramAdobePushNotificationState)
  {
    ArrayList localArrayList = AdobePushNotificationQueue.getPushNotificationQueue().getReadNotificationsList();
    AdobeANSSession localAdobeANSSession = AdobeANSSession.sharedSession();
    IAdobeUpdateNotificationCallback local6 = new IAdobeUpdateNotificationCallback()
    {
      public void onError() {}
      
      public void onSuccess(JSONObject paramAnonymousJSONObject)
      {
        AdobePushNotificationQueue.getPushNotificationQueue().handleNotificationResponse(paramAnonymousJSONObject);
      }
    };
    if (localAdobeANSSession != null)
    {
      if (paramAdobePushNotificationState == AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_NEW) {
        localAdobeANSSession.updateNotifications(_adobeAppID, localArrayList, "NEW", local6);
      }
    }
    else {
      return;
    }
    localAdobeANSSession.updateNotifications(_adobeAppID, localArrayList, "EXPIRED", local6);
  }
  
  private void wentOffline() {}
  
  private void wentOnline()
  {
    if ((_deviceID == null) && (isNotificationSwitchedOn())) {
      if ((_googleRegistrationID == null) || (_googleRegistrationID.equals(""))) {
        if (mNotificationInterface != null) {
          mNotificationInterface.registerGCM(new IAdobeGoogleRegistrationCallback() {});
        }
      }
    }
    while ((_deviceID == null) || (isNotificationSwitchedOn()))
    {
      return;
      registerDevice();
      return;
    }
    unRegisterDevice();
  }
  
  public void markNotificationsForAssetsAsRead(String paramString, boolean paramBoolean)
  {
    int i = _pushNotificationDataModel.markNotificationsForAssetsAsRead(paramString, paramBoolean);
    _unReadCount -= i;
    if (_unReadCount < _pushNotificationDataModel.getInvitationListSize()) {}
    for (i = _pushNotificationDataModel.getInvitationListSize();; i = _unReadCount)
    {
      _unReadCount = i;
      sendNewCountToAssetBrowser(_unReadCount);
      updateNotification(AdobePushNotificationState.ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED);
      return;
    }
  }
  
  public void queryUnreadNotificationsCount(IAdobeNotificationUnreadCountCallback paramIAdobeNotificationUnreadCountCallback)
  {
    if ((_deviceID != null) && (_deviceID.length() > 0))
    {
      AdobeANSSession localAdobeANSSession = AdobeANSSession.sharedSession();
      if (localAdobeANSSession != null) {
        localAdobeANSSession.queryUnreadNotificationCount(_adobeAppID, _deviceID, paramIAdobeNotificationUnreadCountCallback);
      }
      return;
    }
    paramIAdobeNotificationUnreadCountCallback.onError();
  }
  
  protected void registerLocalNofications()
  {
    if (_network_reachability_observer == null) {
      _network_reachability_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (AdobeNetworkReachability.AdobeNetworkStatus)((AdobeNotification)paramAnonymousObject).getInfo().get("AdobeNetworkReachabilityStatusKey");
          switch (AdobeNotificationManager.16.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode[networkStatusCode.ordinal()])
          {
          default: 
            AdobeNotificationManager.this.wentOffline();
            return;
          }
          AdobeNotificationManager.this.wentOnline();
        }
      };
    }
    if (_login_notification_observer == null) {
      _login_notification_observer = new LoginNotificationObserver(null);
    }
    if (_cloud_switching_observer == null) {
      _cloud_switching_observer = new CloudChangeNotificationObserver(null);
    }
    if (_notification_switch_observer == null) {
      _notification_switch_observer = new NotificationSwitchChangeListener(null);
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, _login_notification_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, _login_notification_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginExternalNotification, _login_notification_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNotificationManagerNotificationSwitchChange, _notification_switch_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNotificationManagerSwitchedToPrivateCloudNotification, _cloud_switching_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNotificationManagerSwitchedToPublicCloudNotification, _cloud_switching_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
  }
  
  public void unRegisterDevice(IAdobeDeviceUnregisterCallback paramIAdobeDeviceUnregisterCallback)
  {
    if ((_deviceID != null) && (_deviceID.length() > 0))
    {
      AdobeANSSession localAdobeANSSession = AdobeANSSession.sharedSession();
      if (localAdobeANSSession != null) {
        localAdobeANSSession.unregisterDevice(_adobeAppID, _deviceID, paramIAdobeDeviceUnregisterCallback);
      }
      return;
    }
    paramIAdobeDeviceUnregisterCallback.onError();
  }
  
  private class CloudChangeNotificationObserver
    implements Observer
  {
    private CloudChangeNotificationObserver() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      if (((AdobeNotification)paramObject).getId() == AdobeInternalNotificationID.AdobeNotificationManagerSwitchedToPrivateCloudNotification)
      {
        AdobeNotificationManager.this.handleSwitchToPrivateCloud();
        return;
      }
      AdobeNotificationManager.this.handleSwitchToPublicCloud();
    }
  }
  
  private class LoginNotificationObserver
    implements Observer
  {
    private LoginNotificationObserver() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if ((paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLoginNotification) || (paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLoginExternalNotification))
      {
        AdobePushNotificationModel.clearSharedPreference();
        AdobeNotificationManager.this.registerDevice();
      }
      while (paramObservable.getId() != AdobeInternalNotificationID.AdobeAuthLogoutNotification) {
        return;
      }
      AdobePushNotificationModel.clearSharedPreference();
      AdobeNotificationManager.access$2000();
    }
  }
  
  private class NotificationSwitchChangeListener
    implements Observer
  {
    private NotificationSwitchChangeListener() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      boolean bool = ((Boolean)((AdobeNotification)paramObject).getInfo().get("notification_state")).booleanValue();
      AdobeNotificationManager.setNotificationSwitchStatus(bool);
      if (bool == true) {
        if (AdobeNotificationManager._deviceID == null) {
          AdobeNotificationManager.this.registerDevice();
        }
      }
      while (AdobeNotificationManager._deviceID == null) {
        return;
      }
      AdobeNotificationManager.unRegisterDevice();
    }
  }
}
