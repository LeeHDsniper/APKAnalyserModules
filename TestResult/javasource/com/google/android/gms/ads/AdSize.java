package com.google.android.gms.ads;

import android.content.Context;
import android.content.res.Resources;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.zza;

public final class AdSize
{
  public static final int AUTO_HEIGHT = -2;
  public static final AdSize BANNER = new AdSize(320, 50, "320x50_mb");
  public static final AdSize FULL_BANNER = new AdSize(468, 60, "468x60_as");
  public static final int FULL_WIDTH = -1;
  public static final AdSize LARGE_BANNER = new AdSize(320, 100, "320x100_as");
  public static final AdSize LEADERBOARD = new AdSize(728, 90, "728x90_as");
  public static final AdSize MEDIUM_RECTANGLE = new AdSize(300, 250, "300x250_as");
  public static final AdSize SMART_BANNER = new AdSize(-1, -2, "smart_banner");
  public static final AdSize WIDE_SKYSCRAPER = new AdSize(160, 600, "160x600_as");
  private final int zznP;
  private final int zznQ;
  private final String zznR;
  
  public AdSize(int paramInt1, int paramInt2) {}
  
  AdSize(int paramInt1, int paramInt2, String paramString)
  {
    if ((paramInt1 < 0) && (paramInt1 != -1)) {
      throw new IllegalArgumentException("Invalid width for AdSize: " + paramInt1);
    }
    if ((paramInt2 < 0) && (paramInt2 != -2)) {
      throw new IllegalArgumentException("Invalid height for AdSize: " + paramInt2);
    }
    zznP = paramInt1;
    zznQ = paramInt2;
    zznR = paramString;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof AdSize)) {
        return false;
      }
      paramObject = (AdSize)paramObject;
    } while ((zznP == zznP) && (zznQ == zznQ) && (zznR.equals(zznR)));
    return false;
  }
  
  public int getHeight()
  {
    return zznQ;
  }
  
  public int getHeightInPixels(Context paramContext)
  {
    if (zznQ == -2) {
      return AdSizeParcel.zzb(paramContext.getResources().getDisplayMetrics());
    }
    return zzk.zzcE().zzb(paramContext, zznQ);
  }
  
  public int getWidth()
  {
    return zznP;
  }
  
  public int getWidthInPixels(Context paramContext)
  {
    if (zznP == -1) {
      return AdSizeParcel.zza(paramContext.getResources().getDisplayMetrics());
    }
    return zzk.zzcE().zzb(paramContext, zznP);
  }
  
  public int hashCode()
  {
    return zznR.hashCode();
  }
  
  public boolean isAutoHeight()
  {
    return zznQ == -2;
  }
  
  public boolean isFullWidth()
  {
    return zznP == -1;
  }
  
  public String toString()
  {
    return zznR;
  }
}
