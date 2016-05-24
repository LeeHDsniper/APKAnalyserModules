package com.adobe.creativesdk.foundation.internal.analytics;

import android.content.Context;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class AdobeAnalyticsSession
{
  private static volatile AdobeAnalyticsSession sharedSession = null;
  private Map<Context, IAdobeAnalyticsSessionCallback> _registeredSessionDelegates = new HashMap();
  
  public AdobeAnalyticsSession() {}
  
  public static AdobeAnalyticsSession getSharedInstance()
  {
    if (sharedSession == null) {}
    try
    {
      if (sharedSession == null) {
        sharedSession = new AdobeAnalyticsSession();
      }
      return sharedSession;
    }
    finally {}
  }
  
  public Boolean hasDelegate()
  {
    if (_registeredSessionDelegates.size() == 0) {
      return Boolean.valueOf(false);
    }
    return Boolean.valueOf(true);
  }
  
  void trackAction(String paramString, Map<String, Object> paramMap)
  {
    if (!hasDelegate().booleanValue()) {}
    for (;;)
    {
      return;
      Iterator localIterator = _registeredSessionDelegates.keySet().iterator();
      while (localIterator.hasNext())
      {
        Context localContext = (Context)localIterator.next();
        ((IAdobeAnalyticsSessionCallback)_registeredSessionDelegates.get(localContext)).trackAction(paramString, paramMap);
      }
    }
  }
}
