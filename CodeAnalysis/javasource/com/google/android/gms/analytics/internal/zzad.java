package com.google.android.gms.analytics.internal;

public class zzad
{
  private final long zzOe;
  private final int zzOf;
  private double zzOg;
  private long zzOh;
  private final Object zzOi = new Object();
  private final String zzOj;
  
  public zzad(int paramInt, long paramLong, String paramString)
  {
    zzOf = paramInt;
    zzOg = zzOf;
    zzOe = paramLong;
    zzOj = paramString;
  }
  
  public zzad(String paramString)
  {
    this(60, 2000L, paramString);
  }
  
  public boolean zzkp()
  {
    synchronized (zzOi)
    {
      long l = System.currentTimeMillis();
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
      zzae.zzaE("Excessive " + zzOj + " detected; call ignored.");
      return false;
    }
  }
}
