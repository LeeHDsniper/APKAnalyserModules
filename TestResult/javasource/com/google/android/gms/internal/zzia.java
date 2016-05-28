package com.google.android.gms.internal;

import android.content.Context;

@zzgk
public final class zzia
  extends zzhq
{
  private final Context mContext;
  private final String zzF;
  private String zzHj = null;
  private final String zzqK;
  
  public zzia(Context paramContext, String paramString1, String paramString2)
  {
    mContext = paramContext;
    zzqK = paramString1;
    zzF = paramString2;
  }
  
  public zzia(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    mContext = paramContext;
    zzqK = paramString1;
    zzF = paramString2;
    zzHj = paramString3;
  }
  
  public void onStop() {}
  
  /* Error */
  public void zzdG()
  {
    // Byte code:
    //   0: new 36	java/lang/StringBuilder
    //   3: dup
    //   4: invokespecial 37	java/lang/StringBuilder:<init>	()V
    //   7: ldc 39
    //   9: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12: aload_0
    //   13: getfield 24	com/google/android/gms/internal/zzia:zzF	Ljava/lang/String;
    //   16: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   19: invokevirtual 47	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   22: invokestatic 53	com/google/android/gms/ads/internal/util/client/zzb:v	(Ljava/lang/String;)V
    //   25: new 55	java/net/URL
    //   28: dup
    //   29: aload_0
    //   30: getfield 24	com/google/android/gms/internal/zzia:zzF	Ljava/lang/String;
    //   33: invokespecial 57	java/net/URL:<init>	(Ljava/lang/String;)V
    //   36: invokevirtual 61	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   39: checkcast 63	java/net/HttpURLConnection
    //   42: astore_2
    //   43: aload_0
    //   44: getfield 18	com/google/android/gms/internal/zzia:zzHj	Ljava/lang/String;
    //   47: invokestatic 69	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   50: ifeq +77 -> 127
    //   53: invokestatic 75	com/google/android/gms/ads/internal/zzp:zzbx	()Lcom/google/android/gms/internal/zzhu;
    //   56: aload_0
    //   57: getfield 20	com/google/android/gms/internal/zzia:mContext	Landroid/content/Context;
    //   60: aload_0
    //   61: getfield 22	com/google/android/gms/internal/zzia:zzqK	Ljava/lang/String;
    //   64: iconst_1
    //   65: aload_2
    //   66: invokevirtual 81	com/google/android/gms/internal/zzhu:zza	(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;)V
    //   69: aload_2
    //   70: invokevirtual 85	java/net/HttpURLConnection:getResponseCode	()I
    //   73: istore_1
    //   74: iload_1
    //   75: sipush 200
    //   78: if_icmplt +10 -> 88
    //   81: iload_1
    //   82: sipush 300
    //   85: if_icmplt +37 -> 122
    //   88: new 36	java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial 37	java/lang/StringBuilder:<init>	()V
    //   95: ldc 87
    //   97: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: iload_1
    //   101: invokevirtual 90	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   104: ldc 92
    //   106: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   109: aload_0
    //   110: getfield 24	com/google/android/gms/internal/zzia:zzF	Ljava/lang/String;
    //   113: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   116: invokevirtual 47	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   119: invokestatic 95	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   122: aload_2
    //   123: invokevirtual 98	java/net/HttpURLConnection:disconnect	()V
    //   126: return
    //   127: invokestatic 75	com/google/android/gms/ads/internal/zzp:zzbx	()Lcom/google/android/gms/internal/zzhu;
    //   130: aload_0
    //   131: getfield 20	com/google/android/gms/internal/zzia:mContext	Landroid/content/Context;
    //   134: aload_0
    //   135: getfield 22	com/google/android/gms/internal/zzia:zzqK	Ljava/lang/String;
    //   138: iconst_1
    //   139: aload_2
    //   140: aload_0
    //   141: getfield 18	com/google/android/gms/internal/zzia:zzHj	Ljava/lang/String;
    //   144: invokevirtual 101	com/google/android/gms/internal/zzhu:zza	(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;Ljava/lang/String;)V
    //   147: goto -78 -> 69
    //   150: astore_3
    //   151: aload_2
    //   152: invokevirtual 98	java/net/HttpURLConnection:disconnect	()V
    //   155: aload_3
    //   156: athrow
    //   157: astore_2
    //   158: new 36	java/lang/StringBuilder
    //   161: dup
    //   162: invokespecial 37	java/lang/StringBuilder:<init>	()V
    //   165: ldc 103
    //   167: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   170: aload_0
    //   171: getfield 24	com/google/android/gms/internal/zzia:zzF	Ljava/lang/String;
    //   174: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   177: ldc 105
    //   179: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   182: aload_2
    //   183: invokevirtual 108	java/lang/IndexOutOfBoundsException:getMessage	()Ljava/lang/String;
    //   186: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   189: invokevirtual 47	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   192: invokestatic 95	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   195: return
    //   196: astore_2
    //   197: new 36	java/lang/StringBuilder
    //   200: dup
    //   201: invokespecial 37	java/lang/StringBuilder:<init>	()V
    //   204: ldc 110
    //   206: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: aload_0
    //   210: getfield 24	com/google/android/gms/internal/zzia:zzF	Ljava/lang/String;
    //   213: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   216: ldc 105
    //   218: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   221: aload_2
    //   222: invokevirtual 111	java/io/IOException:getMessage	()Ljava/lang/String;
    //   225: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: invokevirtual 47	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   231: invokestatic 95	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   234: return
    //   235: astore_2
    //   236: new 36	java/lang/StringBuilder
    //   239: dup
    //   240: invokespecial 37	java/lang/StringBuilder:<init>	()V
    //   243: ldc 110
    //   245: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   248: aload_0
    //   249: getfield 24	com/google/android/gms/internal/zzia:zzF	Ljava/lang/String;
    //   252: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   255: ldc 105
    //   257: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   260: aload_2
    //   261: invokevirtual 112	java/lang/RuntimeException:getMessage	()Ljava/lang/String;
    //   264: invokevirtual 43	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   267: invokevirtual 47	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   270: invokestatic 95	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   273: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	274	0	this	zzia
    //   73	28	1	i	int
    //   42	110	2	localHttpURLConnection	java.net.HttpURLConnection
    //   157	26	2	localIndexOutOfBoundsException	IndexOutOfBoundsException
    //   196	26	2	localIOException	java.io.IOException
    //   235	26	2	localRuntimeException	RuntimeException
    //   150	6	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   43	69	150	finally
    //   69	74	150	finally
    //   88	122	150	finally
    //   127	147	150	finally
    //   0	43	157	java/lang/IndexOutOfBoundsException
    //   122	126	157	java/lang/IndexOutOfBoundsException
    //   151	157	157	java/lang/IndexOutOfBoundsException
    //   0	43	196	java/io/IOException
    //   122	126	196	java/io/IOException
    //   151	157	196	java/io/IOException
    //   0	43	235	java/lang/RuntimeException
    //   122	126	235	java/lang/RuntimeException
    //   151	157	235	java/lang/RuntimeException
  }
}
