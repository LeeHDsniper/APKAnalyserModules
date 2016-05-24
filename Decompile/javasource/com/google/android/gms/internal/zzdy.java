package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@zzgk
public final class zzdy
{
  private final Context mContext;
  private final zzeh zzow;
  private final Object zzpc = new Object();
  private final AdRequestInfoParcel zzyd;
  private final zzea zzye;
  private final boolean zzyf;
  private boolean zzyg = false;
  private zzed zzyh;
  
  public zzdy(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zzeh paramZzeh, zzea paramZzea, boolean paramBoolean)
  {
    mContext = paramContext;
    zzyd = paramAdRequestInfoParcel;
    zzow = paramZzeh;
    zzye = paramZzea;
    zzyf = paramBoolean;
  }
  
  public void cancel()
  {
    synchronized (zzpc)
    {
      zzyg = true;
      if (zzyh != null) {
        zzyh.cancel();
      }
      return;
    }
  }
  
  public zzee zza(long paramLong1, long paramLong2, zzcd paramZzcd)
  {
    zzb.zzaC("Starting mediation.");
    ArrayList localArrayList = new ArrayList();
    zzcc localZzcc1 = paramZzcd.zzdl();
    Iterator localIterator1 = zzye.zzyu.iterator();
    while (localIterator1.hasNext())
    {
      zzdz localZzdz = (zzdz)localIterator1.next();
      zzb.zzaD("Trying mediation network: " + zzyl);
      Iterator localIterator2 = zzym.iterator();
      while (localIterator2.hasNext())
      {
        String str = (String)localIterator2.next();
        zzcc localZzcc2 = paramZzcd.zzdl();
        synchronized (zzpc)
        {
          if (zzyg)
          {
            paramZzcd = new zzee(-1);
            return paramZzcd;
          }
          zzyh = new zzed(mContext, str, zzow, zzye, localZzdz, zzyd.zzDy, zzyd.zzqf, zzyd.zzqb, zzyf, zzyd.zzqt, zzyd.zzqv);
          ??? = zzyh.zza(paramLong1, paramLong2);
          if (zzyP == 0)
          {
            zzb.zzaC("Adapter succeeded.");
            paramZzcd.zzd("mediation_network_succeed", str);
            if (!localArrayList.isEmpty()) {
              paramZzcd.zzd("mediation_networks_fail", TextUtils.join(",", localArrayList));
            }
            paramZzcd.zza(localZzcc2, new String[] { "mls" });
            paramZzcd.zza(localZzcc1, new String[] { "ttm" });
            return ???;
          }
        }
        localArrayList.add(str);
        paramZzcd.zza(localZzcc2, new String[] { "mlf" });
        if (zzyR != null) {
          zzhu.zzHK.post(new Runnable()
          {
            public void run()
            {
              try
              {
                zzyi.zzyR.destroy();
                return;
              }
              catch (RemoteException localRemoteException)
              {
                zzb.zzd("Could not destroy mediation adapter.", localRemoteException);
              }
            }
          });
        }
      }
    }
    if (!localArrayList.isEmpty()) {
      paramZzcd.zzd("mediation_networks_fail", TextUtils.join(",", localArrayList));
    }
    return new zzee(1);
  }
}
