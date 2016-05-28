package com.google.android.gms.internal;

import android.os.Build.VERSION;

public final class zzlv
{
  @Deprecated
  public static boolean isAtLeastL()
  {
    return zzpX();
  }
  
  private static boolean zzbZ(int paramInt)
  {
    return Build.VERSION.SDK_INT >= paramInt;
  }
  
  public static boolean zzpO()
  {
    return zzbZ(11);
  }
  
  public static boolean zzpQ()
  {
    return zzbZ(13);
  }
  
  public static boolean zzpR()
  {
    return zzbZ(14);
  }
  
  public static boolean zzpT()
  {
    return zzbZ(17);
  }
  
  public static boolean zzpU()
  {
    return zzbZ(18);
  }
  
  public static boolean zzpV()
  {
    return zzbZ(19);
  }
  
  public static boolean zzpW()
  {
    return zzbZ(20);
  }
  
  public static boolean zzpX()
  {
    return zzbZ(21);
  }
}
