package com.google.ads;

import android.content.Context;

@Deprecated
public final class AdSize
{
  public static final int AUTO_HEIGHT = -2;
  public static final AdSize BANNER;
  public static final int FULL_WIDTH = -1;
  public static final AdSize IAB_BANNER = new AdSize(468, 60, "as");
  public static final AdSize IAB_LEADERBOARD = new AdSize(728, 90, "as");
  public static final AdSize IAB_MRECT;
  public static final AdSize IAB_WIDE_SKYSCRAPER = new AdSize(160, 600, "as");
  public static final int LANDSCAPE_AD_HEIGHT = 32;
  public static final int LARGE_AD_HEIGHT = 90;
  public static final int PORTRAIT_AD_HEIGHT = 50;
  public static final AdSize SMART_BANNER = new AdSize(-1, -2, "mb");
  private final com.google.android.gms.ads.AdSize zzaJ;
  
  static
  {
    BANNER = new AdSize(320, 50, "mb");
    IAB_MRECT = new AdSize(300, 250, "as");
  }
  
  public AdSize(int paramInt1, int paramInt2)
  {
    this(new com.google.android.gms.ads.AdSize(paramInt1, paramInt2));
  }
  
  private AdSize(int paramInt1, int paramInt2, String paramString)
  {
    this(new com.google.android.gms.ads.AdSize(paramInt1, paramInt2));
  }
  
  public AdSize(com.google.android.gms.ads.AdSize paramAdSize)
  {
    zzaJ = paramAdSize;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof AdSize)) {
      return false;
    }
    paramObject = (AdSize)paramObject;
    return zzaJ.equals(zzaJ);
  }
  
  public AdSize findBestSize(AdSize... paramVarArgs)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    if (paramVarArgs == null) {}
    float f1;
    int j;
    int k;
    int m;
    int i;
    do
    {
      return localObject2;
      f1 = 0.0F;
      j = getWidth();
      k = getHeight();
      m = paramVarArgs.length;
      i = 0;
      localObject2 = localObject1;
    } while (i >= m);
    localObject2 = paramVarArgs[i];
    int n = ((AdSize)localObject2).getWidth();
    int i1 = ((AdSize)localObject2).getHeight();
    float f2;
    if (isSizeAppropriate(n, i1))
    {
      float f3 = n * i1 / (j * k);
      f2 = f3;
      if (f3 > 1.0F) {
        f2 = 1.0F / f3;
      }
      if (f2 > f1) {
        localObject1 = localObject2;
      }
    }
    for (;;)
    {
      i += 1;
      f1 = f2;
      break;
      f2 = f1;
    }
  }
  
  public int getHeight()
  {
    return zzaJ.getHeight();
  }
  
  public int getHeightInPixels(Context paramContext)
  {
    return zzaJ.getHeightInPixels(paramContext);
  }
  
  public int getWidth()
  {
    return zzaJ.getWidth();
  }
  
  public int getWidthInPixels(Context paramContext)
  {
    return zzaJ.getWidthInPixels(paramContext);
  }
  
  public int hashCode()
  {
    return zzaJ.hashCode();
  }
  
  public boolean isAutoHeight()
  {
    return zzaJ.isAutoHeight();
  }
  
  public boolean isCustomAdSize()
  {
    return false;
  }
  
  public boolean isFullWidth()
  {
    return zzaJ.isFullWidth();
  }
  
  public boolean isSizeAppropriate(int paramInt1, int paramInt2)
  {
    int i = getWidth();
    int j = getHeight();
    return (paramInt1 <= i * 1.25F) && (paramInt1 >= i * 0.8F) && (paramInt2 <= j * 1.25F) && (paramInt2 >= j * 0.8F);
  }
  
  public String toString()
  {
    return zzaJ.toString();
  }
}
