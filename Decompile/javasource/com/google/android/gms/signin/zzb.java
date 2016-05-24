package com.google.android.gms.signin;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zza;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.signin.internal.zzh;
import com.google.android.gms.signin.internal.zzi;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executors;

public final class zzb
{
  public static final Api<zze> API;
  public static final Api.zzc<zzi> zzQf = new Api.zzc();
  public static final Api.zza<zzi, zze> zzQg;
  static final Api.zza<zzi, Api.ApiOptions.NoOptions> zzaNZ;
  public static final Scope zzaOa;
  public static final Scope zzaOb;
  public static final zzc zzaOc = new zzh();
  public static final Api<Api.ApiOptions.NoOptions> zzagz;
  public static final Api.zzc<zzi> zzanf = new Api.zzc();
  
  static
  {
    zzQg = new Api.zza()
    {
      public zzi zza(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymousZzf, zze paramAnonymousZze, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
      {
        return new zzi(paramAnonymousContext, paramAnonymousLooper, true, paramAnonymousZzf, paramAnonymousZze, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, Executors.newSingleThreadExecutor());
      }
      
      public List<Scope> zza(zze paramAnonymousZze)
      {
        return Arrays.asList(new Scope[] { zzb.zzaOa, zzb.zzaOb });
      }
    };
    zzaNZ = new Api.zza()
    {
      public zzi zzt(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymousZzf, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
      {
        return new zzi(paramAnonymousContext, paramAnonymousLooper, false, paramAnonymousZzf, zze.zzaOd, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, Executors.newSingleThreadExecutor());
      }
    };
    zzaOa = new Scope("profile");
    zzaOb = new Scope("email");
    API = new Api("SignIn.API", zzQg, zzQf);
    zzagz = new Api("SignIn.INTERNAL_API", zzaNZ, zzanf);
  }
}
