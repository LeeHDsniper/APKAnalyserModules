package com.adobe.creativesdk.foundation.internal.utils;

import android.os.Handler;
import android.os.Looper;

public class AdobeUxUtilMainUIThreadHandler
{
  private static Handler mUIThreadHandler;
  
  public static Handler getHandler()
  {
    if (mUIThreadHandler == null) {
      mUIThreadHandler = new Handler(Looper.getMainLooper());
    }
    return mUIThreadHandler;
  }
}
