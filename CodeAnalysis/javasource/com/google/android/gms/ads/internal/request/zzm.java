package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.internal.zzbb;
import com.google.android.gms.internal.zzbe;
import com.google.android.gms.internal.zzbr;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzdg;
import com.google.android.gms.internal.zzdh;
import com.google.android.gms.internal.zzdl;
import com.google.android.gms.internal.zzdv;
import com.google.android.gms.internal.zzdv.zzb;
import com.google.android.gms.internal.zzdv.zzd;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzgn;
import com.google.android.gms.internal.zzgs;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhq;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzij.zza;
import com.google.android.gms.internal.zzij.zzc;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zzlm;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzm
  extends zzhq
{
  static final long zzEu = TimeUnit.SECONDS.toMillis(10L);
  private static boolean zzEv = false;
  private static zzdv zzEw = null;
  private static zzdh zzEx = null;
  private static zzdl zzEy = null;
  private static zzdg zzEz = null;
  private static final Object zzpm = new Object();
  private final Context mContext;
  private final Object zzCE = new Object();
  private final zza.zza zzDp;
  private final AdRequestInfoParcel.zza zzDq;
  private zzdv.zzd zzEA;
  
  public zzm(Context paramContext, AdRequestInfoParcel.zza paramZza, zza.zza arg3)
  {
    zzDp = ???;
    mContext = paramContext;
    zzDq = paramZza;
    synchronized (zzpm)
    {
      if (!zzEv)
      {
        zzEy = new zzdl();
        zzEx = new zzdh(paramContext.getApplicationContext(), zzqb);
        zzEz = new zzc();
        zzEw = new zzdv(mContext.getApplicationContext(), zzDq.zzqb, (String)zzby.zztW.get(), new zzb(), new zza());
        zzEv = true;
      }
      return;
    }
  }
  
  private JSONObject zza(AdRequestInfoParcel paramAdRequestInfoParcel, String paramString)
  {
    Bundle localBundle = zzDy.extras.getBundle("sdk_less_server_data");
    String str = zzDy.extras.getString("sdk_less_network_id");
    if (localBundle == null) {}
    JSONObject localJSONObject;
    do
    {
      return null;
      localJSONObject = zzgn.zza(mContext, paramAdRequestInfoParcel, zzp.zzbD().zzD(mContext), null, null, new zzbr((String)zzby.zztW.get()), null, null, new ArrayList());
    } while (localJSONObject == null);
    try
    {
      paramAdRequestInfoParcel = AdvertisingIdClient.getAdvertisingIdInfo(mContext);
      localHashMap = new HashMap();
      localHashMap.put("request_id", paramString);
      localHashMap.put("network_id", str);
      localHashMap.put("request_param", localJSONObject);
      localHashMap.put("data", localBundle);
      if (paramAdRequestInfoParcel != null)
      {
        localHashMap.put("adid", paramAdRequestInfoParcel.getId());
        if (!paramAdRequestInfoParcel.isLimitAdTrackingEnabled()) {
          break label203;
        }
        i = 1;
        localHashMap.put("lat", Integer.valueOf(i));
      }
    }
    catch (IOException paramAdRequestInfoParcel)
    {
      for (;;)
      {
        try
        {
          HashMap localHashMap;
          paramAdRequestInfoParcel = zzp.zzbx().zzx(localHashMap);
          return paramAdRequestInfoParcel;
        }
        catch (JSONException paramAdRequestInfoParcel)
        {
          int i;
          return null;
        }
        paramAdRequestInfoParcel = paramAdRequestInfoParcel;
        zzb.zzd("Cannot get advertising id info", paramAdRequestInfoParcel);
        paramAdRequestInfoParcel = null;
        continue;
        i = 0;
      }
    }
    catch (IllegalStateException paramAdRequestInfoParcel)
    {
      for (;;) {}
    }
    catch (GooglePlayServicesNotAvailableException paramAdRequestInfoParcel)
    {
      for (;;) {}
    }
    catch (GooglePlayServicesRepairableException paramAdRequestInfoParcel)
    {
      label203:
      for (;;) {}
    }
  }
  
  protected static void zzc(zzbb paramZzbb)
  {
    paramZzbb.zza("/loadAd", zzEy);
    paramZzbb.zza("/fetchHttpRequest", zzEx);
    paramZzbb.zza("/invalidRequest", zzEz);
  }
  
  protected static void zzd(zzbb paramZzbb)
  {
    paramZzbb.zzb("/loadAd", zzEy);
    paramZzbb.zzb("/fetchHttpRequest", zzEx);
    paramZzbb.zzb("/invalidRequest", zzEz);
  }
  
  private AdResponseParcel zzf(AdRequestInfoParcel paramAdRequestInfoParcel)
  {
    Object localObject = UUID.randomUUID().toString();
    final JSONObject localJSONObject = zza(paramAdRequestInfoParcel, (String)localObject);
    if (localJSONObject == null) {
      paramAdRequestInfoParcel = new AdResponseParcel(0);
    }
    for (;;)
    {
      return paramAdRequestInfoParcel;
      long l1 = zzp.zzbB().elapsedRealtime();
      Future localFuture = zzEy.zzW((String)localObject);
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          zzm.zza(zzm.this, zzm.zzfE().zzdL());
          zzm.zzb(zzm.this).zza(new zzij.zzc()new zzij.zza
          {
            public void zzb(zzbe paramAnonymous2Zzbe)
            {
              try
              {
                paramAnonymous2Zzbe.zza("AFMA_getAdapterLessMediationAd", zzEC);
                return;
              }
              catch (Exception paramAnonymous2Zzbe)
              {
                zzb.zzb("Error requesting an ad url", paramAnonymous2Zzbe);
                zzm.zzfD().zzX(zzED);
              }
            }
          }, new zzij.zza()
          {
            public void run()
            {
              zzm.zzfD().zzX(zzED);
            }
          });
        }
      });
      long l2 = zzEu;
      long l3 = zzp.zzbB().elapsedRealtime();
      try
      {
        localObject = (JSONObject)localFuture.get(l2 - (l3 - l1), TimeUnit.MILLISECONDS);
        if (localObject == null) {
          return new AdResponseParcel(-1);
        }
      }
      catch (CancellationException paramAdRequestInfoParcel)
      {
        return new AdResponseParcel(-1);
      }
      catch (TimeoutException paramAdRequestInfoParcel)
      {
        return new AdResponseParcel(2);
      }
      catch (ExecutionException paramAdRequestInfoParcel)
      {
        return new AdResponseParcel(0);
        localObject = zzgn.zza(mContext, paramAdRequestInfoParcel, ((JSONObject)localObject).toString());
        paramAdRequestInfoParcel = (AdRequestInfoParcel)localObject;
        if (errorCode == -3) {
          continue;
        }
        paramAdRequestInfoParcel = (AdRequestInfoParcel)localObject;
        if (!TextUtils.isEmpty(body)) {
          continue;
        }
        return new AdResponseParcel(3);
      }
      catch (InterruptedException paramAdRequestInfoParcel)
      {
        for (;;) {}
      }
    }
  }
  
  public void onStop()
  {
    synchronized (zzCE)
    {
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          if (zzm.zzb(zzm.this) != null)
          {
            zzm.zzb(zzm.this).release();
            zzm.zza(zzm.this, null);
          }
        }
      });
      return;
    }
  }
  
  public void zzdG()
  {
    zzb.zzaC("SdkLessAdLoaderBackgroundTask started.");
    Object localObject = new AdRequestInfoParcel(zzDq, null, null, -1L);
    AdResponseParcel localAdResponseParcel = zzf((AdRequestInfoParcel)localObject);
    long l = zzp.zzbB().elapsedRealtime();
    localObject = new zzhj.zza((AdRequestInfoParcel)localObject, localAdResponseParcel, null, null, errorCode, l, zzEb, null);
    zza.zzIy.post(new Runnable()
    {
      public void run()
      {
        zzm.zza(zzm.this).zza(zzoA);
        if (zzm.zzb(zzm.this) != null)
        {
          zzm.zzb(zzm.this).release();
          zzm.zza(zzm.this, null);
        }
      }
    });
  }
  
  public static class zza
    implements zzdv.zzb<zzbb>
  {
    public zza() {}
    
    public void zza(zzbb paramZzbb)
    {
      zzm.zzd(paramZzbb);
    }
  }
  
  public static class zzb
    implements zzdv.zzb<zzbb>
  {
    public zzb() {}
    
    public void zza(zzbb paramZzbb)
    {
      zzm.zzc(paramZzbb);
    }
  }
  
  public static class zzc
    implements zzdg
  {
    public zzc() {}
    
    public void zza(zzip paramZzip, Map<String, String> paramMap)
    {
      paramZzip = (String)paramMap.get("request_id");
      paramMap = (String)paramMap.get("errors");
      zzb.zzaE("Invalid request: " + paramMap);
      zzm.zzfD().zzX(paramZzip);
    }
  }
}
