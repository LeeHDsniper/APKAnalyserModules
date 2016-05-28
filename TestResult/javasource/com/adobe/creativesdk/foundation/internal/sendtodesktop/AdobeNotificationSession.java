package com.adobe.creativesdk.foundation.internal.sendtodesktop;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudEndpoint;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceSession;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.net.MalformedURLException;
import java.net.URL;

public class AdobeNotificationSession
  extends AdobeCloudServiceSession
{
  public AdobeNotificationSession(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    super(paramAdobeCloudEndpoint);
    setUpService();
    setDisconnectionNotifier(AdobeInternalNotificationID.AdobeNotificationServiceDisconnectedNotification);
    setupOngoingConnectionTimer(15L, false);
  }
  
  protected static AdobeCloudEndpoint getServiceEndpoint()
  {
    Object localObject = null;
    AdobeAuthIMSEnvironment localAdobeAuthIMSEnvironment = AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[localAdobeAuthIMSEnvironment.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, AdobeNotificationSession.class.getSimpleName(), "An undefined authentication endpoint has been specified.");
    }
    for (;;)
    {
      try
      {
        localObject = new AdobeCloudEndpoint(null, new URL((String)localObject), AdobeCloudServiceType.AdobeCloudServiceTypeNotification);
        return localObject;
      }
      catch (MalformedURLException localMalformedURLException) {}
      localObject = "https://ans.adobe.io/ans/v1/notifications";
      continue;
      localObject = "https://stg-ans.adobe.io/ans/v1/notifications";
    }
    return null;
  }
  
  public static AdobeCloudServiceSession getSessionForCloudEndpoint(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    AdobeCloudEndpoint localAdobeCloudEndpoint = paramAdobeCloudEndpoint;
    if (paramAdobeCloudEndpoint == null) {
      localAdobeCloudEndpoint = getServiceEndpoint();
    }
    return new AdobeNotificationSession(localAdobeCloudEndpoint);
  }
  
  public void setUpService() {}
  
  public void tearDownService()
  {
    super.tearDownService();
  }
}
