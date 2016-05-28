package com.google.android.gms.internal;

import android.net.TrafficStats;
import android.os.Build.VERSION;
import java.util.concurrent.BlockingQueue;

public class zzg
  extends Thread
{
  private final zzb zzj;
  private final zzn zzk;
  private volatile boolean zzl = false;
  private final BlockingQueue<zzk<?>> zzy;
  private final zzf zzz;
  
  public zzg(BlockingQueue<zzk<?>> paramBlockingQueue, zzf paramZzf, zzb paramZzb, zzn paramZzn)
  {
    zzy = paramBlockingQueue;
    zzz = paramZzf;
    zzj = paramZzb;
    zzk = paramZzn;
  }
  
  private void zzb(zzk<?> paramZzk)
  {
    if (Build.VERSION.SDK_INT >= 14) {
      TrafficStats.setThreadStatsTag(paramZzk.zzg());
    }
  }
  
  private void zzb(zzk<?> paramZzk, zzr paramZzr)
  {
    paramZzr = paramZzk.zzb(paramZzr);
    zzk.zza(paramZzk, paramZzr);
  }
  
  public void quit()
  {
    zzl = true;
    interrupt();
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: bipush 10
    //   2: invokestatic 80	android/os/Process:setThreadPriority	(I)V
    //   5: invokestatic 86	android/os/SystemClock:elapsedRealtime	()J
    //   8: lstore_1
    //   9: aload_0
    //   10: getfield 24	com/google/android/gms/internal/zzg:zzy	Ljava/util/concurrent/BlockingQueue;
    //   13: invokeinterface 92 1 0
    //   18: checkcast 43	com/google/android/gms/internal/zzk
    //   21: astore_3
    //   22: aload_3
    //   23: ldc 94
    //   25: invokevirtual 98	com/google/android/gms/internal/zzk:zzc	(Ljava/lang/String;)V
    //   28: aload_3
    //   29: invokevirtual 102	com/google/android/gms/internal/zzk:isCanceled	()Z
    //   32: ifeq +43 -> 75
    //   35: aload_3
    //   36: ldc 104
    //   38: invokevirtual 107	com/google/android/gms/internal/zzk:zzd	(Ljava/lang/String;)V
    //   41: goto -36 -> 5
    //   44: astore 4
    //   46: aload 4
    //   48: invokestatic 86	android/os/SystemClock:elapsedRealtime	()J
    //   51: lload_1
    //   52: lsub
    //   53: invokevirtual 110	com/google/android/gms/internal/zzr:zza	(J)V
    //   56: aload_0
    //   57: aload_3
    //   58: aload 4
    //   60: invokespecial 112	com/google/android/gms/internal/zzg:zzb	(Lcom/google/android/gms/internal/zzk;Lcom/google/android/gms/internal/zzr;)V
    //   63: goto -58 -> 5
    //   66: astore_3
    //   67: aload_0
    //   68: getfield 22	com/google/android/gms/internal/zzg:zzl	Z
    //   71: ifeq -66 -> 5
    //   74: return
    //   75: aload_0
    //   76: aload_3
    //   77: invokespecial 114	com/google/android/gms/internal/zzg:zzb	(Lcom/google/android/gms/internal/zzk;)V
    //   80: aload_0
    //   81: getfield 26	com/google/android/gms/internal/zzg:zzz	Lcom/google/android/gms/internal/zzf;
    //   84: aload_3
    //   85: invokeinterface 119 2 0
    //   90: astore 4
    //   92: aload_3
    //   93: ldc 121
    //   95: invokevirtual 98	com/google/android/gms/internal/zzk:zzc	(Ljava/lang/String;)V
    //   98: aload 4
    //   100: getfield 126	com/google/android/gms/internal/zzi:zzB	Z
    //   103: ifeq +76 -> 179
    //   106: aload_3
    //   107: invokevirtual 129	com/google/android/gms/internal/zzk:zzw	()Z
    //   110: ifeq +69 -> 179
    //   113: aload_3
    //   114: ldc -125
    //   116: invokevirtual 107	com/google/android/gms/internal/zzk:zzd	(Ljava/lang/String;)V
    //   119: goto -114 -> 5
    //   122: astore 4
    //   124: aload 4
    //   126: ldc -123
    //   128: iconst_1
    //   129: anewarray 135	java/lang/Object
    //   132: dup
    //   133: iconst_0
    //   134: aload 4
    //   136: invokevirtual 139	java/lang/Exception:toString	()Ljava/lang/String;
    //   139: aastore
    //   140: invokestatic 144	com/google/android/gms/internal/zzs:zza	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   143: new 73	com/google/android/gms/internal/zzr
    //   146: dup
    //   147: aload 4
    //   149: invokespecial 147	com/google/android/gms/internal/zzr:<init>	(Ljava/lang/Throwable;)V
    //   152: astore 4
    //   154: aload 4
    //   156: invokestatic 86	android/os/SystemClock:elapsedRealtime	()J
    //   159: lload_1
    //   160: lsub
    //   161: invokevirtual 110	com/google/android/gms/internal/zzr:zza	(J)V
    //   164: aload_0
    //   165: getfield 30	com/google/android/gms/internal/zzg:zzk	Lcom/google/android/gms/internal/zzn;
    //   168: aload_3
    //   169: aload 4
    //   171: invokeinterface 63 3 0
    //   176: goto -171 -> 5
    //   179: aload_3
    //   180: aload 4
    //   182: invokevirtual 150	com/google/android/gms/internal/zzk:zza	(Lcom/google/android/gms/internal/zzi;)Lcom/google/android/gms/internal/zzm;
    //   185: astore 4
    //   187: aload_3
    //   188: ldc -104
    //   190: invokevirtual 98	com/google/android/gms/internal/zzk:zzc	(Ljava/lang/String;)V
    //   193: aload_3
    //   194: invokevirtual 155	com/google/android/gms/internal/zzk:zzr	()Z
    //   197: ifeq +35 -> 232
    //   200: aload 4
    //   202: getfield 161	com/google/android/gms/internal/zzm:zzag	Lcom/google/android/gms/internal/zzb$zza;
    //   205: ifnull +27 -> 232
    //   208: aload_0
    //   209: getfield 28	com/google/android/gms/internal/zzg:zzj	Lcom/google/android/gms/internal/zzb;
    //   212: aload_3
    //   213: invokevirtual 164	com/google/android/gms/internal/zzk:zzh	()Ljava/lang/String;
    //   216: aload 4
    //   218: getfield 161	com/google/android/gms/internal/zzm:zzag	Lcom/google/android/gms/internal/zzb$zza;
    //   221: invokeinterface 169 3 0
    //   226: aload_3
    //   227: ldc -85
    //   229: invokevirtual 98	com/google/android/gms/internal/zzk:zzc	(Ljava/lang/String;)V
    //   232: aload_3
    //   233: invokevirtual 174	com/google/android/gms/internal/zzk:zzv	()V
    //   236: aload_0
    //   237: getfield 30	com/google/android/gms/internal/zzg:zzk	Lcom/google/android/gms/internal/zzn;
    //   240: aload_3
    //   241: aload 4
    //   243: invokeinterface 177 3 0
    //   248: goto -243 -> 5
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	251	0	this	zzg
    //   8	152	1	l	long
    //   21	37	3	localZzk	zzk
    //   66	175	3	localInterruptedException	InterruptedException
    //   44	15	4	localZzr	zzr
    //   90	9	4	localZzi	zzi
    //   122	26	4	localException	Exception
    //   152	90	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   22	41	44	com/google/android/gms/internal/zzr
    //   75	119	44	com/google/android/gms/internal/zzr
    //   179	232	44	com/google/android/gms/internal/zzr
    //   232	248	44	com/google/android/gms/internal/zzr
    //   9	22	66	java/lang/InterruptedException
    //   22	41	122	java/lang/Exception
    //   75	119	122	java/lang/Exception
    //   179	232	122	java/lang/Exception
    //   232	248	122	java/lang/Exception
  }
}
