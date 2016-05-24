package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzlm;

class zzbe
  implements zzcd
{
  private final long zzOe;
  private final int zzOf;
  private double zzOg;
  private long zzOh;
  private final Object zzOi = new Object();
  private final String zzOj;
  private final long zzaQB;
  private final zzlm zzpO;
  
  public zzbe(int paramInt, long paramLong1, long paramLong2, String paramString, zzlm paramZzlm)
  {
    zzOf = paramInt;
    zzOg = zzOf;
    zzOe = paramLong1;
    zzaQB = paramLong2;
    zzOj = paramString;
    zzpO = paramZzlm;
  }
  
  public boolean zzkp()
  {
    synchronized (zzOi)
    {
      long l = zzpO.currentTimeMillis();
      if (l - zzOh < zzaQB)
      {
        zzbg.zzaE("Excessive " + zzOj + " detected; call ignored.");
        return false;
      }
      if (zzOg < zzOf)
      {
        double d = (l - zzOh) / zzOe;
        if (d > 0.0D) {
          zzOg = Math.min(zzOf, d + zzOg);
        }
      }
      zzOh = l;
      if (zzOg >= 1.0D)
      {
        zzOg -= 1.0D;
        return true;
      }
    }
    zzbg.zzaE("Excessive " + zzOj + " detected; call ignored.");
    return false;
  }
}
