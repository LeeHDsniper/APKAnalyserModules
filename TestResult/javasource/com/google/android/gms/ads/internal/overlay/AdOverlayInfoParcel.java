package com.google.android.gms.ads.internal.overlay;

import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.ads.internal.InterstitialAdParameterParcel;
import com.google.android.gms.ads.internal.client.zza;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzdd;
import com.google.android.gms.internal.zzdi;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzip;

@zzgk
public final class AdOverlayInfoParcel
  implements SafeParcelable
{
  public static final zzf CREATOR = new zzf();
  public final int orientation;
  public final String url;
  public final int versionCode;
  public final AdLauncherIntentInfoParcel zzAO;
  public final zza zzAP;
  public final zzg zzAQ;
  public final zzip zzAR;
  public final zzdd zzAS;
  public final String zzAT;
  public final boolean zzAU;
  public final String zzAV;
  public final zzn zzAW;
  public final int zzAX;
  public final zzdi zzAY;
  public final String zzAZ;
  public final InterstitialAdParameterParcel zzBa;
  public final VersionInfoParcel zzqb;
  
  AdOverlayInfoParcel(int paramInt1, AdLauncherIntentInfoParcel paramAdLauncherIntentInfoParcel, IBinder paramIBinder1, IBinder paramIBinder2, IBinder paramIBinder3, IBinder paramIBinder4, String paramString1, boolean paramBoolean, String paramString2, IBinder paramIBinder5, int paramInt2, int paramInt3, String paramString3, VersionInfoParcel paramVersionInfoParcel, IBinder paramIBinder6, String paramString4, InterstitialAdParameterParcel paramInterstitialAdParameterParcel)
  {
    versionCode = paramInt1;
    zzAO = paramAdLauncherIntentInfoParcel;
    zzAP = ((zza)zze.zzp(zzd.zza.zzbk(paramIBinder1)));
    zzAQ = ((zzg)zze.zzp(zzd.zza.zzbk(paramIBinder2)));
    zzAR = ((zzip)zze.zzp(zzd.zza.zzbk(paramIBinder3)));
    zzAS = ((zzdd)zze.zzp(zzd.zza.zzbk(paramIBinder4)));
    zzAT = paramString1;
    zzAU = paramBoolean;
    zzAV = paramString2;
    zzAW = ((zzn)zze.zzp(zzd.zza.zzbk(paramIBinder5)));
    orientation = paramInt2;
    zzAX = paramInt3;
    url = paramString3;
    zzqb = paramVersionInfoParcel;
    zzAY = ((zzdi)zze.zzp(zzd.zza.zzbk(paramIBinder6)));
    zzAZ = paramString4;
    zzBa = paramInterstitialAdParameterParcel;
  }
  
  public AdOverlayInfoParcel(zza paramZza, zzg paramZzg, zzn paramZzn, zzip paramZzip, int paramInt, VersionInfoParcel paramVersionInfoParcel, String paramString, InterstitialAdParameterParcel paramInterstitialAdParameterParcel)
  {
    versionCode = 4;
    zzAO = null;
    zzAP = paramZza;
    zzAQ = paramZzg;
    zzAR = paramZzip;
    zzAS = null;
    zzAT = null;
    zzAU = false;
    zzAV = null;
    zzAW = paramZzn;
    orientation = paramInt;
    zzAX = 1;
    url = null;
    zzqb = paramVersionInfoParcel;
    zzAY = null;
    zzAZ = paramString;
    zzBa = paramInterstitialAdParameterParcel;
  }
  
  public AdOverlayInfoParcel(zza paramZza, zzg paramZzg, zzn paramZzn, zzip paramZzip, boolean paramBoolean, int paramInt, VersionInfoParcel paramVersionInfoParcel)
  {
    versionCode = 4;
    zzAO = null;
    zzAP = paramZza;
    zzAQ = paramZzg;
    zzAR = paramZzip;
    zzAS = null;
    zzAT = null;
    zzAU = paramBoolean;
    zzAV = null;
    zzAW = paramZzn;
    orientation = paramInt;
    zzAX = 2;
    url = null;
    zzqb = paramVersionInfoParcel;
    zzAY = null;
    zzAZ = null;
    zzBa = null;
  }
  
  public AdOverlayInfoParcel(zza paramZza, zzg paramZzg, zzdd paramZzdd, zzn paramZzn, zzip paramZzip, boolean paramBoolean, int paramInt, String paramString, VersionInfoParcel paramVersionInfoParcel, zzdi paramZzdi)
  {
    versionCode = 4;
    zzAO = null;
    zzAP = paramZza;
    zzAQ = paramZzg;
    zzAR = paramZzip;
    zzAS = paramZzdd;
    zzAT = null;
    zzAU = paramBoolean;
    zzAV = null;
    zzAW = paramZzn;
    orientation = paramInt;
    zzAX = 3;
    url = paramString;
    zzqb = paramVersionInfoParcel;
    zzAY = paramZzdi;
    zzAZ = null;
    zzBa = null;
  }
  
  public AdOverlayInfoParcel(zza paramZza, zzg paramZzg, zzdd paramZzdd, zzn paramZzn, zzip paramZzip, boolean paramBoolean, int paramInt, String paramString1, String paramString2, VersionInfoParcel paramVersionInfoParcel, zzdi paramZzdi)
  {
    versionCode = 4;
    zzAO = null;
    zzAP = paramZza;
    zzAQ = paramZzg;
    zzAR = paramZzip;
    zzAS = paramZzdd;
    zzAT = paramString2;
    zzAU = paramBoolean;
    zzAV = paramString1;
    zzAW = paramZzn;
    orientation = paramInt;
    zzAX = 3;
    url = null;
    zzqb = paramVersionInfoParcel;
    zzAY = paramZzdi;
    zzAZ = null;
    zzBa = null;
  }
  
  public AdOverlayInfoParcel(AdLauncherIntentInfoParcel paramAdLauncherIntentInfoParcel, zza paramZza, zzg paramZzg, zzn paramZzn, VersionInfoParcel paramVersionInfoParcel)
  {
    versionCode = 4;
    zzAO = paramAdLauncherIntentInfoParcel;
    zzAP = paramZza;
    zzAQ = paramZzg;
    zzAR = null;
    zzAS = null;
    zzAT = null;
    zzAU = false;
    zzAV = null;
    zzAW = paramZzn;
    orientation = -1;
    zzAX = 4;
    url = null;
    zzqb = paramVersionInfoParcel;
    zzAY = null;
    zzAZ = null;
    zzBa = null;
  }
  
  public static void zza(Intent paramIntent, AdOverlayInfoParcel paramAdOverlayInfoParcel)
  {
    Bundle localBundle = new Bundle(1);
    localBundle.putParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", paramAdOverlayInfoParcel);
    paramIntent.putExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", localBundle);
  }
  
  public static AdOverlayInfoParcel zzb(Intent paramIntent)
  {
    try
    {
      paramIntent = paramIntent.getBundleExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
      paramIntent.setClassLoader(AdOverlayInfoParcel.class.getClassLoader());
      paramIntent = (AdOverlayInfoParcel)paramIntent.getParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
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
    zzf.zza(this, paramParcel, paramInt);
  }
  
  IBinder zzeE()
  {
    return zze.zzx(zzAP).asBinder();
  }
  
  IBinder zzeF()
  {
    return zze.zzx(zzAQ).asBinder();
  }
  
  IBinder zzeG()
  {
    return zze.zzx(zzAR).asBinder();
  }
  
  IBinder zzeH()
  {
    return zze.zzx(zzAS).asBinder();
  }
  
  IBinder zzeI()
  {
    return zze.zzx(zzAY).asBinder();
  }
  
  IBinder zzeJ()
  {
    return zze.zzx(zzAW).asBinder();
  }
}
