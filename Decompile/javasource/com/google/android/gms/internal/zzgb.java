package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;

@zzgk
public class zzgb
  extends zzfw
{
  zzgb(Context paramContext, zzhj.zza paramZza, zzip paramZzip, zzga.zza paramZza1)
  {
    super(paramContext, paramZza, paramZzip, paramZza1);
  }
  
  protected void zzfp() {}
  
  protected void zzh(long paramLong)
    throws zzfz.zza
  {
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        synchronized (zzpc)
        {
          if (zzCG.errorCode != -2) {
            return;
          }
          zzoL.zzgS().zza(zzgb.this);
          zzfp();
          zzb.v("Loading HTML in WebView.");
          zzoL.loadDataWithBaseURL(zzp.zzbx().zzaw(zzCG.zzAT), zzCG.body, "text/html", "UTF-8", null);
          return;
        }
      }
    });
    zzg(paramLong);
  }
}
