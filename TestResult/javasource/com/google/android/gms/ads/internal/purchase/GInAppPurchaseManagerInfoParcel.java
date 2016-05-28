package com.google.android.gms.ads.internal.purchase;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzfl;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class GInAppPurchaseManagerInfoParcel
  implements SafeParcelable
{
  public static final zza CREATOR = new zza();
  public final int versionCode;
  public final zzfl zzBJ;
  public final Context zzBK;
  public final zzj zzBL;
  public final zzk zzqw;
  
  GInAppPurchaseManagerInfoParcel(int paramInt, IBinder paramIBinder1, IBinder paramIBinder2, IBinder paramIBinder3, IBinder paramIBinder4)
  {
    versionCode = paramInt;
    zzqw = ((zzk)zze.zzp(zzd.zza.zzbk(paramIBinder1)));
    zzBJ = ((zzfl)zze.zzp(zzd.zza.zzbk(paramIBinder2)));
    zzBK = ((Context)zze.zzp(zzd.zza.zzbk(paramIBinder3)));
    zzBL = ((zzj)zze.zzp(zzd.zza.zzbk(paramIBinder4)));
  }
  
  public GInAppPurchaseManagerInfoParcel(Context paramContext, zzk paramZzk, zzfl paramZzfl, zzj paramZzj)
  {
    versionCode = 2;
    zzBK = paramContext;
    zzqw = paramZzk;
    zzBJ = paramZzfl;
    zzBL = paramZzj;
  }
  
  public static void zza(Intent paramIntent, GInAppPurchaseManagerInfoParcel paramGInAppPurchaseManagerInfoParcel)
  {
    Bundle localBundle = new Bundle(1);
    localBundle.putParcelable("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo", paramGInAppPurchaseManagerInfoParcel);
    paramIntent.putExtra("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo", localBundle);
  }
  
  public static GInAppPurchaseManagerInfoParcel zzc(Intent paramIntent)
  {
    try
    {
      paramIntent = paramIntent.getBundleExtra("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo");
      paramIntent.setClassLoader(GInAppPurchaseManagerInfoParcel.class.getClassLoader());
      paramIntent = (GInAppPurchaseManagerInfoParcel)paramIntent.getParcelable("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo");
      return paramIntent;
    }
    catch (Exception paramIntent) {}
    return null;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
  
  IBinder zzfc()
  {
    return zze.zzx(zzBL).asBinder();
  }
  
  IBinder zzfd()
  {
    return zze.zzx(zzqw).asBinder();
  }
  
  IBinder zzfe()
  {
    return zze.zzx(zzBJ).asBinder();
  }
  
  IBinder zzff()
  {
    return zze.zzx(zzBK).asBinder();
  }
}
