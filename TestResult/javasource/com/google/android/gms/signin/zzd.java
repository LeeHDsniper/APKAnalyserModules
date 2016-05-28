package com.google.android.gms.signin;

import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzp;
import com.google.android.gms.common.internal.zzt;
import com.google.android.gms.signin.internal.zze;
import java.util.Set;

public abstract interface zzd
  extends Api.zzb
{
  public abstract void connect();
  
  public abstract void zza(zzp paramZzp, Set<Scope> paramSet, zze paramZze);
  
  public abstract void zza(zzp paramZzp, boolean paramBoolean);
  
  public abstract void zza(zzt paramZzt);
  
  public abstract void zzzn();
}
