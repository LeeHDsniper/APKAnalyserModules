package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.text.TextUtils;
import android.webkit.WebView;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.request.zzj.zza;
import com.google.android.gms.ads.internal.request.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public final class zzgm
  extends zzj.zza
{
  private static zzgm zzEL;
  private static final Object zzpm = new Object();
  private final Context mContext;
  private final zzgl zzEM;
  private final zzbr zzEN;
  private final zzdv zzqU;
  
  zzgm(Context paramContext, zzbr paramZzbr, zzgl paramZzgl)
  {
    mContext = paramContext;
    zzEM = paramZzgl;
    zzEN = paramZzbr;
    if (paramContext.getApplicationContext() != null) {
      paramContext = paramContext.getApplicationContext();
    }
    for (;;)
    {
      zzqU = new zzdv(paramContext, new VersionInfoParcel(7895000, 7895000, true), paramZzbr.zzdb(), new zzdv.zzb()new zzdv.zzc
      {
        public void zza(zzbb paramAnonymousZzbb)
        {
          paramAnonymousZzbb.zza("/log", zzdf.zzwP);
        }
      }, new zzdv.zzc());
      return;
    }
  }
  
  private static AdResponseParcel zza(Context paramContext, zzdv paramZzdv, final zzbr paramZzbr, zzgl paramZzgl, final AdRequestInfoParcel paramAdRequestInfoParcel)
  {
    zzb.zzaC("Starting ad request from service.");
    zzby.zzw(paramContext);
    final zzcd localZzcd = new zzcd(((Boolean)zzby.zzuB.get()).booleanValue(), "load_ad", zzqf.zzsG);
    if ((versionCode > 10) && (zzDT != -1L)) {
      localZzcd.zza(localZzcd.zzb(zzDT), new String[] { "cts" });
    }
    zzcc localZzcc = localZzcd.zzdl();
    zzEH.init();
    Object localObject = zzp.zzbD().zzD(paramContext);
    if (zzFN == -1)
    {
      zzb.zzaC("Device is offline.");
      return new AdResponseParcel(2);
    }
    if (versionCode >= 7) {}
    final zzgo localZzgo;
    for (final String str1 = zzDQ;; str1 = UUID.randomUUID().toString())
    {
      localZzgo = new zzgo(str1, applicationInfo.packageName);
      if (zzDy.extras == null) {
        break;
      }
      str2 = zzDy.extras.getString("_ad");
      if (str2 == null) {
        break;
      }
      return zzgn.zza(paramContext, paramAdRequestInfoParcel, str2);
    }
    Location localLocation = zzEH.zzc(250L);
    String str2 = zzEI.zzc(paramContext, zzDz.packageName);
    List localList = zzEG.zza(paramAdRequestInfoParcel);
    String str3 = zzEJ.zzau(zzDA);
    localObject = zzgn.zza(paramContext, paramAdRequestInfoParcel, (zzgr)localObject, zzEK.zzE(paramContext), localLocation, paramZzbr, str2, str3, localList);
    if (versionCode < 7) {}
    try
    {
      ((JSONObject)localObject).put("request_id", str1);
      if (localObject == null) {
        return new AdResponseParcel(0);
      }
      str1 = ((JSONObject)localObject).toString();
      localZzcd.zza(localZzcc, new String[] { "arc" });
      localObject = localZzcd.zzdl();
      if (((Boolean)zzby.zztX.get()).booleanValue()) {
        zzhu.zzHK.post(new Runnable()
        {
          public void run()
          {
            zzdv.zzd localZzd = zzEO.zzdL();
            localZzgo.zzb(localZzd);
            localZzcd.zza(zzEQ, new String[] { "rwc" });
            localZzd.zza(new zzij.zzc()new zzij.zza
            {
              public void zzb(zzbe paramAnonymous2Zzbe)
              {
                zzoC.zza(zzES, new String[] { "jsf" });
                zzoC.zzdm();
                paramAnonymous2Zzbe.zza("/invalidRequest", zzEP.zzFc);
                paramAnonymous2Zzbe.zza("/loadAdURL", zzEP.zzFd);
                try
                {
                  paramAnonymous2Zzbe.zza("AFMA_buildAdURL", zzER);
                  return;
                }
                catch (Exception paramAnonymous2Zzbe)
                {
                  zzb.zzb("Error requesting an ad url", paramAnonymous2Zzbe);
                }
              }
            }, new zzij.zza()
            {
              public void run() {}
            });
          }
        });
      }
      for (;;)
      {
        try
        {
          paramZzbr = (zzgq)localZzgo.zzfI().get(10L, TimeUnit.SECONDS);
          if (paramZzbr != null) {
            continue;
          }
          paramContext = new AdResponseParcel(0);
          return paramContext;
        }
        catch (Exception paramContext)
        {
          paramContext = new AdResponseParcel(0);
          return paramContext;
          if (paramZzbr.getErrorCode() == -2) {
            continue;
          }
          paramContext = new AdResponseParcel(paramZzbr.getErrorCode());
          return paramContext;
          if (localZzcd.zzdo() == null) {
            continue;
          }
          localZzcd.zza(localZzcd.zzdo(), new String[] { "rur" });
          paramZzdv = null;
          if (!paramZzbr.zzfM()) {
            continue;
          }
          paramZzdv = zzEF.zzat(zzDz.packageName);
          paramZzdv = zza(paramAdRequestInfoParcel, paramContext, zzqb.zzIz, paramZzbr.getUrl(), paramZzdv, str2, paramZzbr, localZzcd);
          if (zzEj != 1) {
            continue;
          }
          zzEI.clearToken(paramContext, zzDz.packageName);
          localZzcd.zza(localZzcc, new String[] { "tts" });
          zzEl = localZzcd.zzdn();
          return paramZzdv;
        }
        finally
        {
          zzhu.zzHK.post(new Runnable()
          {
            public void run()
            {
              zzEP.zzfJ();
              if (zzEP.zzfH() != null) {
                zzEP.zzfH().release();
              }
            }
          });
        }
        zzhu.zzHK.post(new Runnable()
        {
          public void run()
          {
            zzip localZzip = zzp.zzby().zza(zzrn, new AdSizeParcel(), false, false, null, paramAdRequestInfoParcelzzqb);
            if (zzp.zzbA().zzgi()) {
              localZzip.getWebView().clearCache(true);
            }
            localZzip.setWillNotDraw(true);
            localZzgo.zze(localZzip);
            localZzcd.zza(zzEQ, new String[] { "rwc" });
            Object localObject = localZzcd.zzdl();
            localObject = zzgm.zzb(str1, localZzcd, (zzcc)localObject);
            zziq localZziq = localZzip.zzgS();
            localZziq.zza("/invalidRequest", localZzgozzFc);
            localZziq.zza("/loadAdURL", localZzgozzFd);
            localZziq.zza("/log", zzdf.zzwP);
            localZziq.zza((zziq.zza)localObject);
            zzb.zzaC("Loading the JS library.");
            localZzip.loadUrl(paramZzbr.zzdb());
          }
        });
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;) {}
    }
  }
  
  public static AdResponseParcel zza(AdRequestInfoParcel paramAdRequestInfoParcel, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, zzgq paramZzgq, zzcd paramZzcd)
  {
    zzcc localZzcc;
    if (paramZzcd != null) {
      localZzcc = paramZzcd.zzdl();
    }
    try
    {
      localZzgp = new zzgp(paramAdRequestInfoParcel);
      zzb.zzaC("AdRequestServiceImpl: Sending request: " + paramString2);
      paramAdRequestInfoParcel = new URL(paramString2);
      l = zzp.zzbB().elapsedRealtime();
      i = 0;
      paramString2 = (HttpURLConnection)paramAdRequestInfoParcel.openConnection();
    }
    catch (IOException paramAdRequestInfoParcel)
    {
      try
      {
        for (;;)
        {
          zzgp localZzgp;
          long l;
          int i;
          zzp.zzbx().zza(paramContext, paramString1, false, paramString2);
          if (!TextUtils.isEmpty(paramString3)) {
            paramString2.addRequestProperty("x-afma-drt-cookie", paramString3);
          }
          if (!TextUtils.isEmpty(paramString4)) {
            paramString2.addRequestProperty("Authorization", "Bearer " + paramString4);
          }
          if ((paramZzgq != null) && (!TextUtils.isEmpty(paramZzgq.zzfL())))
          {
            paramString2.setDoOutput(true);
            localObject = paramZzgq.zzfL().getBytes();
            paramString2.setFixedLengthStreamingMode(localObject.length);
            BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(paramString2.getOutputStream());
            localBufferedOutputStream.write((byte[])localObject);
            localBufferedOutputStream.close();
          }
          int j = paramString2.getResponseCode();
          Object localObject = paramString2.getHeaderFields();
          if ((j >= 200) && (j < 300))
          {
            paramAdRequestInfoParcel = paramAdRequestInfoParcel.toString();
            paramContext = zzp.zzbx().zza(new InputStreamReader(paramString2.getInputStream()));
            zza(paramAdRequestInfoParcel, (Map)localObject, paramContext, j);
            localZzgp.zzb(paramAdRequestInfoParcel, (Map)localObject, paramContext);
            if (paramZzcd != null) {
              paramZzcd.zza(localZzcc, new String[] { "ufe" });
            }
            paramAdRequestInfoParcel = localZzgp.zzj(l);
            return paramAdRequestInfoParcel;
            localZzcc = null;
          }
          else
          {
            zza(paramAdRequestInfoParcel.toString(), (Map)localObject, null, j);
            if ((j >= 300) && (j < 400))
            {
              paramAdRequestInfoParcel = paramString2.getHeaderField("Location");
              if (TextUtils.isEmpty(paramAdRequestInfoParcel))
              {
                zzb.zzaE("No location header to follow redirect.");
                paramAdRequestInfoParcel = new AdResponseParcel(0);
                return paramAdRequestInfoParcel;
              }
              paramAdRequestInfoParcel = new URL(paramAdRequestInfoParcel);
              i += 1;
              if (i > 5)
              {
                zzb.zzaE("Too many redirects.");
                paramAdRequestInfoParcel = new AdResponseParcel(0);
                return paramAdRequestInfoParcel;
              }
            }
            else
            {
              zzb.zzaE("Received error HTTP response code: " + j);
              paramAdRequestInfoParcel = new AdResponseParcel(0);
              return paramAdRequestInfoParcel;
            }
            localZzgp.zzh((Map)localObject);
            paramString2.disconnect();
          }
        }
      }
      finally
      {
        paramString2.disconnect();
      }
      paramAdRequestInfoParcel = paramAdRequestInfoParcel;
      zzb.zzaE("Error while connecting to ad server: " + paramAdRequestInfoParcel.getMessage());
      return new AdResponseParcel(2);
    }
  }
  
  public static zzgm zza(Context paramContext, zzbr paramZzbr, zzgl paramZzgl)
  {
    synchronized (zzpm)
    {
      if (zzEL == null)
      {
        Context localContext = paramContext;
        if (paramContext.getApplicationContext() != null) {
          localContext = paramContext.getApplicationContext();
        }
        zzEL = new zzgm(localContext, paramZzbr, paramZzgl);
      }
      paramContext = zzEL;
      return paramContext;
    }
  }
  
  private static zziq.zza zza(final String paramString, zzcd paramZzcd, final zzcc paramZzcc)
  {
    new zziq.zza()
    {
      public void zza(zzip paramAnonymousZzip, boolean paramAnonymousBoolean)
      {
        zzoC.zza(paramZzcc, new String[] { "jsf" });
        zzoC.zzdm();
        paramAnonymousZzip.zza("AFMA_buildAdURL", paramString);
      }
    };
  }
  
  private static void zza(String paramString1, Map<String, List<String>> paramMap, String paramString2, int paramInt)
  {
    if (zzb.zzM(2))
    {
      zzb.v("Http Response: {\n  URL:\n    " + paramString1 + "\n  Headers:");
      if (paramMap != null)
      {
        paramString1 = paramMap.keySet().iterator();
        while (paramString1.hasNext())
        {
          Object localObject = (String)paramString1.next();
          zzb.v("    " + (String)localObject + ":");
          localObject = ((List)paramMap.get(localObject)).iterator();
          while (((Iterator)localObject).hasNext())
          {
            String str = (String)((Iterator)localObject).next();
            zzb.v("      " + str);
          }
        }
      }
      zzb.v("  Body:");
      if (paramString2 != null)
      {
        int i = 0;
        while (i < Math.min(paramString2.length(), 100000))
        {
          zzb.v(paramString2.substring(i, Math.min(paramString2.length(), i + 1000)));
          i += 1000;
        }
      }
      zzb.v("    null");
      zzb.v("  Response Code:\n    " + paramInt + "\n}");
    }
  }
  
  public void zza(final AdRequestInfoParcel paramAdRequestInfoParcel, final zzk paramZzk)
  {
    zzp.zzbA().zzb(mContext, zzqb);
    zzhu.zzb(new Runnable()
    {
      public void run()
      {
        try
        {
          AdResponseParcel localAdResponseParcel1 = zze(paramAdRequestInfoParcel);
          localAdResponseParcel2 = localAdResponseParcel1;
          if (localAdResponseParcel1 == null) {
            localAdResponseParcel2 = new AdResponseParcel(0);
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            try
            {
              AdResponseParcel localAdResponseParcel2;
              paramZzk.zzb(localAdResponseParcel2);
              return;
            }
            catch (RemoteException localRemoteException)
            {
              Object localObject;
              zzb.zzd("Fail to forward ad response.", localRemoteException);
            }
            localException = localException;
            zzp.zzbA().zzc(localException, true);
            zzb.zzd("Could not fetch ad response due to an Exception.", localException);
            localObject = null;
          }
        }
      }
    });
  }
  
  public AdResponseParcel zze(AdRequestInfoParcel paramAdRequestInfoParcel)
  {
    return zza(mContext, zzqU, zzEN, zzEM, paramAdRequestInfoParcel);
  }
}
