package com.google.android.gms.tagmanager;

class zzcs
  implements zzcd
{
  private final long zzOe;
  private final int zzOf;
  private double zzOg;
  private final Object zzOi = new Object();
  private long zzaRW;
  
  public zzcs()
  {
    this(60, 2000L);
  }
  
  public zzcs(int paramInt, long paramLong)
  {
    zzOf = paramInt;
    zzOg = zzOf;
    zzOe = paramLong;
  }
  
  public boolean zzkp()
  {
    synchronized (zzOi)
    {
      long l = System.currentTimeMillis();
      if (zzOg < zzOf)
      {
        double d = (l - zzaRW) / zzOe;
        if (d > 0.0D) {
          zzOg = Math.min(zzOf, d + zzOg);
        }
      }
      zzaRW = l;
      if (zzOg >= 1.0D)
      {
        zzOg -= 1.0D;
        return true;
      }
      zzbg.zzaE("No more tokens available.");
      return false;
    }
  }
}
