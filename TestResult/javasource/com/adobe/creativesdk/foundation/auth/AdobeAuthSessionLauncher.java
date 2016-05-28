package com.adobe.creativesdk.foundation.auth;

import android.app.Activity;
import android.content.Context;

public class AdobeAuthSessionLauncher
{
  private int _defaultIntentFlags = 0;
  private Activity _launcherActivity = null;
  private Context _launcherContext = null;
  private int _requestCode = 2002;
  
  private AdobeAuthSessionLauncher() {}
  
  public int getIntentFlags()
  {
    return _defaultIntentFlags;
  }
  
  public Context getLauncherActivity()
  {
    return _launcherActivity;
  }
  
  public Context getLauncherContext()
  {
    return _launcherContext;
  }
  
  public int getRequestCode()
  {
    return _requestCode;
  }
  
  public static class Builder
  {
    int _defaultIntentFlags = 0;
    Activity _launcherActivity = null;
    Context _launcherContext = null;
    int _requestCode = 2002;
    
    public Builder() {}
    
    public AdobeAuthSessionLauncher build()
    {
      if ((_launcherContext == null) && (_launcherActivity == null)) {
        throw new IllegalArgumentException("activity or context must be defined");
      }
      AdobeAuthSessionLauncher localAdobeAuthSessionLauncher = new AdobeAuthSessionLauncher(null);
      AdobeAuthSessionLauncher.access$102(localAdobeAuthSessionLauncher, _defaultIntentFlags);
      AdobeAuthSessionLauncher.access$202(localAdobeAuthSessionLauncher, _requestCode);
      AdobeAuthSessionLauncher.access$302(localAdobeAuthSessionLauncher, _launcherActivity);
      AdobeAuthSessionLauncher.access$402(localAdobeAuthSessionLauncher, _launcherContext);
      return localAdobeAuthSessionLauncher;
    }
    
    public Builder withActivity(Activity paramActivity)
    {
      _launcherActivity = paramActivity;
      _launcherContext = null;
      return this;
    }
    
    public Builder withRequestCode(int paramInt)
    {
      _requestCode = paramInt;
      return this;
    }
  }
}
