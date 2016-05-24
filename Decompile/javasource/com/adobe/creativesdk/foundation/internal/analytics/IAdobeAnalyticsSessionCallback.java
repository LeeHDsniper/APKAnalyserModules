package com.adobe.creativesdk.foundation.internal.analytics;

import java.util.Map;

public abstract interface IAdobeAnalyticsSessionCallback
{
  public abstract void trackAction(String paramString, Map<String, Object> paramMap);
}
