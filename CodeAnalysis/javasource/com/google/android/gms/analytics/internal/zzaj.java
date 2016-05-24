package com.google.android.gms.analytics.internal;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;

class zzaj
{
  private long zzOC;
  private final zzlm zzpO;
  
  public zzaj(zzlm paramZzlm)
  {
    zzx.zzv(paramZzlm);
    zzpO = paramZzlm;
  }
  
  public zzaj(zzlm paramZzlm, long paramLong)
  {
    zzx.zzv(paramZzlm);
    zzpO = paramZzlm;
    zzOC = paramLong;
  }
  
  public void clear()
  {
    zzOC = 0L;
  }
  
  public void start()
  {
    zzOC = zzpO.elapsedRealtime();
  }
  
  public boolean zzv(long paramLong)
  {
    if (zzOC == 0L) {}
    while (zzpO.elapsedRealtime() - zzOC > paramLong) {
      return true;
    }
    return false;
  }
}
