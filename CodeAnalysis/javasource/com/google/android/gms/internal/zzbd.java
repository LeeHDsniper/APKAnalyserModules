package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.overlay.zzg;
import com.google.android.gms.ads.internal.overlay.zzn;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zze;
import com.google.android.gms.ads.internal.zzp;
import org.json.JSONObject;

@zzgk
public class zzbd
  implements zzbb
{
  private final zzip zzoL;
  
  public zzbd(Context paramContext, VersionInfoParcel paramVersionInfoParcel, zzan paramZzan)
  {
    zzoL = zzp.zzby().zza(paramContext, new AdSizeParcel(), false, false, paramZzan, paramVersionInfoParcel);
    zzoL.setWillNotDraw(true);
  }
  
  private void runOnUiThread(Runnable paramRunnable)
  {
    if (zzk.zzcE().zzgI())
    {
      paramRunnable.run();
      return;
    }
    zzhu.zzHK.post(paramRunnable);
  }
  
  public void destroy()
  {
    zzoL.destroy();
  }
  
  public void zza(com.google.android.gms.ads.internal.client.zza paramZza, zzg paramZzg, zzdd paramZzdd, zzn paramZzn, boolean paramBoolean, zzdi paramZzdi, zzdk paramZzdk, zze paramZze, zzfc paramZzfc)
  {
    zzoL.zzgS().zzb(paramZza, paramZzg, paramZzdd, paramZzn, paramBoolean, paramZzdi, paramZzdk, new zze(false), paramZzfc);
  }
  
  public void zza(final zzbb.zza paramZza)
  {
    zzoL.zzgS().zza(new zziq.zza()
    {
      public void zza(zzip paramAnonymousZzip, boolean paramAnonymousBoolean)
      {
        paramZza.zzcj();
      }
    });
  }
  
  public void zza(String paramString, zzdg paramZzdg)
  {
    zzoL.zzgS().zza(paramString, paramZzdg);
  }
  
  public void zza(final String paramString1, final String paramString2)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        zzbd.zza(zzbd.this).zza(paramString1, paramString2);
      }
    });
  }
  
  public void zza(final String paramString, final JSONObject paramJSONObject)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        zzbd.zza(zzbd.this).zza(paramString, paramJSONObject);
      }
    });
  }
  
  public void zzb(String paramString, zzdg paramZzdg)
  {
    zzoL.zzgS().zzb(paramString, paramZzdg);
  }
  
  public void zzb(String paramString, JSONObject paramJSONObject)
  {
    zzoL.zzb(paramString, paramJSONObject);
  }
  
  public zzbf zzci()
  {
    return new zzbg(this);
  }
  
  public void zzs(String paramString)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        zzbd.zza(zzbd.this).loadData(zzry, "text/html", "UTF-8");
      }
    });
  }
  
  public void zzt(final String paramString)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        zzbd.zza(zzbd.this).loadUrl(paramString);
      }
    });
  }
  
  public void zzu(final String paramString)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        zzbd.zza(zzbd.this).loadData(paramString, "text/html", "UTF-8");
      }
    });
  }
}
