package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbg;

public class zzqy
  implements Runnable
{
  private final Context mContext;
  private final zzqw zzaRm;
  private final zzqn zzaUo;
  private final zzqx zzaUv;
  private final zzqs zzaUw;
  
  public zzqy(Context paramContext, zzqn paramZzqn, zzqx paramZzqx)
  {
    this(paramContext, paramZzqn, paramZzqx, new zzqw(), new zzqs());
  }
  
  zzqy(Context paramContext, zzqn paramZzqn, zzqx paramZzqx, zzqw paramZzqw, zzqs paramZzqs)
  {
    zzx.zzv(paramContext);
    zzx.zzv(paramZzqx);
    mContext = paramContext;
    zzaUo = paramZzqn;
    zzaUv = paramZzqx;
    zzaRm = paramZzqw;
    zzaUw = paramZzqs;
  }
  
  public zzqy(Context paramContext, zzqn paramZzqn, zzqx paramZzqx, String paramString)
  {
    this(paramContext, paramZzqn, paramZzqx, new zzqw(), new zzqs());
    zzaUw.zzfj(paramString);
  }
  
  public void run()
  {
    zzeP();
  }
  
  boolean zzBY()
  {
    if (!zzbf("android.permission.INTERNET"))
    {
      zzbg.e("Missing android.permission.INTERNET. Please add the following declaration to your AndroidManifest.xml: <uses-permission android:name=\"android.permission.INTERNET\" />");
      return false;
    }
    if (!zzbf("android.permission.ACCESS_NETWORK_STATE"))
    {
      zzbg.e("Missing android.permission.ACCESS_NETWORK_STATE. Please add the following declaration to your AndroidManifest.xml: <uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\" />");
      return false;
    }
    NetworkInfo localNetworkInfo = ((ConnectivityManager)mContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected()))
    {
      zzbg.zzaE("NetworkLoader: No network connectivity - Offline");
      return false;
    }
    return true;
  }
  
  boolean zzbf(String paramString)
  {
    return mContext.getPackageManager().checkPermission(paramString, mContext.getPackageName()) == 0;
  }
  
  /* Error */
  void zzeP()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 119	com/google/android/gms/internal/zzqy:zzBY	()Z
    //   4: ifne +14 -> 18
    //   7: aload_0
    //   8: getfield 43	com/google/android/gms/internal/zzqy:zzaUv	Lcom/google/android/gms/internal/zzqx;
    //   11: getstatic 125	com/google/android/gms/internal/zzqx$zza:zzaUq	Lcom/google/android/gms/internal/zzqx$zza;
    //   14: invokevirtual 131	com/google/android/gms/internal/zzqx:zza	(Lcom/google/android/gms/internal/zzqx$zza;)V
    //   17: return
    //   18: ldc -123
    //   20: invokestatic 136	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   23: aload_0
    //   24: getfield 45	com/google/android/gms/internal/zzqy:zzaRm	Lcom/google/android/gms/internal/zzqw;
    //   27: invokevirtual 140	com/google/android/gms/internal/zzqw:zzBW	()Lcom/google/android/gms/internal/zzqv;
    //   30: astore_1
    //   31: aload_0
    //   32: getfield 47	com/google/android/gms/internal/zzqy:zzaUw	Lcom/google/android/gms/internal/zzqs;
    //   35: aload_0
    //   36: getfield 41	com/google/android/gms/internal/zzqy:zzaUo	Lcom/google/android/gms/internal/zzqn;
    //   39: invokevirtual 146	com/google/android/gms/internal/zzqn:zzBv	()Ljava/util/List;
    //   42: invokevirtual 150	com/google/android/gms/internal/zzqs:zzt	(Ljava/util/List;)Ljava/lang/String;
    //   45: astore_2
    //   46: aload_1
    //   47: aload_2
    //   48: invokeinterface 156 2 0
    //   53: astore_3
    //   54: new 158	java/io/ByteArrayOutputStream
    //   57: dup
    //   58: invokespecial 159	java/io/ByteArrayOutputStream:<init>	()V
    //   61: astore 4
    //   63: aload_3
    //   64: aload 4
    //   66: invokestatic 164	com/google/android/gms/internal/zzlr:zza	(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    //   69: pop2
    //   70: aload_0
    //   71: getfield 43	com/google/android/gms/internal/zzqy:zzaUv	Lcom/google/android/gms/internal/zzqx;
    //   74: aload 4
    //   76: invokevirtual 168	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   79: invokevirtual 172	com/google/android/gms/internal/zzqx:zzu	([B)V
    //   82: aload_1
    //   83: invokeinterface 175 1 0
    //   88: ldc -79
    //   90: invokestatic 136	com/google/android/gms/tagmanager/zzbg:v	(Ljava/lang/String;)V
    //   93: return
    //   94: astore_3
    //   95: new 179	java/lang/StringBuilder
    //   98: dup
    //   99: invokespecial 180	java/lang/StringBuilder:<init>	()V
    //   102: ldc -74
    //   104: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: aload_2
    //   108: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   111: invokevirtual 189	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   114: invokestatic 71	com/google/android/gms/tagmanager/zzbg:e	(Ljava/lang/String;)V
    //   117: aload_0
    //   118: getfield 43	com/google/android/gms/internal/zzqy:zzaUv	Lcom/google/android/gms/internal/zzqx;
    //   121: getstatic 192	com/google/android/gms/internal/zzqx$zza:zzaUs	Lcom/google/android/gms/internal/zzqx$zza;
    //   124: invokevirtual 131	com/google/android/gms/internal/zzqx:zza	(Lcom/google/android/gms/internal/zzqx$zza;)V
    //   127: aload_1
    //   128: invokeinterface 175 1 0
    //   133: return
    //   134: astore_3
    //   135: new 179	java/lang/StringBuilder
    //   138: dup
    //   139: invokespecial 180	java/lang/StringBuilder:<init>	()V
    //   142: ldc -62
    //   144: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: aload_2
    //   148: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   151: ldc -60
    //   153: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: aload_3
    //   157: invokevirtual 199	java/io/IOException:getMessage	()Ljava/lang/String;
    //   160: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   163: invokevirtual 189	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   166: aload_3
    //   167: invokestatic 203	com/google/android/gms/tagmanager/zzbg:zzb	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   170: aload_0
    //   171: getfield 43	com/google/android/gms/internal/zzqy:zzaUv	Lcom/google/android/gms/internal/zzqx;
    //   174: getstatic 206	com/google/android/gms/internal/zzqx$zza:zzaUr	Lcom/google/android/gms/internal/zzqx$zza;
    //   177: invokevirtual 131	com/google/android/gms/internal/zzqx:zza	(Lcom/google/android/gms/internal/zzqx$zza;)V
    //   180: aload_1
    //   181: invokeinterface 175 1 0
    //   186: return
    //   187: astore_3
    //   188: new 179	java/lang/StringBuilder
    //   191: dup
    //   192: invokespecial 180	java/lang/StringBuilder:<init>	()V
    //   195: ldc -48
    //   197: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   200: aload_2
    //   201: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   204: ldc -60
    //   206: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: aload_3
    //   210: invokevirtual 199	java/io/IOException:getMessage	()Ljava/lang/String;
    //   213: invokevirtual 186	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   216: invokevirtual 189	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   219: aload_3
    //   220: invokestatic 203	com/google/android/gms/tagmanager/zzbg:zzb	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   223: aload_0
    //   224: getfield 43	com/google/android/gms/internal/zzqy:zzaUv	Lcom/google/android/gms/internal/zzqx;
    //   227: getstatic 192	com/google/android/gms/internal/zzqx$zza:zzaUs	Lcom/google/android/gms/internal/zzqx$zza;
    //   230: invokevirtual 131	com/google/android/gms/internal/zzqx:zza	(Lcom/google/android/gms/internal/zzqx$zza;)V
    //   233: aload_1
    //   234: invokeinterface 175 1 0
    //   239: return
    //   240: astore_2
    //   241: aload_1
    //   242: invokeinterface 175 1 0
    //   247: aload_2
    //   248: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	249	0	this	zzqy
    //   30	212	1	localZzqv	zzqv
    //   45	156	2	str	String
    //   240	8	2	localObject	Object
    //   53	11	3	localInputStream	java.io.InputStream
    //   94	1	3	localFileNotFoundException	java.io.FileNotFoundException
    //   134	33	3	localIOException1	java.io.IOException
    //   187	33	3	localIOException2	java.io.IOException
    //   61	14	4	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    // Exception table:
    //   from	to	target	type
    //   46	54	94	java/io/FileNotFoundException
    //   46	54	134	java/io/IOException
    //   54	82	187	java/io/IOException
    //   31	46	240	finally
    //   46	54	240	finally
    //   54	82	240	finally
    //   95	127	240	finally
    //   135	180	240	finally
    //   188	233	240	finally
  }
}
