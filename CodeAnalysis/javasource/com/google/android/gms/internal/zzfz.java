package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;

@zzgk
public abstract class zzfz
  extends zzhq
{
  protected final Context mContext;
  protected final zzga.zza zzCD;
  protected final Object zzCE = new Object();
  protected final zzhj.zza zzCF;
  protected AdResponseParcel zzCG;
  protected final zzip zzoL;
  protected final Object zzpc = new Object();
  
  protected zzfz(Context paramContext, zzhj.zza paramZza, zzip paramZzip, zzga.zza paramZza1)
  {
    mContext = paramContext;
    zzCF = paramZza;
    zzCG = zzGM;
    zzoL = paramZzip;
    zzCD = paramZza1;
  }
  
  public void onStop() {}
  
  public void zzdG()
  {
    for (;;)
    {
      int i;
      synchronized (zzpc)
      {
        zzb.zzaC("AdRendererBackgroundTask started.");
        i = zzCF.errorCode;
        try
        {
          zzh(SystemClock.elapsedRealtime());
          final zzhj localZzhj = zzz(i);
          zzhu.zzHK.post(new Runnable()
          {
            public void run()
            {
              synchronized (zzpc)
              {
                zzi(localZzhj);
                return;
              }
            }
          });
          return;
        }
        catch (zza localZza)
        {
          i = localZza.getErrorCode();
          if (i == 3) {
            continue;
          }
        }
        if (i == -1)
        {
          zzb.zzaD(localZza.getMessage());
          if (zzCG == null)
          {
            zzCG = new AdResponseParcel(i);
            zzhu.zzHK.post(new Runnable()
            {
              public void run()
              {
                onStop();
              }
            });
          }
        }
        else
        {
          zzb.zzaE(localZza.getMessage());
        }
      }
      zzCG = new AdResponseParcel(i, zzCG.zzyA);
    }
  }
  
  protected abstract void zzh(long paramLong)
    throws zzfz.zza;
  
  protected void zzi(zzhj paramZzhj)
  {
    zzCD.zzb(paramZzhj);
  }
  
  protected zzhj zzz(int paramInt)
  {
    AdRequestInfoParcel localAdRequestInfoParcel = zzCF.zzGL;
    return new zzhj(zzDy, zzoL, zzCG.zzyw, paramInt, zzCG.zzyx, zzCG.zzDZ, zzCG.orientation, zzCG.zzyA, zzDB, zzCG.zzDX, null, null, null, null, null, zzCG.zzDY, zzCF.zzqf, zzCG.zzDW, zzCF.zzGI, zzCG.zzEb, zzCG.zzEc, zzCF.zzGF, null, zzDO);
  }
  
  protected static final class zza
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
