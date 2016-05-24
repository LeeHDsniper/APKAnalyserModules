package com.google.android.gms.tagmanager;

import android.content.Context;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.concurrent.LinkedBlockingQueue;

class zzat
  extends Thread
  implements zzas
{
  private static zzat zzaQj;
  private volatile boolean mClosed = false;
  private final Context mContext;
  private volatile boolean zzMT = false;
  private final LinkedBlockingQueue<Runnable> zzaQi = new LinkedBlockingQueue();
  private volatile zzau zzaQk;
  
  private zzat(Context paramContext)
  {
    super("GAThread");
    if (paramContext != null) {}
    for (mContext = paramContext.getApplicationContext();; mContext = paramContext)
    {
      start();
      return;
    }
  }
  
  static zzat zzaO(Context paramContext)
  {
    if (zzaQj == null) {
      zzaQj = new zzat(paramContext);
    }
    return zzaQj;
  }
  
  private String zzd(Throwable paramThrowable)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    PrintStream localPrintStream = new PrintStream(localByteArrayOutputStream);
    paramThrowable.printStackTrace(localPrintStream);
    localPrintStream.flush();
    return new String(localByteArrayOutputStream.toByteArray());
  }
  
  public void run()
  {
    while (!mClosed) {
      try
      {
        Runnable localRunnable = (Runnable)zzaQi.take();
        if (!zzMT) {
          localRunnable.run();
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        zzbg.zzaD(localInterruptedException.toString());
      }
      catch (Throwable localThrowable)
      {
        zzbg.e("Error on Google TagManager Thread: " + zzd(localThrowable));
        zzbg.e("Google TagManager is shutting down.");
        zzMT = true;
      }
    }
  }
  
  public void zzeL(String paramString)
  {
    zzh(paramString, System.currentTimeMillis());
  }
  
  public void zzg(Runnable paramRunnable)
  {
    zzaQi.add(paramRunnable);
  }
  
  void zzh(String paramString, final long paramLong)
  {
    zzg(new Runnable()
    {
      public void run()
      {
        if (zzat.zza(zzat.this) == null)
        {
          zzcu localZzcu = zzcu.zzAP();
          localZzcu.zza(zzat.zzb(zzat.this), jdField_this);
          zzat.zza(zzat.this, localZzcu.zzAS());
        }
        zzat.zza(zzat.this).zzg(paramLong, zzxv);
      }
    });
  }
}
