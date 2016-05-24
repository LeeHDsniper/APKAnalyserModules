package com.adobe.creativesdk.foundation.internal.analytics;

import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import java.util.HashMap;
import java.util.Map;

public class AdobeAnalyticsSDKReporter
{
  public static final String AdobeAnalyticsShareTargetBehanceProject = "Behance-Project";
  public static final String AdobeAnalyticsShareTargetBehanceWIP = "Behance-WIP";
  public static final String AdobeAnalyticsShareTypePublishFailure = "Publish Failure";
  public static final String AdobeAnalyticsShareTypePublishSuccess = "Publish Success";
  public static final String AdobeAnalyticsShareTypePublishUXCancel = "Publish UX Cancel";
  public static final String AdobeAnalyticsShareTypePublishUXStart = "Publish UX Start";
  
  static void addGlobalAnalyticsFields(Map<String, Object> paramMap)
  {
    label161:
    label204:
    label223:
    label229:
    for (;;)
    {
      Object localObject;
      try
      {
        AdobeUXAuthManager localAdobeUXAuthManager = AdobeUXAuthManager.getSharedAuthManager();
        localObject = localAdobeUXAuthManager.getUserProfile();
        AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.getSharedInstance();
        if (paramMap.get("adb.user.profile.profileId") == null)
        {
          if (localObject != null)
          {
            localObject = ((AdobeAuthUserProfile)localObject).getAdobeID();
            if (localObject == null) {
              continue;
            }
            paramMap.put("adb.user.profile.profileId", localObject);
          }
        }
        else
        {
          paramMap.put("adb.user.profile.attributes.clientId", localAdobeAuthIdentityManagementService.getClientID());
          if (paramMap.get("adb.page.pageInfo.SKDsUtilized") != null) {
            break label161;
          }
          paramMap.put("adb.page.pageInfo.SKDsUtilized", "Creative SDK Android");
          boolean bool = localAdobeUXAuthManager.isAuthenticated();
          localObject = Boolean.valueOf(AdobeNetworkReachabilityUtil.getSharedInstance().isOnline());
          if (!Boolean.valueOf(bool).booleanValue()) {
            break label204;
          }
          if (!((Boolean)localObject).booleanValue()) {
            break label223;
          }
          localObject = "Logged In : Online";
          paramMap.put("adb.user.profile.attributes.authStatus", localObject);
          return;
        }
        localObject = null;
        continue;
        paramMap.put("adb.user.profile.profileId", "Unknown");
        continue;
        paramMap.put("adb.page.pageInfo.SKDsUtilized", paramMap.get("adb.page.pageInfo.SKDsUtilized") + "|" + "Creative SDK Android");
      }
      finally {}
      continue;
      if (((Boolean)localObject).booleanValue())
      {
        localObject = "Logged Out : Online";
      }
      else
      {
        localObject = "Logged Out : Offline";
        break label229;
        localObject = "Logged In : Offline";
      }
    }
  }
  
  public static void trackAction(String paramString, Map<String, Object> paramMap)
  {
    try
    {
      paramMap.put("adb.event.eventInfo.eventName", paramString);
      addGlobalAnalyticsFields(paramMap);
      AdobeAnalyticsSession.getSharedInstance().trackAction(paramString, paramMap);
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public static void trackAssetBrowserAction(String paramString)
  {
    try
    {
      HashMap localHashMap = new HashMap(20);
      localHashMap.put("adb.event.eventInfo.eventAction", paramString);
      trackAction("Asset Browser Action", localHashMap);
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public static void trackAuthStep(String paramString1, String paramString2)
  {
    try
    {
      HashMap localHashMap = new HashMap(20);
      if (paramString2 != null) {
        localHashMap.put("adb.user.profile.profileId", paramString2);
      }
      localHashMap.put("adb.event.eventInfo.eventAction", paramString1);
      trackAction("Auth Step", localHashMap);
      return;
    }
    finally {}
  }
  
  public static void trackRegStep(String paramString1, String paramString2)
  {
    try
    {
      paramString2 = new HashMap(20);
      paramString2.put("adb.event.eventInfo.eventAction", paramString1);
      trackAction("Registration Step", paramString2);
      return;
    }
    finally
    {
      paramString1 = finally;
      throw paramString1;
    }
  }
  
  public static void trackSharingAction(String paramString1, String paramString2)
  {
    try
    {
      HashMap localHashMap = new HashMap(20);
      localHashMap.put("adb.event.eventInfo.eventAction", paramString1);
      localHashMap.put("adb.event.eventInfo.type", paramString2);
      trackAction("Sharing Action", localHashMap);
      return;
    }
    finally
    {
      paramString1 = finally;
      throw paramString1;
    }
  }
}
