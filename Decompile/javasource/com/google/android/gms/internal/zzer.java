package com.google.android.gms.internal;

import android.location.Location;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.formats.NativeAdOptions.Builder;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.mediation.NativeMediationAdRequest;
import java.util.Date;
import java.util.List;
import java.util.Set;

@zzgk
public final class zzer
  implements NativeMediationAdRequest
{
  private final Date zzaT;
  private final Set<String> zzaV;
  private final boolean zzaW;
  private final Location zzaX;
  private final NativeAdOptionsParcel zzoX;
  private final List<String> zzoY;
  private final int zzsW;
  private final int zzyV;
  
  public zzer(Date paramDate, int paramInt1, Set<String> paramSet, Location paramLocation, boolean paramBoolean, int paramInt2, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList)
  {
    zzaT = paramDate;
    zzsW = paramInt1;
    zzaV = paramSet;
    zzaX = paramLocation;
    zzaW = paramBoolean;
    zzyV = paramInt2;
    zzoX = paramNativeAdOptionsParcel;
    zzoY = paramList;
  }
  
  public Date getBirthday()
  {
    return zzaT;
  }
  
  public int getGender()
  {
    return zzsW;
  }
  
  public Set<String> getKeywords()
  {
    return zzaV;
  }
  
  public Location getLocation()
  {
    return zzaX;
  }
  
  public NativeAdOptions getNativeAdOptions()
  {
    if (zzoX == null) {
      return null;
    }
    return new NativeAdOptions.Builder().setReturnUrlsForImageAssets(zzoX.zzwn).setImageOrientation(zzoX.zzwo).setRequestMultipleImages(zzoX.zzwp).build();
  }
  
  public boolean isAppInstallAdRequested()
  {
    return (zzoY != null) && (zzoY.contains("2"));
  }
  
  public boolean isContentAdRequested()
  {
    return (zzoY != null) && (zzoY.contains("1"));
  }
  
  public boolean isTesting()
  {
    return zzaW;
  }
  
  public int taggedForChildDirectedTreatment()
  {
    return zzyV;
  }
}
