package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;

@zzgk
public class zzfy
  extends zzfw
{
  zzfy(Context paramContext, zzhj.zza paramZza, zzip paramZzip, zzga.zza paramZza1)
  {
    super(paramContext, paramZza, paramZzip, paramZza1);
  }
  
  protected void zzh(long paramLong)
    throws zzfz.zza
  {
    Object localObject = zzoL.zzaN();
    int j;
    if (zzsH) {
      j = mContext.getResources().getDisplayMetrics().widthPixels;
    }
    for (int i = mContext.getResources().getDisplayMetrics().heightPixels;; i = heightPixels)
    {
      localObject = new zzfx(this, zzoL, j, i);
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          synchronized (zzpc)
          {
            if (zzCG.errorCode != -2) {
              return;
            }
            zzoL.zzgS().zza(zzfy.this);
            zzCB.zza(zzCG);
            return;
          }
        }
      });
      zzg(paramLong);
      if (!((zzfx)localObject).zzfn()) {
        break;
      }
      zzb.zzaC("Ad-Network indicated no fill with passback URL.");
      throw new zzfz.zza("AdNetwork sent passback url", 3);
      j = widthPixels;
    }
    if (!((zzfx)localObject).zzfo()) {
      throw new zzfz.zza("AdNetwork timed out", 2);
    }
  }
}
