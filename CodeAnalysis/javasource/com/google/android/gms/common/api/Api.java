package com.google.android.gms.common.api;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzp;
import com.google.android.gms.common.internal.zzx;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Set;

public final class Api<O extends ApiOptions>
{
  private final String mName;
  private final zzc<?> zzXW;
  private final zza<?, O> zzYL;
  private final zze<?, O> zzYM;
  private final zzf<?> zzYN;
  
  public <C extends zzb> Api(String paramString, zza<C, O> paramZza, zzc<C> paramZzc)
  {
    zzx.zzb(paramZza, "Cannot construct an Api with a null ClientBuilder");
    zzx.zzb(paramZzc, "Cannot construct an Api with a null ClientKey");
    mName = paramString;
    zzYL = paramZza;
    zzYM = null;
    zzXW = paramZzc;
    zzYN = null;
  }
  
  public String getName()
  {
    return mName;
  }
  
  public zza<?, O> zznb()
  {
    if (zzYL != null) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "This API was constructed with a SimpleClientBuilder. Use getSimpleClientBuilder");
      return zzYL;
    }
  }
  
  public zze<?, O> zznc()
  {
    if (zzYM != null) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "This API was constructed with a ClientBuilder. Use getClientBuilder");
      return zzYM;
    }
  }
  
  public zzc<?> zznd()
  {
    if (zzXW != null) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "This API was constructed with a SimpleClientKey. Use getSimpleClientKey");
      return zzXW;
    }
  }
  
  public boolean zzne()
  {
    return zzYN != null;
  }
  
  public static abstract interface ApiOptions
  {
    public static abstract interface HasOptions
      extends Api.ApiOptions
    {}
    
    public static final class NoOptions
      implements Api.ApiOptions.NotRequiredOptions
    {
      private NoOptions() {}
    }
    
    public static abstract interface NotRequiredOptions
      extends Api.ApiOptions
    {}
    
    public static abstract interface Optional
      extends Api.ApiOptions.HasOptions, Api.ApiOptions.NotRequiredOptions
    {}
  }
  
  public static abstract class zza<T extends Api.zzb, O>
  {
    public zza() {}
    
    public int getPriority()
    {
      return Integer.MAX_VALUE;
    }
    
    public abstract T zza(Context paramContext, Looper paramLooper, zzf paramZzf, O paramO, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener);
    
    public List<Scope> zzl(O paramO)
    {
      return Collections.emptyList();
    }
  }
  
  public static abstract interface zzb
  {
    public abstract void disconnect();
    
    public abstract void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString);
    
    public abstract boolean isConnected();
    
    public abstract void zza(GoogleApiClient.zza paramZza);
    
    public abstract void zza(zzp paramZzp);
    
    public abstract void zza(zzp paramZzp, Set<Scope> paramSet);
    
    public abstract boolean zzlm();
  }
  
  public static final class zzc<C extends Api.zzb>
  {
    public zzc() {}
  }
  
  public static abstract interface zzd<T extends IInterface>
  {
    public abstract T zzV(IBinder paramIBinder);
    
    public abstract void zza(int paramInt, T paramT);
    
    public abstract String zzfA();
    
    public abstract String zzfB();
  }
  
  public static abstract interface zze<T extends Api.zzd, O>
  {
    public abstract T zzm(O paramO);
    
    public abstract int zznf();
  }
  
  public static final class zzf<C extends Api.zzd> {}
}
