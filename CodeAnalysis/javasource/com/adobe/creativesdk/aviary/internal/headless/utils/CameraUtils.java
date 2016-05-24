package com.adobe.creativesdk.aviary.internal.headless.utils;

public final class CameraUtils
{
  static
  {
    System.loadLibrary("cutils");
    System.loadLibrary("aviary_moalite");
    System.loadLibrary("aviary_native");
  }
  
  private CameraUtils() {}
  
  static MegaPixels fromInt(int paramInt)
  {
    MegaPixels[] arrayOfMegaPixels = (MegaPixels[])MegaPixels.class.getEnumConstants();
    if ((paramInt >= 0) && (paramInt < arrayOfMegaPixels.length)) {
      return arrayOfMegaPixels[paramInt];
    }
    return MegaPixels.Mp1;
  }
  
  public static MegaPixels getNormalMegaPixels()
  {
    return fromInt(n_getSmallMp());
  }
  
  private static native int n_getLargeMp();
  
  private static native int n_getMaximumMp();
  
  private static native int n_getMediumMp();
  
  private static native int n_getSmallMp();
}
