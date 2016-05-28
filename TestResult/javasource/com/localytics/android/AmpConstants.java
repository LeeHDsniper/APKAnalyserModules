package com.localytics.android;

import java.util.concurrent.atomic.AtomicBoolean;

class AmpConstants
  extends Constants
{
  private static final AtomicBoolean sTestModeEnabled = new AtomicBoolean(false);
  
  public static boolean isTestModeEnabled()
  {
    return sTestModeEnabled.get();
  }
  
  public static void setTestModeEnabled(boolean paramBoolean)
  {
    sTestModeEnabled.set(paramBoolean);
  }
}
