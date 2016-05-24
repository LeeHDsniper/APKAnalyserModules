package com.google.android.gms.internal;

import android.text.TextUtils;
import com.google.android.gms.ads.internal.util.client.zzb;

public class zzcb
{
  public zzcb() {}
  
  public zzca zza(zzbz paramZzbz)
  {
    if (paramZzbz == null) {
      throw new IllegalArgumentException("CSI configuration can't be null. ");
    }
    if (!paramZzbz.zzdf())
    {
      zzb.v("CsiReporterFactory: CSI is not enabled. No CSI reporter created.");
      return null;
    }
    if (paramZzbz.getContext() == null) {
      throw new IllegalArgumentException("Context can't be null. Please set up context in CsiConfiguration.");
    }
    if (TextUtils.isEmpty(paramZzbz.zzbV())) {
      throw new IllegalArgumentException("AfmaVersion can't be null or empty. Please set up afmaVersion in CsiConfiguration.");
    }
    return new zzca(paramZzbz.getContext(), paramZzbz.zzbV(), paramZzbz.zzdg(), paramZzbz.zzdh());
  }
}
