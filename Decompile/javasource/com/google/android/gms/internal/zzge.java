package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.zzn;
import java.util.concurrent.Future;

@zzgk
public class zzge
  extends zzhq
{
  private final zzga.zza zzCD;
  private final zzhj.zza zzCF;
  private final AdResponseParcel zzCG;
  private final zzgf zzCP;
  private Future<zzhj> zzCQ;
  private final Object zzpc = new Object();
  
  public zzge(Context paramContext, zzn paramZzn, zzbc paramZzbc, zzhj.zza paramZza, zzan paramZzan, zzga.zza paramZza1)
  {
    this(paramZza, paramZza1, new zzgf(paramContext, paramZzn, paramZzbc, new zzhy(paramContext), paramZzan, paramZza));
  }
  
  zzge(zzhj.zza paramZza, zzga.zza paramZza1, zzgf paramZzgf)
  {
    zzCF = paramZza;
    zzCG = zzGM;
    zzCD = paramZza1;
    zzCP = paramZzgf;
  }
  
  private zzhj zzA(int paramInt)
  {
    return new zzhj(zzCF.zzGL.zzDy, null, null, paramInt, null, null, zzCG.orientation, zzCG.zzyA, zzCF.zzGL.zzDB, false, null, null, null, null, null, zzCG.zzDY, zzCF.zzqf, zzCG.zzDW, zzCF.zzGI, zzCG.zzEb, zzCG.zzEc, zzCF.zzGF, null, zzCF.zzGL.zzDO);
  }
  
  public void onStop()
  {
    synchronized (zzpc)
    {
      if (zzCQ != null) {
        zzCQ.cancel(true);
      }
      return;
    }
  }
  
  /* Error */
  public void zzdG()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 44	com/google/android/gms/internal/zzge:zzpc	Ljava/lang/Object;
    //   4: astore_2
    //   5: aload_2
    //   6: monitorenter
    //   7: aload_0
    //   8: aload_0
    //   9: getfield 57	com/google/android/gms/internal/zzge:zzCP	Lcom/google/android/gms/internal/zzgf;
    //   12: invokestatic 139	com/google/android/gms/internal/zzht:zza	(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;
    //   15: putfield 119	com/google/android/gms/internal/zzge:zzCQ	Ljava/util/concurrent/Future;
    //   18: aload_2
    //   19: monitorexit
    //   20: aload_0
    //   21: getfield 119	com/google/android/gms/internal/zzge:zzCQ	Ljava/util/concurrent/Future;
    //   24: ldc2_w 140
    //   27: getstatic 147	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   30: invokeinterface 151 4 0
    //   35: checkcast 61	com/google/android/gms/internal/zzhj
    //   38: astore_2
    //   39: bipush -2
    //   41: istore_1
    //   42: aload_2
    //   43: ifnull +73 -> 116
    //   46: getstatic 157	com/google/android/gms/internal/zzhu:zzHK	Landroid/os/Handler;
    //   49: new 6	com/google/android/gms/internal/zzge$1
    //   52: dup
    //   53: aload_0
    //   54: aload_2
    //   55: invokespecial 160	com/google/android/gms/internal/zzge$1:<init>	(Lcom/google/android/gms/internal/zzge;Lcom/google/android/gms/internal/zzhj;)V
    //   58: invokevirtual 166	android/os/Handler:post	(Ljava/lang/Runnable;)Z
    //   61: pop
    //   62: return
    //   63: astore_3
    //   64: aload_2
    //   65: monitorexit
    //   66: aload_3
    //   67: athrow
    //   68: astore_2
    //   69: ldc -88
    //   71: invokestatic 174	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   74: aload_0
    //   75: getfield 119	com/google/android/gms/internal/zzge:zzCQ	Ljava/util/concurrent/Future;
    //   78: iconst_1
    //   79: invokeinterface 125 2 0
    //   84: pop
    //   85: iconst_2
    //   86: istore_1
    //   87: aconst_null
    //   88: astore_2
    //   89: goto -47 -> 42
    //   92: astore_2
    //   93: iconst_0
    //   94: istore_1
    //   95: aconst_null
    //   96: astore_2
    //   97: goto -55 -> 42
    //   100: astore_2
    //   101: aconst_null
    //   102: astore_2
    //   103: iconst_m1
    //   104: istore_1
    //   105: goto -63 -> 42
    //   108: astore_2
    //   109: aconst_null
    //   110: astore_2
    //   111: iconst_m1
    //   112: istore_1
    //   113: goto -71 -> 42
    //   116: aload_0
    //   117: iload_1
    //   118: invokespecial 176	com/google/android/gms/internal/zzge:zzA	(I)Lcom/google/android/gms/internal/zzhj;
    //   121: astore_2
    //   122: goto -76 -> 46
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	125	0	this	zzge
    //   41	77	1	i	int
    //   68	1	2	localTimeoutException	java.util.concurrent.TimeoutException
    //   88	1	2	localObject2	Object
    //   92	1	2	localExecutionException	java.util.concurrent.ExecutionException
    //   96	1	2	localObject3	Object
    //   100	1	2	localInterruptedException	InterruptedException
    //   102	1	2	localObject4	Object
    //   108	1	2	localCancellationException	java.util.concurrent.CancellationException
    //   110	12	2	localZzhj	zzhj
    //   63	4	3	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   7	20	63	finally
    //   64	66	63	finally
    //   0	7	68	java/util/concurrent/TimeoutException
    //   20	39	68	java/util/concurrent/TimeoutException
    //   66	68	68	java/util/concurrent/TimeoutException
    //   0	7	92	java/util/concurrent/ExecutionException
    //   20	39	92	java/util/concurrent/ExecutionException
    //   66	68	92	java/util/concurrent/ExecutionException
    //   0	7	100	java/lang/InterruptedException
    //   20	39	100	java/lang/InterruptedException
    //   66	68	100	java/lang/InterruptedException
    //   0	7	108	java/util/concurrent/CancellationException
    //   20	39	108	java/util/concurrent/CancellationException
    //   66	68	108	java/util/concurrent/CancellationException
  }
}
