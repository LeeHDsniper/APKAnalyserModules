package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.ads.internal.zzp;

@zzgk
public class zzho
{
  private final String zzGP;
  private int zzHq;
  private int zzHr;
  private final zzhl zzpN;
  private final Object zzpc = new Object();
  
  zzho(zzhl paramZzhl, String paramString)
  {
    zzpN = paramZzhl;
    zzGP = paramString;
  }
  
  public zzho(String paramString)
  {
    this(zzp.zzbA(), paramString);
  }
  
  public Bundle toBundle()
  {
    synchronized (zzpc)
    {
      Bundle localBundle = new Bundle();
      localBundle.putInt("pmnli", zzHq);
      localBundle.putInt("pmnll", zzHr);
      return localBundle;
    }
  }
  
  public void zzf(int paramInt1, int paramInt2)
  {
    synchronized (zzpc)
    {
      zzHq = paramInt1;
      zzHr = paramInt2;
      zzpN.zza(zzGP, this);
      return;
    }
  }
}
