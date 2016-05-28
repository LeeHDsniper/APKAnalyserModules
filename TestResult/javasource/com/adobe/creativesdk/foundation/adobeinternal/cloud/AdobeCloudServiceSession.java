package com.adobe.creativesdk.foundation.adobeinternal.cloud;

import com.adobe.creativesdk.foundation.AdobeCSDKFoundation;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthManager;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkHttpServiceDelegate;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.notification.IAdobeNotificationID;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.net.URL;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Observable;
import java.util.Observer;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

public abstract class AdobeCloudServiceSession
  implements IAdobeNetworkHttpServiceDelegate, Observer
{
  private boolean _checkIsAuthenticated;
  private Timer _connectionTimer;
  private IAdobeNotificationID _disconnectionNotifier;
  private AdobeCloudEndpoint _endpoint;
  private HashMap<String, AdobeNetworkHttpService> _httpServices = new HashMap();
  private Timer _ongoingConnectionTimer;
  private boolean _privateService;
  private boolean _triedReconnecting;
  private boolean _useOngoingTimer;
  
  static
  {
    if (!AdobeCloudServiceSession.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public AdobeCloudServiceSession()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, this);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginExternalNotification, this);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, this);
  }
  
  protected AdobeCloudServiceSession(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    this();
    configureEndpoint(paramAdobeCloudEndpoint);
  }
  
  private void checkServiceConnection()
  {
    if (!AdobeUXAuthManager.getSharedAuthManager().isAuthenticated()) {
      stopConnectionTimer();
    }
    for (;;)
    {
      return;
      if (!_useOngoingTimer)
      {
        Iterator localIterator = _httpServices.entrySet().iterator();
        while (localIterator.hasNext())
        {
          AdobeNetworkHttpService localAdobeNetworkHttpService = (AdobeNetworkHttpService)((Map.Entry)localIterator.next()).getValue();
          if (localAdobeNetworkHttpService == null)
          {
            AdobeLogger.log(Level.ERROR, AdobeCloudServiceSession.class.getSimpleName(), "Network service not set up for " + getClass().getSimpleName() + " timer");
          }
          else if (_disconnectionNotifier == null)
          {
            AdobeLogger.log(Level.ERROR, AdobeCloudServiceSession.class.getSimpleName(), "Disconnect notifier not set up for " + getClass().getSimpleName() + " timer");
          }
          else if (localAdobeNetworkHttpService.isConnected())
          {
            AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), getClass().getSimpleName() + " isConnected is true.  Cancel timer.");
            _connectionTimer.cancel();
            _connectionTimer = null;
          }
          else if (!_triedReconnecting)
          {
            AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), "Attempting to reconnect " + getClass().getSimpleName());
            localAdobeNetworkHttpService.reconnect();
            _triedReconnecting = true;
          }
          else
          {
            AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), "Failed to reconnect " + getClass().getSimpleName() + ". Sending " + _disconnectionNotifier);
            AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(_disconnectionNotifier, null));
            localAdobeNetworkHttpService.reconnect();
            if (_connectionTimer != null)
            {
              _connectionTimer.cancel();
              _connectionTimer = null;
            }
            _triedReconnecting = false;
          }
        }
      }
    }
  }
  
  private void ongoingCheckServiceConnection()
  {
    if ((_checkIsAuthenticated) && (!AdobeUXAuthManager.getSharedAuthManager().isAuthenticated())) {
      stopOngoingConnectionTimer();
    }
    for (;;)
    {
      return;
      if (_useOngoingTimer)
      {
        Iterator localIterator = _httpServices.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Object localObject = (Map.Entry)localIterator.next();
          AdobeNetworkHttpService localAdobeNetworkHttpService = (AdobeNetworkHttpService)((Map.Entry)localObject).getValue();
          localObject = (String)((Map.Entry)localObject).getKey();
          if (localAdobeNetworkHttpService == null)
          {
            AdobeLogger.log(Level.ERROR, AdobeCloudServiceSession.class.getSimpleName(), "Network service not set up for " + getClass().getSimpleName() + " timer");
          }
          else if (_disconnectionNotifier == null)
          {
            AdobeLogger.log(Level.ERROR, AdobeCloudServiceSession.class.getSimpleName(), "Disconnect notification not set up for " + getClass().getSimpleName() + " timer");
          }
          else if (!localAdobeNetworkHttpService.isConnected())
          {
            AdobeLogger.log(Level.ERROR, AdobeCloudServiceSession.class.getSimpleName(), "Ongoing timer.  Attempting to reconnect " + getClass().getSimpleName());
            localAdobeNetworkHttpService.reconnect();
          }
        }
      }
    }
  }
  
  private boolean refreshAccessTokenForService(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    boolean bool = AdobeAuthManager.sharedAuthManager().reAuthenticate();
    if (bool)
    {
      paramAdobeNetworkHttpService.setAccessToken(AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken());
      paramAdobeNetworkHttpService.setSuspended(false);
    }
    return bool;
  }
  
  private void setupConnectionTimer(long paramLong, AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    if (!_useOngoingTimer)
    {
      Object localObject2 = null;
      Iterator localIterator = _httpServices.entrySet().iterator();
      do
      {
        localObject1 = localObject2;
        if (!localIterator.hasNext()) {
          break;
        }
        localObject1 = (Map.Entry)localIterator.next();
      } while (!paramAdobeNetworkHttpService.equals(((Map.Entry)localObject1).getValue()));
      Object localObject1 = (AdobeNetworkHttpService)((Map.Entry)localObject1).getValue();
      if (localObject1 == null) {
        _httpServices.put("default", paramAdobeNetworkHttpService);
      }
      if (_connectionTimer == null)
      {
        AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), "Check connection for in " + paramLong + " secs.");
        _connectionTimer = new Timer();
        paramAdobeNetworkHttpService = new TimerTask()
        {
          public void run()
          {
            AdobeCloudServiceSession.this.checkServiceConnection();
          }
        };
        _connectionTimer.scheduleAtFixedRate(paramAdobeNetworkHttpService, 0L, 1000L * paramLong);
      }
    }
  }
  
  private void stopConnectionTimer()
  {
    if (_connectionTimer != null) {
      try
      {
        AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), "Stopping connection timer");
        _connectionTimer.cancel();
        _connectionTimer = null;
        _triedReconnecting = false;
        return;
      }
      finally {}
    }
  }
  
  public boolean HTTPServiceAuthenticationDidFail(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    return refreshAccessTokenForService(paramAdobeNetworkHttpService);
  }
  
  public void HTTPServiceDidDisconnect(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    setupConnectionTimer(15L, paramAdobeNetworkHttpService);
  }
  
  public void HTTPServiceIsActive(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    stopConnectionTimer();
  }
  
  protected void configureEndpoint(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.getSharedInstance();
    String str = localAdobeAuthIdentityManagementService.getAccessToken();
    HashMap localHashMap = new HashMap();
    Object localObject = String.format("%s%s", new Object[] { "CreativeSDK", AdobeCSDKFoundation.getVersion() });
    assert (localAdobeAuthIdentityManagementService.getClientID() != null) : "clientID not initialized by the authentication module.";
    localHashMap.put("x-api-key", localAdobeAuthIdentityManagementService.getClientID());
    localHashMap.put("x-creativesdk-versions", localObject);
    assert (paramAdobeCloudEndpoint.getServiceURLs() != null) : "Service endpoint URLs cannot be nil.";
    localObject = paramAdobeCloudEndpoint.getServiceURLs().entrySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
      AdobeNetworkHttpService localAdobeNetworkHttpService = new AdobeNetworkHttpService(((URL)localEntry.getValue()).toString(), localAdobeAuthIdentityManagementService.getClientID(), localHashMap);
      localAdobeNetworkHttpService.setAccessToken(str);
      localAdobeNetworkHttpService.setHttpServiceDelegate(this);
      _httpServices.put(localEntry.getKey(), localAdobeNetworkHttpService);
    }
    _endpoint = paramAdobeCloudEndpoint;
  }
  
  protected void finalize()
  {
    unInitialize();
  }
  
  public AdobeCloudEndpoint getCloudEndpoint()
  {
    return _endpoint;
  }
  
  public HashMap<String, AdobeNetworkHttpService> getHttpServices()
  {
    return _httpServices;
  }
  
  public AdobeNetworkHttpService getService()
  {
    return getServiceForSchemaId(null);
  }
  
  public AdobeNetworkHttpService getServiceForSchemaId(String paramString)
  {
    Object localObject = null;
    String str = paramString;
    if (paramString == null)
    {
      Iterator localIterator = _httpServices.entrySet().iterator();
      str = paramString;
      if (localIterator.hasNext()) {
        str = (String)((Map.Entry)localIterator.next()).getKey();
      }
    }
    paramString = localObject;
    if (str != null) {
      paramString = (AdobeNetworkHttpService)_httpServices.get(str);
    }
    return paramString;
  }
  
  public boolean isPrivateService()
  {
    return _privateService;
  }
  
  public void setDisconnectionNotifier(IAdobeNotificationID paramIAdobeNotificationID)
  {
    _disconnectionNotifier = paramIAdobeNotificationID;
  }
  
  public void setPrivateService(boolean paramBoolean)
  {
    _privateService = paramBoolean;
  }
  
  public void setUpService() {}
  
  protected void setupOngoingConnectionTimer(long paramLong, boolean paramBoolean)
  {
    _useOngoingTimer = true;
    _checkIsAuthenticated = paramBoolean;
    if (_ongoingConnectionTimer == null)
    {
      AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), "Set up " + getClass().getSimpleName() + " ongoing connection timer at " + paramLong + " secs.");
      _ongoingConnectionTimer = new Timer();
      TimerTask local2 = new TimerTask()
      {
        public void run()
        {
          AdobeCloudServiceSession.this.ongoingCheckServiceConnection();
        }
      };
      _ongoingConnectionTimer.scheduleAtFixedRate(local2, 0L, 1000L * paramLong);
    }
  }
  
  protected void stopOngoingConnectionTimer()
  {
    if (_ongoingConnectionTimer != null) {
      synchronized (_ongoingConnectionTimer)
      {
        _useOngoingTimer = false;
        AdobeLogger.log(Level.DEBUG, AdobeCloudServiceSession.class.getSimpleName(), "Stopping ongoing connection timer");
        _ongoingConnectionTimer.cancel();
        _ongoingConnectionTimer = null;
        return;
      }
    }
  }
  
  public void tearDownService()
  {
    Iterator localIterator = getHttpServices().values().iterator();
    while (localIterator.hasNext()) {
      ((AdobeNetworkHttpService)localIterator.next()).clearQueuedRequests();
    }
  }
  
  protected void unInitialize()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, this);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAuthLoginExternalNotification, this);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, this);
    tearDownService();
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    paramObservable = (AdobeNotification)paramObject;
    if ((paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLogoutNotification) && (paramObservable.getInfo() == null))
    {
      tearDownService();
      stopConnectionTimer();
      stopOngoingConnectionTimer();
      paramObservable = _httpServices.entrySet().iterator();
      while (paramObservable.hasNext()) {
        ((AdobeNetworkHttpService)((Map.Entry)paramObservable.next()).getValue()).clearQueuedRequests();
      }
      _httpServices.clear();
    }
    while ((paramObservable.getId() != AdobeInternalNotificationID.AdobeAuthLoginNotification) && (paramObservable.getId() != AdobeInternalNotificationID.AdobeAuthLoginExternalNotification)) {
      return;
    }
    paramObject = AdobeAuthIdentityManagementService.getSharedInstance();
    Iterator localIterator = _httpServices.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      AdobeNetworkHttpService localAdobeNetworkHttpService = (AdobeNetworkHttpService)localEntry.getValue();
      String str = (String)localEntry.getKey();
      localAdobeNetworkHttpService.setAccessToken(paramObject.getAccessToken());
      localAdobeNetworkHttpService.setSuspended(false);
      if (_endpoint != null)
      {
        assert (_endpoint.getServiceURLs() != null) : "Service endpoint URLs cannot be nil.";
        if (_endpoint.getServiceURLs() != null) {}
        for (paramObservable = (URL)_endpoint.getServiceURLs().get(str);; paramObservable = null)
        {
          if (paramObservable == null) {
            break label261;
          }
          localAdobeNetworkHttpService.setBaseURL(paramObservable);
          break;
        }
        label261:
        if ((_endpoint.getServiceURLs() != null) && (_endpoint.getServiceURLs().size() > 0)) {
          if (str == "default")
          {
            paramObservable = _endpoint.getServiceURLs().entrySet().iterator();
            if (localIterator.hasNext())
            {
              paramObservable = (Map.Entry)paramObservable.next();
              paramObservable = (String)localEntry.getKey();
            }
            localAdobeNetworkHttpService.setBaseURL((URL)_endpoint.getServiceURLs().get(str));
          }
          else
          {
            localAdobeNetworkHttpService.setBaseURL(null);
          }
        }
      }
    }
    setUpService();
  }
}
