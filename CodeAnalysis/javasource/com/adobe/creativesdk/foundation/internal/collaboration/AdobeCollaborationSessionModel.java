package com.adobe.creativesdk.foundation.internal.collaboration;

import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkHttpServiceDelegate;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.util.Timer;
import java.util.TimerTask;

public class AdobeCollaborationSessionModel
  implements IAdobeNetworkHttpServiceDelegate
{
  private static AdobeCollaborationSessionModel _sharedModel = null;
  private AdobeCollaborationSession _session = null;
  
  private AdobeCollaborationSessionModel() {}
  
  public static AdobeCollaborationSessionModel getSharedModel()
  {
    if (_sharedModel == null) {
      _sharedModel = new AdobeCollaborationSessionModel();
    }
    return _sharedModel;
  }
  
  public boolean HTTPServiceAuthenticationDidFail(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    boolean bool = false;
    if (!paramAdobeNetworkHttpService.hasEncounteredTooManyAuthFailures())
    {
      bool = AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().reAuthenticate();
      paramAdobeNetworkHttpService.setAccessToken(AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken());
    }
    for (;;)
    {
      if (bool) {
        paramAdobeNetworkHttpService.setSuspended(false);
      }
      return bool;
      AdobeLogger.log(Level.ERROR, "AdobeStorageModel", "Too many authentication failures have occurred within the last 5 minutes.");
      paramAdobeNetworkHttpService.setAccessToken(null);
    }
  }
  
  public void HTTPServiceDidDisconnect(final AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    final Timer localTimer = new Timer();
    localTimer.schedule(new TimerTask()
    {
      boolean triedReconnecting = false;
      
      public void run()
      {
        if (paramAdobeNetworkHttpService.isConnected())
        {
          cancel();
          localTimer.cancel();
          return;
        }
        if (!triedReconnecting)
        {
          paramAdobeNetworkHttpService.reconnect();
          triedReconnecting = true;
          return;
        }
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeStorageServiceDisconnectedNotification, null));
        cancel();
        localTimer.cancel();
      }
    }, 15000L, 15000L);
  }
  
  public void HTTPServiceIsActive(AdobeNetworkHttpService paramAdobeNetworkHttpService) {}
  
  public void login() {}
  
  public void logout()
  {
    _session = null;
  }
  
  public void setCollaborationSession(AdobeCollaborationSession paramAdobeCollaborationSession)
  {
    _session = paramAdobeCollaborationSession;
  }
}
