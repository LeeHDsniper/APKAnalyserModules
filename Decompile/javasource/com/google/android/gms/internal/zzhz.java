package com.google.android.gms.internal;

import android.os.HandlerThread;
import android.os.Looper;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzx;

public class zzhz
{
  private HandlerThread zzIn = null;
  private int zzIo = 0;
  private final Object zzpc = new Object();
  
  public zzhz() {}
  
  public Looper zzgB()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzIn == null)
        {
          if (zzIo == 0)
          {
            bool = true;
            zzx.zzb(bool, "Invalid state: mHandlerThread should already been initialized.");
            zzb.v("Starting the looper provider thread.");
            zzIn = new HandlerThread("LooperProvider");
            zzIn.start();
          }
        }
        else
        {
          zzIo += 1;
          Looper localLooper = zzIn.getLooper();
          return localLooper;
        }
      }
      boolean bool = false;
    }
  }
  
  public void zzgC()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzIo > 0)
        {
          bool = true;
          zzx.zzb(bool, "Invalid state: release() called more times than expected.");
          int i = zzIo - 1;
          zzIo = i;
          if (i == 0)
          {
            zzb.v("Terminate the looper provider thread.");
            zzIn.quit();
            zzIn = null;
          }
          return;
        }
      }
      boolean bool = false;
    }
  }
}
