package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import com.google.android.gms.internal.zzcc;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzip;

public class zzl
  implements zzj
{
  public zzl() {}
  
  public zzi zza(Context paramContext, zzip paramZzip, int paramInt, zzcd paramZzcd, zzcc paramZzcc)
  {
    return new zzc(paramContext, new zzp(paramContext, paramZzip.zzgV(), paramZzip.getRequestId(), paramZzcd, paramZzcc));
  }
}
