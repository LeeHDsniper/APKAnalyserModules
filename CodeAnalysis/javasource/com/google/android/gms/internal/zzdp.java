package com.google.android.gms.internal;

import android.os.Handler;
import com.google.android.gms.ads.internal.zzp;

@zzgk
public class zzdp
  extends zzhq
{
  final zzip zzoL;
  final zzdr zzxr;
  private final String zzxs;
  
  zzdp(zzip paramZzip, zzdr paramZzdr, String paramString)
  {
    zzoL = paramZzip;
    zzxr = paramZzdr;
    zzxs = paramString;
    zzp.zzbK().zza(this);
  }
  
  public void onStop()
  {
    zzxr.abort();
  }
  
  public void zzdG()
  {
    try
    {
      zzxr.zzZ(zzxs);
      return;
    }
    finally
    {
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          zzp.zzbK().zzb(zzdp.this);
        }
      });
    }
  }
}
