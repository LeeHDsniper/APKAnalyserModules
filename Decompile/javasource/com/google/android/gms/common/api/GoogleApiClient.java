package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzf.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzld;
import com.google.android.gms.signin.zzb;
import com.google.android.gms.signin.zzd;
import com.google.android.gms.signin.zze;
import com.google.android.gms.signin.zze.zza;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public abstract interface GoogleApiClient
{
  public abstract void connect();
  
  public abstract void disconnect();
  
  public abstract void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString);
  
  public abstract Looper getLooper();
  
  public abstract boolean isConnected();
  
  public abstract boolean isConnecting();
  
  public abstract void registerConnectionCallbacks(ConnectionCallbacks paramConnectionCallbacks);
  
  public abstract void registerConnectionFailedListener(OnConnectionFailedListener paramOnConnectionFailedListener);
  
  public abstract void unregisterConnectionCallbacks(ConnectionCallbacks paramConnectionCallbacks);
  
  public abstract void unregisterConnectionFailedListener(OnConnectionFailedListener paramOnConnectionFailedListener);
  
  public abstract <A extends Api.zzb, R extends Result, T extends zzc.zza<R, A>> T zza(T paramT);
  
  public static final class Builder
  {
    private final Context mContext;
    private Account zzOY;
    private String zzQl;
    private Looper zzYV;
    private final Set<Scope> zzYY = new HashSet();
    private int zzYZ;
    private View zzZa;
    private String zzZb;
    private final Map<Api<?>, zzf.zza> zzZc = new zzld();
    private final Map<Api<?>, Api.ApiOptions> zzZd = new zzld();
    private FragmentActivity zzZe;
    private int zzZf = -1;
    private int zzZg = -1;
    private GoogleApiClient.OnConnectionFailedListener zzZh;
    private GoogleApiAvailability zzZi = GoogleApiAvailability.getInstance();
    private Api.zza<? extends zzd, zze> zzZj = zzb.zzQg;
    private final ArrayList<GoogleApiClient.ConnectionCallbacks> zzZk = new ArrayList();
    private final ArrayList<GoogleApiClient.OnConnectionFailedListener> zzZl = new ArrayList();
    private zze.zza zzZm = new zze.zza();
    
    public Builder(Context paramContext)
    {
      mContext = paramContext;
      zzYV = paramContext.getMainLooper();
      zzQl = paramContext.getPackageName();
      zzZb = paramContext.getClass().getName();
    }
    
    private void zza(zzp paramZzp, GoogleApiClient paramGoogleApiClient)
    {
      paramZzp.zza(zzZf, paramGoogleApiClient, zzZh);
    }
    
    private GoogleApiClient zznj()
    {
      final zzi localZzi = new zzi(mContext.getApplicationContext(), zzYV, zzni(), zzZi, zzZj, zzZd, zzZk, zzZl, zzZf, -1);
      zzp localZzp = zzp.zza(zzZe);
      if (localZzp == null)
      {
        new Handler(mContext.getMainLooper()).post(new Runnable()
        {
          public void run()
          {
            if ((GoogleApiClient.Builder.zza(GoogleApiClient.Builder.this).isFinishing()) || (GoogleApiClient.Builder.zza(GoogleApiClient.Builder.this).getSupportFragmentManager().isDestroyed())) {
              return;
            }
            GoogleApiClient.Builder.zza(GoogleApiClient.Builder.this, zzp.zzb(GoogleApiClient.Builder.zza(GoogleApiClient.Builder.this)), localZzi);
          }
        });
        return localZzi;
      }
      zza(localZzp, localZzi);
      return localZzi;
    }
    
    private GoogleApiClient zznk()
    {
      zzq localZzq = zzq.zzc(zzZe);
      GoogleApiClient localGoogleApiClient = localZzq.zzbj(zzZg);
      Object localObject = localGoogleApiClient;
      if (localGoogleApiClient == null) {
        localObject = new zzi(mContext.getApplicationContext(), zzYV, zzni(), zzZi, zzZj, zzZd, zzZk, zzZl, -1, zzZg);
      }
      localZzq.zza(zzZg, (GoogleApiClient)localObject, zzZh);
      return localObject;
    }
    
    public Builder addApi(Api<? extends Api.ApiOptions.NotRequiredOptions> paramApi)
    {
      zzZd.put(paramApi, null);
      zzYY.addAll(paramApi.zznb().zzl(null));
      return this;
    }
    
    public GoogleApiClient build()
    {
      if (!zzZd.isEmpty()) {}
      for (boolean bool = true;; bool = false)
      {
        zzx.zzb(bool, "must call addApi() to add at least one API");
        if (zzZf < 0) {
          break;
        }
        return zznj();
      }
      if (zzZg >= 0) {
        return zznk();
      }
      return new zzi(mContext, zzYV, zzni(), zzZi, zzZj, zzZd, zzZk, zzZl, -1, -1);
    }
    
    public zzf zzni()
    {
      return new zzf(zzOY, zzYY, zzZc, zzYZ, zzZa, zzQl, zzZb, zzZm.zzzr());
    }
  }
  
  public static abstract interface ConnectionCallbacks
  {
    public abstract void onConnected(Bundle paramBundle);
    
    public abstract void onConnectionSuspended(int paramInt);
  }
  
  public static abstract interface OnConnectionFailedListener
  {
    public abstract void onConnectionFailed(ConnectionResult paramConnectionResult);
  }
  
  public static abstract interface ServerAuthCodeCallbacks
  {
    public abstract CheckResult onCheckServerAuthorization(String paramString, Set<Scope> paramSet);
    
    public abstract boolean onUploadServerAuthCode(String paramString1, String paramString2);
    
    public static class CheckResult
    {
      private boolean zzZo;
      private Set<Scope> zzZp;
      
      public boolean zznl()
      {
        return zzZo;
      }
      
      public Set<Scope> zznm()
      {
        return zzZp;
      }
    }
  }
  
  public static abstract interface zza
  {
    public abstract void zza(ConnectionResult paramConnectionResult);
    
    public abstract void zzb(ConnectionResult paramConnectionResult);
  }
}
