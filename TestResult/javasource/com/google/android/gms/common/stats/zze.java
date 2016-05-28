package com.google.android.gms.common.stats;

import android.os.SystemClock;
import android.support.v4.util.SimpleArrayMap;
import android.util.Log;

public class zze
{
  private final long zzafP;
  private final int zzafQ;
  private final SimpleArrayMap<String, Long> zzafR;
  
  public zze()
  {
    zzafP = 60000L;
    zzafQ = 10;
    zzafR = new SimpleArrayMap(10);
  }
  
  public zze(int paramInt, long paramLong)
  {
    zzafP = paramLong;
    zzafQ = paramInt;
    zzafR = new SimpleArrayMap();
  }
  
  private void zzb(long paramLong1, long paramLong2)
  {
    int i = zzafR.size() - 1;
    while (i >= 0)
    {
      if (paramLong2 - ((Long)zzafR.valueAt(i)).longValue() > paramLong1) {
        zzafR.removeAt(i);
      }
      i -= 1;
    }
  }
  
  public Long zzcy(String paramString)
  {
    long l2 = SystemClock.elapsedRealtime();
    long l1 = zzafP;
    try
    {
      while (zzafR.size() >= zzafQ)
      {
        zzb(l1, l2);
        l1 /= 2L;
        Log.w("ConnectionTracker", "The max capacity " + zzafQ + " is not enough. Current durationThreshold is: " + l1);
      }
      paramString = (Long)zzafR.put(paramString, Long.valueOf(l2));
    }
    finally {}
    return paramString;
  }
  
  public boolean zzcz(String paramString)
  {
    for (;;)
    {
      try
      {
        if (zzafR.remove(paramString) != null)
        {
          bool = true;
          return bool;
        }
      }
      finally {}
      boolean bool = false;
    }
  }
}
