package com.google.android.gms.ads.internal.request;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzf
  implements Parcelable.Creator<AdRequestInfoParcel>
{
  public zzf() {}
  
  static void zza(AdRequestInfoParcel paramAdRequestInfoParcel, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, zzDx, false);
    zzb.zza(paramParcel, 3, zzDy, paramInt, false);
    zzb.zza(paramParcel, 4, zzqf, paramInt, false);
    zzb.zza(paramParcel, 5, zzpZ, false);
    zzb.zza(paramParcel, 6, applicationInfo, paramInt, false);
    zzb.zza(paramParcel, 7, zzDz, paramInt, false);
    zzb.zza(paramParcel, 8, zzDA, false);
    zzb.zza(paramParcel, 9, zzDB, false);
    zzb.zza(paramParcel, 10, zzDC, false);
    zzb.zza(paramParcel, 11, zzqb, paramInt, false);
    zzb.zza(paramParcel, 12, zzDD, false);
    zzb.zzc(paramParcel, 13, zzDE);
    zzb.zzb(paramParcel, 14, zzqv, false);
    zzb.zza(paramParcel, 15, zzDF, false);
    zzb.zza(paramParcel, 17, zzDH, paramInt, false);
    zzb.zza(paramParcel, 16, zzDG);
    zzb.zzc(paramParcel, 19, zzDJ);
    zzb.zzc(paramParcel, 18, zzDI);
    zzb.zza(paramParcel, 21, zzDL, false);
    zzb.zza(paramParcel, 20, zzDK);
    zzb.zzc(paramParcel, 23, zzDN);
    zzb.zza(paramParcel, 22, zzDM);
    zzb.zza(paramParcel, 25, zzDP);
    zzb.zza(paramParcel, 24, zzDO, false);
    zzb.zzb(paramParcel, 27, zzDR, false);
    zzb.zza(paramParcel, 26, zzDQ, false);
    zzb.zza(paramParcel, 29, zzqt, paramInt, false);
    zzb.zza(paramParcel, 28, zzpY, false);
    zzb.zza(paramParcel, 31, zzDT);
    zzb.zzb(paramParcel, 30, zzDS, false);
    zzb.zza(paramParcel, 32, zzDU, paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public AdRequestInfoParcel[] zzC(int paramInt)
  {
    return new AdRequestInfoParcel[paramInt];
  }
  
  public AdRequestInfoParcel zzj(Parcel paramParcel)
  {
    int i1 = zza.zzaj(paramParcel);
    int n = 0;
    Bundle localBundle3 = null;
    AdRequestParcel localAdRequestParcel = null;
    AdSizeParcel localAdSizeParcel = null;
    String str8 = null;
    ApplicationInfo localApplicationInfo = null;
    PackageInfo localPackageInfo = null;
    String str7 = null;
    String str6 = null;
    String str5 = null;
    VersionInfoParcel localVersionInfoParcel = null;
    Bundle localBundle2 = null;
    int m = 0;
    ArrayList localArrayList3 = null;
    Bundle localBundle1 = null;
    boolean bool2 = false;
    Messenger localMessenger = null;
    int k = 0;
    int j = 0;
    float f = 0.0F;
    String str4 = null;
    boolean bool1 = false;
    int i = 0;
    String str3 = null;
    long l2 = 0L;
    String str2 = null;
    ArrayList localArrayList2 = null;
    String str1 = null;
    NativeAdOptionsParcel localNativeAdOptionsParcel = null;
    ArrayList localArrayList1 = null;
    long l1 = 0L;
    CapabilityParcel localCapabilityParcel = null;
    while (paramParcel.dataPosition() < i1)
    {
      int i2 = zza.zzai(paramParcel);
      switch (zza.zzbH(i2))
      {
      default: 
        zza.zzb(paramParcel, i2);
        break;
      case 1: 
        n = zza.zzg(paramParcel, i2);
        break;
      case 2: 
        localBundle3 = zza.zzq(paramParcel, i2);
        break;
      case 3: 
        localAdRequestParcel = (AdRequestParcel)zza.zza(paramParcel, i2, AdRequestParcel.CREATOR);
        break;
      case 4: 
        localAdSizeParcel = (AdSizeParcel)zza.zza(paramParcel, i2, AdSizeParcel.CREATOR);
        break;
      case 5: 
        str8 = zza.zzo(paramParcel, i2);
        break;
      case 6: 
        localApplicationInfo = (ApplicationInfo)zza.zza(paramParcel, i2, ApplicationInfo.CREATOR);
        break;
      case 7: 
        localPackageInfo = (PackageInfo)zza.zza(paramParcel, i2, PackageInfo.CREATOR);
        break;
      case 8: 
        str7 = zza.zzo(paramParcel, i2);
        break;
      case 9: 
        str6 = zza.zzo(paramParcel, i2);
        break;
      case 10: 
        str5 = zza.zzo(paramParcel, i2);
        break;
      case 11: 
        localVersionInfoParcel = (VersionInfoParcel)zza.zza(paramParcel, i2, VersionInfoParcel.CREATOR);
        break;
      case 12: 
        localBundle2 = zza.zzq(paramParcel, i2);
        break;
      case 13: 
        m = zza.zzg(paramParcel, i2);
        break;
      case 14: 
        localArrayList3 = zza.zzC(paramParcel, i2);
        break;
      case 15: 
        localBundle1 = zza.zzq(paramParcel, i2);
        break;
      case 17: 
        localMessenger = (Messenger)zza.zza(paramParcel, i2, Messenger.CREATOR);
        break;
      case 16: 
        bool2 = zza.zzc(paramParcel, i2);
        break;
      case 19: 
        j = zza.zzg(paramParcel, i2);
        break;
      case 18: 
        k = zza.zzg(paramParcel, i2);
        break;
      case 21: 
        str4 = zza.zzo(paramParcel, i2);
        break;
      case 20: 
        f = zza.zzl(paramParcel, i2);
        break;
      case 23: 
        i = zza.zzg(paramParcel, i2);
        break;
      case 22: 
        bool1 = zza.zzc(paramParcel, i2);
        break;
      case 25: 
        l2 = zza.zzi(paramParcel, i2);
        break;
      case 24: 
        str3 = zza.zzo(paramParcel, i2);
        break;
      case 27: 
        localArrayList2 = zza.zzC(paramParcel, i2);
        break;
      case 26: 
        str2 = zza.zzo(paramParcel, i2);
        break;
      case 29: 
        localNativeAdOptionsParcel = (NativeAdOptionsParcel)zza.zza(paramParcel, i2, NativeAdOptionsParcel.CREATOR);
        break;
      case 28: 
        str1 = zza.zzo(paramParcel, i2);
        break;
      case 31: 
        l1 = zza.zzi(paramParcel, i2);
        break;
      case 30: 
        localArrayList1 = zza.zzC(paramParcel, i2);
        break;
      case 32: 
        localCapabilityParcel = (CapabilityParcel)zza.zza(paramParcel, i2, CapabilityParcel.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i1) {
      throw new zza.zza("Overread allowed size end=" + i1, paramParcel);
    }
    return new AdRequestInfoParcel(n, localBundle3, localAdRequestParcel, localAdSizeParcel, str8, localApplicationInfo, localPackageInfo, str7, str6, str5, localVersionInfoParcel, localBundle2, m, localArrayList3, localBundle1, bool2, localMessenger, k, j, f, str4, bool1, i, str3, l2, str2, localArrayList2, str1, localNativeAdOptionsParcel, localArrayList1, l1, localCapabilityParcel);
  }
}
