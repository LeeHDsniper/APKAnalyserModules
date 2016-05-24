package com.google.android.gms.internal;

import android.content.Context;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import java.util.List;

@zzgk
public class zzgd
  extends zzfz
{
  private zzdy zzCN;
  protected zzee zzCO;
  private final zzcd zzon;
  private zzeh zzow;
  private zzea zzye;
  
  zzgd(Context paramContext, zzhj.zza paramZza, zzip paramZzip, zzeh paramZzeh, zzga.zza paramZza1, zzcd paramZzcd)
  {
    super(paramContext, paramZza, paramZzip, paramZza1);
    zzow = paramZzeh;
    zzye = zzGG;
    zzon = paramZzcd;
  }
  
  public void onStop()
  {
    synchronized (zzCE)
    {
      super.onStop();
      if (zzCN != null) {
        zzCN.cancel();
      }
      return;
    }
  }
  
  protected void zzh(long paramLong)
    throws zzfz.zza
  {
    synchronized (zzCE)
    {
      zzCN = new zzdy(mContext, zzCF.zzGL, zzow, zzye, zzCG.zzsJ);
      zzCO = zzCN.zza(paramLong, 60000L, zzon);
      switch (zzCO.zzyP)
      {
      default: 
        throw new zzfz.zza("Unexpected mediation result: " + zzCO.zzyP, 0);
      }
    }
    throw new zzfz.zza("No fill from any mediation ad networks.", 3);
  }
  
  protected zzhj zzz(int paramInt)
  {
    AdRequestInfoParcel localAdRequestInfoParcel = zzCF.zzGL;
    AdRequestParcel localAdRequestParcel = zzDy;
    zzip localZzip = zzoL;
    List localList1 = zzCG.zzyw;
    List localList2 = zzCG.zzyx;
    List localList3 = zzCG.zzDZ;
    int i = zzCG.orientation;
    long l = zzCG.zzyA;
    String str2 = zzDB;
    boolean bool = zzCG.zzDX;
    zzdz localZzdz;
    zzei localZzei;
    label113:
    String str1;
    label129:
    zzea localZzea;
    if (zzCO != null)
    {
      localZzdz = zzCO.zzyQ;
      if (zzCO == null) {
        break label247;
      }
      localZzei = zzCO.zzyR;
      if (zzCO == null) {
        break label253;
      }
      str1 = zzCO.zzyS;
      localZzea = zzye;
      if (zzCO == null) {
        break label263;
      }
    }
    label247:
    label253:
    label263:
    for (zzec localZzec = zzCO.zzyT;; localZzec = null)
    {
      return new zzhj(localAdRequestParcel, localZzip, localList1, paramInt, localList2, localList3, i, l, str2, bool, localZzdz, localZzei, str1, localZzea, localZzec, zzCG.zzDY, zzCF.zzqf, zzCG.zzDW, zzCF.zzGI, zzCG.zzEb, zzCG.zzEc, zzCF.zzGF, null, zzDO);
      localZzdz = null;
      break;
      localZzei = null;
      break label113;
      str1 = AdMobAdapter.class.getName();
      break label129;
    }
  }
}
