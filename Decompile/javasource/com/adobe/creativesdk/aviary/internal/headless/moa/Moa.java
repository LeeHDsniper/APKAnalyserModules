package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.content.Context;
import android.graphics.Bitmap;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageInitializationException;

public final class Moa
{
  public static final Object M_LOCK = new Object();
  
  static
  {
    System.loadLibrary("cutils");
    System.loadLibrary("aviary_moalite");
    System.loadLibrary("aviary_native");
  }
  
  private Moa() {}
  
  public static void applyActions(MoaResult paramMoaResult)
  {
    synchronized (M_LOCK)
    {
      n_applyActions(paramMoaResult);
      return;
    }
  }
  
  public static void init(Context paramContext, String paramString, int paramInt)
    throws AdobeImageInitializationException
  {
    synchronized (M_LOCK)
    {
      paramInt = n_init(paramContext, paramString, paramInt);
      if (paramInt > 0) {
        throw AdobeImageInitializationException.fromInt(paramInt);
      }
    }
  }
  
  static native void n_applyActions(MoaResult paramMoaResult);
  
  static native boolean n_cpuIsArmv7();
  
  static native String[] n_getActions();
  
  static native int n_getCpuBuild();
  
  static native int n_getCpuFamily();
  
  static native String[] n_getEffects();
  
  static native String n_getMoaLiteVersion();
  
  static native String n_getProclistVersion();
  
  static native int n_getVersion();
  
  static native boolean n_hasHeadless();
  
  static native int n_init(Context paramContext, String paramString, int paramInt);
  
  static native void n_notifyPixelsChanged(Bitmap paramBitmap);
  
  static native void n_setid(String paramString);
  
  public static void notifyPixelsChanged(Bitmap paramBitmap)
  {
    n_notifyPixelsChanged(paramBitmap);
  }
}
