package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;

class zzcu
  extends zzct
{
  private static final Object zzaRX = new Object();
  private static zzcu zzaSi;
  private boolean connected = true;
  private Handler handler;
  private Context zzaRY;
  private zzau zzaRZ;
  private volatile zzas zzaSa;
  private int zzaSb = 1800000;
  private boolean zzaSc = true;
  private boolean zzaSd = false;
  private boolean zzaSe = true;
  private zzav zzaSf = new zzav()
  {
    public void zzas(boolean paramAnonymousBoolean)
    {
      zzd(paramAnonymousBoolean, zzcu.zza(zzcu.this));
    }
  };
  private zzbl zzaSg;
  private boolean zzaSh = false;
  
  private zzcu() {}
  
  public static zzcu zzAP()
  {
    if (zzaSi == null) {
      zzaSi = new zzcu();
    }
    return zzaSi;
  }
  
  private void zzAQ()
  {
    zzaSg = new zzbl(this);
    zzaSg.zzaP(zzaRY);
  }
  
  private void zzAR()
  {
    handler = new Handler(zzaRY.getMainLooper(), new Handler.Callback()
    {
      public boolean handleMessage(Message paramAnonymousMessage)
      {
        if ((1 == what) && (zzcu.zzAT().equals(obj)))
        {
          dispatch();
          if ((zzcu.zzb(zzcu.this) > 0) && (!zzcu.zzc(zzcu.this))) {
            zzcu.zzd(zzcu.this).sendMessageDelayed(zzcu.zzd(zzcu.this).obtainMessage(1, zzcu.zzAT()), zzcu.zzb(zzcu.this));
          }
        }
        return true;
      }
    });
    if (zzaSb > 0) {
      handler.sendMessageDelayed(handler.obtainMessage(1, zzaRX), zzaSb);
    }
  }
  
  /* Error */
  public void dispatch()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 52	com/google/android/gms/tagmanager/zzcu:zzaSd	Z
    //   6: ifne +16 -> 22
    //   9: ldc 121
    //   11: invokestatic 127	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: iconst_1
    //   16: putfield 50	com/google/android/gms/tagmanager/zzcu:zzaSc	Z
    //   19: aload_0
    //   20: monitorexit
    //   21: return
    //   22: aload_0
    //   23: getfield 129	com/google/android/gms/tagmanager/zzcu:zzaSa	Lcom/google/android/gms/tagmanager/zzas;
    //   26: new 10	com/google/android/gms/tagmanager/zzcu$3
    //   29: dup
    //   30: aload_0
    //   31: invokespecial 130	com/google/android/gms/tagmanager/zzcu$3:<init>	(Lcom/google/android/gms/tagmanager/zzcu;)V
    //   34: invokeinterface 136 2 0
    //   39: goto -20 -> 19
    //   42: astore_1
    //   43: aload_0
    //   44: monitorexit
    //   45: aload_1
    //   46: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	47	0	this	zzcu
    //   42	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	19	42	finally
    //   22	39	42	finally
  }
  
  zzau zzAS()
  {
    try
    {
      if (zzaRZ != null) {
        break label50;
      }
      if (zzaRY == null) {
        throw new IllegalStateException("Cant get a store unless we have a context");
      }
    }
    finally {}
    zzaRZ = new zzby(zzaSf, zzaRY);
    label50:
    if (handler == null) {
      zzAR();
    }
    zzaSd = true;
    if (zzaSc)
    {
      dispatch();
      zzaSc = false;
    }
    if ((zzaSg == null) && (zzaSe)) {
      zzAQ();
    }
    zzau localZzau = zzaRZ;
    return localZzau;
  }
  
  /* Error */
  void zza(Context paramContext, zzas paramZzas)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 78	com/google/android/gms/tagmanager/zzcu:zzaRY	Landroid/content/Context;
    //   6: astore_3
    //   7: aload_3
    //   8: ifnull +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: aload_1
    //   16: invokevirtual 160	android/content/Context:getApplicationContext	()Landroid/content/Context;
    //   19: putfield 78	com/google/android/gms/tagmanager/zzcu:zzaRY	Landroid/content/Context;
    //   22: aload_0
    //   23: getfield 129	com/google/android/gms/tagmanager/zzcu:zzaSa	Lcom/google/android/gms/tagmanager/zzas;
    //   26: ifnonnull -15 -> 11
    //   29: aload_0
    //   30: aload_2
    //   31: putfield 129	com/google/android/gms/tagmanager/zzcu:zzaSa	Lcom/google/android/gms/tagmanager/zzas;
    //   34: goto -23 -> 11
    //   37: astore_1
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_1
    //   41: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	42	0	this	zzcu
    //   0	42	1	paramContext	Context
    //   0	42	2	paramZzas	zzas
    //   6	2	3	localContext	Context
    // Exception table:
    //   from	to	target	type
    //   2	7	37	finally
    //   14	34	37	finally
  }
  
  void zzat(boolean paramBoolean)
  {
    try
    {
      zzd(zzaSh, paramBoolean);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  void zzd(boolean paramBoolean1, boolean paramBoolean2)
  {
    for (;;)
    {
      StringBuilder localStringBuilder;
      String str1;
      try
      {
        if (zzaSh == paramBoolean1)
        {
          boolean bool = connected;
          if (bool == paramBoolean2) {
            return;
          }
        }
        if (((paramBoolean1) || (!paramBoolean2)) && (zzaSb > 0)) {
          handler.removeMessages(1, zzaRX);
        }
        if ((!paramBoolean1) && (paramBoolean2) && (zzaSb > 0)) {
          handler.sendMessageDelayed(handler.obtainMessage(1, zzaRX), zzaSb);
        }
        localStringBuilder = new StringBuilder().append("PowerSaveMode ");
        if (paramBoolean1) {
          break label153;
        }
        if (paramBoolean2) {
          break label146;
        }
      }
      finally {}
      zzbg.v(str1);
      zzaSh = paramBoolean1;
      connected = paramBoolean2;
      continue;
      label146:
      String str2 = "terminated.";
      continue;
      label153:
      str2 = "initiated.";
    }
  }
  
  void zzhY()
  {
    try
    {
      if ((!zzaSh) && (connected) && (zzaSb > 0))
      {
        handler.removeMessages(1, zzaRX);
        handler.sendMessage(handler.obtainMessage(1, zzaRX));
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
