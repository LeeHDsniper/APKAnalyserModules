package com.google.android.gms.common.api;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.internal.zzac;
import com.google.android.gms.common.internal.zzf.zza;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzk.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.signin.zzd;
import com.google.android.gms.signin.zze;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

final class zzi
  implements GoogleApiClient
{
  private final Context mContext;
  private final Looper zzYV;
  final com.google.android.gms.common.internal.zzf zzZH;
  final Map<Api<?>, Integer> zzZI;
  private final Condition zzZX;
  final zzk zzZY;
  final Queue<zze<?>> zzZZ = new LinkedList();
  private final int zzZf;
  private final int zzZg;
  private final GoogleApiAvailability zzZi;
  final Api.zza<? extends zzd, zze> zzZj;
  private final Lock zzZs = new ReentrantLock();
  private volatile boolean zzaaa;
  private long zzaab = 120000L;
  private long zzaac = 5000L;
  private final zza zzaad;
  BroadcastReceiver zzaae;
  final Map<Api.zzc<?>, Api.zzb> zzaaf = new HashMap();
  final Map<Api.zzc<?>, ConnectionResult> zzaag = new HashMap();
  Set<Scope> zzaah = new HashSet();
  private volatile zzj zzaai;
  private ConnectionResult zzaaj = null;
  private final Set<zzl<?>> zzaak = Collections.newSetFromMap(new WeakHashMap());
  final Set<zze<?>> zzaal = Collections.newSetFromMap(new ConcurrentHashMap(16, 0.75F, 2));
  private final zzd zzaam = new zzd()
  {
    public void zzc(zzi.zze<?> paramAnonymousZze)
    {
      zzaal.remove(paramAnonymousZze);
    }
  };
  private final GoogleApiClient.ConnectionCallbacks zzaan = new GoogleApiClient.ConnectionCallbacks()
  {
    public void onConnected(Bundle paramAnonymousBundle)
    {
      zzi.zza(zzi.this).lock();
      try
      {
        zzi.zzb(zzi.this).onConnected(paramAnonymousBundle);
        return;
      }
      finally
      {
        zzi.zza(zzi.this).unlock();
      }
    }
    
    public void onConnectionSuspended(int paramAnonymousInt)
    {
      zzi.zza(zzi.this).lock();
      try
      {
        zzi.zzb(zzi.this).onConnectionSuspended(paramAnonymousInt);
        return;
      }
      finally
      {
        zzi.zza(zzi.this).unlock();
      }
    }
  };
  private final zzk.zza zzaao = new zzk.zza()
  {
    public boolean isConnected()
    {
      return zzi.this.isConnected();
    }
    
    public Bundle zzmw()
    {
      return null;
    }
  };
  
  public zzi(Context paramContext, Looper paramLooper, com.google.android.gms.common.internal.zzf paramZzf, GoogleApiAvailability paramGoogleApiAvailability, Api.zza<? extends zzd, zze> paramZza, Map<Api<?>, Api.ApiOptions> paramMap, ArrayList<GoogleApiClient.ConnectionCallbacks> paramArrayList, ArrayList<GoogleApiClient.OnConnectionFailedListener> paramArrayList1, int paramInt1, int paramInt2)
  {
    mContext = paramContext;
    zzZY = new zzk(paramLooper, zzaao);
    zzYV = paramLooper;
    zzaad = new zza(paramLooper);
    zzZi = paramGoogleApiAvailability;
    zzZf = paramInt1;
    zzZg = paramInt2;
    zzZI = new HashMap();
    zzZX = zzZs.newCondition();
    zzaai = new zzh(this);
    paramGoogleApiAvailability = paramArrayList.iterator();
    while (paramGoogleApiAvailability.hasNext())
    {
      paramArrayList = (GoogleApiClient.ConnectionCallbacks)paramGoogleApiAvailability.next();
      zzZY.registerConnectionCallbacks(paramArrayList);
    }
    paramGoogleApiAvailability = paramArrayList1.iterator();
    while (paramGoogleApiAvailability.hasNext())
    {
      paramArrayList = (GoogleApiClient.OnConnectionFailedListener)paramGoogleApiAvailability.next();
      zzZY.registerConnectionFailedListener(paramArrayList);
    }
    paramArrayList = paramZzf.zzok();
    paramArrayList1 = paramMap.keySet().iterator();
    Api localApi;
    if (paramArrayList1.hasNext())
    {
      localApi = (Api)paramArrayList1.next();
      paramGoogleApiAvailability = paramMap.get(localApi);
      if (paramArrayList.get(localApi) == null) {
        break label528;
      }
      if (getzzadg) {
        paramInt1 = 1;
      }
    }
    for (;;)
    {
      label408:
      zzZI.put(localApi, Integer.valueOf(paramInt1));
      if (localApi.zzne()) {}
      for (paramGoogleApiAvailability = zza(localApi.zznc(), paramGoogleApiAvailability, paramContext, paramLooper, paramZzf, zzaan, zza(localApi, paramInt1));; paramGoogleApiAvailability = zza(localApi.zznb(), paramGoogleApiAvailability, paramContext, paramLooper, paramZzf, zzaan, zza(localApi, paramInt1)))
      {
        zzaaf.put(localApi.zznd(), paramGoogleApiAvailability);
        break;
        paramInt1 = 2;
        break label408;
      }
      zzZH = paramZzf;
      zzZj = paramZza;
      return;
      label528:
      paramInt1 = 0;
    }
  }
  
  private void resume()
  {
    zzZs.lock();
    try
    {
      if (zznB()) {
        connect();
      }
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  private static <C extends Api.zzb, O> C zza(Api.zza<C, O> paramZza, Object paramObject, Context paramContext, Looper paramLooper, com.google.android.gms.common.internal.zzf paramZzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return paramZza.zza(paramContext, paramLooper, paramZzf, paramObject, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }
  
  private final GoogleApiClient.OnConnectionFailedListener zza(final Api<?> paramApi, final int paramInt)
  {
    new GoogleApiClient.OnConnectionFailedListener()
    {
      public void onConnectionFailed(ConnectionResult paramAnonymousConnectionResult)
      {
        zzi.zza(zzi.this).lock();
        try
        {
          zzi.zzb(zzi.this).zza(paramAnonymousConnectionResult, paramApi, paramInt);
          return;
        }
        finally
        {
          zzi.zza(zzi.this).unlock();
        }
      }
    };
  }
  
  private static <C extends Api.zzd, O> zzac zza(Api.zze<C, O> paramZze, Object paramObject, Context paramContext, Looper paramLooper, com.google.android.gms.common.internal.zzf paramZzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return new zzac(paramContext, paramLooper, paramZze.zznf(), paramConnectionCallbacks, paramOnConnectionFailedListener, paramZzf, paramZze.zzm(paramObject));
  }
  
  private void zznC()
  {
    zzZs.lock();
    try
    {
      if (zznE()) {
        connect();
      }
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  public void connect()
  {
    zzZs.lock();
    try
    {
      zzaai.connect();
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  public void disconnect()
  {
    zzZs.lock();
    try
    {
      zznE();
      zzaai.disconnect();
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    paramPrintWriter.append(paramString).append("mState=").append(zzaai.getName());
    paramPrintWriter.append(" mResuming=").print(zzaaa);
    paramPrintWriter.append(" mWorkQueue.size()=").print(zzZZ.size());
    paramPrintWriter.append(" mUnconsumedRunners.size()=").println(zzaal.size());
    String str = paramString + "  ";
    Iterator localIterator = zzZI.keySet().iterator();
    while (localIterator.hasNext())
    {
      Api localApi = (Api)localIterator.next();
      paramPrintWriter.append(paramString).append(localApi.getName()).println(":");
      ((Api.zzb)zzaaf.get(localApi.zznd())).dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    }
  }
  
  public Looper getLooper()
  {
    return zzYV;
  }
  
  public int getSessionId()
  {
    return System.identityHashCode(this);
  }
  
  public boolean isConnected()
  {
    return zzaai instanceof zzf;
  }
  
  public boolean isConnecting()
  {
    return zzaai instanceof zzg;
  }
  
  public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzZY.registerConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzZY.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void unregisterConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzZY.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void unregisterConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzZY.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public <C extends Api.zzb> C zza(Api.zzc<C> paramZzc)
  {
    paramZzc = (Api.zzb)zzaaf.get(paramZzc);
    zzx.zzb(paramZzc, "Appropriate Api was not requested.");
    return paramZzc;
  }
  
  public <A extends Api.zzb, R extends Result, T extends zzc.zza<R, A>> T zza(T paramT)
  {
    if (paramT.zznd() != null) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zzb(bool, "This task can not be enqueued (it's probably a Batch or malformed)");
      zzx.zzb(zzaaf.containsKey(paramT.zznd()), "GoogleApiClient is not configured to use the API required for this call.");
      zzZs.lock();
      try
      {
        paramT = zzaai.zza(paramT);
        return paramT;
      }
      finally
      {
        zzZs.unlock();
      }
    }
  }
  
  void zza(zzb paramZzb)
  {
    paramZzb = zzaad.obtainMessage(3, paramZzb);
    zzaad.sendMessage(paramZzb);
  }
  
  void zza(RuntimeException paramRuntimeException)
  {
    paramRuntimeException = zzaad.obtainMessage(4, paramRuntimeException);
    zzaad.sendMessage(paramRuntimeException);
  }
  
  <A extends Api.zzb> void zzb(zze<A> paramZze)
  {
    zzaal.add(paramZze);
    paramZze.zza(zzaam);
  }
  
  void zzg(ConnectionResult paramConnectionResult)
  {
    zzZs.lock();
    try
    {
      zzaaj = paramConnectionResult;
      zzaai = new zzh(this);
      zzaai.begin();
      zzZX.signalAll();
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  void zznA()
  {
    zzZs.lock();
    try
    {
      zznE();
      zzaai = new zzf(this);
      zzaai.begin();
      zzZX.signalAll();
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  boolean zznB()
  {
    return zzaaa;
  }
  
  void zznD()
  {
    if (zznB()) {
      return;
    }
    zzaaa = true;
    if (zzaae == null)
    {
      zzaae = new zzc(this);
      IntentFilter localIntentFilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
      localIntentFilter.addDataScheme("package");
      mContext.getApplicationContext().registerReceiver(zzaae, localIntentFilter);
    }
    zzaad.sendMessageDelayed(zzaad.obtainMessage(1), zzaab);
    zzaad.sendMessageDelayed(zzaad.obtainMessage(2), zzaac);
  }
  
  boolean zznE()
  {
    if (!zznB()) {
      return false;
    }
    zzaaa = false;
    zzaad.removeMessages(2);
    zzaad.removeMessages(1);
    if (zzaae != null)
    {
      mContext.getApplicationContext().unregisterReceiver(zzaae);
      zzaae = null;
    }
    return true;
  }
  
  void zznx()
  {
    Iterator localIterator = zzaal.iterator();
    while (localIterator.hasNext())
    {
      zze localZze = (zze)localIterator.next();
      localZze.zza(null);
      localZze.cancel();
    }
    zzaal.clear();
    localIterator = zzaak.iterator();
    while (localIterator.hasNext()) {
      ((zzl)localIterator.next()).clear();
    }
    zzaak.clear();
  }
  
  void zzny()
  {
    Iterator localIterator = zzaaf.values().iterator();
    while (localIterator.hasNext()) {
      ((Api.zzb)localIterator.next()).disconnect();
    }
  }
  
  void zznz()
  {
    zzZs.lock();
    try
    {
      zzaai = new zzg(this, zzZH, zzZI, zzZi, zzZj, zzZs, mContext);
      zzaai.begin();
      zzZX.signalAll();
      return;
    }
    finally
    {
      zzZs.unlock();
    }
  }
  
  final class zza
    extends Handler
  {
    zza(Looper paramLooper)
    {
      super();
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
        Log.w("GoogleApiClientImpl", "Unknown message id: " + what);
        return;
      case 1: 
        zzi.zzd(zzi.this);
        return;
      case 2: 
        zzi.zzc(zzi.this);
        return;
      case 3: 
        ((zzi.zzb)obj).zzf(zzi.this);
        return;
      }
      throw ((RuntimeException)obj);
    }
  }
  
  static abstract class zzb
  {
    private final zzj zzaaw;
    
    protected zzb(zzj paramZzj)
    {
      zzaaw = paramZzj;
    }
    
    public final void zzf(zzi paramZzi)
    {
      zzi.zza(paramZzi).lock();
      try
      {
        zzj localZzj1 = zzi.zzb(paramZzi);
        zzj localZzj2 = zzaaw;
        if (localZzj1 != localZzj2) {
          return;
        }
        zznn();
        return;
      }
      finally
      {
        zzi.zza(paramZzi).unlock();
      }
    }
    
    protected abstract void zznn();
  }
  
  private static class zzc
    extends BroadcastReceiver
  {
    private WeakReference<zzi> zzaax;
    
    zzc(zzi paramZzi)
    {
      zzaax = new WeakReference(paramZzi);
    }
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      paramIntent = paramIntent.getData();
      paramContext = null;
      if (paramIntent != null) {
        paramContext = paramIntent.getSchemeSpecificPart();
      }
      if ((paramContext == null) || (!paramContext.equals("com.google.android.gms"))) {}
      do
      {
        return;
        paramContext = (zzi)zzaax.get();
      } while (paramContext == null);
      zzi.zzc(paramContext);
    }
  }
  
  static abstract interface zzd
  {
    public abstract void zzc(zzi.zze<?> paramZze);
  }
  
  static abstract interface zze<A extends Api.zzb>
  {
    public abstract void cancel();
    
    public abstract void zza(zzi.zzd paramZzd);
    
    public abstract void zzb(A paramA)
      throws DeadObjectException;
    
    public abstract Api.zzc<A> zznd();
    
    public abstract int zzng();
    
    public abstract void zzw(Status paramStatus);
    
    public abstract void zzx(Status paramStatus);
  }
}
