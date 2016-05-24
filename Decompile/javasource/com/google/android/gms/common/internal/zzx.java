package com.google.android.gms.common.internal;

import android.os.Looper;
import android.text.TextUtils;

public final class zzx
{
  public static void zzY(boolean paramBoolean)
  {
    if (!paramBoolean) {
      throw new IllegalStateException();
    }
  }
  
  public static void zzZ(boolean paramBoolean)
  {
    if (!paramBoolean) {
      throw new IllegalArgumentException();
    }
  }
  
  public static void zza(boolean paramBoolean, Object paramObject)
  {
    if (!paramBoolean) {
      throw new IllegalStateException(String.valueOf(paramObject));
    }
  }
  
  public static void zza(boolean paramBoolean, String paramString, Object... paramVarArgs)
  {
    if (!paramBoolean) {
      throw new IllegalStateException(String.format(paramString, paramVarArgs));
    }
  }
  
  public static <T> T zzb(T paramT, Object paramObject)
  {
    if (paramT == null) {
      throw new NullPointerException(String.valueOf(paramObject));
    }
    return paramT;
  }
  
  public static void zzb(boolean paramBoolean, Object paramObject)
  {
    if (!paramBoolean) {
      throw new IllegalArgumentException(String.valueOf(paramObject));
    }
  }
  
  public static void zzb(boolean paramBoolean, String paramString, Object... paramVarArgs)
  {
    if (!paramBoolean) {
      throw new IllegalArgumentException(String.format(paramString, paramVarArgs));
    }
  }
  
  public static int zzbD(int paramInt)
  {
    if (paramInt == 0) {
      throw new IllegalArgumentException("Given Integer is zero");
    }
    return paramInt;
  }
  
  public static void zzch(String paramString)
  {
    if (Looper.myLooper() != Looper.getMainLooper()) {
      throw new IllegalStateException(paramString);
    }
  }
  
  public static void zzci(String paramString)
  {
    if (Looper.myLooper() == Looper.getMainLooper()) {
      throw new IllegalStateException(paramString);
    }
  }
  
  public static String zzcs(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("Given String is empty or null");
    }
    return paramString;
  }
  
  public static String zzh(String paramString, Object paramObject)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException(String.valueOf(paramObject));
    }
    return paramString;
  }
  
  public static <T> T zzv(T paramT)
  {
    if (paramT == null) {
      throw new NullPointerException("null reference");
    }
    return paramT;
  }
}
