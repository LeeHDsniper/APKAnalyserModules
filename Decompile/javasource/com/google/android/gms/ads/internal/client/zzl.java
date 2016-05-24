package com.google.android.gms.ads.internal.client;

import java.util.Random;

public class zzl
  extends zzu.zza
{
  private Object zzpc = new Object();
  private final Random zzsT = new Random();
  private long zzsU;
  
  public zzl()
  {
    zzcK();
  }
  
  public long getValue()
  {
    return zzsU;
  }
  
  public void zzcK()
  {
    Object localObject1 = zzpc;
    int i = 3;
    long l1 = 0L;
    for (;;)
    {
      int j = i - 1;
      if (j > 0) {}
      try
      {
        long l2 = zzsT.nextInt() + 2147483648L;
        l1 = l2;
        i = j;
        if (l2 == zzsU) {
          continue;
        }
        l1 = l2;
        i = j;
        if (l2 == 0L) {
          continue;
        }
        l1 = l2;
        zzsU = l1;
        return;
      }
      finally {}
    }
  }
}
