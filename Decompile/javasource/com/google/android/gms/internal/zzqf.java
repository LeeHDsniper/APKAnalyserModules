package com.google.android.gms.internal;

public final class zzqf
{
  private final boolean zzaTm;
  private final boolean zzaTn;
  private final String zzaTo;
  private final String zztw;
  
  private zzqf(zza paramZza)
  {
    zzaTo = zza.zza(paramZza);
    zzaTm = zza.zzb(paramZza);
    zzaTn = zza.zzc(paramZza);
    zztw = zza.zzd(paramZza);
  }
  
  public String getTrackingId()
  {
    return zztw;
  }
  
  public String zzBj()
  {
    return zzaTo;
  }
  
  public boolean zzBk()
  {
    return zzaTm;
  }
  
  public boolean zzBl()
  {
    return zzaTn;
  }
  
  public static final class zza
  {
    private boolean zzaTm = true;
    private boolean zzaTn = false;
    private final String zzaTo;
    private String zztw;
    
    public zza(String paramString)
    {
      zzaTo = paramString;
    }
    
    public zzqf zzBm()
    {
      return new zzqf(this, null);
    }
    
    public zza zzau(boolean paramBoolean)
    {
      zzaTm = paramBoolean;
      return this;
    }
    
    public zza zzav(boolean paramBoolean)
    {
      zzaTn = paramBoolean;
      return this;
    }
    
    public zza zzfh(String paramString)
    {
      zztw = paramString;
      return this;
    }
  }
}
