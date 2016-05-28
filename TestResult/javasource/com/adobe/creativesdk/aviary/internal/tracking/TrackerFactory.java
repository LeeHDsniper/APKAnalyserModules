package com.adobe.creativesdk.aviary.internal.tracking;

import android.content.Context;

public final class TrackerFactory
{
  private TrackerFactory() {}
  
  public static AbstractTracker create(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    return new LocalyticsTracker(paramContext, paramString1, paramString2, paramString3);
  }
}
