package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.zzp;

public class zzib
{
  private long zzIp;
  private long zzIq = Long.MIN_VALUE;
  private Object zzpc = new Object();
  
  public zzib(long paramLong)
  {
    zzIp = paramLong;
  }
  
  public boolean tryAcquire()
  {
    synchronized (zzpc)
    {
      long l = zzp.zzbB().elapsedRealtime();
      if (zzIq + zzIp > l) {
        return false;
      }
      zzIq = l;
      return true;
    }
  }
}
