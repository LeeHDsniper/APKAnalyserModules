package com.google.android.gms.ads.internal.purchase;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzfq;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhq;
import com.google.android.gms.internal.zzhu;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@zzgk
public class zzc
  extends zzhq
  implements ServiceConnection
{
  private Context mContext;
  private boolean zzBO = false;
  private zzfq zzBP;
  private zzb zzBQ;
  private zzh zzBR;
  private List<zzf> zzBS = null;
  private zzk zzBT;
  private final Object zzpc = new Object();
  
  public zzc(Context paramContext, zzfq paramZzfq, zzk paramZzk)
  {
    this(paramContext, paramZzfq, paramZzk, new zzb(paramContext), zzh.zzx(paramContext.getApplicationContext()));
  }
  
  zzc(Context paramContext, zzfq paramZzfq, zzk paramZzk, zzb paramZzb, zzh paramZzh)
  {
    mContext = paramContext;
    zzBP = paramZzfq;
    zzBT = paramZzk;
    zzBQ = paramZzb;
    zzBR = paramZzh;
    zzBS = zzBR.zzf(10L);
  }
  
  private void zzd(long paramLong)
  {
    do
    {
      if (!zze(paramLong)) {
        com.google.android.gms.ads.internal.util.client.zzb.v("Timeout waiting for pending transaction to be processed.");
      }
    } while (!zzBO);
  }
  
  private boolean zze(long paramLong)
  {
    paramLong = 60000L - (SystemClock.elapsedRealtime() - paramLong);
    if (paramLong <= 0L) {
      return false;
    }
    try
    {
      zzpc.wait(paramLong);
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("waitWithTimeout_lock interrupted");
      }
    }
  }
  
  public void onServiceConnected(ComponentName arg1, IBinder paramIBinder)
  {
    synchronized (zzpc)
    {
      zzBQ.zzM(paramIBinder);
      zzfg();
      zzBO = true;
      zzpc.notify();
      return;
    }
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    com.google.android.gms.ads.internal.util.client.zzb.zzaD("In-app billing service disconnected.");
    zzBQ.destroy();
  }
  
  public void onStop()
  {
    synchronized (zzpc)
    {
      com.google.android.gms.common.stats.zzb.zzpD().zza(mContext, this);
      zzBQ.destroy();
      return;
    }
  }
  
  protected void zza(final zzf paramZzf, String paramString1, String paramString2)
  {
    final Intent localIntent = new Intent();
    zzp.zzbH();
    localIntent.putExtra("RESPONSE_CODE", 0);
    zzp.zzbH();
    localIntent.putExtra("INAPP_PURCHASE_DATA", paramString1);
    zzp.zzbH();
    localIntent.putExtra("INAPP_DATA_SIGNATURE", paramString2);
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        try
        {
          if (zzc.zza(zzc.this).zza(paramZzfzzCe, -1, localIntent))
          {
            zzc.zzc(zzc.this).zza(new zzg(zzc.zzb(zzc.this), paramZzfzzCf, true, -1, localIntent, paramZzf));
            return;
          }
          zzc.zzc(zzc.this).zza(new zzg(zzc.zzb(zzc.this), paramZzfzzCf, false, -1, localIntent, paramZzf));
          return;
        }
        catch (RemoteException localRemoteException)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to verify and dispatch pending transaction");
        }
      }
    });
  }
  
  public void zzdG()
  {
    synchronized (zzpc)
    {
      Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
      localIntent.setPackage("com.android.vending");
      com.google.android.gms.common.stats.zzb.zzpD().zza(mContext, localIntent, this, 1);
      zzd(SystemClock.elapsedRealtime());
      com.google.android.gms.common.stats.zzb.zzpD().zza(mContext, this);
      zzBQ.destroy();
      return;
    }
  }
  
  protected void zzfg()
  {
    if (zzBS.isEmpty()) {
      return;
    }
    HashMap localHashMap = new HashMap();
    Object localObject1 = zzBS.iterator();
    Object localObject2;
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (zzf)((Iterator)localObject1).next();
      localHashMap.put(zzCf, localObject2);
    }
    localObject1 = null;
    for (;;)
    {
      localObject1 = zzBQ.zzj(mContext.getPackageName(), (String)localObject1);
      if (localObject1 == null) {}
      do
      {
        do
        {
          localObject1 = localHashMap.keySet().iterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject2 = (String)((Iterator)localObject1).next();
            zzBR.zza((zzf)localHashMap.get(localObject2));
          }
          break;
        } while (zzp.zzbH().zzc((Bundle)localObject1) != 0);
        localObject2 = ((Bundle)localObject1).getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
        ArrayList localArrayList1 = ((Bundle)localObject1).getStringArrayList("INAPP_PURCHASE_DATA_LIST");
        ArrayList localArrayList2 = ((Bundle)localObject1).getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
        localObject1 = ((Bundle)localObject1).getString("INAPP_CONTINUATION_TOKEN");
        int i = 0;
        while (i < ((ArrayList)localObject2).size())
        {
          if (localHashMap.containsKey(((ArrayList)localObject2).get(i)))
          {
            String str1 = (String)((ArrayList)localObject2).get(i);
            String str2 = (String)localArrayList1.get(i);
            String str3 = (String)localArrayList2.get(i);
            zzf localZzf = (zzf)localHashMap.get(str1);
            String str4 = zzp.zzbH().zzal(str2);
            if (zzCe.equals(str4))
            {
              zza(localZzf, str2, str3);
              localHashMap.remove(str1);
            }
          }
          i += 1;
        }
      } while ((localObject1 == null) || (localHashMap.isEmpty()));
    }
  }
}
