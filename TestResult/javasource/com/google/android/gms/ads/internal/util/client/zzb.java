package com.google.android.gms.ads.internal.util.client;

import android.util.Log;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class zzb
{
  public static void e(String paramString)
  {
    if (zzM(6)) {
      Log.e("Ads", paramString);
    }
  }
  
  public static void v(String paramString)
  {
    if (zzM(2)) {
      Log.v("Ads", paramString);
    }
  }
  
  public static boolean zzM(int paramInt)
  {
    return ((paramInt >= 5) || (Log.isLoggable("Ads", paramInt))) && ((paramInt != 2) || (zzgJ()));
  }
  
  public static void zza(String paramString, Throwable paramThrowable)
  {
    if (zzM(3)) {
      Log.d("Ads", paramString, paramThrowable);
    }
  }
  
  public static void zzaC(String paramString)
  {
    if (zzM(3)) {
      Log.d("Ads", paramString);
    }
  }
  
  public static void zzaD(String paramString)
  {
    if (zzM(4)) {
      Log.i("Ads", paramString);
    }
  }
  
  public static void zzaE(String paramString)
  {
    if (zzM(5)) {
      Log.w("Ads", paramString);
    }
  }
  
  public static void zzb(String paramString, Throwable paramThrowable)
  {
    if (zzM(6)) {
      Log.e("Ads", paramString, paramThrowable);
    }
  }
  
  public static void zzc(String paramString, Throwable paramThrowable)
  {
    if (zzM(4)) {
      Log.i("Ads", paramString, paramThrowable);
    }
  }
  
  public static void zzd(String paramString, Throwable paramThrowable)
  {
    if (zzM(5)) {
      Log.w("Ads", paramString, paramThrowable);
    }
  }
  
  public static boolean zzgJ()
  {
    return ((Boolean)zzby.zzuW.get()).booleanValue();
  }
}
