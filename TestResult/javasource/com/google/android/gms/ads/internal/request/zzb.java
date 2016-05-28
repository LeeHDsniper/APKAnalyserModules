package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.zzm;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzaj;
import com.google.android.gms.internal.zzan;
import com.google.android.gms.internal.zzbk;
import com.google.android.gms.internal.zzea;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzhq;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzlm;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzb
  extends zzhq
  implements zzc.zza
{
  private final Context mContext;
  private final Object zzCE = new Object();
  AdResponseParcel zzCG;
  private final zza.zza zzDp;
  private final AdRequestInfoParcel.zza zzDq;
  zzhq zzDr;
  Object zzpc = new Object();
  private final zzan zzwh;
  zzea zzye;
  
  public zzb(Context paramContext, AdRequestInfoParcel.zza paramZza, zzan paramZzan, zza.zza paramZza1)
  {
    zzDp = paramZza1;
    mContext = paramContext;
    zzDq = paramZza;
    zzwh = paramZzan;
  }
  
  public void onStop()
  {
    synchronized (zzCE)
    {
      if (zzDr != null) {
        zzDr.cancel();
      }
      return;
    }
  }
  
  zzhq zzb(AdRequestInfoParcel paramAdRequestInfoParcel)
  {
    return zzc.zza(mContext, paramAdRequestInfoParcel, this);
  }
  
  public void zzb(AdResponseParcel paramAdResponseParcel)
  {
    synchronized (zzpc)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Received ad response.");
      zzCG = paramAdResponseParcel;
      zzpc.notify();
      return;
    }
  }
  
  protected AdSizeParcel zzc(AdRequestInfoParcel paramAdRequestInfoParcel)
    throws zzb.zza
  {
    if (zzCG.zzEa == null) {
      throw new zza("The ad response must specify one of the supported ad sizes.", 0);
    }
    Object localObject = zzCG.zzEa.split("x");
    if (localObject.length != 2) {
      throw new zza("Invalid ad size format from the ad response: " + zzCG.zzEa, 0);
    }
    for (;;)
    {
      int i;
      AdSizeParcel localAdSizeParcel;
      try
      {
        int m = Integer.parseInt(localObject[0]);
        int n = Integer.parseInt(localObject[1]);
        localObject = zzqf.zzsI;
        int i1 = localObject.length;
        i = 0;
        if (i >= i1) {
          break;
        }
        localAdSizeParcel = localObject[i];
        float f = mContext.getResources().getDisplayMetrics().density;
        if (width == -1)
        {
          j = (int)(widthPixels / f);
          if (height != -2) {
            break label253;
          }
          k = (int)(heightPixels / f);
          if ((m != j) || (n != k)) {
            break label263;
          }
          return new AdSizeParcel(localAdSizeParcel, zzqf.zzsI);
        }
      }
      catch (NumberFormatException paramAdRequestInfoParcel)
      {
        throw new zza("Invalid ad size number from the ad response: " + zzCG.zzEa, 0);
      }
      int j = width;
      continue;
      label253:
      int k = height;
      continue;
      label263:
      i += 1;
    }
    throw new zza("The ad size from the ad response was not one of the requested sizes: " + zzCG.zzEa, 0);
  }
  
  public void zzdG()
  {
    for (;;)
    {
      int i;
      long l2;
      long l1;
      synchronized (zzpc)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaC("AdLoaderBackgroundTask started.");
        Object localObject1 = zzwh.zzab().zzb(mContext);
        Object localObject4 = zzm.zzq(mContext).getClientId();
        long l3 = zzp.zzbB().elapsedRealtime();
        AdRequestInfoParcel localAdRequestInfoParcel = new AdRequestInfoParcel(zzDq, (String)localObject1, (String)localObject4, l3);
        i = -2;
        l2 = -1L;
        l1 = l2;
        try
        {
          localObject4 = zzb(localAdRequestInfoParcel);
          l1 = l2;
          localObject1 = zzCE;
          l1 = l2;
          try
          {
            zzDr = ((zzhq)localObject4);
            if (zzDr != null) {
              continue;
            }
            throw new zza("Could not start the ad request service.", 0);
          }
          finally
          {
            l1 = l2;
          }
          i = localZza1.getErrorCode();
        }
        catch (zza localZza1)
        {
          localObject1 = null;
        }
        if ((i == 3) || (i == -1))
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzaD(localZza1.getMessage());
          if (zzCG != null) {
            break label378;
          }
          zzCG = new AdResponseParcel(i);
          zzhu.zzHK.post(new Runnable()
          {
            public void run()
            {
              onStop();
            }
          });
          boolean bool = TextUtils.isEmpty(zzCG.zzEf);
          if (bool) {
            break label410;
          }
        }
        try
        {
          localJSONObject = new JSONObject(zzCG.zzEf);
          localObject1 = new zzhj.zza(localAdRequestInfoParcel, zzCG, zzye, (AdSizeParcel)localObject1, i, l1, zzCG.zzEb, localJSONObject);
          zzDp.zza((zzhj.zza)localObject1);
          return;
        }
        catch (Exception localException)
        {
          JSONObject localJSONObject;
          com.google.android.gms.ads.internal.util.client.zzb.zzb("Error parsing the JSON for Active View.", localException);
        }
        l1 = l2;
        zzi(l3);
        l1 = l2;
        l2 = zzp.zzbB().elapsedRealtime();
        l1 = l2;
        zzfw();
        l1 = l2;
        if (zzqf.zzsI == null) {
          break label424;
        }
        l1 = l2;
        localObject1 = zzc(localAdRequestInfoParcel);
        try
        {
          zzw(zzCG.zzEh);
          l1 = l2;
        }
        catch (zza localZza2)
        {
          Object localObject6;
          l1 = l2;
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzaE(localJSONObject.getMessage());
      }
      label378:
      zzCG = new AdResponseParcel(i, zzCG.zzyA);
      continue;
      label410:
      localObject6 = null;
      continue;
      continue;
      label424:
      Object localObject3 = null;
    }
  }
  
  protected boolean zze(long paramLong)
    throws zzb.zza
  {
    paramLong = 60000L - (zzp.zzbB().elapsedRealtime() - paramLong);
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
      throw new zza("Ad request cancelled.", -1);
    }
  }
  
  protected void zzfw()
    throws zzb.zza
  {
    if (zzCG.errorCode == -3) {}
    do
    {
      return;
      if (TextUtils.isEmpty(zzCG.body)) {
        throw new zza("No fill from ad server.", 3);
      }
      zzp.zzbA().zza(mContext, zzCG.zzDG);
    } while (!zzCG.zzDX);
    try
    {
      zzye = new zzea(zzCG.body);
      return;
    }
    catch (JSONException localJSONException)
    {
      throw new zza("Could not parse mediation config: " + zzCG.body, 0);
    }
  }
  
  protected void zzi(long paramLong)
    throws zzb.zza
  {
    do
    {
      if (!zze(paramLong)) {
        throw new zza("Timed out waiting for ad response.", 2);
      }
    } while (zzCG == null);
    synchronized (zzCE)
    {
      zzDr = null;
      if ((zzCG.errorCode != -2) && (zzCG.errorCode != -3)) {
        throw new zza("There was a problem getting an ad response. ErrorCode: " + zzCG.errorCode, zzCG.errorCode);
      }
    }
  }
  
  protected void zzw(boolean paramBoolean)
  {
    zzp.zzbA().zzA(paramBoolean);
    zzbk localZzbk = zzp.zzbA().zzF(mContext);
    if ((localZzbk != null) && (!localZzbk.isAlive()))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("start fetching content...");
      localZzbk.zzct();
    }
  }
  
  @zzgk
  static final class zza
    extends Exception
  {
    private final int zzCI;
    
    public zza(String paramString, int paramInt)
    {
      super();
      zzCI = paramInt;
    }
    
    public int getErrorCode()
    {
      return zzCI;
    }
  }
}
