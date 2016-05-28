package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.internal.zzan;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhq;

@zzgk
public class zza
{
  public zza() {}
  
  public zzhq zza(Context paramContext, AdRequestInfoParcel.zza paramZza, zzan paramZzan, zza paramZza1)
  {
    if (zzDy.extras.getBundle("sdk_less_server_data") != null) {}
    for (paramContext = new zzm(paramContext, paramZza, paramZza1);; paramContext = new zzb(paramContext, paramZza, paramZzan, paramZza1))
    {
      paramContext.zzgo();
      return paramContext;
    }
  }
  
  public static abstract interface zza
  {
    public abstract void zza(zzhj.zza paramZza);
  }
}
