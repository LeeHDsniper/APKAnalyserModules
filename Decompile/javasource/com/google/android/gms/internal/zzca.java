package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Environment;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.io.File;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public class zzca
{
  final Context mContext;
  final String zzqK;
  String zzvg;
  BlockingQueue<zzcd> zzvi;
  ExecutorService zzvj;
  LinkedHashMap<String, String> zzvk = new LinkedHashMap();
  private AtomicBoolean zzvl;
  private File zzvm;
  
  public zzca(Context paramContext, String paramString1, String paramString2, Map<String, String> paramMap)
  {
    mContext = paramContext;
    zzqK = paramString1;
    zzvg = paramString2;
    zzvl = new AtomicBoolean(false);
    zzvl.set(((Boolean)zzby.zzuD.get()).booleanValue());
    if (zzvl.get())
    {
      paramContext = Environment.getExternalStorageDirectory();
      if (paramContext != null) {
        zzvm = new File(paramContext, "sdk_csi_data.txt");
      }
    }
    paramContext = paramMap.entrySet().iterator();
    while (paramContext.hasNext())
    {
      paramString1 = (Map.Entry)paramContext.next();
      zzvk.put(paramString1.getKey(), paramString1.getValue());
    }
    zzvi = new ArrayBlockingQueue(30);
    zzvj = Executors.newSingleThreadExecutor();
    zzvj.execute(new Runnable()
    {
      public void run()
      {
        zzca.zza(zzca.this);
      }
    });
  }
  
  /* Error */
  private void zza(File paramFile, String paramString)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +101 -> 102
    //   4: new 151	java/io/FileOutputStream
    //   7: dup
    //   8: aload_1
    //   9: iconst_1
    //   10: invokespecial 154	java/io/FileOutputStream:<init>	(Ljava/io/File;Z)V
    //   13: astore_3
    //   14: aload_3
    //   15: astore_1
    //   16: aload_3
    //   17: aload_2
    //   18: invokevirtual 160	java/lang/String:getBytes	()[B
    //   21: invokevirtual 164	java/io/FileOutputStream:write	([B)V
    //   24: aload_3
    //   25: astore_1
    //   26: aload_3
    //   27: bipush 10
    //   29: invokevirtual 166	java/io/FileOutputStream:write	(I)V
    //   32: aload_3
    //   33: ifnull +7 -> 40
    //   36: aload_3
    //   37: invokevirtual 169	java/io/FileOutputStream:close	()V
    //   40: return
    //   41: astore_1
    //   42: ldc -85
    //   44: aload_1
    //   45: invokestatic 177	com/google/android/gms/ads/internal/util/client/zzb:zzd	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   48: return
    //   49: astore 4
    //   51: aconst_null
    //   52: astore_2
    //   53: aload_2
    //   54: astore_1
    //   55: ldc -77
    //   57: aload 4
    //   59: invokestatic 177	com/google/android/gms/ads/internal/util/client/zzb:zzd	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   62: aload_2
    //   63: ifnull -23 -> 40
    //   66: aload_2
    //   67: invokevirtual 169	java/io/FileOutputStream:close	()V
    //   70: return
    //   71: astore_1
    //   72: ldc -85
    //   74: aload_1
    //   75: invokestatic 177	com/google/android/gms/ads/internal/util/client/zzb:zzd	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   78: return
    //   79: astore_2
    //   80: aconst_null
    //   81: astore_1
    //   82: aload_1
    //   83: ifnull +7 -> 90
    //   86: aload_1
    //   87: invokevirtual 169	java/io/FileOutputStream:close	()V
    //   90: aload_2
    //   91: athrow
    //   92: astore_1
    //   93: ldc -85
    //   95: aload_1
    //   96: invokestatic 177	com/google/android/gms/ads/internal/util/client/zzb:zzd	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   99: goto -9 -> 90
    //   102: ldc -75
    //   104: invokestatic 185	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   107: return
    //   108: astore_2
    //   109: goto -27 -> 82
    //   112: astore 4
    //   114: aload_3
    //   115: astore_2
    //   116: goto -63 -> 53
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	119	0	this	zzca
    //   0	119	1	paramFile	File
    //   0	119	2	paramString	String
    //   13	102	3	localFileOutputStream	java.io.FileOutputStream
    //   49	9	4	localIOException1	java.io.IOException
    //   112	1	4	localIOException2	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   36	40	41	java/io/IOException
    //   4	14	49	java/io/IOException
    //   66	70	71	java/io/IOException
    //   4	14	79	finally
    //   86	90	92	java/io/IOException
    //   16	24	108	finally
    //   26	32	108	finally
    //   55	62	108	finally
    //   16	24	112	java/io/IOException
    //   26	32	112	java/io/IOException
  }
  
  private void zzc(Map<String, String> paramMap, String paramString)
  {
    paramMap = zza(zzvg, paramMap, paramString);
    if (zzvl.get())
    {
      zza(zzvm, paramMap);
      return;
    }
    zzp.zzbx().zzc(mContext, zzqK, paramMap);
  }
  
  private void zzdi()
  {
    try
    {
      for (;;)
      {
        zzcd localZzcd = (zzcd)zzvi.take();
        String str = localZzcd.zzdn();
        if (!TextUtils.isEmpty(str))
        {
          zzvk.putAll(localZzcd.zzn());
          zzc(zzvk, str);
        }
      }
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      zzb.zzd("CsiReporter:reporter interrupted", localInterruptedException);
    }
  }
  
  String zza(String paramString1, Map<String, String> paramMap, String paramString2)
  {
    paramString1 = Uri.parse(paramString1).buildUpon();
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      paramString1.appendQueryParameter((String)localEntry.getKey(), (String)localEntry.getValue());
    }
    paramString1 = new StringBuilder(paramString1.build().toString());
    paramString1.append("&").append("it").append("=").append(paramString2);
    return paramString1.toString();
  }
  
  public boolean zza(zzcd paramZzcd)
  {
    return zzvi.offer(paramZzcd);
  }
  
  public void zzb(List<String> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty())) {
      zzvk.put("e", TextUtils.join(",", paramList));
    }
  }
}
