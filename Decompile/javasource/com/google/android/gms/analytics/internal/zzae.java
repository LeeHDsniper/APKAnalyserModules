package com.google.android.gms.analytics.internal;

import android.util.Log;
import com.google.android.gms.analytics.Logger;

@Deprecated
public class zzae
{
  private static volatile Logger zzOk;
  
  static
  {
    setLogger(new zzs());
  }
  
  public static Logger getLogger()
  {
    return zzOk;
  }
  
  public static void setLogger(Logger paramLogger)
  {
    zzOk = paramLogger;
  }
  
  public static boolean zzM(int paramInt)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (getLogger() != null)
    {
      bool1 = bool2;
      if (getLogger().getLogLevel() <= paramInt) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public static void zzaE(String paramString)
  {
    Object localObject = zzaf.zzkq();
    if (localObject != null) {
      ((zzaf)localObject).zzbb(paramString);
    }
    for (;;)
    {
      localObject = zzOk;
      if (localObject != null) {
        ((Logger)localObject).warn(paramString);
      }
      return;
      if (zzM(2)) {
        Log.w((String)zzy.zzNa.get(), paramString);
      }
    }
  }
  
  public static void zzf(String paramString, Object paramObject)
  {
    zzaf localZzaf = zzaf.zzkq();
    if (localZzaf != null) {
      localZzaf.zze(paramString, paramObject);
    }
    while (!zzM(3))
    {
      paramObject = zzOk;
      if (paramObject != null) {
        paramObject.error(paramString);
      }
      return;
    }
    if (paramObject != null) {}
    for (paramObject = paramString + ":" + paramObject;; paramObject = paramString)
    {
      Log.e((String)zzy.zzNa.get(), paramObject);
      break;
    }
  }
}
