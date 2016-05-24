package com.google.android.gms.signin.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.GoogleApiClient.ServerAuthCodeCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.ServerAuthCodeCallbacks.CheckResult;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.AuthAccountRequest;
import com.google.android.gms.common.internal.BinderWrapper;
import com.google.android.gms.common.internal.ResolveAccountRequest;
import com.google.android.gms.common.internal.ResolveAccountResponse;
import com.google.android.gms.common.internal.zzj;
import com.google.android.gms.common.internal.zzj.zzf;
import com.google.android.gms.common.internal.zzp;
import com.google.android.gms.common.internal.zzt;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.signin.zzd;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;

public class zzi
  extends zzj<zzf>
  implements zzd
{
  private final com.google.android.gms.common.internal.zzf zzZH;
  private final boolean zzaOn;
  private final ExecutorService zzaOo;
  private final com.google.android.gms.signin.zze zzade;
  private Integer zzadf;
  
  public zzi(Context paramContext, Looper paramLooper, boolean paramBoolean, com.google.android.gms.common.internal.zzf paramZzf, com.google.android.gms.signin.zze paramZze, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, ExecutorService paramExecutorService)
  {
    super(paramContext, paramLooper, 44, paramZzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
    zzaOn = paramBoolean;
    zzZH = paramZzf;
    zzade = paramZzf.zzoo();
    zzadf = paramZzf.zzop();
    zzaOo = paramExecutorService;
  }
  
  public static Bundle zza(com.google.android.gms.signin.zze paramZze, Integer paramInteger, ExecutorService paramExecutorService)
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("com.google.android.gms.signin.internal.offlineAccessRequested", paramZze.zzzo());
    localBundle.putBoolean("com.google.android.gms.signin.internal.idTokenRequested", paramZze.zzzp());
    localBundle.putString("com.google.android.gms.signin.internal.serverClientId", paramZze.zzlG());
    if (paramZze.zzzq() != null) {
      localBundle.putParcelable("com.google.android.gms.signin.internal.signInCallbacks", new BinderWrapper(new zza(paramZze, paramExecutorService).asBinder()));
    }
    if (paramInteger != null) {
      localBundle.putInt("com.google.android.gms.common.internal.ClientSettings.sessionId", paramInteger.intValue());
    }
    return localBundle;
  }
  
  public void connect()
  {
    zza(new zzj.zzf(this));
  }
  
  public void zza(zzp paramZzp, Set<Scope> paramSet, zze paramZze)
  {
    zzx.zzb(paramZze, "Expecting a valid ISignInCallbacks");
    try
    {
      ((zzf)zzoA()).zza(new AuthAccountRequest(paramZzp, paramSet), paramZze);
      return;
    }
    catch (RemoteException paramZzp)
    {
      Log.w("SignInClientImpl", "Remote service probably died when authAccount is called");
      try
      {
        paramZze.zza(new ConnectionResult(8, null), new AuthAccountResult());
        return;
      }
      catch (RemoteException paramZzp)
      {
        Log.wtf("SignInClientImpl", "ISignInCallbacks#onAuthAccount should be executed from the same process, unexpected RemoteException.");
      }
    }
  }
  
  public void zza(zzp paramZzp, boolean paramBoolean)
  {
    try
    {
      ((zzf)zzoA()).zza(paramZzp, zzadf.intValue(), paramBoolean);
      return;
    }
    catch (RemoteException paramZzp)
    {
      Log.w("SignInClientImpl", "Remote service probably died when saveDefaultAccount is called");
    }
  }
  
  public void zza(zzt paramZzt)
  {
    zzx.zzb(paramZzt, "Expecting a valid IResolveAccountCallbacks");
    try
    {
      Account localAccount = zzZH.zzog();
      ((zzf)zzoA()).zza(new ResolveAccountRequest(localAccount, zzadf.intValue()), paramZzt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("SignInClientImpl", "Remote service probably died when resolveAccount is called");
      try
      {
        paramZzt.zzb(new ResolveAccountResponse(8));
        return;
      }
      catch (RemoteException paramZzt)
      {
        Log.wtf("SignInClientImpl", "IResolveAccountCallbacks#onAccountResolutionComplete should be executed from the same process, unexpected RemoteException.");
      }
    }
  }
  
  protected zzf zzdI(IBinder paramIBinder)
  {
    return zzf.zza.zzdH(paramIBinder);
  }
  
  protected String zzfA()
  {
    return "com.google.android.gms.signin.service.START";
  }
  
  protected String zzfB()
  {
    return "com.google.android.gms.signin.internal.ISignInService";
  }
  
  protected Bundle zzli()
  {
    Bundle localBundle = zza(zzade, zzZH.zzop(), zzaOo);
    String str = zzZH.zzol();
    if (!getContext().getPackageName().equals(str)) {
      localBundle.putString("com.google.android.gms.signin.internal.realClientPackageName", zzZH.zzol());
    }
    return localBundle;
  }
  
  public boolean zzlm()
  {
    return zzaOn;
  }
  
  public void zzzn()
  {
    try
    {
      ((zzf)zzoA()).zzja(zzadf.intValue());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("SignInClientImpl", "Remote service probably died when clearAccountFromSessionStore is called");
    }
  }
  
  private static class zza
    extends zzd.zza
  {
    private final ExecutorService zzaOo;
    private final com.google.android.gms.signin.zze zzade;
    
    public zza(com.google.android.gms.signin.zze paramZze, ExecutorService paramExecutorService)
    {
      zzade = paramZze;
      zzaOo = paramExecutorService;
    }
    
    private GoogleApiClient.ServerAuthCodeCallbacks zzzq()
      throws RemoteException
    {
      return zzade.zzzq();
    }
    
    public void zza(final String paramString1, final String paramString2, final zzf paramZzf)
      throws RemoteException
    {
      zzaOo.submit(new Runnable()
      {
        public void run()
        {
          try
          {
            boolean bool = zzi.zza.zza(zzi.zza.this).onUploadServerAuthCode(paramString1, paramString2);
            paramZzf.zzaq(bool);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            Log.e("SignInClientImpl", "RemoteException thrown when processing uploadServerAuthCode callback", localRemoteException);
          }
        }
      });
    }
    
    public void zza(final String paramString, final List<Scope> paramList, final zzf paramZzf)
      throws RemoteException
    {
      zzaOo.submit(new Runnable()
      {
        public void run()
        {
          try
          {
            Object localObject = zzi.zza.zza(zzi.zza.this);
            Set localSet = Collections.unmodifiableSet(new HashSet(paramList));
            localObject = ((GoogleApiClient.ServerAuthCodeCallbacks)localObject).onCheckServerAuthorization(paramString, localSet);
            localObject = new CheckServerAuthResult(((GoogleApiClient.ServerAuthCodeCallbacks.CheckResult)localObject).zznl(), ((GoogleApiClient.ServerAuthCodeCallbacks.CheckResult)localObject).zznm());
            paramZzf.zza((CheckServerAuthResult)localObject);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            Log.e("SignInClientImpl", "RemoteException thrown when processing checkServerAuthorization callback", localRemoteException);
          }
        }
      });
    }
  }
}
