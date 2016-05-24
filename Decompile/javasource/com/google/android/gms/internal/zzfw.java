package com.google.android.gms.internal;

import android.content.Context;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;

@zzgk
public abstract class zzfw
  extends zzfz
  implements zziq.zza
{
  private final zziq zzCq;
  protected boolean zzCr = false;
  private boolean zzyg = false;
  
  protected zzfw(Context paramContext, zzhj.zza paramZza, zzip paramZzip, zzga.zza paramZza1)
  {
    super(paramContext, paramZza, paramZzip, paramZza1);
    zzCq = paramZzip.zzgS();
  }
  
  private boolean zze(long paramLong)
    throws zzfz.zza
  {
    paramLong = 60000L - (SystemClock.elapsedRealtime() - paramLong);
    if (paramLong <= 1L) {
      return false;
    }
    try
    {
      zzpc.wait(paramLong);
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new zzfz.zza("Ad request cancelled.", -1);
    }
  }
  
  public void onStop()
  {
    synchronized (zzCE)
    {
      zzoL.stopLoading();
      zzp.zzbz().zza(zzoL.getWebView());
      return;
    }
  }
  
  public void zza(zzip arg1, boolean paramBoolean)
  {
    boolean bool = true;
    for (;;)
    {
      synchronized (zzpc)
      {
        zzb.zzaC("WebView finished loading.");
        zzCr = true;
        if (!paramBoolean)
        {
          paramBoolean = bool;
          zzyg = paramBoolean;
          zzpc.notify();
          return;
        }
      }
      paramBoolean = false;
    }
  }
  
  protected void zzg(long paramLong)
    throws zzfz.zza
  {
    do
    {
      if (!zze(paramLong)) {
        throw new zzfz.zza("Timed out waiting for WebView to finish loading.", 2);
      }
      if (zzyg) {
        throw new zzfz.zza("Received cancellation request from creative.", 0);
      }
    } while (!zzCr);
  }
}
