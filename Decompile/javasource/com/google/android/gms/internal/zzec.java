package com.google.android.gms.internal;

@zzgk
public final class zzec
  extends zzej.zza
{
  private final Object zzpc = new Object();
  private zzee.zza zzyF;
  private zzeb zzyG;
  
  public zzec() {}
  
  public void onAdClicked()
  {
    synchronized (zzpc)
    {
      if (zzyG != null) {
        zzyG.zzaX();
      }
      return;
    }
  }
  
  public void onAdClosed()
  {
    synchronized (zzpc)
    {
      if (zzyG != null) {
        zzyG.zzaY();
      }
      return;
    }
  }
  
  public void onAdFailedToLoad(int paramInt)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzyF != null)
        {
          if (paramInt == 3)
          {
            paramInt = 1;
            zzyF.zzq(paramInt);
            zzyF = null;
          }
        }
        else {
          return;
        }
      }
      paramInt = 2;
    }
  }
  
  public void onAdLeftApplication()
  {
    synchronized (zzpc)
    {
      if (zzyG != null) {
        zzyG.zzaZ();
      }
      return;
    }
  }
  
  public void onAdLoaded()
  {
    synchronized (zzpc)
    {
      if (zzyF != null)
      {
        zzyF.zzq(0);
        zzyF = null;
        return;
      }
      if (zzyG != null) {
        zzyG.zzbb();
      }
      return;
    }
  }
  
  public void onAdOpened()
  {
    synchronized (zzpc)
    {
      if (zzyG != null) {
        zzyG.zzba();
      }
      return;
    }
  }
  
  public void zza(zzeb paramZzeb)
  {
    synchronized (zzpc)
    {
      zzyG = paramZzeb;
      return;
    }
  }
  
  public void zza(zzee.zza paramZza)
  {
    synchronized (zzpc)
    {
      zzyF = paramZza;
      return;
    }
  }
}
