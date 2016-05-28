package com.google.android.gms.ads.formats;

import android.graphics.drawable.Drawable;
import android.net.Uri;

public abstract class NativeAd
{
  public NativeAd() {}
  
  protected abstract Object zzaH();
  
  public static abstract interface Image
  {
    public abstract Drawable getDrawable();
    
    public abstract Uri getUri();
  }
}
