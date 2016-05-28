package com.google.android.gms.appdatasearch;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zza;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzjf;
import com.google.android.gms.internal.zzjh;

public final class zza
{
  public static final Api.zzc<zzjf> zzOO = new Api.zzc();
  private static final Api.zza<zzjf, Api.ApiOptions.NoOptions> zzOP = new Api.zza()
  {
    public zzjf zza(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymousZzf, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      return new zzjf(paramAnonymousContext, paramAnonymousLooper, paramAnonymousZzf, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener);
    }
  };
  public static final Api<Api.ApiOptions.NoOptions> zzOQ = new Api("AppDataSearch.LIGHTWEIGHT_API", zzOP, zzOO);
  public static final zzk zzOR = new zzjh();
}
