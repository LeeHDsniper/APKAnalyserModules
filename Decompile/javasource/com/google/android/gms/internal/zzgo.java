package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.Map;
import java.util.concurrent.Future;

@zzgk
public final class zzgo
{
  private String zzBm;
  private String zzEZ;
  private zzie<zzgq> zzFa = new zzie();
  zzdv.zzd zzFb;
  public final zzdg zzFc = new zzdg()
  {
    public void zza(zzip arg1, Map<String, String> paramAnonymousMap)
    {
      synchronized (zzgo.zza(zzgo.this))
      {
        if (zzgo.zzb(zzgo.this).isDone()) {
          return;
        }
        if (!zzgo.zzc(zzgo.this).equals(paramAnonymousMap.get("request_id"))) {
          return;
        }
      }
      paramAnonymousMap = new zzgq(1, paramAnonymousMap);
      zzb.zzaE("Invalid " + paramAnonymousMap.getType() + " request error: " + paramAnonymousMap.zzfK());
      zzgo.zzb(zzgo.this).zzf(paramAnonymousMap);
    }
  };
  public final zzdg zzFd = new zzdg()
  {
    public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
    {
      zzgq localZzgq;
      synchronized (zzgo.zza(zzgo.this))
      {
        if (zzgo.zzb(zzgo.this).isDone()) {
          return;
        }
        localZzgq = new zzgq(-2, paramAnonymousMap);
        if (!zzgo.zzc(zzgo.this).equals(localZzgq.getRequestId()))
        {
          zzb.zzaE(localZzgq.getRequestId() + " ==== " + zzgo.zzc(zzgo.this));
          return;
        }
      }
      String str = localZzgq.getUrl();
      if (str == null)
      {
        zzb.zzaE("URL missing in loadAdUrl GMSG.");
        return;
      }
      if (str.contains("%40mediation_adapters%40"))
      {
        paramAnonymousZzip = str.replaceAll("%40mediation_adapters%40", zzhp.zza(paramAnonymousZzip.getContext(), (String)paramAnonymousMap.get("check_adapters"), zzgo.zzd(zzgo.this)));
        localZzgq.setUrl(paramAnonymousZzip);
        zzb.v("Ad request URL modified to " + paramAnonymousZzip);
      }
      zzgo.zzb(zzgo.this).zzf(localZzgq);
    }
  };
  zzip zzoL;
  private final Object zzpc = new Object();
  
  public zzgo(String paramString1, String paramString2)
  {
    zzEZ = paramString2;
    zzBm = paramString1;
  }
  
  public void zzb(zzdv.zzd paramZzd)
  {
    zzFb = paramZzd;
  }
  
  public void zze(zzip paramZzip)
  {
    zzoL = paramZzip;
  }
  
  public zzdv.zzd zzfH()
  {
    return zzFb;
  }
  
  public Future<zzgq> zzfI()
  {
    return zzFa;
  }
  
  public void zzfJ()
  {
    if (zzoL != null)
    {
      zzoL.destroy();
      zzoL = null;
    }
  }
}
