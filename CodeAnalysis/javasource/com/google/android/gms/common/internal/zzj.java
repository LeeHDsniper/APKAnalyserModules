package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.GoogleApiClient.zza;
import com.google.android.gms.common.api.Scope;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class zzj<T extends IInterface>
  implements Api.zzb, zzk.zza
{
  public static final String[] zzadF = { "service_esmobile", "service_googleme" };
  private final Context mContext;
  final Handler mHandler;
  private final Account zzOY;
  private final Looper zzYV;
  private final zzf zzZH;
  private final GoogleApiAvailability zzZi;
  private final Set<Scope> zzZp;
  private int zzadA = 1;
  private final GoogleApiClient.ConnectionCallbacks zzadB;
  private final GoogleApiClient.OnConnectionFailedListener zzadC;
  private final int zzadD;
  protected AtomicInteger zzadE = new AtomicInteger(0);
  private final zzl zzadu;
  private zzs zzadv;
  private GoogleApiClient.zza zzadw;
  private T zzadx;
  private final ArrayList<zzj<T>.zzc<?>> zzady = new ArrayList();
  private zzj<T>.zze zzadz;
  private final Object zzpc = new Object();
  
  protected zzj(Context paramContext, Looper paramLooper, int paramInt, zzf paramZzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this(paramContext, paramLooper, zzl.zzak(paramContext), GoogleApiAvailability.getInstance(), paramInt, paramZzf, (GoogleApiClient.ConnectionCallbacks)zzx.zzv(paramConnectionCallbacks), (GoogleApiClient.OnConnectionFailedListener)zzx.zzv(paramOnConnectionFailedListener));
  }
  
  protected zzj(Context paramContext, Looper paramLooper, zzl paramZzl, GoogleApiAvailability paramGoogleApiAvailability, int paramInt, zzf paramZzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    mContext = ((Context)zzx.zzb(paramContext, "Context must not be null"));
    zzYV = ((Looper)zzx.zzb(paramLooper, "Looper must not be null"));
    zzadu = ((zzl)zzx.zzb(paramZzl, "Supervisor must not be null"));
    zzZi = ((GoogleApiAvailability)zzx.zzb(paramGoogleApiAvailability, "API availability must not be null"));
    mHandler = new zzb(paramLooper);
    zzadD = paramInt;
    zzZH = ((zzf)zzx.zzv(paramZzf));
    zzOY = paramZzf.getAccount();
    zzZp = zzb(paramZzf.zzoj());
    zzadB = paramConnectionCallbacks;
    zzadC = paramOnConnectionFailedListener;
  }
  
  private boolean zza(int paramInt1, int paramInt2, T paramT)
  {
    synchronized (zzpc)
    {
      if (zzadA != paramInt1) {
        return false;
      }
      zzb(paramInt2, paramT);
      return true;
    }
  }
  
  private Set<Scope> zzb(Set<Scope> paramSet)
  {
    Set localSet = zza(paramSet);
    if (localSet == null) {
      return localSet;
    }
    Iterator localIterator = localSet.iterator();
    while (localIterator.hasNext()) {
      if (!paramSet.contains((Scope)localIterator.next())) {
        throw new IllegalStateException("Expanding scopes is not permitted, use implied scopes instead");
      }
    }
    return localSet;
  }
  
  private void zzb(int paramInt, T paramT)
  {
    boolean bool = true;
    int i;
    int j;
    if (paramInt == 3)
    {
      i = 1;
      if (paramT == null) {
        break label119;
      }
      j = 1;
      label17:
      if (i != j) {
        break label125;
      }
    }
    for (;;)
    {
      zzx.zzZ(bool);
      for (;;)
      {
        synchronized (zzpc)
        {
          zzadA = paramInt;
          zzadx = paramT;
          zzc(paramInt, paramT);
          switch (paramInt)
          {
          case 2: 
            return;
            zzov();
          }
        }
        zzou();
        continue;
        zzow();
      }
      i = 0;
      break;
      label119:
      j = 0;
      break label17;
      label125:
      bool = false;
    }
  }
  
  private void zzov()
  {
    if (zzadz != null)
    {
      Log.e("GmsClient", "Calling connect() while still connected, missing disconnect() for " + zzfA());
      zzadu.zzb(zzfA(), zzadz, zzot());
      zzadE.incrementAndGet();
    }
    zzadz = new zze(zzadE.get());
    if (!zzadu.zza(zzfA(), zzadz, zzot()))
    {
      Log.e("GmsClient", "unable to connect to service: " + zzfA());
      mHandler.sendMessage(mHandler.obtainMessage(3, zzadE.get(), 9));
    }
  }
  
  private void zzow()
  {
    if (zzadz != null)
    {
      zzadu.zzb(zzfA(), zzadz, zzot());
      zzadz = null;
    }
  }
  
  public void disconnect()
  {
    zzadE.incrementAndGet();
    synchronized (zzady)
    {
      int j = zzady.size();
      int i = 0;
      while (i < j)
      {
        ((zzc)zzady.get(i)).zzoG();
        i += 1;
      }
      zzady.clear();
      zzb(1, null);
      return;
    }
  }
  
  public void dump(String paramString, FileDescriptor arg2, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        int i = zzadA;
        paramArrayOfString = zzadx;
        paramPrintWriter.append(paramString).append("mConnectState=");
        switch (i)
        {
        default: 
          paramPrintWriter.print("UNKNOWN");
          paramPrintWriter.append(" mService=");
          if (paramArrayOfString != null) {
            break label137;
          }
          paramPrintWriter.println("null");
          return;
        }
      }
      paramPrintWriter.print("CONNECTING");
      continue;
      paramPrintWriter.print("CONNECTED");
      continue;
      paramPrintWriter.print("DISCONNECTING");
      continue;
      paramPrintWriter.print("DISCONNECTED");
    }
    label137:
    paramPrintWriter.append(zzfB()).append("@").println(Integer.toHexString(System.identityHashCode(paramArrayOfString.asBinder())));
  }
  
  public final Context getContext()
  {
    return mContext;
  }
  
  public final Looper getLooper()
  {
    return zzYV;
  }
  
  public boolean isConnected()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzadA == 3)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public boolean isConnecting()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzadA == 2)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  protected void onConnectionFailed(ConnectionResult paramConnectionResult) {}
  
  protected void onConnectionSuspended(int paramInt) {}
  
  protected abstract T zzV(IBinder paramIBinder);
  
  protected Set<Scope> zza(Set<Scope> paramSet)
  {
    return paramSet;
  }
  
  protected void zza(int paramInt1, Bundle paramBundle, int paramInt2)
  {
    mHandler.sendMessage(mHandler.obtainMessage(5, paramInt2, -1, new zzi(paramInt1, paramBundle)));
  }
  
  protected void zza(int paramInt1, IBinder paramIBinder, Bundle paramBundle, int paramInt2)
  {
    mHandler.sendMessage(mHandler.obtainMessage(1, paramInt2, -1, new zzg(paramInt1, paramIBinder, paramBundle)));
  }
  
  public void zza(GoogleApiClient.zza paramZza)
  {
    zzadw = ((GoogleApiClient.zza)zzx.zzb(paramZza, "Connection progress callbacks cannot be null."));
    zzb(2, null);
  }
  
  public void zza(zzp paramZzp)
  {
    Bundle localBundle = zzoB();
    paramZzp = new ValidateAccountRequest(paramZzp, (Scope[])zzZp.toArray(new Scope[zzZp.size()]), mContext.getPackageName(), localBundle);
    try
    {
      zzadv.zza(new zzd(this, zzadE.get()), paramZzp);
      return;
    }
    catch (DeadObjectException paramZzp)
    {
      Log.w("GmsClient", "service died");
      zzbz(1);
      return;
    }
    catch (RemoteException paramZzp)
    {
      Log.w("GmsClient", "Remote exception occurred", paramZzp);
    }
  }
  
  public void zza(zzp paramZzp, Set<Scope> paramSet)
  {
    try
    {
      Object localObject = zzli();
      localObject = new GetServiceRequest(zzadD).zzck(mContext.getPackageName()).zzg((Bundle)localObject);
      if (paramSet != null) {
        ((GetServiceRequest)localObject).zzd(paramSet);
      }
      if (zzlm()) {
        ((GetServiceRequest)localObject).zzb(zzog()).zzc(paramZzp);
      }
      for (;;)
      {
        zzadv.zza(new zzd(this, zzadE.get()), (GetServiceRequest)localObject);
        return;
        if (zzoC()) {
          ((GetServiceRequest)localObject).zzb(zzOY);
        }
      }
      return;
    }
    catch (DeadObjectException paramZzp)
    {
      Log.w("GmsClient", "service died");
      zzbz(1);
      return;
    }
    catch (RemoteException paramZzp)
    {
      Log.w("GmsClient", "Remote exception occurred", paramZzp);
    }
  }
  
  protected void zzbA(int paramInt)
  {
    mHandler.sendMessage(mHandler.obtainMessage(6, paramInt, -1, new zzh()));
  }
  
  public void zzbz(int paramInt)
  {
    mHandler.sendMessage(mHandler.obtainMessage(4, zzadE.get(), paramInt));
  }
  
  protected void zzc(int paramInt, T paramT) {}
  
  protected abstract String zzfA();
  
  protected abstract String zzfB();
  
  protected Bundle zzli()
  {
    return new Bundle();
  }
  
  public boolean zzlm()
  {
    return false;
  }
  
  public Bundle zzmw()
  {
    return null;
  }
  
  public final T zzoA()
    throws DeadObjectException
  {
    synchronized (zzpc)
    {
      if (zzadA == 4) {
        throw new DeadObjectException();
      }
    }
    zzoz();
    if (zzadx != null) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "Client is connected but service is null");
      IInterface localIInterface = zzadx;
      return localIInterface;
    }
  }
  
  protected Bundle zzoB()
  {
    return null;
  }
  
  public boolean zzoC()
  {
    return false;
  }
  
  public final Account zzog()
  {
    if (zzOY != null) {
      return zzOY;
    }
    return new Account("<<default account>>", "com.google");
  }
  
  protected final String zzot()
  {
    return zzZH.zzom();
  }
  
  protected void zzou() {}
  
  public void zzox()
  {
    int i = zzZi.isGooglePlayServicesAvailable(mContext);
    if (i != 0)
    {
      zzb(1, null);
      zzadw = new zzf();
      mHandler.sendMessage(mHandler.obtainMessage(3, zzadE.get(), i));
      return;
    }
    zza(new zzf());
  }
  
  protected final void zzoz()
  {
    if (!isConnected()) {
      throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
    }
  }
  
  private abstract class zza
    extends zzj<T>.zzj.zzc<Boolean>
  {
    public final int statusCode;
    public final Bundle zzadG;
    
    protected zza(int paramInt, Bundle paramBundle)
    {
      super(Boolean.valueOf(true));
      statusCode = paramInt;
      zzadG = paramBundle;
    }
    
    protected void zzc(Boolean paramBoolean)
    {
      Object localObject = null;
      if (paramBoolean == null) {
        zzj.zza(zzj.this, 1, null);
      }
      do
      {
        return;
        switch (statusCode)
        {
        default: 
          zzj.zza(zzj.this, 1, null);
          paramBoolean = localObject;
          if (zzadG != null) {
            paramBoolean = (PendingIntent)zzadG.getParcelable("pendingIntent");
          }
          zzi(new ConnectionResult(statusCode, paramBoolean));
          return;
        }
      } while (zzoD());
      zzj.zza(zzj.this, 1, null);
      zzi(new ConnectionResult(8, null));
      return;
      zzj.zza(zzj.this, 1, null);
      throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
    }
    
    protected abstract void zzi(ConnectionResult paramConnectionResult);
    
    protected abstract boolean zzoD();
    
    protected void zzoE() {}
  }
  
  final class zzb
    extends Handler
  {
    public zzb(Looper paramLooper)
    {
      super();
    }
    
    private void zza(Message paramMessage)
    {
      paramMessage = (zzj.zzc)obj;
      paramMessage.zzoE();
      paramMessage.unregister();
    }
    
    private boolean zzb(Message paramMessage)
    {
      return (what == 2) || (what == 1) || (what == 5) || (what == 6);
    }
    
    public void handleMessage(Message paramMessage)
    {
      if (zzadE.get() != arg1)
      {
        if (zzb(paramMessage)) {
          zza(paramMessage);
        }
        return;
      }
      if (((what == 1) || (what == 5) || (what == 6)) && (!isConnecting()))
      {
        zza(paramMessage);
        return;
      }
      if (what == 3)
      {
        paramMessage = new ConnectionResult(arg2, null);
        zzj.zza(zzj.this).zza(paramMessage);
        onConnectionFailed(paramMessage);
        return;
      }
      if (what == 4)
      {
        zzj.zza(zzj.this, 4, null);
        if (zzj.zzb(zzj.this) != null) {
          zzj.zzb(zzj.this).onConnectionSuspended(arg2);
        }
        onConnectionSuspended(arg2);
        zzj.zza(zzj.this, 4, 1, null);
        return;
      }
      if ((what == 2) && (!isConnected()))
      {
        zza(paramMessage);
        return;
      }
      if (zzb(paramMessage))
      {
        ((zzj.zzc)obj).zzoF();
        return;
      }
      Log.wtf("GmsClient", "Don't know how to handle this message.");
    }
  }
  
  protected abstract class zzc<TListener>
  {
    private TListener mListener;
    private boolean zzadI;
    
    public zzc()
    {
      Object localObject;
      mListener = localObject;
      zzadI = false;
    }
    
    public void unregister()
    {
      zzoG();
      synchronized (zzj.zzc(zzj.this))
      {
        zzj.zzc(zzj.this).remove(this);
        return;
      }
    }
    
    protected abstract void zzoE();
    
    /* Error */
    public void zzoF()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 24	com/google/android/gms/common/internal/zzj$zzc:mListener	Ljava/lang/Object;
      //   6: astore_1
      //   7: aload_0
      //   8: getfield 26	com/google/android/gms/common/internal/zzj$zzc:zzadI	Z
      //   11: ifeq +33 -> 44
      //   14: ldc 48
      //   16: new 50	java/lang/StringBuilder
      //   19: dup
      //   20: invokespecial 51	java/lang/StringBuilder:<init>	()V
      //   23: ldc 53
      //   25: invokevirtual 57	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   28: aload_0
      //   29: invokevirtual 60	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   32: ldc 62
      //   34: invokevirtual 57	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   37: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   40: invokestatic 72	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
      //   43: pop
      //   44: aload_0
      //   45: monitorexit
      //   46: aload_1
      //   47: ifnull +34 -> 81
      //   50: aload_0
      //   51: aload_1
      //   52: invokevirtual 76	com/google/android/gms/common/internal/zzj$zzc:zzs	(Ljava/lang/Object;)V
      //   55: aload_0
      //   56: monitorenter
      //   57: aload_0
      //   58: iconst_1
      //   59: putfield 26	com/google/android/gms/common/internal/zzj$zzc:zzadI	Z
      //   62: aload_0
      //   63: monitorexit
      //   64: aload_0
      //   65: invokevirtual 78	com/google/android/gms/common/internal/zzj$zzc:unregister	()V
      //   68: return
      //   69: astore_1
      //   70: aload_0
      //   71: monitorexit
      //   72: aload_1
      //   73: athrow
      //   74: astore_1
      //   75: aload_0
      //   76: invokevirtual 80	com/google/android/gms/common/internal/zzj$zzc:zzoE	()V
      //   79: aload_1
      //   80: athrow
      //   81: aload_0
      //   82: invokevirtual 80	com/google/android/gms/common/internal/zzj$zzc:zzoE	()V
      //   85: goto -30 -> 55
      //   88: astore_1
      //   89: aload_0
      //   90: monitorexit
      //   91: aload_1
      //   92: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	93	0	this	zzc
      //   6	46	1	localObject1	Object
      //   69	4	1	localObject2	Object
      //   74	6	1	localRuntimeException	RuntimeException
      //   88	4	1	localObject3	Object
      // Exception table:
      //   from	to	target	type
      //   2	44	69	finally
      //   44	46	69	finally
      //   70	72	69	finally
      //   50	55	74	java/lang/RuntimeException
      //   57	64	88	finally
      //   89	91	88	finally
    }
    
    public void zzoG()
    {
      try
      {
        mListener = null;
        return;
      }
      finally {}
    }
    
    protected abstract void zzs(TListener paramTListener);
  }
  
  public static final class zzd
    extends zzr.zza
  {
    private zzj zzadJ;
    private final int zzadK;
    
    public zzd(zzj paramZzj, int paramInt)
    {
      zzadJ = paramZzj;
      zzadK = paramInt;
    }
    
    private void zzoH()
    {
      zzadJ = null;
    }
    
    public void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      zzx.zzb(zzadJ, "onPostInitComplete can be called only once per call to getRemoteService");
      zzadJ.zza(paramInt, paramIBinder, paramBundle, zzadK);
      zzoH();
    }
    
    public void zzb(int paramInt, Bundle paramBundle)
    {
      zzx.zzb(zzadJ, "onAccountValidationComplete can be called only once per call to validateAccount");
      zzadJ.zza(paramInt, paramBundle, zzadK);
      zzoH();
    }
  }
  
  public final class zze
    implements ServiceConnection
  {
    private final int zzadK;
    
    public zze(int paramInt)
    {
      zzadK = paramInt;
    }
    
    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      zzx.zzb(paramIBinder, "Expecting a valid IBinder");
      zzj.zza(zzj.this, zzs.zza.zzaK(paramIBinder));
      zzbA(zzadK);
    }
    
    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      mHandler.sendMessage(mHandler.obtainMessage(4, zzadK, 1));
    }
  }
  
  protected class zzf
    implements GoogleApiClient.zza
  {
    public zzf() {}
    
    public void zza(ConnectionResult paramConnectionResult)
    {
      if (paramConnectionResult.isSuccess()) {
        zza(null, zzj.zzd(zzj.this));
      }
      while (zzj.zze(zzj.this) == null) {
        return;
      }
      zzj.zze(zzj.this).onConnectionFailed(paramConnectionResult);
    }
    
    public void zzb(ConnectionResult paramConnectionResult)
    {
      throw new IllegalStateException("Legacy GmsClient received onReportAccountValidation callback.");
    }
  }
  
  protected final class zzg
    extends zzj<T>.zzj.zza
  {
    public final IBinder zzadL;
    
    public zzg(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      super(paramInt, paramBundle);
      zzadL = paramIBinder;
    }
    
    protected void zzi(ConnectionResult paramConnectionResult)
    {
      if (zzj.zze(zzj.this) != null) {
        zzj.zze(zzj.this).onConnectionFailed(paramConnectionResult);
      }
      onConnectionFailed(paramConnectionResult);
    }
    
    protected boolean zzoD()
    {
      do
      {
        try
        {
          String str = zzadL.getInterfaceDescriptor();
          if (!zzfB().equals(str))
          {
            Log.e("GmsClient", "service descriptor mismatch: " + zzfB() + " vs. " + str);
            return false;
          }
        }
        catch (RemoteException localRemoteException)
        {
          Log.w("GmsClient", "service probably died");
          return false;
        }
        localObject = zzV(zzadL);
      } while ((localObject == null) || (!zzj.zza(zzj.this, 2, 3, (IInterface)localObject)));
      Object localObject = zzmw();
      if (zzj.zzb(zzj.this) != null) {
        zzj.zzb(zzj.this).onConnected((Bundle)localObject);
      }
      return true;
    }
  }
  
  protected final class zzh
    extends zzj<T>.zzj.zza
  {
    public zzh()
    {
      super(0, null);
    }
    
    protected void zzi(ConnectionResult paramConnectionResult)
    {
      zzj.zza(zzj.this).zza(paramConnectionResult);
      onConnectionFailed(paramConnectionResult);
    }
    
    protected boolean zzoD()
    {
      zzj.zza(zzj.this).zza(ConnectionResult.zzYi);
      return true;
    }
  }
  
  protected final class zzi
    extends zzj<T>.zzj.zza
  {
    public zzi(int paramInt, Bundle paramBundle)
    {
      super(paramInt, paramBundle);
    }
    
    protected void zzi(ConnectionResult paramConnectionResult)
    {
      zzj.zza(zzj.this).zzb(paramConnectionResult);
      onConnectionFailed(paramConnectionResult);
    }
    
    protected boolean zzoD()
    {
      zzj.zza(zzj.this).zzb(ConnectionResult.zzYi);
      return true;
    }
  }
}
