package com.adobe.creativesdk.aviary.internal.tracking;

import android.content.Context;
import com.adobe.creativesdk.aviary.internal.utils.SDKUtils;

final class TrackingUtils
{
  private static final Object M_API_KEY_LOCK = new Object();
  private static String mTrackingApiKey = null;
  
  public static String getTrackerApiKey(Context paramContext)
  {
    if (mTrackingApiKey == null) {}
    synchronized (M_API_KEY_LOCK)
    {
      if (mTrackingApiKey == null) {
        mTrackingApiKey = SDKUtils.getMetadataValue(paramContext, "com.aviary.android.feather.v1.LOCALYTICS_API_KEY", "ff159f6cc04d5010ac6461e-fc511f5e-b6ff-11e0-049a-007f58cb3154");
      }
      return mTrackingApiKey;
    }
  }
}
