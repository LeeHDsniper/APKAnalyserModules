package com.google.android.gms.internal;

public class zzd
  implements zzo
{
  private int zzo;
  private int zzp;
  private final int zzq;
  private final float zzr;
  
  public zzd()
  {
    this(2500, 1, 1.0F);
  }
  
  public zzd(int paramInt1, int paramInt2, float paramFloat)
  {
    zzo = paramInt1;
    zzq = paramInt2;
    zzr = paramFloat;
  }
  
  public void zza(zzr paramZzr)
    throws zzr
  {
    zzp += 1;
    zzo = ((int)(zzo + zzo * zzr));
    if (!zzf()) {
      throw paramZzr;
    }
  }
  
  public int zzd()
  {
    return zzo;
  }
  
  public int zze()
  {
    return zzp;
  }
  
  protected boolean zzf()
  {
    return zzp <= zzq;
  }
}
