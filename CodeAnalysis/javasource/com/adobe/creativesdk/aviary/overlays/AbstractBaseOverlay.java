package com.adobe.creativesdk.aviary.overlays;

import android.content.Context;
import com.adobe.android.ui.view.AdobeTutorialOverlay;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;

public abstract class AbstractBaseOverlay
  extends AdobeTutorialOverlay
{
  LoggerFactory.Logger logger = LoggerFactory.getLogger(getClass().getSimpleName(), LoggerFactory.LoggerType.ConsoleLoggerType);
  
  public AbstractBaseOverlay(Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    super(paramContext, paramString, paramInt1, paramInt2);
  }
  
  private static void markAsViewed(SharedPreferencesUtils paramSharedPreferencesUtils, int paramInt)
  {
    if (paramInt < 0) {
      return;
    }
    paramSharedPreferencesUtils.markOverlayAsRead(paramInt);
  }
  
  public static boolean shouldShow(Context paramContext, int paramInt)
  {
    return shouldShow(SharedPreferencesUtils.getInstance(paramContext), paramInt);
  }
  
  private static boolean shouldShow(SharedPreferencesUtils paramSharedPreferencesUtils, int paramInt)
  {
    return (paramInt <= -1) || (!paramSharedPreferencesUtils.hasOverlayKey(paramInt));
  }
  
  public boolean shouldShow()
  {
    if (getContext() == null) {}
    SharedPreferencesUtils localSharedPreferencesUtils;
    do
    {
      return false;
      localSharedPreferencesUtils = SharedPreferencesUtils.getInstance(getContext());
    } while (!shouldShow(localSharedPreferencesUtils, overlayId));
    markAsViewed(localSharedPreferencesUtils, overlayId);
    return true;
  }
  
  protected void trackTutorialClosed(String paramString)
  {
    if ((getContext() != null) && (paramString != null)) {
      AdobeImageAnalyticsTracker.getInstance(getContext()).tagEvent(mTagName + ": tutorial_closed", new String[] { "from", paramString });
    }
  }
  
  protected void trackTutorialOpened()
  {
    if (getContext() != null) {
      AdobeImageAnalyticsTracker.getInstance(getContext()).tagEvent(mTagName + ": tutorial_presented");
    }
  }
}
