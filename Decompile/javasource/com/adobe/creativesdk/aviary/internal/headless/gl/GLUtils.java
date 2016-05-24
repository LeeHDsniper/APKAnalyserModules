package com.adobe.creativesdk.aviary.internal.headless.gl;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ConfigurationInfo;

public final class GLUtils
{
  private static int mGlEsVersion = -1;
  
  private GLUtils() {}
  
  public static boolean getGlEsEnabled(Context paramContext)
  {
    return n_getOpenGLEnabled();
  }
  
  public static int getGlEsVersion(Context paramContext)
  {
    if (mGlEsVersion == -1) {
      mGlEsVersion = getSystemService"activity"getDeviceConfigurationInforeqGlEsVersion;
    }
    return mGlEsVersion;
  }
  
  public static native boolean n_getOpenGLEnabled();
}
