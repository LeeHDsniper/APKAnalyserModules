package com.adobe.creativesdk.aviary.internal.tracking;

import android.content.Context;
import com.localytics.android.LocalyticsSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class LocalyticsTracker
  extends AbstractTracker
{
  private LocalyticsSession localyticsSession;
  private final List<String> mCustomDimensions;
  private final HashMap<String, String> mDefaultAttributes = new HashMap();
  
  public LocalyticsTracker(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    super(paramContext, paramString1, paramString2, paramString3);
    mDefaultAttributes.put("apiKey", mApiKey);
    mDefaultAttributes.put("appId", mCallingAppName);
    mDefaultAttributes.put("sdkVersion", mSdkVersion);
    localyticsSession = new LocalyticsSession(paramContext, TrackingUtils.getTrackerApiKey(paramContext));
    mCustomDimensions = new ArrayList(3);
    mCustomDimensions.add(paramString1);
  }
  
  public boolean close()
  {
    localyticsSession.close(mCustomDimensions);
    return true;
  }
  
  public void open()
  {
    localyticsSession.open(mCustomDimensions);
  }
  
  public void putCustomAttribute(String paramString1, String paramString2)
  {
    mDefaultAttributes.put(paramString1, paramString2);
  }
  
  public boolean recordTag(String paramString, HashMap<String, String> paramHashMap)
  {
    if (paramHashMap == null) {
      paramHashMap = mDefaultAttributes;
    }
    for (;;)
    {
      localyticsSession.tagEvent(paramString, paramHashMap, mCustomDimensions);
      return true;
      paramHashMap.putAll(mDefaultAttributes);
    }
  }
  
  public void upload()
  {
    localyticsSession.upload();
  }
}
