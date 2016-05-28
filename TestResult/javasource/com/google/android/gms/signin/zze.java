package com.google.android.gms.signin;

import com.google.android.gms.common.api.Api.ApiOptions.Optional;
import com.google.android.gms.common.api.GoogleApiClient.ServerAuthCodeCallbacks;

public final class zze
  implements Api.ApiOptions.Optional
{
  public static final zze zzaOd = new zza().zzzr();
  private final String zzRU;
  private final boolean zzaOe;
  private final boolean zzaOf;
  private final GoogleApiClient.ServerAuthCodeCallbacks zzaOg;
  
  private zze(boolean paramBoolean1, boolean paramBoolean2, String paramString, GoogleApiClient.ServerAuthCodeCallbacks paramServerAuthCodeCallbacks)
  {
    zzaOe = paramBoolean1;
    zzaOf = paramBoolean2;
    zzRU = paramString;
    zzaOg = paramServerAuthCodeCallbacks;
  }
  
  public String zzlG()
  {
    return zzRU;
  }
  
  public boolean zzzo()
  {
    return zzaOe;
  }
  
  public boolean zzzp()
  {
    return zzaOf;
  }
  
  public GoogleApiClient.ServerAuthCodeCallbacks zzzq()
  {
    return zzaOg;
  }
  
  public static final class zza
  {
    private String zzaLe;
    private boolean zzaOh;
    private boolean zzaOi;
    private GoogleApiClient.ServerAuthCodeCallbacks zzaOj;
    
    public zza() {}
    
    public zze zzzr()
    {
      return new zze(zzaOh, zzaOi, zzaLe, zzaOj, null);
    }
  }
}
