package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.google.android.gms.internal.zzaf.zzj;
import com.google.android.gms.internal.zzqw;

class zzcl
  implements Runnable
{
  private final Context mContext;
  private final String zzaOS;
  private volatile String zzaPp;
  private final zzqw zzaRm;
  private final String zzaRn;
  private zzbf<zzaf.zzj> zzaRo;
  private volatile zzs zzaRp;
  private volatile String zzaRq;
  
  zzcl(Context paramContext, String paramString, zzqw paramZzqw, zzs paramZzs)
  {
    mContext = paramContext;
    zzaRm = paramZzqw;
    zzaOS = paramString;
    zzaRp = paramZzs;
    zzaRn = ("/r?id=" + paramString);
    zzaPp = zzaRn;
    zzaRq = null;
  }
  
  public zzcl(Context paramContext, String paramString, zzs paramZzs)
  {
    this(paramContext, paramString, new zzqw(), paramZzs);
  }
  
  private boolean zzAy()
  {
    NetworkInfo localNetworkInfo = ((ConnectivityManager)mContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected()))
    {
      zzbg.v("...no network connectivity");
      return false;
    }
    return true;
  }
  
  /* Error */
  private void zzAz()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 95	com/google/android/gms/tagmanager/zzcl:zzAy	()Z
    //   4: ifne +16 -> 20
    //   7: aload_0
    //   8: getfield 97	com/google/android/gms/tagmanager/zzcl:zzaRo	Lcom/google/android/gms/tagmanager/zzbf;
    //   11: getstatic 103	com/google/android/gms/tagmanager/zzbf$zza:zzaQC	Lcom/google/android/gms/tagmanager/zzbf$zza;
    //   14: invokeinterface 109 2 0
    //   19: return
    //   20: ldc 111
    //   22: invokestatic 88	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   25: aload_0
    //   26: invokevirtual 114	com/google/android/gms/tagmanager/zzcl:zzAA	()Ljava/lang/String;
    //   29: astore_2
    //   30: aload_0
    //   31: getfield 29	com/google/android/gms/tagmanager/zzcl:zzaRm	Lcom/google/android/gms/internal/zzqw;
    //   34: invokevirtual 118	com/google/android/gms/internal/zzqw:zzBW	()Lcom/google/android/gms/internal/zzqv;
    //   37: astore_1
    //   38: aload_1
    //   39: aload_2
    //   40: invokeinterface 124 2 0
    //   45: astore_3
    //   46: new 126	java/io/ByteArrayOutputStream
    //   49: dup
    //   50: invokespecial 127	java/io/ByteArrayOutputStream:<init>	()V
    //   53: astore 4
    //   55: aload_3
    //   56: aload 4
    //   58: invokestatic 133	com/google/android/gms/internal/zzqp:zzc	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   61: aload 4
    //   63: invokevirtual 137	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   66: invokestatic 143	com/google/android/gms/internal/zzaf$zzj:zzd	([B)Lcom/google/android/gms/internal/zzaf$zzj;
    //   69: astore_3
    //   70: new 35	java/lang/StringBuilder
    //   73: dup
    //   74: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   77: ldc -111
    //   79: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   82: aload_3
    //   83: invokevirtual 148	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   86: invokevirtual 46	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   89: invokestatic 88	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   92: aload_3
    //   93: getfield 152	com/google/android/gms/internal/zzaf$zzj:zziR	Lcom/google/android/gms/internal/zzaf$zzf;
    //   96: ifnonnull +36 -> 132
    //   99: aload_3
    //   100: getfield 156	com/google/android/gms/internal/zzaf$zzj:zziQ	[Lcom/google/android/gms/internal/zzaf$zzi;
    //   103: arraylength
    //   104: ifne +28 -> 132
    //   107: new 35	java/lang/StringBuilder
    //   110: dup
    //   111: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   114: ldc -98
    //   116: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: aload_0
    //   120: getfield 31	com/google/android/gms/tagmanager/zzcl:zzaOS	Ljava/lang/String;
    //   123: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   126: invokevirtual 46	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   129: invokestatic 88	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   132: aload_0
    //   133: getfield 97	com/google/android/gms/tagmanager/zzcl:zzaRo	Lcom/google/android/gms/tagmanager/zzbf;
    //   136: aload_3
    //   137: invokeinterface 162 2 0
    //   142: aload_1
    //   143: invokeinterface 165 1 0
    //   148: ldc -89
    //   150: invokestatic 88	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   153: return
    //   154: astore_3
    //   155: new 35	java/lang/StringBuilder
    //   158: dup
    //   159: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   162: ldc -87
    //   164: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: aload_2
    //   168: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   171: ldc -85
    //   173: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   176: aload_0
    //   177: getfield 31	com/google/android/gms/tagmanager/zzcl:zzaOS	Ljava/lang/String;
    //   180: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: ldc -83
    //   185: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   188: invokevirtual 46	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   191: invokestatic 176	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   194: aload_0
    //   195: getfield 97	com/google/android/gms/tagmanager/zzcl:zzaRo	Lcom/google/android/gms/tagmanager/zzbf;
    //   198: getstatic 179	com/google/android/gms/tagmanager/zzbf$zza:zzaQE	Lcom/google/android/gms/tagmanager/zzbf$zza;
    //   201: invokeinterface 109 2 0
    //   206: aload_1
    //   207: invokeinterface 165 1 0
    //   212: return
    //   213: astore_3
    //   214: new 35	java/lang/StringBuilder
    //   217: dup
    //   218: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   221: ldc -75
    //   223: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: aload_2
    //   227: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   230: ldc -73
    //   232: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: aload_3
    //   236: invokevirtual 186	java/io/IOException:getMessage	()Ljava/lang/String;
    //   239: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: invokevirtual 46	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   245: aload_3
    //   246: invokestatic 189	com/google/android/gms/tagmanager/zzbg:zzd	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   249: aload_0
    //   250: getfield 97	com/google/android/gms/tagmanager/zzcl:zzaRo	Lcom/google/android/gms/tagmanager/zzbf;
    //   253: getstatic 192	com/google/android/gms/tagmanager/zzbf$zza:zzaQD	Lcom/google/android/gms/tagmanager/zzbf$zza;
    //   256: invokeinterface 109 2 0
    //   261: aload_1
    //   262: invokeinterface 165 1 0
    //   267: return
    //   268: astore_3
    //   269: new 35	java/lang/StringBuilder
    //   272: dup
    //   273: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   276: ldc -62
    //   278: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   281: aload_2
    //   282: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   285: ldc -73
    //   287: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   290: aload_3
    //   291: invokevirtual 186	java/io/IOException:getMessage	()Ljava/lang/String;
    //   294: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   297: invokevirtual 46	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   300: aload_3
    //   301: invokestatic 189	com/google/android/gms/tagmanager/zzbg:zzd	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   304: aload_0
    //   305: getfield 97	com/google/android/gms/tagmanager/zzcl:zzaRo	Lcom/google/android/gms/tagmanager/zzbf;
    //   308: getstatic 179	com/google/android/gms/tagmanager/zzbf$zza:zzaQE	Lcom/google/android/gms/tagmanager/zzbf$zza;
    //   311: invokeinterface 109 2 0
    //   316: aload_1
    //   317: invokeinterface 165 1 0
    //   322: return
    //   323: astore_2
    //   324: aload_1
    //   325: invokeinterface 165 1 0
    //   330: aload_2
    //   331: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	332	0	this	zzcl
    //   37	288	1	localZzqv	com.google.android.gms.internal.zzqv
    //   29	253	2	str	String
    //   323	8	2	localObject1	Object
    //   45	92	3	localObject2	Object
    //   154	1	3	localFileNotFoundException	java.io.FileNotFoundException
    //   213	33	3	localIOException1	java.io.IOException
    //   268	33	3	localIOException2	java.io.IOException
    //   53	9	4	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    // Exception table:
    //   from	to	target	type
    //   38	46	154	java/io/FileNotFoundException
    //   38	46	213	java/io/IOException
    //   46	132	268	java/io/IOException
    //   132	142	268	java/io/IOException
    //   38	46	323	finally
    //   46	132	323	finally
    //   132	142	323	finally
    //   155	206	323	finally
    //   214	261	323	finally
    //   269	316	323	finally
  }
  
  public void run()
  {
    if (zzaRo == null) {
      throw new IllegalStateException("callback must be set before execute");
    }
    zzaRo.zzzL();
    zzAz();
  }
  
  String zzAA()
  {
    Object localObject2 = zzaRp.zzzN() + zzaPp + "&v=a65833898";
    Object localObject1 = localObject2;
    if (zzaRq != null)
    {
      localObject1 = localObject2;
      if (!zzaRq.trim().equals("")) {
        localObject1 = (String)localObject2 + "&pv=" + zzaRq;
      }
    }
    localObject2 = localObject1;
    if (zzcb.zzAv().zzAw().equals(zzcb.zza.zzaRe)) {
      localObject2 = (String)localObject1 + "&gtm_debug=x";
    }
    return localObject2;
  }
  
  void zza(zzbf<zzaf.zzj> paramZzbf)
  {
    zzaRo = paramZzbf;
  }
  
  void zzeB(String paramString)
  {
    if (paramString == null)
    {
      zzaPp = zzaRn;
      return;
    }
    zzbg.zzaC("Setting CTFE URL path: " + paramString);
    zzaPp = paramString;
  }
  
  void zzeQ(String paramString)
  {
    zzbg.zzaC("Setting previous container version: " + paramString);
    zzaRq = paramString;
  }
}
