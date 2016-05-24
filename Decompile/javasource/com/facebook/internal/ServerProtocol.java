package com.facebook.internal;

import com.facebook.Settings;
import java.util.Collection;

public final class ServerProtocol
{
  public static final Collection<String> errorsProxyAuthDisabled = Utility.unmodifiableCollection(new String[] { "service_disabled", "AndroidAuthKillSwitchException" });
  public static final Collection<String> errorsUserCanceled = Utility.unmodifiableCollection(new String[] { "access_denied", "OAuthAccessDeniedException" });
  
  public static final String getAPIVersion()
  {
    if (Settings.getPlatformCompatibilityEnabled()) {
      return "v1.0";
    }
    return "v2.1";
  }
  
  public static final String getDialogAuthority()
  {
    return String.format("m.%s", new Object[] { Settings.getFacebookDomain() });
  }
  
  public static final String getGraphUrlBase()
  {
    return String.format("https://graph.%s", new Object[] { Settings.getFacebookDomain() });
  }
  
  public static final String getGraphVideoUrlBase()
  {
    return String.format("https://graph-video.%s", new Object[] { Settings.getFacebookDomain() });
  }
}
