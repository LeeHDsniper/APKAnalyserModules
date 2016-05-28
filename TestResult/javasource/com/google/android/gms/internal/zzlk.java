package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import java.util.regex.Pattern;

public final class zzlk
{
  private static Pattern zzagc = null;
  
  public static boolean zzao(Context paramContext)
  {
    return paramContext.getPackageManager().hasSystemFeature("android.hardware.type.watch");
  }
  
  public static int zzbV(int paramInt)
  {
    return paramInt / 1000;
  }
  
  public static int zzbW(int paramInt)
  {
    return paramInt % 1000 / 100;
  }
  
  public static boolean zzbX(int paramInt)
  {
    return zzbW(paramInt) == 3;
  }
}
