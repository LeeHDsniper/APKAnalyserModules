package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import java.util.concurrent.Future;

@zzgk
public class zzbc
{
  public zzbc() {}
  
  private zzbb zza(final Context paramContext, VersionInfoParcel paramVersionInfoParcel, final zzie<zzbb> paramZzie, zzan paramZzan)
  {
    paramContext = new zzbd(paramContext, paramVersionInfoParcel, paramZzan);
    paramContext.zza(new zzbb.zza()
    {
      public void zzcj()
      {
        paramZzie.zzf(paramContext);
      }
    });
    return paramContext;
  }
  
  public Future<zzbb> zza(final Context paramContext, final VersionInfoParcel paramVersionInfoParcel, final String paramString, final zzan paramZzan)
  {
    final zzie localZzie = new zzie();
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        zzbc.zza(zzbc.this, paramContext, paramVersionInfoParcel, localZzie, paramZzan).zzt(paramString);
      }
    });
    return localZzie;
  }
}
