package com.google.android.gms.analytics.internal;

public enum zzm
{
  private zzm() {}
  
  public static zzm zzbh(String paramString)
  {
    if ("BATCH_BY_SESSION".equalsIgnoreCase(paramString)) {
      return zzMA;
    }
    if ("BATCH_BY_TIME".equalsIgnoreCase(paramString)) {
      return zzMB;
    }
    if ("BATCH_BY_BRUTE_FORCE".equalsIgnoreCase(paramString)) {
      return zzMC;
    }
    if ("BATCH_BY_COUNT".equalsIgnoreCase(paramString)) {
      return zzMD;
    }
    if ("BATCH_BY_SIZE".equalsIgnoreCase(paramString)) {
      return zzME;
    }
    return zzMz;
  }
}
