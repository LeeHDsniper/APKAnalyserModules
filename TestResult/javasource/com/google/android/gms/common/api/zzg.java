package com.google.android.gms.common.api;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.internal.ResolveAccountResponse;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzf.zza;
import com.google.android.gms.common.internal.zzp;
import com.google.android.gms.common.internal.zzt.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.signin.internal.AuthAccountResult;
import com.google.android.gms.signin.internal.zzb;
import com.google.android.gms.signin.zzd;
import com.google.android.gms.signin.zze;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.locks.Lock;

public class zzg
  implements zzj
{
  private final Context mContext;
  private zzd zzZA;
  private int zzZB;
  private boolean zzZC;
  private boolean zzZD;
  private zzp zzZE;
  private boolean zzZF;
  private boolean zzZG;
  private final zzf zzZH;
  private final Map<Api<?>, Integer> zzZI;
  private ArrayList<Future<?>> zzZJ = new ArrayList();
  private final GoogleApiAvailability zzZi;
  private final Api.zza<? extends zzd, zze> zzZj;
  private final zzi zzZq;
  private final Lock zzZs;
  private ConnectionResult zzZt;
  private int zzZu;
  private int zzZv = 0;
  private boolean zzZw = false;
  private int zzZx;
  private final Bundle zzZy = new Bundle();
  private final Set<Api.zzc> zzZz = new HashSet();
  
  public zzg(zzi paramZzi, zzf paramZzf, Map<Api<?>, Integer> paramMap, GoogleApiAvailability paramGoogleApiAvailability, Api.zza<? extends zzd, zze> paramZza, Lock paramLock, Context paramContext)
  {
    zzZq = paramZzi;
    zzZH = paramZzf;
    zzZI = paramMap;
    zzZi = paramGoogleApiAvailability;
    zzZj = paramZza;
    zzZs = paramLock;
    mContext = paramContext;
  }
  
  private void zzX(boolean paramBoolean)
  {
    if (zzZA != null)
    {
      if ((zzZA.isConnected()) && (paramBoolean)) {
        zzZA.zzzn();
      }
      zzZA.disconnect();
      zzZE = null;
    }
  }
  
  private void zza(ResolveAccountResponse paramResolveAccountResponse)
  {
    if (!zzbe(0)) {
      return;
    }
    ConnectionResult localConnectionResult = paramResolveAccountResponse.zzoP();
    if (localConnectionResult.isSuccess())
    {
      zzZE = paramResolveAccountResponse.zzoO();
      zzZD = true;
      zzZF = paramResolveAccountResponse.zzoQ();
      zzZG = paramResolveAccountResponse.zzoR();
      zznp();
      return;
    }
    if (zze(localConnectionResult))
    {
      zznu();
      zznp();
      return;
    }
    zzf(localConnectionResult);
  }
  
  private boolean zza(int paramInt1, int paramInt2, ConnectionResult paramConnectionResult)
  {
    if ((paramInt2 == 1) && (!zzd(paramConnectionResult))) {}
    while ((zzZt != null) && (paramInt1 >= zzZu)) {
      return false;
    }
    return true;
  }
  
  private void zzb(ConnectionResult paramConnectionResult, Api<?> paramApi, int paramInt)
  {
    if (paramInt != 2)
    {
      int i = paramApi.zznb().getPriority();
      if (zza(i, paramInt, paramConnectionResult))
      {
        zzZt = paramConnectionResult;
        zzZu = i;
      }
    }
    zzZq.zzaag.put(paramApi.zznd(), paramConnectionResult);
  }
  
  private boolean zzbe(int paramInt)
  {
    if (zzZv != paramInt)
    {
      Log.wtf("GoogleApiClientConnecting", "GoogleApiClient connecting is in step " + zzbf(zzZv) + " but received callback for step " + zzbf(paramInt));
      zzf(new ConnectionResult(8, null));
      return false;
    }
    return true;
  }
  
  private String zzbf(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return "UNKNOWN";
    case 0: 
      return "STEP_GETTING_SERVICE_BINDINGS";
    case 1: 
      return "STEP_VALIDATING_ACCOUNT";
    case 2: 
      return "STEP_AUTHENTICATING";
    }
    return "STEP_GETTING_REMOTE_SERVICE";
  }
  
  private void zzc(ConnectionResult paramConnectionResult)
  {
    if (!zzbe(2)) {
      return;
    }
    if (paramConnectionResult.isSuccess())
    {
      zzns();
      return;
    }
    if (zze(paramConnectionResult))
    {
      zznu();
      zzns();
      return;
    }
    zzf(paramConnectionResult);
  }
  
  private boolean zzd(ConnectionResult paramConnectionResult)
  {
    if (paramConnectionResult.hasResolution()) {}
    while (zzZi.zzbb(paramConnectionResult.getErrorCode()) != null) {
      return true;
    }
    return false;
  }
  
  private boolean zze(ConnectionResult paramConnectionResult)
  {
    return (zzZB == 2) || ((zzZB == 1) && (!paramConnectionResult.hasResolution()));
  }
  
  private void zzf(ConnectionResult paramConnectionResult)
  {
    boolean bool = false;
    zzZw = false;
    zznv();
    if (!paramConnectionResult.hasResolution()) {
      bool = true;
    }
    zzX(bool);
    zzZq.zzaag.clear();
    zzZq.zzg(paramConnectionResult);
    if ((!zzZq.zznB()) || (!zzZi.zzd(mContext, paramConnectionResult.getErrorCode())))
    {
      zzZq.zznE();
      zzZq.zzZY.zzj(paramConnectionResult);
    }
    zzZq.zzZY.zzoI();
  }
  
  private boolean zzno()
  {
    zzZx -= 1;
    if (zzZx > 0) {
      return false;
    }
    if (zzZx < 0)
    {
      Log.wtf("GoogleApiClientConnecting", "GoogleApiClient received too many callbacks for the given step. Clients may be in an unexpected state; GoogleApiClient will now disconnect.");
      zzf(new ConnectionResult(8, null));
      return false;
    }
    if (zzZt != null)
    {
      zzf(zzZt);
      return false;
    }
    return true;
  }
  
  private void zznp()
  {
    if (zzZx != 0) {}
    do
    {
      return;
      if (!zzZC) {
        break;
      }
    } while (!zzZD);
    zznq();
    return;
    zzns();
  }
  
  private void zznq()
  {
    ArrayList localArrayList = new ArrayList();
    zzZv = 1;
    zzZx = zzZq.zzaaf.size();
    Iterator localIterator = zzZq.zzaaf.keySet().iterator();
    while (localIterator.hasNext())
    {
      Api.zzc localZzc = (Api.zzc)localIterator.next();
      if (zzZq.zzaag.containsKey(localZzc))
      {
        if (zzno()) {
          zznr();
        }
      }
      else {
        localArrayList.add(zzZq.zzaaf.get(localZzc));
      }
    }
    if (!localArrayList.isEmpty()) {
      zzZJ.add(zzk.zznF().submit(new zzh(localArrayList)));
    }
  }
  
  private void zznr()
  {
    zzZv = 2;
    zzZq.zzaah = zznw();
    zzZJ.add(zzk.zznF().submit(new zzc(null)));
  }
  
  private void zzns()
  {
    ArrayList localArrayList = new ArrayList();
    zzZv = 3;
    zzZx = zzZq.zzaaf.size();
    Iterator localIterator = zzZq.zzaaf.keySet().iterator();
    while (localIterator.hasNext())
    {
      Api.zzc localZzc = (Api.zzc)localIterator.next();
      if (zzZq.zzaag.containsKey(localZzc))
      {
        if (zzno()) {
          zznt();
        }
      }
      else {
        localArrayList.add(zzZq.zzaaf.get(localZzc));
      }
    }
    if (!localArrayList.isEmpty()) {
      zzZJ.add(zzk.zznF().submit(new zzf(localArrayList)));
    }
  }
  
  private void zznt()
  {
    zzZq.zznA();
    zzk.zznF().execute(new Runnable()
    {
      public void run()
      {
        zzg.zzb(zzg.this).zzac(zzg.zza(zzg.this));
      }
    });
    if (zzZA != null)
    {
      if (zzZF) {
        zzZA.zza(zzZE, zzZG);
      }
      zzX(false);
    }
    Object localObject = zzZq.zzaag.keySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      Api.zzc localZzc = (Api.zzc)((Iterator)localObject).next();
      ((Api.zzb)zzZq.zzaaf.get(localZzc)).disconnect();
    }
    if (zzZw)
    {
      zzZw = false;
      disconnect();
      return;
    }
    if (zzZy.isEmpty()) {}
    for (localObject = null;; localObject = zzZy)
    {
      zzZq.zzZY.zzh((Bundle)localObject);
      return;
    }
  }
  
  private void zznu()
  {
    zzZC = false;
    zzZq.zzaah = Collections.emptySet();
    Iterator localIterator = zzZz.iterator();
    while (localIterator.hasNext())
    {
      Api.zzc localZzc = (Api.zzc)localIterator.next();
      if (!zzZq.zzaag.containsKey(localZzc)) {
        zzZq.zzaag.put(localZzc, new ConnectionResult(17, null));
      }
    }
  }
  
  private void zznv()
  {
    Iterator localIterator = zzZJ.iterator();
    while (localIterator.hasNext()) {
      ((Future)localIterator.next()).cancel(true);
    }
    zzZJ.clear();
  }
  
  private Set<Scope> zznw()
  {
    HashSet localHashSet = new HashSet(zzZH.zzoi());
    Map localMap = zzZH.zzok();
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      Api localApi = (Api)localIterator.next();
      if (!zzZq.zzaag.containsKey(localApi.zznd())) {
        localHashSet.addAll(getzzZp);
      }
    }
    return localHashSet;
  }
  
  public void begin()
  {
    zzZq.zzZY.zzoJ();
    zzZq.zzaag.clear();
    zzZw = false;
    zzZC = false;
    zzZt = null;
    zzZv = 0;
    zzZB = 2;
    zzZD = false;
    zzZF = false;
    HashMap localHashMap = new HashMap();
    Object localObject = zzZI.keySet().iterator();
    int i = 0;
    if (((Iterator)localObject).hasNext())
    {
      Api localApi = (Api)((Iterator)localObject).next();
      Api.zzb localZzb = (Api.zzb)zzZq.zzaaf.get(localApi.zznd());
      int k = ((Integer)zzZI.get(localApi)).intValue();
      if (localApi.zznb().getPriority() == 1) {}
      for (int j = 1;; j = 0)
      {
        if (localZzb.zzlm())
        {
          zzZC = true;
          if (k < zzZB) {
            zzZB = k;
          }
          if (k != 0) {
            zzZz.add(localApi.zznd());
          }
        }
        localHashMap.put(localZzb, new zzd(this, localApi, k));
        i = j | i;
        break;
      }
    }
    if (i != 0) {
      zzZC = false;
    }
    if (zzZC)
    {
      zzZH.zza(Integer.valueOf(zzZq.getSessionId()));
      localObject = new zzg(null);
      zzZA = ((zzd)zzZj.zza(mContext, zzZq.getLooper(), zzZH, zzZH.zzoo(), (GoogleApiClient.ConnectionCallbacks)localObject, (GoogleApiClient.OnConnectionFailedListener)localObject));
    }
    zzZx = zzZq.zzaaf.size();
    zzZJ.add(zzk.zznF().submit(new zze(localHashMap)));
  }
  
  public void connect()
  {
    zzZw = false;
  }
  
  public void disconnect()
  {
    Iterator localIterator = zzZq.zzZZ.iterator();
    while (localIterator.hasNext())
    {
      zzi.zze localZze = (zzi.zze)localIterator.next();
      if (localZze.zzng() != 1)
      {
        localZze.cancel();
        localIterator.remove();
      }
    }
    zzZq.zznx();
    if ((zzZt == null) && (!zzZq.zzZZ.isEmpty()))
    {
      zzZw = true;
      return;
    }
    zznv();
    zzX(true);
    zzZq.zzaag.clear();
    zzZq.zzg(null);
    zzZq.zzZY.zzoI();
  }
  
  public String getName()
  {
    return "CONNECTING";
  }
  
  public void onConnected(Bundle paramBundle)
  {
    if (!zzbe(3)) {}
    do
    {
      return;
      if (paramBundle != null) {
        zzZy.putAll(paramBundle);
      }
    } while (!zzno());
    zznt();
  }
  
  public void onConnectionSuspended(int paramInt)
  {
    zzf(new ConnectionResult(8, null));
  }
  
  public <A extends Api.zzb, R extends Result, T extends zzc.zza<R, A>> T zza(T paramT)
  {
    zzZq.zzZZ.add(paramT);
    return paramT;
  }
  
  public void zza(ConnectionResult paramConnectionResult, Api<?> paramApi, int paramInt)
  {
    if (!zzbe(3)) {}
    do
    {
      return;
      zzb(paramConnectionResult, paramApi, paramInt);
    } while (!zzno());
    zznt();
  }
  
  private static class zza
    extends zzb
  {
    private final WeakReference<zzg> zzZL;
    
    zza(zzg paramZzg)
    {
      zzZL = new WeakReference(paramZzg);
    }
    
    public void zza(final ConnectionResult paramConnectionResult, final AuthAccountResult paramAuthAccountResult)
    {
      paramAuthAccountResult = (zzg)zzZL.get();
      if (paramAuthAccountResult == null) {
        return;
      }
      zzg.zzd(paramAuthAccountResult).zza(new zzi.zzb(paramAuthAccountResult)
      {
        public void zznn()
        {
          zzg.zzc(paramAuthAccountResult, paramConnectionResult);
        }
      });
    }
  }
  
  private static class zzb
    extends zzt.zza
  {
    private final WeakReference<zzg> zzZL;
    
    zzb(zzg paramZzg)
    {
      zzZL = new WeakReference(paramZzg);
    }
    
    public void zzb(final ResolveAccountResponse paramResolveAccountResponse)
    {
      final zzg localZzg = (zzg)zzZL.get();
      if (localZzg == null) {
        return;
      }
      zzg.zzd(localZzg).zza(new zzi.zzb(localZzg)
      {
        public void zznn()
        {
          zzg.zza(localZzg, paramResolveAccountResponse);
        }
      });
    }
  }
  
  private class zzc
    extends zzg.zzi
  {
    private zzc()
    {
      super(null);
    }
    
    public void zznn()
    {
      zzg.zzf(zzg.this).zza(zzg.zzg(zzg.this), zzdzzaah, new zzg.zza(zzg.this));
    }
  }
  
  private static class zzd
    implements GoogleApiClient.zza
  {
    private final WeakReference<zzg> zzZL;
    private final Api<?> zzZR;
    private final int zzZS;
    
    public zzd(zzg paramZzg, Api<?> paramApi, int paramInt)
    {
      zzZL = new WeakReference(paramZzg);
      zzZR = paramApi;
      zzZS = paramInt;
    }
    
    public void zza(ConnectionResult paramConnectionResult)
    {
      boolean bool = false;
      zzg localZzg = (zzg)zzZL.get();
      if (localZzg == null) {
        return;
      }
      if (Looper.myLooper() == zzg.zzd(localZzg).getLooper()) {
        bool = true;
      }
      zzx.zza(bool, "onReportServiceBinding must be called on the GoogleApiClient handler thread");
      zzg.zzc(localZzg).lock();
      try
      {
        bool = zzg.zza(localZzg, 0);
        if (!bool) {
          return;
        }
        if (!paramConnectionResult.isSuccess()) {
          zzg.zza(localZzg, paramConnectionResult, zzZR, zzZS);
        }
        if (zzg.zzk(localZzg)) {
          zzg.zzl(localZzg);
        }
        return;
      }
      finally
      {
        zzg.zzc(localZzg).unlock();
      }
    }
    
    public void zzb(ConnectionResult paramConnectionResult)
    {
      boolean bool = true;
      zzg localZzg = (zzg)zzZL.get();
      if (localZzg == null) {
        return;
      }
      if (Looper.myLooper() == zzg.zzd(localZzg).getLooper()) {}
      for (;;)
      {
        zzx.zza(bool, "onReportAccountValidation must be called on the GoogleApiClient handler thread");
        zzg.zzc(localZzg).lock();
        try
        {
          bool = zzg.zza(localZzg, 1);
          if (!bool)
          {
            return;
            bool = false;
            continue;
          }
          if (!paramConnectionResult.isSuccess()) {
            zzg.zza(localZzg, paramConnectionResult, zzZR, zzZS);
          }
          if (zzg.zzk(localZzg)) {
            zzg.zzm(localZzg);
          }
          return;
        }
        finally
        {
          zzg.zzc(localZzg).unlock();
        }
      }
    }
  }
  
  private class zze
    extends zzg.zzi
  {
    private final Map<Api.zzb, GoogleApiClient.zza> zzZT;
    
    public zze()
    {
      super(null);
      Object localObject;
      zzZT = localObject;
    }
    
    public void zznn()
    {
      int i = zzg.zzb(zzg.this).isGooglePlayServicesAvailable(zzg.zza(zzg.this));
      Object localObject;
      if (i != 0)
      {
        localObject = new ConnectionResult(i, null);
        zzg.zzd(zzg.this).zza(new zzi.zzb(zzg.this)
        {
          public void zznn()
          {
            zzg.zza(zzg.this, zzZU);
          }
        });
      }
      for (;;)
      {
        return;
        if (zzg.zze(zzg.this)) {
          zzg.zzf(zzg.this).connect();
        }
        localObject = zzZT.keySet().iterator();
        while (((Iterator)localObject).hasNext())
        {
          Api.zzb localZzb = (Api.zzb)((Iterator)localObject).next();
          localZzb.zza((GoogleApiClient.zza)zzZT.get(localZzb));
        }
      }
    }
  }
  
  private class zzf
    extends zzg.zzi
  {
    private final ArrayList<Api.zzb> zzZW;
    
    public zzf()
    {
      super(null);
      Object localObject;
      zzZW = localObject;
    }
    
    public void zznn()
    {
      Set localSet = zzdzzaah;
      if (localSet.isEmpty()) {
        localSet = zzg.zzh(zzg.this);
      }
      for (;;)
      {
        Iterator localIterator = zzZW.iterator();
        while (localIterator.hasNext()) {
          ((Api.zzb)localIterator.next()).zza(zzg.zzg(zzg.this), localSet);
        }
        return;
      }
    }
  }
  
  private class zzg
    implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
  {
    private zzg() {}
    
    public void onConnected(Bundle paramBundle)
    {
      zzg.zzf(zzg.this).zza(new zzg.zzb(zzg.this));
    }
    
    /* Error */
    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   4: invokestatic 45	com/google/android/gms/common/api/zzg:zzc	(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;
      //   7: invokeinterface 50 1 0
      //   12: aload_0
      //   13: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   16: aload_1
      //   17: invokestatic 54	com/google/android/gms/common/api/zzg:zzb	(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)Z
      //   20: ifeq +30 -> 50
      //   23: aload_0
      //   24: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   27: invokestatic 57	com/google/android/gms/common/api/zzg:zzi	(Lcom/google/android/gms/common/api/zzg;)V
      //   30: aload_0
      //   31: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   34: invokestatic 60	com/google/android/gms/common/api/zzg:zzj	(Lcom/google/android/gms/common/api/zzg;)V
      //   37: aload_0
      //   38: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   41: invokestatic 45	com/google/android/gms/common/api/zzg:zzc	(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;
      //   44: invokeinterface 63 1 0
      //   49: return
      //   50: aload_0
      //   51: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   54: aload_1
      //   55: invokestatic 66	com/google/android/gms/common/api/zzg:zza	(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V
      //   58: goto -21 -> 37
      //   61: astore_1
      //   62: aload_0
      //   63: getfield 17	com/google/android/gms/common/api/zzg$zzg:zzZK	Lcom/google/android/gms/common/api/zzg;
      //   66: invokestatic 45	com/google/android/gms/common/api/zzg:zzc	(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;
      //   69: invokeinterface 63 1 0
      //   74: aload_1
      //   75: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	76	0	this	zzg
      //   0	76	1	paramConnectionResult	ConnectionResult
      // Exception table:
      //   from	to	target	type
      //   12	37	61	finally
      //   50	58	61	finally
    }
    
    public void onConnectionSuspended(int paramInt) {}
  }
  
  private class zzh
    extends zzg.zzi
  {
    private final ArrayList<Api.zzb> zzZW;
    
    public zzh()
    {
      super(null);
      Object localObject;
      zzZW = localObject;
    }
    
    public void zznn()
    {
      Iterator localIterator = zzZW.iterator();
      while (localIterator.hasNext()) {
        ((Api.zzb)localIterator.next()).zza(zzg.zzg(zzg.this));
      }
    }
  }
  
  private abstract class zzi
    implements Runnable
  {
    private zzi() {}
    
    public void run()
    {
      zzg.zzc(zzg.this).lock();
      try
      {
        boolean bool = Thread.interrupted();
        if (bool) {
          return;
        }
        zznn();
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        zzg.zzd(zzg.this).zza(localRuntimeException);
        return;
      }
      finally
      {
        zzg.zzc(zzg.this).unlock();
      }
    }
    
    protected abstract void zznn();
  }
}
