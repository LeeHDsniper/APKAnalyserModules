package com.google.android.gms.internal;

import android.os.SystemClock;

public final class zzlo
  implements zzlm
{
  private static zzlo zzagd;
  
  public zzlo() {}
  
  public static zzlm zzpN()
  {
    try
    {
      if (zzagd == null) {
        zzagd = new zzlo();
      }
      zzlo localZzlo = zzagd;
      return localZzlo;
    }
    finally {}
  }
  
  public long currentTimeMillis()
  {
    return System.currentTimeMillis();
  }
  
  public long elapsedRealtime()
  {
    return SystemClock.elapsedRealtime();
  }
  
  public long nanoTime()
  {
    return System.nanoTime();
  }
}
