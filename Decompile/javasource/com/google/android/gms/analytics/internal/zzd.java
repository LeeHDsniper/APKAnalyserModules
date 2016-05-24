package com.google.android.gms.analytics.internal;

public abstract class zzd
  extends zzc
{
  private boolean zzLA;
  private boolean zzLz;
  
  protected zzd(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  public boolean isInitialized()
  {
    return (zzLz) && (!zzLA);
  }
  
  public void zza()
  {
    zzhB();
    zzLz = true;
  }
  
  protected abstract void zzhB();
  
  protected void zzio()
  {
    if (!isInitialized()) {
      throw new IllegalStateException("Not initialized");
    }
  }
}
