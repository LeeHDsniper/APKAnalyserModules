package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class AdSizeParcel
  implements SafeParcelable
{
  public static final zzh CREATOR = new zzh();
  public final int height;
  public final int heightPixels;
  public final int versionCode;
  public final int width;
  public final int widthPixels;
  public final String zzsG;
  public final boolean zzsH;
  public final AdSizeParcel[] zzsI;
  public final boolean zzsJ;
  
  public AdSizeParcel()
  {
    this(3, "interstitial_mb", 0, 0, true, 0, 0, null, false);
  }
  
  AdSizeParcel(int paramInt1, String paramString, int paramInt2, int paramInt3, boolean paramBoolean1, int paramInt4, int paramInt5, AdSizeParcel[] paramArrayOfAdSizeParcel, boolean paramBoolean2)
  {
    versionCode = paramInt1;
    zzsG = paramString;
    height = paramInt2;
    heightPixels = paramInt3;
    zzsH = paramBoolean1;
    width = paramInt4;
    widthPixels = paramInt5;
    zzsI = paramArrayOfAdSizeParcel;
    zzsJ = paramBoolean2;
  }
  
  public AdSizeParcel(Context paramContext, AdSize paramAdSize)
  {
    this(paramContext, new AdSize[] { paramAdSize });
  }
  
  public AdSizeParcel(Context paramContext, AdSize[] paramArrayOfAdSize)
  {
    AdSize localAdSize = paramArrayOfAdSize[0];
    versionCode = 3;
    zzsH = false;
    width = localAdSize.getWidth();
    height = localAdSize.getHeight();
    int j;
    int k;
    label60:
    DisplayMetrics localDisplayMetrics;
    label111:
    int m;
    int i;
    if (width == -1)
    {
      j = 1;
      if (height != -2) {
        break label279;
      }
      k = 1;
      localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
      if (j == 0) {
        break label297;
      }
      if ((!zzk.zzcE().zzS(paramContext)) || (!zzk.zzcE().zzT(paramContext))) {
        break label285;
      }
      widthPixels = (zza(localDisplayMetrics) - zzk.zzcE().zzU(paramContext));
      double d = widthPixels / density;
      m = (int)d;
      i = m;
      if (d - (int)d >= 0.01D) {
        i = m + 1;
      }
      label150:
      if (k == 0) {
        break label322;
      }
      m = zzc(localDisplayMetrics);
      label162:
      heightPixels = zzk.zzcE().zza(localDisplayMetrics, m);
      if ((j == 0) && (k == 0)) {
        break label331;
      }
    }
    label279:
    label285:
    label297:
    label322:
    label331:
    for (zzsG = (i + "x" + m + "_as");; zzsG = localAdSize.toString())
    {
      if (paramArrayOfAdSize.length <= 1) {
        break label343;
      }
      zzsI = new AdSizeParcel[paramArrayOfAdSize.length];
      i = 0;
      while (i < paramArrayOfAdSize.length)
      {
        zzsI[i] = new AdSizeParcel(paramContext, paramArrayOfAdSize[i]);
        i += 1;
      }
      j = 0;
      break;
      k = 0;
      break label60;
      widthPixels = zza(localDisplayMetrics);
      break label111;
      i = width;
      widthPixels = zzk.zzcE().zza(localDisplayMetrics, width);
      break label150;
      m = height;
      break label162;
    }
    label343:
    zzsI = null;
    zzsJ = false;
  }
  
  public AdSizeParcel(AdSizeParcel paramAdSizeParcel, AdSizeParcel[] paramArrayOfAdSizeParcel)
  {
    this(3, zzsG, height, heightPixels, zzsH, width, widthPixels, paramArrayOfAdSizeParcel, zzsJ);
  }
  
  public static int zza(DisplayMetrics paramDisplayMetrics)
  {
    return widthPixels;
  }
  
  public static int zzb(DisplayMetrics paramDisplayMetrics)
  {
    return (int)(zzc(paramDisplayMetrics) * density);
  }
  
  private static int zzc(DisplayMetrics paramDisplayMetrics)
  {
    int i = (int)(heightPixels / density);
    if (i <= 400) {
      return 32;
    }
    if (i <= 720) {
      return 50;
    }
    return 90;
  }
  
  public static AdSizeParcel zzcB()
  {
    return new AdSizeParcel(3, "reward_mb", 0, 0, false, 0, 0, null, false);
  }
  
  public static AdSizeParcel zzs(Context paramContext)
  {
    return new AdSizeParcel(3, "320x50_mb", 0, 0, false, 0, 0, null, true);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }
  
  public AdSize zzcC()
  {
    return com.google.android.gms.ads.zza.zza(width, height, zzsG);
  }
}
