package com.google.android.gms.ads.identifier;

import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.common.zza;
import com.google.android.gms.internal.zzav;
import com.google.android.gms.internal.zzav.zza;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class AdvertisingIdClient
{
  private static boolean zzog = false;
  private final Context mContext;
  zza zzoa;
  zzav zzob;
  boolean zzoc;
  Object zzod = new Object();
  zza zzoe;
  final long zzof;
  
  public AdvertisingIdClient(Context paramContext)
  {
    this(paramContext, 30000L);
  }
  
  public AdvertisingIdClient(Context paramContext, long paramLong)
  {
    zzx.zzv(paramContext);
    mContext = paramContext;
    zzoc = false;
    zzof = paramLong;
  }
  
  public static Info getAdvertisingIdInfo(Context paramContext)
    throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    paramContext = new AdvertisingIdClient(paramContext, -1L);
    try
    {
      paramContext.zzb(false);
      Info localInfo = paramContext.getInfo();
      return localInfo;
    }
    finally
    {
      paramContext.finish();
    }
  }
  
  public static void setShouldSkipGmsCoreVersionCheck(boolean paramBoolean)
  {
    zzog = paramBoolean;
  }
  
  static zzav zza(Context paramContext, zza paramZza)
    throws IOException
  {
    try
    {
      paramContext = zzav.zza.zzb(paramZza.zzmS());
      return paramContext;
    }
    catch (InterruptedException paramContext)
    {
      throw new IOException("Interrupted exception");
    }
    catch (Throwable paramContext)
    {
      throw new IOException(paramContext);
    }
  }
  
  private void zzaJ()
  {
    synchronized (zzod)
    {
      if (zzoe != null) {
        zzoe.cancel();
      }
    }
    try
    {
      zzoe.join();
      if (zzof > 0L) {
        zzoe = new zza(this, zzof);
      }
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;) {}
    }
  }
  
  /* Error */
  static zza zzo(Context paramContext)
    throws IOException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 124	android/content/Context:getPackageManager	()Landroid/content/pm/PackageManager;
    //   4: ldc 126
    //   6: iconst_0
    //   7: invokevirtual 132	android/content/pm/PackageManager:getPackageInfo	(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   10: pop
    //   11: getstatic 29	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzog	Z
    //   14: ifeq +67 -> 81
    //   17: ldc -122
    //   19: ldc -120
    //   21: invokestatic 142	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   24: pop
    //   25: invokestatic 148	com/google/android/gms/common/GoogleApiAvailability:getInstance	()Lcom/google/android/gms/common/GoogleApiAvailability;
    //   28: aload_0
    //   29: invokevirtual 152	com/google/android/gms/common/GoogleApiAvailability:isGooglePlayServicesAvailable	(Landroid/content/Context;)I
    //   32: tableswitch	default:+28->60, 0:+53->85, 1:+28->60, 2:+53->85
    //   60: new 57	java/io/IOException
    //   63: dup
    //   64: ldc -102
    //   66: invokespecial 99	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   69: athrow
    //   70: astore_0
    //   71: new 61	com/google/android/gms/common/GooglePlayServicesNotAvailableException
    //   74: dup
    //   75: bipush 9
    //   77: invokespecial 157	com/google/android/gms/common/GooglePlayServicesNotAvailableException:<init>	(I)V
    //   80: athrow
    //   81: aload_0
    //   82: invokestatic 162	com/google/android/gms/common/GooglePlayServicesUtil:zzaa	(Landroid/content/Context;)V
    //   85: new 85	com/google/android/gms/common/zza
    //   88: dup
    //   89: invokespecial 163	com/google/android/gms/common/zza:<init>	()V
    //   92: astore_2
    //   93: new 165	android/content/Intent
    //   96: dup
    //   97: ldc -89
    //   99: invokespecial 168	android/content/Intent:<init>	(Ljava/lang/String;)V
    //   102: astore_3
    //   103: aload_3
    //   104: ldc -86
    //   106: invokevirtual 174	android/content/Intent:setPackage	(Ljava/lang/String;)Landroid/content/Intent;
    //   109: pop
    //   110: invokestatic 180	com/google/android/gms/common/stats/zzb:zzpD	()Lcom/google/android/gms/common/stats/zzb;
    //   113: aload_0
    //   114: aload_3
    //   115: aload_2
    //   116: iconst_1
    //   117: invokevirtual 183	com/google/android/gms/common/stats/zzb:zza	(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    //   120: istore_1
    //   121: iload_1
    //   122: ifeq +25 -> 147
    //   125: aload_2
    //   126: areturn
    //   127: astore_0
    //   128: new 57	java/io/IOException
    //   131: dup
    //   132: aload_0
    //   133: invokespecial 102	java/io/IOException:<init>	(Ljava/lang/Throwable;)V
    //   136: athrow
    //   137: astore_0
    //   138: new 57	java/io/IOException
    //   141: dup
    //   142: aload_0
    //   143: invokespecial 102	java/io/IOException:<init>	(Ljava/lang/Throwable;)V
    //   146: athrow
    //   147: new 57	java/io/IOException
    //   150: dup
    //   151: ldc -71
    //   153: invokespecial 99	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   156: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	157	0	paramContext	Context
    //   120	2	1	bool	boolean
    //   92	34	2	localZza	zza
    //   102	13	3	localIntent	android.content.Intent
    // Exception table:
    //   from	to	target	type
    //   0	11	70	android/content/pm/PackageManager$NameNotFoundException
    //   81	85	127	com/google/android/gms/common/GooglePlayServicesNotAvailableException
    //   110	121	137	java/lang/Throwable
  }
  
  protected void finalize()
    throws Throwable
  {
    finish();
    super.finalize();
  }
  
  /* Error */
  public void finish()
  {
    // Byte code:
    //   0: ldc -64
    //   2: invokestatic 195	com/google/android/gms/common/internal/zzx:zzci	(Ljava/lang/String;)V
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 49	com/google/android/gms/ads/identifier/AdvertisingIdClient:mContext	Landroid/content/Context;
    //   11: ifnull +10 -> 21
    //   14: aload_0
    //   15: getfield 197	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoa	Lcom/google/android/gms/common/zza;
    //   18: ifnonnull +6 -> 24
    //   21: aload_0
    //   22: monitorexit
    //   23: return
    //   24: aload_0
    //   25: getfield 51	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoc	Z
    //   28: ifeq +17 -> 45
    //   31: invokestatic 180	com/google/android/gms/common/stats/zzb:zzpD	()Lcom/google/android/gms/common/stats/zzb;
    //   34: aload_0
    //   35: getfield 49	com/google/android/gms/ads/identifier/AdvertisingIdClient:mContext	Landroid/content/Context;
    //   38: aload_0
    //   39: getfield 197	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoa	Lcom/google/android/gms/common/zza;
    //   42: invokevirtual 200	com/google/android/gms/common/stats/zzb:zza	(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    //   45: aload_0
    //   46: iconst_0
    //   47: putfield 51	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoc	Z
    //   50: aload_0
    //   51: aconst_null
    //   52: putfield 202	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzob	Lcom/google/android/gms/internal/zzav;
    //   55: aload_0
    //   56: aconst_null
    //   57: putfield 197	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoa	Lcom/google/android/gms/common/zza;
    //   60: aload_0
    //   61: monitorexit
    //   62: return
    //   63: astore_1
    //   64: aload_0
    //   65: monitorexit
    //   66: aload_1
    //   67: athrow
    //   68: astore_1
    //   69: ldc -52
    //   71: ldc -50
    //   73: aload_1
    //   74: invokestatic 210	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   77: pop
    //   78: goto -33 -> 45
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	this	AdvertisingIdClient
    //   63	4	1	localObject	Object
    //   68	6	1	localIllegalArgumentException	IllegalArgumentException
    // Exception table:
    //   from	to	target	type
    //   7	21	63	finally
    //   21	23	63	finally
    //   24	45	63	finally
    //   45	62	63	finally
    //   64	66	63	finally
    //   69	78	63	finally
    //   24	45	68	java/lang/IllegalArgumentException
  }
  
  /* Error */
  public Info getInfo()
    throws IOException
  {
    // Byte code:
    //   0: ldc -64
    //   2: invokestatic 195	com/google/android/gms/common/internal/zzx:zzci	(Ljava/lang/String;)V
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 51	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoc	Z
    //   11: ifne +83 -> 94
    //   14: aload_0
    //   15: getfield 41	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzod	Ljava/lang/Object;
    //   18: astore_1
    //   19: aload_1
    //   20: monitorenter
    //   21: aload_0
    //   22: getfield 105	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoe	Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$zza;
    //   25: ifnull +13 -> 38
    //   28: aload_0
    //   29: getfield 105	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoe	Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$zza;
    //   32: invokevirtual 218	com/google/android/gms/ads/identifier/AdvertisingIdClient$zza:zzaK	()Z
    //   35: ifne +23 -> 58
    //   38: new 57	java/io/IOException
    //   41: dup
    //   42: ldc -36
    //   44: invokespecial 99	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   47: athrow
    //   48: astore_2
    //   49: aload_1
    //   50: monitorexit
    //   51: aload_2
    //   52: athrow
    //   53: astore_1
    //   54: aload_0
    //   55: monitorexit
    //   56: aload_1
    //   57: athrow
    //   58: aload_1
    //   59: monitorexit
    //   60: aload_0
    //   61: iconst_0
    //   62: invokevirtual 69	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzb	(Z)V
    //   65: aload_0
    //   66: getfield 51	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoc	Z
    //   69: ifne +25 -> 94
    //   72: new 57	java/io/IOException
    //   75: dup
    //   76: ldc -34
    //   78: invokespecial 99	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   81: athrow
    //   82: astore_1
    //   83: new 57	java/io/IOException
    //   86: dup
    //   87: ldc -34
    //   89: aload_1
    //   90: invokespecial 225	java/io/IOException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   93: athrow
    //   94: aload_0
    //   95: getfield 197	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzoa	Lcom/google/android/gms/common/zza;
    //   98: invokestatic 47	com/google/android/gms/common/internal/zzx:zzv	(Ljava/lang/Object;)Ljava/lang/Object;
    //   101: pop
    //   102: aload_0
    //   103: getfield 202	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzob	Lcom/google/android/gms/internal/zzav;
    //   106: invokestatic 47	com/google/android/gms/common/internal/zzx:zzv	(Ljava/lang/Object;)Ljava/lang/Object;
    //   109: pop
    //   110: new 6	com/google/android/gms/ads/identifier/AdvertisingIdClient$Info
    //   113: dup
    //   114: aload_0
    //   115: getfield 202	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzob	Lcom/google/android/gms/internal/zzav;
    //   118: invokeinterface 231 1 0
    //   123: aload_0
    //   124: getfield 202	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzob	Lcom/google/android/gms/internal/zzav;
    //   127: iconst_1
    //   128: invokeinterface 235 2 0
    //   133: invokespecial 238	com/google/android/gms/ads/identifier/AdvertisingIdClient$Info:<init>	(Ljava/lang/String;Z)V
    //   136: astore_1
    //   137: aload_0
    //   138: monitorexit
    //   139: aload_0
    //   140: invokespecial 240	com/google/android/gms/ads/identifier/AdvertisingIdClient:zzaJ	()V
    //   143: aload_1
    //   144: areturn
    //   145: astore_1
    //   146: ldc -52
    //   148: ldc -14
    //   150: aload_1
    //   151: invokestatic 210	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   154: pop
    //   155: new 57	java/io/IOException
    //   158: dup
    //   159: ldc -12
    //   161: invokespecial 99	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   164: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	165	0	this	AdvertisingIdClient
    //   53	6	1	localObject2	Object
    //   82	8	1	localException	Exception
    //   136	8	1	localInfo	Info
    //   145	6	1	localRemoteException	android.os.RemoteException
    //   48	4	2	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   21	38	48	finally
    //   38	48	48	finally
    //   49	51	48	finally
    //   58	60	48	finally
    //   7	21	53	finally
    //   51	53	53	finally
    //   54	56	53	finally
    //   60	65	53	finally
    //   65	82	53	finally
    //   83	94	53	finally
    //   94	110	53	finally
    //   110	137	53	finally
    //   137	139	53	finally
    //   146	165	53	finally
    //   60	65	82	java/lang/Exception
    //   110	137	145	android/os/RemoteException
  }
  
  public void start()
    throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    zzb(true);
  }
  
  protected void zzb(boolean paramBoolean)
    throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    zzx.zzci("Calling this from your main thread can lead to deadlock");
    try
    {
      if (zzoc) {
        finish();
      }
      zzoa = zzo(mContext);
      zzob = zza(mContext, zzoa);
      zzoc = true;
      if (paramBoolean) {
        zzaJ();
      }
      return;
    }
    finally {}
  }
  
  public static final class Info
  {
    private final String zzol;
    private final boolean zzom;
    
    public Info(String paramString, boolean paramBoolean)
    {
      zzol = paramString;
      zzom = paramBoolean;
    }
    
    public String getId()
    {
      return zzol;
    }
    
    public boolean isLimitAdTrackingEnabled()
    {
      return zzom;
    }
    
    public String toString()
    {
      return "{" + zzol + "}" + zzom;
    }
  }
  
  static class zza
    extends Thread
  {
    private WeakReference<AdvertisingIdClient> zzoh;
    private long zzoi;
    CountDownLatch zzoj;
    boolean zzok;
    
    public zza(AdvertisingIdClient paramAdvertisingIdClient, long paramLong)
    {
      zzoh = new WeakReference(paramAdvertisingIdClient);
      zzoi = paramLong;
      zzoj = new CountDownLatch(1);
      zzok = false;
      start();
    }
    
    private void disconnect()
    {
      AdvertisingIdClient localAdvertisingIdClient = (AdvertisingIdClient)zzoh.get();
      if (localAdvertisingIdClient != null)
      {
        localAdvertisingIdClient.finish();
        zzok = true;
      }
    }
    
    public void cancel()
    {
      zzoj.countDown();
    }
    
    public void run()
    {
      try
      {
        if (!zzoj.await(zzoi, TimeUnit.MILLISECONDS)) {
          disconnect();
        }
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        disconnect();
      }
    }
    
    public boolean zzaK()
    {
      return zzok;
    }
  }
}
