package com.adobe.creativesdk.foundation.internal.storage.controllers.common;

import android.os.Build.VERSION;

public class PlatformCommonUtils
{
  public static boolean hasHoneycomb()
  {
    return Build.VERSION.SDK_INT >= 11;
  }
  
  public static boolean hasHoneycombMR1()
  {
    return Build.VERSION.SDK_INT >= 12;
  }
  
  public static boolean hasKitKat()
  {
    return Build.VERSION.SDK_INT >= 19;
  }
}
