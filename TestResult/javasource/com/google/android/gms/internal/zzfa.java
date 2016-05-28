package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.Map;

@zzgk
public class zzfa
  extends zzfb
  implements zzdg
{
  private final Context mContext;
  private final zzip zzoL;
  private final WindowManager zzqX;
  private final zzbq zzzN;
  DisplayMetrics zzzO;
  private float zzzP;
  int zzzQ = -1;
  int zzzR = -1;
  private int zzzS;
  int zzzT = -1;
  int zzzU = -1;
  int zzzV = -1;
  int zzzW = -1;
  
  public zzfa(zzip paramZzip, Context paramContext, zzbq paramZzbq)
  {
    super(paramZzip);
    zzoL = paramZzip;
    mContext = paramContext;
    zzzN = paramZzbq;
    zzqX = ((WindowManager)paramContext.getSystemService("window"));
  }
  
  private void zzeb()
  {
    zzzO = new DisplayMetrics();
    Display localDisplay = zzqX.getDefaultDisplay();
    localDisplay.getMetrics(zzzO);
    zzzP = zzzO.density;
    zzzS = localDisplay.getRotation();
  }
  
  private void zzeg()
  {
    int[] arrayOfInt = new int[2];
    zzoL.getLocationOnScreen(arrayOfInt);
    zze(zzk.zzcE().zzc(mContext, arrayOfInt[0]), zzk.zzcE().zzc(mContext, arrayOfInt[1]));
  }
  
  private zzez zzej()
  {
    return new zzez.zza().zzp(zzzN.zzcV()).zzo(zzzN.zzcW()).zzq(zzzN.zzda()).zzr(zzzN.zzcX()).zzs(zzzN.zzcY()).zzea();
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    zzee();
  }
  
  public void zze(int paramInt1, int paramInt2)
  {
    if ((mContext instanceof Activity)) {}
    for (int i = zzp.zzbx().zzj((Activity)mContext)[0];; i = 0)
    {
      zzc(paramInt1, paramInt2 - i, zzzV, zzzW);
      zzoL.zzgS().zzd(paramInt1, paramInt2);
      return;
    }
  }
  
  void zzec()
  {
    zzzQ = zzk.zzcE().zzb(zzzO, zzzO.widthPixels);
    zzzR = zzk.zzcE().zzb(zzzO, zzzO.heightPixels);
    Object localObject = zzoL.zzgN();
    if ((localObject == null) || (((Activity)localObject).getWindow() == null))
    {
      zzzT = zzzQ;
      zzzU = zzzR;
      return;
    }
    localObject = zzp.zzbx().zzg((Activity)localObject);
    zzzT = zzk.zzcE().zzb(zzzO, localObject[0]);
    zzzU = zzk.zzcE().zzb(zzzO, localObject[1]);
  }
  
  void zzed()
  {
    if (zzoL.zzaN().zzsH)
    {
      zzzV = zzzQ;
      zzzW = zzzR;
      return;
    }
    zzoL.measure(0, 0);
    zzzV = zzk.zzcE().zzc(mContext, zzoL.getMeasuredWidth());
    zzzW = zzk.zzcE().zzc(mContext, zzoL.getMeasuredHeight());
  }
  
  public void zzee()
  {
    zzeb();
    zzec();
    zzed();
    zzeh();
    zzei();
    zzeg();
    zzef();
  }
  
  void zzef()
  {
    if (zzb.zzM(2)) {
      zzb.zzaD("Dispatching Ready Event.");
    }
    zzai(zzoL.zzgV().zzIz);
  }
  
  void zzeh()
  {
    zza(zzzQ, zzzR, zzzT, zzzU, zzzP, zzzS);
  }
  
  void zzei()
  {
    zzez localZzez = zzej();
    zzoL.zzb("onDeviceFeaturesReceived", localZzez.toJson());
  }
}
