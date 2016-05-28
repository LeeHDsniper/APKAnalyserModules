package com.google.android.gms.ads.formats;

public final class NativeAdOptions
{
  public static final int ORIENTATION_ANY = 0;
  public static final int ORIENTATION_LANDSCAPE = 2;
  public static final int ORIENTATION_PORTRAIT = 1;
  private final boolean zznV;
  private final int zznW;
  private final boolean zznX;
  
  private NativeAdOptions(Builder paramBuilder)
  {
    zznV = Builder.zza(paramBuilder);
    zznW = Builder.zzb(paramBuilder);
    zznX = Builder.zzc(paramBuilder);
  }
  
  public int getImageOrientation()
  {
    return zznW;
  }
  
  public boolean shouldRequestMultipleImages()
  {
    return zznX;
  }
  
  public boolean shouldReturnUrlsForImageAssets()
  {
    return zznV;
  }
  
  public static final class Builder
  {
    private boolean zznV = false;
    private int zznW = 0;
    private boolean zznX = false;
    
    public Builder() {}
    
    public NativeAdOptions build()
    {
      return new NativeAdOptions(this, null);
    }
    
    public Builder setImageOrientation(int paramInt)
    {
      zznW = paramInt;
      return this;
    }
    
    public Builder setRequestMultipleImages(boolean paramBoolean)
    {
      zznX = paramBoolean;
      return this;
    }
    
    public Builder setReturnUrlsForImageAssets(boolean paramBoolean)
    {
      zznV = paramBoolean;
      return this;
    }
  }
}
