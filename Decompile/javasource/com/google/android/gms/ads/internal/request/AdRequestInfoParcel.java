package com.google.android.gms.ads.internal.request;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Parcel;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;
import java.util.Collections;
import java.util.List;

@zzgk
public final class AdRequestInfoParcel
  implements SafeParcelable
{
  public static final zzf CREATOR = new zzf();
  public final ApplicationInfo applicationInfo;
  public final int versionCode;
  public final String zzDA;
  public final String zzDB;
  public final String zzDC;
  public final Bundle zzDD;
  public final int zzDE;
  public final Bundle zzDF;
  public final boolean zzDG;
  public final Messenger zzDH;
  public final int zzDI;
  public final int zzDJ;
  public final float zzDK;
  public final String zzDL;
  public final boolean zzDM;
  public final int zzDN;
  public final String zzDO;
  public final long zzDP;
  public final String zzDQ;
  public final List<String> zzDR;
  public final List<String> zzDS;
  public final long zzDT;
  public final CapabilityParcel zzDU;
  public final Bundle zzDx;
  public final AdRequestParcel zzDy;
  public final PackageInfo zzDz;
  public final String zzpY;
  public final String zzpZ;
  public final VersionInfoParcel zzqb;
  public final AdSizeParcel zzqf;
  public final NativeAdOptionsParcel zzqt;
  public final List<String> zzqv;
  
  AdRequestInfoParcel(int paramInt1, Bundle paramBundle1, AdRequestParcel paramAdRequestParcel, AdSizeParcel paramAdSizeParcel, String paramString1, ApplicationInfo paramApplicationInfo, PackageInfo paramPackageInfo, String paramString2, String paramString3, String paramString4, VersionInfoParcel paramVersionInfoParcel, Bundle paramBundle2, int paramInt2, List<String> paramList1, Bundle paramBundle3, boolean paramBoolean1, Messenger paramMessenger, int paramInt3, int paramInt4, float paramFloat, String paramString5, boolean paramBoolean2, int paramInt5, String paramString6, long paramLong1, String paramString7, List<String> paramList2, String paramString8, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList3, long paramLong2, CapabilityParcel paramCapabilityParcel)
  {
    versionCode = paramInt1;
    zzDx = paramBundle1;
    zzDy = paramAdRequestParcel;
    zzqf = paramAdSizeParcel;
    zzpZ = paramString1;
    applicationInfo = paramApplicationInfo;
    zzDz = paramPackageInfo;
    zzDA = paramString2;
    zzDB = paramString3;
    zzDC = paramString4;
    zzqb = paramVersionInfoParcel;
    zzDD = paramBundle2;
    zzDE = paramInt2;
    zzqv = paramList1;
    if (paramList3 == null)
    {
      paramBundle1 = Collections.emptyList();
      zzDS = paramBundle1;
      zzDF = paramBundle3;
      zzDG = paramBoolean1;
      zzDH = paramMessenger;
      zzDI = paramInt3;
      zzDJ = paramInt4;
      zzDK = paramFloat;
      zzDL = paramString5;
      zzDM = paramBoolean2;
      zzDN = paramInt5;
      zzDO = paramString6;
      zzDP = paramLong1;
      zzDQ = paramString7;
      if (paramList2 != null) {
        break label219;
      }
    }
    label219:
    for (paramBundle1 = Collections.emptyList();; paramBundle1 = Collections.unmodifiableList(paramList2))
    {
      zzDR = paramBundle1;
      zzpY = paramString8;
      zzqt = paramNativeAdOptionsParcel;
      zzDT = paramLong2;
      zzDU = paramCapabilityParcel;
      return;
      paramBundle1 = Collections.unmodifiableList(paramList3);
      break;
    }
  }
  
  public AdRequestInfoParcel(Bundle paramBundle1, AdRequestParcel paramAdRequestParcel, AdSizeParcel paramAdSizeParcel, String paramString1, ApplicationInfo paramApplicationInfo, PackageInfo paramPackageInfo, String paramString2, String paramString3, String paramString4, VersionInfoParcel paramVersionInfoParcel, Bundle paramBundle2, int paramInt1, List<String> paramList1, List<String> paramList2, Bundle paramBundle3, boolean paramBoolean1, Messenger paramMessenger, int paramInt2, int paramInt3, float paramFloat, String paramString5, boolean paramBoolean2, int paramInt4, String paramString6, long paramLong1, String paramString7, List<String> paramList3, String paramString8, NativeAdOptionsParcel paramNativeAdOptionsParcel, long paramLong2, CapabilityParcel paramCapabilityParcel)
  {
    this(11, paramBundle1, paramAdRequestParcel, paramAdSizeParcel, paramString1, paramApplicationInfo, paramPackageInfo, paramString2, paramString3, paramString4, paramVersionInfoParcel, paramBundle2, paramInt1, paramList1, paramBundle3, paramBoolean1, paramMessenger, paramInt2, paramInt3, paramFloat, paramString5, paramBoolean2, paramInt4, paramString6, paramLong1, paramString7, paramList3, paramString8, paramNativeAdOptionsParcel, paramList2, paramLong2, paramCapabilityParcel);
  }
  
  public AdRequestInfoParcel(zza paramZza, String paramString1, String paramString2, long paramLong)
  {
    this(zzDx, zzDy, zzqf, zzpZ, applicationInfo, zzDz, paramString1, zzDB, zzDC, zzqb, zzDD, zzDE, zzqv, zzDS, zzDF, zzDG, zzDH, zzDI, zzDJ, zzDK, zzDL, zzDM, zzDN, paramString2, zzDP, zzDQ, zzDR, zzpY, zzqt, paramLong, zzDU);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }
  
  @zzgk
  public static final class zza
  {
    public final ApplicationInfo applicationInfo;
    public final String zzDB;
    public final String zzDC;
    public final Bundle zzDD;
    public final int zzDE;
    public final Bundle zzDF;
    public final boolean zzDG;
    public final Messenger zzDH;
    public final int zzDI;
    public final int zzDJ;
    public final float zzDK;
    public final String zzDL;
    public final boolean zzDM;
    public final int zzDN;
    public final long zzDP;
    public final String zzDQ;
    public final List<String> zzDR;
    public final List<String> zzDS;
    public final CapabilityParcel zzDU;
    public final Bundle zzDx;
    public final AdRequestParcel zzDy;
    public final PackageInfo zzDz;
    public final String zzpY;
    public final String zzpZ;
    public final VersionInfoParcel zzqb;
    public final AdSizeParcel zzqf;
    public final NativeAdOptionsParcel zzqt;
    public final List<String> zzqv;
    
    public zza(Bundle paramBundle1, AdRequestParcel paramAdRequestParcel, AdSizeParcel paramAdSizeParcel, String paramString1, ApplicationInfo paramApplicationInfo, PackageInfo paramPackageInfo, String paramString2, String paramString3, VersionInfoParcel paramVersionInfoParcel, Bundle paramBundle2, List<String> paramList1, List<String> paramList2, Bundle paramBundle3, boolean paramBoolean1, Messenger paramMessenger, int paramInt1, int paramInt2, float paramFloat, String paramString4, boolean paramBoolean2, int paramInt3, long paramLong, String paramString5, List<String> paramList3, String paramString6, NativeAdOptionsParcel paramNativeAdOptionsParcel, CapabilityParcel paramCapabilityParcel)
    {
      zzDx = paramBundle1;
      zzDy = paramAdRequestParcel;
      zzqf = paramAdSizeParcel;
      zzpZ = paramString1;
      applicationInfo = paramApplicationInfo;
      zzDz = paramPackageInfo;
      zzDB = paramString2;
      zzDC = paramString3;
      zzqb = paramVersionInfoParcel;
      zzDD = paramBundle2;
      zzDG = paramBoolean1;
      zzDH = paramMessenger;
      zzDI = paramInt1;
      zzDJ = paramInt2;
      zzDK = paramFloat;
      if ((paramList1 != null) && (paramList1.size() > 0))
      {
        zzDE = 3;
        zzqv = paramList1;
      }
      for (zzDS = paramList2;; zzDS = null)
      {
        zzDF = paramBundle3;
        zzDL = paramString4;
        zzDM = paramBoolean2;
        zzDN = paramInt3;
        zzDP = paramLong;
        zzDQ = paramString5;
        zzDR = paramList3;
        zzpY = paramString6;
        zzqt = paramNativeAdOptionsParcel;
        zzDU = paramCapabilityParcel;
        return;
        zzDE = 0;
        zzqv = null;
      }
    }
  }
}
