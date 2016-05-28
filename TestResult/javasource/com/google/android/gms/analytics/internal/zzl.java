package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.database.sqlite.SQLiteException;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.gms.analytics.AnalyticsReceiver;
import com.google.android.gms.analytics.AnalyticsService;
import com.google.android.gms.analytics.CampaignTrackingReceiver;
import com.google.android.gms.analytics.CampaignTrackingService;
import com.google.android.gms.analytics.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzja;
import com.google.android.gms.internal.zzjb;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzob;
import com.google.android.gms.internal.zzof;
import com.google.android.gms.internal.zzok;
import com.google.android.gms.internal.zzol;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzl
  extends zzd
{
  private boolean mStarted;
  private final zzj zzMn;
  private final zzah zzMo;
  private final zzag zzMp;
  private final zzi zzMq;
  private long zzMr;
  private final zzt zzMs;
  private final zzt zzMt;
  private final zzaj zzMu;
  private long zzMv;
  private boolean zzMw;
  
  protected zzl(zzf paramZzf, zzg paramZzg)
  {
    super(paramZzf);
    zzx.zzv(paramZzg);
    zzMr = Long.MIN_VALUE;
    zzMp = paramZzg.zzk(paramZzf);
    zzMn = paramZzg.zzm(paramZzf);
    zzMo = paramZzg.zzn(paramZzf);
    zzMq = paramZzg.zzo(paramZzf);
    zzMu = new zzaj(zzid());
    zzMs = new zzt(paramZzf)
    {
      public void run()
      {
        zzl.zza(zzl.this);
      }
    };
    zzMt = new zzt(paramZzf)
    {
      public void run()
      {
        zzl.zzb(zzl.this);
      }
    };
  }
  
  private void zza(zzh paramZzh, zzol paramZzol)
  {
    zzx.zzv(paramZzh);
    zzx.zzv(paramZzol);
    Object localObject1 = new zza(zzia());
    ((zza)localObject1).zzaN(paramZzh.zzix());
    ((zza)localObject1).enableAdvertisingIdCollection(paramZzh.zziy());
    localObject1 = ((zza)localObject1).zzhq();
    zzjb localZzjb = (zzjb)((zzob)localObject1).zze(zzjb.class);
    localZzjb.zzaS("data");
    localZzjb.zzH(true);
    ((zzob)localObject1).zzb(paramZzol);
    zzja localZzja = (zzja)((zzob)localObject1).zze(zzja.class);
    zzok localZzok = (zzok)((zzob)localObject1).zze(zzok.class);
    Iterator localIterator = paramZzh.zzn().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject2 = (Map.Entry)localIterator.next();
      String str = (String)((Map.Entry)localObject2).getKey();
      localObject2 = (String)((Map.Entry)localObject2).getValue();
      if ("an".equals(str)) {
        localZzok.setAppName((String)localObject2);
      } else if ("av".equals(str)) {
        localZzok.setAppVersion((String)localObject2);
      } else if ("aid".equals(str)) {
        localZzok.setAppId((String)localObject2);
      } else if ("aiid".equals(str)) {
        localZzok.setAppInstallerId((String)localObject2);
      } else if ("uid".equals(str)) {
        localZzjb.setUserId((String)localObject2);
      } else {
        localZzja.set(str, (String)localObject2);
      }
    }
    zzb("Sending installation campaign to", paramZzh.zzix(), paramZzol);
    ((zzob)localObject1).zzL(zzii().zzky());
    ((zzob)localObject1).zzxl();
  }
  
  private boolean zzbf(String paramString)
  {
    return getContext().checkCallingOrSelfPermission(paramString) == 0;
  }
  
  private void zziM()
  {
    Context localContext = zzia().getContext();
    if (!AnalyticsReceiver.zzV(localContext)) {
      zzbb("AnalyticsReceiver is not registered or is disabled. Register the receiver for reliable dispatching on non-Google Play devices. See http://goo.gl/8Rd3yj for instructions.");
    }
    do
    {
      while (!CampaignTrackingReceiver.zzV(localContext))
      {
        zzbb("CampaignTrackingReceiver is not registered, not exported or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions.");
        return;
        if (!AnalyticsService.zzW(localContext)) {
          zzbc("AnalyticsService is not registered or is disabled. Analytics service at risk of not starting. See http://goo.gl/8Rd3yj for instructions.");
        }
      }
    } while (CampaignTrackingService.zzW(localContext));
    zzbb("CampaignTrackingService is not registered or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions.");
  }
  
  private void zziO()
  {
    zzb(new zzw()
    {
      public void zzc(Throwable paramAnonymousThrowable)
      {
        zziU();
      }
    });
  }
  
  private void zziP()
  {
    try
    {
      zzMn.zziG();
      zziU();
      zzMt.zzt(zzif().zzjM());
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      for (;;)
      {
        zzd("Failed to delete stale hits", localSQLiteException);
      }
    }
  }
  
  private boolean zziV()
  {
    if (zzMw) {}
    while (((zzif().zzjk()) && (!zzif().zzjl())) || (zzjb() <= 0L)) {
      return false;
    }
    return true;
  }
  
  private void zziW()
  {
    zzv localZzv = zzih();
    if (!localZzv.zzjU()) {}
    long l;
    do
    {
      do
      {
        return;
      } while (localZzv.zzbr());
      l = zziH();
    } while ((l == 0L) || (Math.abs(zzid().currentTimeMillis() - l) > zzif().zzju()));
    zza("Dispatch alarm scheduled (ms)", Long.valueOf(zzif().zzjt()));
    localZzv.zzjV();
  }
  
  private void zziX()
  {
    zziW();
    long l2 = zzjb();
    long l1 = zzii().zzkA();
    if (l1 != 0L)
    {
      l1 = l2 - Math.abs(zzid().currentTimeMillis() - l1);
      if (l1 <= 0L) {}
    }
    for (;;)
    {
      zza("Dispatch scheduled (ms)", Long.valueOf(l1));
      if (!zzMs.zzbr()) {
        break;
      }
      l1 = Math.max(1L, l1 + zzMs.zzjR());
      zzMs.zzu(l1);
      return;
      l1 = Math.min(zzif().zzjr(), l2);
      continue;
      l1 = Math.min(zzif().zzjr(), l2);
    }
    zzMs.zzt(l1);
  }
  
  private void zziY()
  {
    zziZ();
    zzja();
  }
  
  private void zziZ()
  {
    if (zzMs.zzbr()) {
      zzaY("All hits dispatched or no network/service. Going to power save mode");
    }
    zzMs.cancel();
  }
  
  private void zzja()
  {
    zzv localZzv = zzih();
    if (localZzv.zzbr()) {
      localZzv.cancel();
    }
  }
  
  protected void onServiceConnected()
  {
    zzic();
    if (!zzif().zzjk()) {
      zziR();
    }
  }
  
  void start()
  {
    zzio();
    if (!mStarted) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "Analytics backend already started");
      mStarted = true;
      if (!zzif().zzjk()) {
        zziM();
      }
      zzig().zzf(new Runnable()
      {
        public void run()
        {
          zziN();
        }
      });
      return;
    }
  }
  
  public void zzI(boolean paramBoolean)
  {
    zziU();
  }
  
  public long zza(zzh paramZzh, boolean paramBoolean)
  {
    zzx.zzv(paramZzh);
    zzio();
    zzic();
    long l;
    for (;;)
    {
      try
      {
        zzMn.beginTransaction();
        zzMn.zza(paramZzh.zziw(), paramZzh.getClientId());
        l = zzMn.zza(paramZzh.zziw(), paramZzh.getClientId(), paramZzh.zzix());
        if (!paramBoolean)
        {
          paramZzh.zzn(l);
          zzMn.zzb(paramZzh);
          zzMn.setTransactionSuccessful();
        }
      }
      catch (SQLiteException paramZzh)
      {
        paramZzh = paramZzh;
        zze("Failed to update Analytics property", paramZzh);
        try
        {
          zzMn.endTransaction();
          return -1L;
        }
        catch (SQLiteException paramZzh)
        {
          zze("Failed to end transaction", paramZzh);
          return -1L;
        }
      }
      finally {}
      try
      {
        zzMn.endTransaction();
        return l;
      }
      catch (SQLiteException paramZzh)
      {
        zze("Failed to end transaction", paramZzh);
        return l;
      }
      paramZzh.zzn(1L + l);
    }
    try
    {
      zzMn.endTransaction();
      throw paramZzh;
    }
    catch (SQLiteException localSQLiteException)
    {
      for (;;)
      {
        zze("Failed to end transaction", localSQLiteException);
      }
    }
  }
  
  public void zza(zzab paramZzab)
  {
    zzx.zzv(paramZzab);
    zzof.zzic();
    zzio();
    if (zzMw) {
      zzaZ("Hit delivery not possible. Missing network permissions. See http://goo.gl/8Rd3yj for instructions");
    }
    for (;;)
    {
      paramZzab = zzf(paramZzab);
      zziQ();
      if (!zzMq.zzb(paramZzab)) {
        break;
      }
      zzaZ("Hit sent to the device AnalyticsService for delivery");
      return;
      zza("Delivering hit", paramZzab);
    }
    if (zzif().zzjk())
    {
      zzie().zza(paramZzab, "Service unavailable on package side");
      return;
    }
    try
    {
      zzMn.zzc(paramZzab);
      zziU();
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zze("Delivery failed to save hit to a database", localSQLiteException);
      zzie().zza(paramZzab, "deliver: failed to insert hit to database");
    }
  }
  
  public void zza(final zzw paramZzw, final long paramLong)
  {
    zzof.zzic();
    zzio();
    long l1 = -1L;
    long l2 = zzii().zzkA();
    if (l2 != 0L) {
      l1 = Math.abs(zzid().currentTimeMillis() - l2);
    }
    zzb("Dispatching local hits. Elapsed time since last dispatch (ms)", Long.valueOf(l1));
    if (!zzif().zzjk()) {
      zziQ();
    }
    try
    {
      if (zziS())
      {
        zzig().zzf(new Runnable()
        {
          public void run()
          {
            zza(paramZzw, paramLong);
          }
        });
        return;
      }
      zzii().zzkB();
      zziU();
      if (paramZzw != null) {
        paramZzw.zzc(null);
      }
      if (zzMv != paramLong)
      {
        zzMp.zzkt();
        return;
      }
    }
    catch (Throwable localThrowable)
    {
      zze("Local dispatch failed", localThrowable);
      zzii().zzkB();
      zziU();
      if (paramZzw != null) {
        paramZzw.zzc(localThrowable);
      }
    }
  }
  
  public void zzb(zzw paramZzw)
  {
    zza(paramZzw, zzMv);
  }
  
  public void zzbg(String paramString)
  {
    zzx.zzcs(paramString);
    zzic();
    zzib();
    zzol localZzol = zzam.zza(zzie(), paramString);
    if (localZzol == null) {
      zzd("Parsing failed. Ignoring invalid campaign data", paramString);
    }
    for (;;)
    {
      return;
      String str = zzii().zzkC();
      if (paramString.equals(str))
      {
        zzbb("Ignoring duplicate install campaign");
        return;
      }
      if (!TextUtils.isEmpty(str))
      {
        zzd("Ignoring multiple install campaigns. original, new", str, paramString);
        return;
      }
      zzii().zzbk(paramString);
      if (zzii().zzkz().zzv(zzif().zzjP()))
      {
        zzd("Campaign received too late, ignoring", localZzol);
        return;
      }
      zzb("Received installation campaign", localZzol);
      paramString = zzMn.zzr(0L).iterator();
      while (paramString.hasNext()) {
        zza((zzh)paramString.next(), localZzol);
      }
    }
  }
  
  protected void zzc(zzh paramZzh)
  {
    zzic();
    zzb("Sending first hit to property", paramZzh.zzix());
    if (zzii().zzkz().zzv(zzif().zzjP())) {}
    do
    {
      return;
      localObject = zzii().zzkC();
    } while (TextUtils.isEmpty((CharSequence)localObject));
    Object localObject = zzam.zza(zzie(), (String)localObject);
    zzb("Found relevant installation campaign", localObject);
    zza(paramZzh, (zzol)localObject);
  }
  
  zzab zzf(zzab paramZzab)
  {
    if (!TextUtils.isEmpty(paramZzab.zzko())) {}
    do
    {
      return paramZzab;
      localObject2 = zzii().zzkD().zzkG();
    } while (localObject2 == null);
    Object localObject1 = (Long)second;
    Object localObject2 = (String)first;
    localObject1 = localObject1 + ":" + (String)localObject2;
    localObject2 = new HashMap(paramZzab.zzn());
    ((Map)localObject2).put("_m", localObject1);
    return zzab.zza(this, paramZzab, (Map)localObject2);
  }
  
  protected void zzhB()
  {
    zzMn.zza();
    zzMo.zza();
    zzMq.zza();
  }
  
  public void zzhX()
  {
    zzof.zzic();
    zzio();
    zzaY("Service disconnected");
  }
  
  void zzhZ()
  {
    zzic();
    zzMv = zzid().currentTimeMillis();
  }
  
  public long zziH()
  {
    zzof.zzic();
    zzio();
    try
    {
      long l = zzMn.zziH();
      return l;
    }
    catch (SQLiteException localSQLiteException)
    {
      zze("Failed to get min/max hit times from local store", localSQLiteException);
    }
    return 0L;
  }
  
  protected void zziN()
  {
    zzio();
    zzii().zzky();
    if (!zzbf("android.permission.ACCESS_NETWORK_STATE"))
    {
      zzbc("Missing required android.permission.ACCESS_NETWORK_STATE. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions");
      zzjc();
    }
    if (!zzbf("android.permission.INTERNET"))
    {
      zzbc("Missing required android.permission.INTERNET. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions");
      zzjc();
    }
    if (AnalyticsService.zzW(getContext())) {
      zzaY("AnalyticsService registered in the app manifest and enabled");
    }
    for (;;)
    {
      if ((!zzMw) && (!zzif().zzjk()) && (!zzMn.isEmpty())) {
        zziQ();
      }
      zziU();
      return;
      if (zzif().zzjk()) {
        zzbc("Device AnalyticsService not registered! Hits will not be delivered reliably.");
      } else {
        zzbb("AnalyticsService not registered in the app manifest. Hits might not be delivered reliably. See http://goo.gl/8Rd3yj for instructions.");
      }
    }
  }
  
  protected void zziQ()
  {
    if (zzMw) {}
    do
    {
      long l;
      do
      {
        do
        {
          return;
        } while ((!zzif().zzjm()) || (zzMq.isConnected()));
        l = zzif().zzjH();
      } while (!zzMu.zzv(l));
      zzMu.start();
      zzaY("Connecting to service");
    } while (!zzMq.connect());
    zzaY("Connected to service");
    zzMu.clear();
    onServiceConnected();
  }
  
  public void zziR()
  {
    zzof.zzic();
    zzio();
    zzib();
    if (!zzif().zzjm()) {
      zzbb("Service client disabled. Can't dispatch local hits to device AnalyticsService");
    }
    if (!zzMq.isConnected()) {
      zzaY("Service not connected");
    }
    while (zzMn.isEmpty()) {
      return;
    }
    zzaY("Dispatching local hits to device AnalyticsService");
    for (;;)
    {
      try
      {
        List localList = zzMn.zzp(zzif().zzjv());
        if (!localList.isEmpty()) {
          break label126;
        }
        zziU();
        return;
      }
      catch (SQLiteException localSQLiteException1)
      {
        zze("Failed to read hits from store", localSQLiteException1);
        zziY();
        return;
      }
      label107:
      Object localObject;
      localSQLiteException1.remove(localObject);
      try
      {
        zzMn.zzq(((zzab)localObject).zzkj());
        label126:
        if (!localSQLiteException1.isEmpty())
        {
          localObject = (zzab)localSQLiteException1.get(0);
          if (zzMq.zzb((zzab)localObject)) {
            break label107;
          }
          zziU();
          return;
        }
      }
      catch (SQLiteException localSQLiteException2)
      {
        zze("Failed to remove hit that was send for delivery", localSQLiteException2);
        zziY();
      }
    }
  }
  
  protected boolean zziS()
  {
    int j = 1;
    zzof.zzic();
    zzio();
    zzaY("Dispatching a batch of local hits");
    int i;
    if ((!zzMq.isConnected()) && (!zzif().zzjk()))
    {
      i = 1;
      if (zzMo.zzku()) {
        break label70;
      }
    }
    for (;;)
    {
      if ((i == 0) || (j == 0)) {
        break label75;
      }
      zzaY("No network or service available. Will retry later");
      return false;
      i = 0;
      break;
      label70:
      j = 0;
    }
    label75:
    long l3 = Math.max(zzif().zzjv(), zzif().zzjw());
    ArrayList localArrayList = new ArrayList();
    l1 = 0L;
    for (;;)
    {
      try
      {
        zzMn.beginTransaction();
        localArrayList.clear();
        try
        {
          localList = zzMn.zzp(l3);
          if (localList.isEmpty())
          {
            zzaY("Store is empty, nothing to dispatch");
            zziY();
            try
            {
              zzMn.setTransactionSuccessful();
              zzMn.endTransaction();
              return false;
            }
            catch (SQLiteException localSQLiteException1)
            {
              zze("Failed to commit local dispatch transaction", localSQLiteException1);
              zziY();
              return false;
            }
          }
          zza("Hits loaded from store. count", Integer.valueOf(localList.size()));
          localObject2 = localList.iterator();
          if (((Iterator)localObject2).hasNext())
          {
            if (((zzab)((Iterator)localObject2).next()).zzkj() != l1) {
              continue;
            }
            zzd("Database contains successfully uploaded hit", Long.valueOf(l1), Integer.valueOf(localList.size()));
            zziY();
            try
            {
              zzMn.setTransactionSuccessful();
              zzMn.endTransaction();
              return false;
            }
            catch (SQLiteException localSQLiteException2)
            {
              zze("Failed to commit local dispatch transaction", localSQLiteException2);
              zziY();
              return false;
            }
          }
          l2 = l1;
        }
        catch (SQLiteException localSQLiteException3)
        {
          zzd("Failed to read hits from persisted store", localSQLiteException3);
          zziY();
          try
          {
            zzMn.setTransactionSuccessful();
            zzMn.endTransaction();
            return false;
          }
          catch (SQLiteException localSQLiteException4)
          {
            zze("Failed to commit local dispatch transaction", localSQLiteException4);
            zziY();
            return false;
          }
          l2 = l1;
          if (!zzMq.isConnected()) {
            continue;
          }
        }
        if (zzif().zzjk()) {
          continue;
        }
        zzaY("Service connected, sending hits to the service");
        l2 = l1;
        if (localList.isEmpty()) {
          continue;
        }
        localObject2 = (zzab)localList.get(0);
        if (zzMq.zzb((zzab)localObject2)) {
          continue;
        }
      }
      finally
      {
        long l2;
        try
        {
          List localList;
          Object localObject2;
          Iterator localIterator;
          zzMn.setTransactionSuccessful();
          zzMn.endTransaction();
          throw localObject1;
        }
        catch (SQLiteException localSQLiteException11)
        {
          zze("Failed to commit local dispatch transaction", localSQLiteException11);
          zziY();
          return false;
        }
        l1 = l2;
        continue;
      }
      l2 = l1;
      if (zzMo.zzku())
      {
        localObject2 = zzMo.zzf(localList);
        localIterator = ((List)localObject2).iterator();
        if (localIterator.hasNext())
        {
          l1 = Math.max(l1, ((Long)localIterator.next()).longValue());
          continue;
          l1 = Math.max(l1, ((zzab)localObject2).zzkj());
          localList.remove(localObject2);
          zzb("Hit sent do device AnalyticsService for delivery", localObject2);
          try
          {
            zzMn.zzq(((zzab)localObject2).zzkj());
            localSQLiteException4.add(Long.valueOf(((zzab)localObject2).zzkj()));
          }
          catch (SQLiteException localSQLiteException5)
          {
            zze("Failed to remove hit that was send for delivery", localSQLiteException5);
            zziY();
            try
            {
              zzMn.setTransactionSuccessful();
              zzMn.endTransaction();
              return false;
            }
            catch (SQLiteException localSQLiteException6)
            {
              zze("Failed to commit local dispatch transaction", localSQLiteException6);
              zziY();
              return false;
            }
          }
        }
        localList.removeAll((Collection)localObject2);
      }
      try
      {
        zzMn.zzd((List)localObject2);
        localSQLiteException6.addAll((Collection)localObject2);
        l2 = l1;
        boolean bool = localSQLiteException6.isEmpty();
        if (bool) {
          try
          {
            zzMn.setTransactionSuccessful();
            zzMn.endTransaction();
            return false;
          }
          catch (SQLiteException localSQLiteException7)
          {
            zze("Failed to commit local dispatch transaction", localSQLiteException7);
            zziY();
            return false;
          }
        }
      }
      catch (SQLiteException localSQLiteException8)
      {
        zze("Failed to remove successfully uploaded hits", localSQLiteException8);
        zziY();
        try
        {
          zzMn.setTransactionSuccessful();
          zzMn.endTransaction();
          return false;
        }
        catch (SQLiteException localSQLiteException9)
        {
          zze("Failed to commit local dispatch transaction", localSQLiteException9);
          zziY();
          return false;
        }
        try
        {
          zzMn.setTransactionSuccessful();
          zzMn.endTransaction();
          l1 = l2;
        }
        catch (SQLiteException localSQLiteException10)
        {
          zze("Failed to commit local dispatch transaction", localSQLiteException10);
          zziY();
          return false;
        }
      }
    }
  }
  
  public void zziU()
  {
    zzia().zzic();
    zzio();
    if (!zziV())
    {
      zzMp.unregister();
      zziY();
      return;
    }
    if (zzMn.isEmpty())
    {
      zzMp.unregister();
      zziY();
      return;
    }
    if (!((Boolean)zzy.zzNH.get()).booleanValue()) {
      zzMp.zzkr();
    }
    for (boolean bool = zzMp.isConnected(); bool; bool = true)
    {
      zziX();
      return;
    }
    zziY();
    zziW();
  }
  
  public long zzjb()
  {
    long l;
    if (zzMr != Long.MIN_VALUE) {
      l = zzMr;
    }
    do
    {
      return l;
      l = zzif().zzjs();
    } while (!zzhA().zzke());
    return zzhA().zzkV() * 1000L;
  }
  
  public void zzjc()
  {
    zzio();
    zzic();
    zzMw = true;
    zzMq.disconnect();
    zziU();
  }
}
