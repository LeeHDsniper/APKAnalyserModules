package com.adobe.creativesdk.foundation.adobeinternal.imageservice;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudEndpoint;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceSession;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

public class AdobeImageSession
  extends AdobeCloudServiceSession
{
  private static String TAG;
  private static long totalPhysicalMemory;
  private String imageSessionTmpDir = null;
  private Map<AdobeNetworkHttpRequest, AdobeNetworkHttpTaskHandle> requestMap;
  
  static
  {
    if (!AdobeImageSession.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      totalPhysicalMemory = -1L;
      TAG = AdobeImageSession.class.getSimpleName();
      return;
    }
  }
  
  public AdobeImageSession(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    super(paramAdobeCloudEndpoint);
    createTmpDir();
    setUpService();
    setDisconnectionNotifier(AdobeInternalNotificationID.AdobeImageServiceDisconnectedNotification);
    setupOngoingConnectionTimer(15L, false);
    requestMap = new HashMap();
  }
  
  protected static AdobeCloudEndpoint getServiceEndpoint()
  {
    Object localObject = null;
    AdobeAuthIMSEnvironment localAdobeAuthIMSEnvironment = AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
    switch (14.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[localAdobeAuthIMSEnvironment.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, AdobeImageSession.class.getSimpleName(), "An undefined authentication endpoint has been specified.");
    }
    for (;;)
    {
      try
      {
        localObject = new AdobeCloudEndpoint("imageservices", new URL((String)localObject), AdobeCloudServiceType.AdobeCloudServiceTypeImage);
        return localObject;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        localMalformedURLException.printStackTrace();
      }
      localObject = "https://cc-api-image.adobe.io";
      continue;
      localObject = "https://cc-api-image-stage.adobe.io";
      continue;
      localObject = "https://cc-api-image-labs.adobe.io";
    }
    return null;
  }
  
  public static AdobeCloudServiceSession getSessionForCloudEndpoint(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    AdobeCloudEndpoint localAdobeCloudEndpoint = paramAdobeCloudEndpoint;
    if (paramAdobeCloudEndpoint == null) {
      localAdobeCloudEndpoint = getServiceEndpoint();
    }
    return new AdobeImageSession(localAdobeCloudEndpoint);
  }
  
  protected String createTmpDir()
  {
    try
    {
      String str = FilenameUtils.concat(FileUtils.getTempDirectoryPath(), "ImageSessionTemp");
      File localFile = new File(str);
      if (!localFile.exists()) {
        localFile.mkdirs();
      }
      if (localFile.exists()) {
        imageSessionTmpDir = str;
      }
      boolean bool = localFile.exists();
      if (!bool) {
        str = null;
      }
      return str;
    }
    finally {}
  }
  
  public void setUpService() {}
  
  public void tearDownService()
  {
    super.tearDownService();
  }
}
