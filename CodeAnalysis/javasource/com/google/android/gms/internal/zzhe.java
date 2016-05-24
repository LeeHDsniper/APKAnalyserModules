package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Future;

@zzgk
public class zzhe
  extends zzhq
  implements zzhd
{
  private final Context mContext;
  private final zzhj.zza zzCF;
  private final HashSet<String> zzGA = new HashSet();
  private final zzgx zzGB;
  private final String zzGh;
  private final ArrayList<Future> zzGy = new ArrayList();
  private final ArrayList<String> zzGz = new ArrayList();
  private final Object zzpc = new Object();
  
  public zzhe(Context paramContext, String paramString, zzhj.zza paramZza, zzgx paramZzgx)
  {
    mContext = paramContext;
    zzGh = paramString;
    zzCF = paramZza;
    zzGB = paramZzgx;
  }
  
  private void zzk(String paramString1, String paramString2)
  {
    synchronized (zzpc)
    {
      zzgy localZzgy = zzGB.zzar(paramString1);
      if ((localZzgy == null) || (localZzgy.zzfR() == null) || (localZzgy.zzfQ() == null)) {
        return;
      }
      paramString2 = new zzgz(mContext, paramString1, zzGh, paramString2, zzCF, localZzgy, this);
      zzGy.add(paramString2.zzgn());
      zzGz.add(paramString1);
      return;
    }
  }
  
  public void onStop() {}
  
  public void zzas(String paramString)
  {
    synchronized (zzpc)
    {
      zzGA.add(paramString);
      return;
    }
  }
  
  public void zzb(String paramString, int paramInt) {}
  
  public void zzdG()
  {
    ??? = zzCF.zzGG.zzyu.iterator();
    Object localObject2;
    while (((Iterator)???).hasNext())
    {
      Object localObject4 = (zzdz)((Iterator)???).next();
      localObject2 = zzyr;
      localObject4 = zzym.iterator();
      while (((Iterator)localObject4).hasNext()) {
        zzk((String)((Iterator)localObject4).next(), (String)localObject2);
      }
    }
    int i = 0;
    for (;;)
    {
      if (i < zzGy.size()) {}
      try
      {
        ((Future)zzGy.get(i)).get();
        synchronized (zzpc)
        {
          if (zzGA.contains(zzGz.get(i)))
          {
            localObject2 = (String)zzGz.get(i);
            localObject2 = new zzhj(zzCF.zzGL.zzDy, null, zzCF.zzGM.zzyw, -2, zzCF.zzGM.zzyx, zzCF.zzGM.zzDZ, zzCF.zzGM.orientation, zzCF.zzGM.zzyA, zzCF.zzGL.zzDB, zzCF.zzGM.zzDX, (zzdz)zzCF.zzGG.zzyu.get(i), null, (String)localObject2, zzCF.zzGG, null, zzCF.zzGM.zzDY, zzCF.zzqf, zzCF.zzGM.zzDW, zzCF.zzGI, zzCF.zzGM.zzEb, zzCF.zzGM.zzEc, zzCF.zzGF, null, zzCF.zzGL.zzDO);
            zza.zzIy.post(new Runnable()
            {
              public void run()
              {
                zzhe.zza(zzhe.this).zzb(zzpx);
              }
            });
            return;
          }
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        final zzhj localZzhj = new zzhj(zzCF.zzGL.zzDy, null, zzCF.zzGM.zzyw, 3, zzCF.zzGM.zzyx, zzCF.zzGM.zzDZ, zzCF.zzGM.orientation, zzCF.zzGM.zzyA, zzCF.zzGL.zzDB, zzCF.zzGM.zzDX, null, null, null, zzCF.zzGG, null, zzCF.zzGM.zzDY, zzCF.zzqf, zzCF.zzGM.zzDW, zzCF.zzGI, zzCF.zzGM.zzEb, zzCF.zzGM.zzEc, zzCF.zzGF, null, zzCF.zzGL.zzDO);
        zza.zzIy.post(new Runnable()
        {
          public void run()
          {
            zzhe.zza(zzhe.this).zzb(localZzhj);
          }
        });
        return;
      }
      catch (Exception localException)
      {
        i += 1;
      }
    }
  }
}
