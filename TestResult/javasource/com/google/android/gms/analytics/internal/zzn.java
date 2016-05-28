package com.google.android.gms.analytics.internal;

import android.content.Context;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzof;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;

public class zzn
  extends zzd
{
  private volatile String zzLd;
  private Future<String> zzMG;
  
  protected zzn(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  private boolean zzg(Context paramContext, String paramString)
  {
    boolean bool1 = false;
    zzx.zzcs(paramString);
    zzx.zzci("ClientId should be saved from worker thread");
    Object localObject5 = null;
    Object localObject6 = null;
    Object localObject4 = null;
    Object localObject2 = localObject4;
    Object localObject3 = localObject5;
    Object localObject1 = localObject6;
    for (;;)
    {
      try
      {
        zza("Storing clientId", paramString);
        localObject2 = localObject4;
        localObject3 = localObject5;
        localObject1 = localObject6;
        paramContext = paramContext.openFileOutput("gaClientId", 0);
        localObject2 = paramContext;
        localObject3 = paramContext;
        localObject1 = paramContext;
        paramContext.write(paramString.getBytes());
        bool2 = true;
        bool1 = bool2;
      }
      catch (FileNotFoundException paramContext)
      {
        boolean bool2;
        localObject1 = localObject2;
        zze("Error creating clientId file", paramContext);
        if (localObject2 == null) {
          continue;
        }
        try
        {
          ((FileOutputStream)localObject2).close();
          return false;
        }
        catch (IOException paramContext)
        {
          zze("Failed to close clientId writing stream", paramContext);
          return false;
        }
      }
      catch (IOException paramContext)
      {
        localObject1 = localObject3;
        zze("Error writing to clientId file", paramContext);
        if (localObject3 == null) {
          continue;
        }
        try
        {
          ((FileOutputStream)localObject3).close();
          return false;
        }
        catch (IOException paramContext)
        {
          zze("Failed to close clientId writing stream", paramContext);
          return false;
        }
      }
      finally
      {
        if (localObject1 == null) {
          break label185;
        }
      }
      try
      {
        paramContext.close();
        bool1 = bool2;
        return bool1;
      }
      catch (IOException paramContext)
      {
        zze("Failed to close clientId writing stream", paramContext);
        return true;
      }
    }
    try
    {
      ((FileOutputStream)localObject1).close();
      label185:
      throw paramContext;
    }
    catch (IOException paramString)
    {
      for (;;)
      {
        zze("Failed to close clientId writing stream", paramString);
      }
    }
  }
  
  private String zzjg()
  {
    String str2 = zzjh();
    String str1 = str2;
    try
    {
      if (!zzg(zzig().getContext(), str2)) {
        str1 = "0";
      }
      return str1;
    }
    catch (Exception localException)
    {
      zze("Error saving clientId file", localException);
    }
    return "0";
  }
  
  /* Error */
  protected String zzZ(Context paramContext)
  {
    // Byte code:
    //   0: ldc 105
    //   2: invokestatic 42	com/google/android/gms/common/internal/zzx:zzci	(Ljava/lang/String;)V
    //   5: aload_1
    //   6: ldc 49
    //   8: invokevirtual 109	android/content/Context:openFileInput	(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   11: astore_3
    //   12: aload_3
    //   13: astore 4
    //   15: bipush 36
    //   17: newarray byte
    //   19: astore 5
    //   21: aload_3
    //   22: astore 4
    //   24: aload_3
    //   25: aload 5
    //   27: iconst_0
    //   28: aload 5
    //   30: arraylength
    //   31: invokevirtual 115	java/io/FileInputStream:read	([BII)I
    //   34: istore_2
    //   35: aload_3
    //   36: astore 4
    //   38: aload_3
    //   39: invokevirtual 119	java/io/FileInputStream:available	()I
    //   42: ifle +49 -> 91
    //   45: aload_3
    //   46: astore 4
    //   48: aload_0
    //   49: ldc 121
    //   51: invokevirtual 124	com/google/android/gms/analytics/internal/zzn:zzbb	(Ljava/lang/String;)V
    //   54: aload_3
    //   55: astore 4
    //   57: aload_3
    //   58: invokevirtual 125	java/io/FileInputStream:close	()V
    //   61: aload_3
    //   62: astore 4
    //   64: aload_1
    //   65: ldc 49
    //   67: invokevirtual 129	android/content/Context:deleteFile	(Ljava/lang/String;)Z
    //   70: pop
    //   71: aload_3
    //   72: ifnull +7 -> 79
    //   75: aload_3
    //   76: invokevirtual 125	java/io/FileInputStream:close	()V
    //   79: aconst_null
    //   80: areturn
    //   81: astore_1
    //   82: aload_0
    //   83: ldc -125
    //   85: aload_1
    //   86: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   89: aconst_null
    //   90: areturn
    //   91: iload_2
    //   92: bipush 14
    //   94: if_icmpge +49 -> 143
    //   97: aload_3
    //   98: astore 4
    //   100: aload_0
    //   101: ldc -123
    //   103: invokevirtual 124	com/google/android/gms/analytics/internal/zzn:zzbb	(Ljava/lang/String;)V
    //   106: aload_3
    //   107: astore 4
    //   109: aload_3
    //   110: invokevirtual 125	java/io/FileInputStream:close	()V
    //   113: aload_3
    //   114: astore 4
    //   116: aload_1
    //   117: ldc 49
    //   119: invokevirtual 129	android/content/Context:deleteFile	(Ljava/lang/String;)Z
    //   122: pop
    //   123: aload_3
    //   124: ifnull -45 -> 79
    //   127: aload_3
    //   128: invokevirtual 125	java/io/FileInputStream:close	()V
    //   131: aconst_null
    //   132: areturn
    //   133: astore_1
    //   134: aload_0
    //   135: ldc -125
    //   137: aload_1
    //   138: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   141: aconst_null
    //   142: areturn
    //   143: aload_3
    //   144: astore 4
    //   146: aload_3
    //   147: invokevirtual 125	java/io/FileInputStream:close	()V
    //   150: aload_3
    //   151: astore 4
    //   153: new 57	java/lang/String
    //   156: dup
    //   157: aload 5
    //   159: iconst_0
    //   160: iload_2
    //   161: invokespecial 136	java/lang/String:<init>	([BII)V
    //   164: astore 5
    //   166: aload_3
    //   167: astore 4
    //   169: aload_0
    //   170: ldc -118
    //   172: aload 5
    //   174: invokevirtual 47	com/google/android/gms/analytics/internal/zzn:zza	(Ljava/lang/String;Ljava/lang/Object;)V
    //   177: aload_3
    //   178: ifnull +7 -> 185
    //   181: aload_3
    //   182: invokevirtual 125	java/io/FileInputStream:close	()V
    //   185: aload 5
    //   187: areturn
    //   188: astore_1
    //   189: aload_0
    //   190: ldc -125
    //   192: aload_1
    //   193: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   196: goto -11 -> 185
    //   199: astore_1
    //   200: aconst_null
    //   201: astore_1
    //   202: aload_1
    //   203: ifnull -124 -> 79
    //   206: aload_1
    //   207: invokevirtual 125	java/io/FileInputStream:close	()V
    //   210: aconst_null
    //   211: areturn
    //   212: astore_1
    //   213: aload_0
    //   214: ldc -125
    //   216: aload_1
    //   217: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   220: aconst_null
    //   221: areturn
    //   222: astore 5
    //   224: aconst_null
    //   225: astore_3
    //   226: aload_3
    //   227: astore 4
    //   229: aload_0
    //   230: ldc -116
    //   232: aload 5
    //   234: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   237: aload_3
    //   238: astore 4
    //   240: aload_1
    //   241: ldc 49
    //   243: invokevirtual 129	android/content/Context:deleteFile	(Ljava/lang/String;)Z
    //   246: pop
    //   247: aload_3
    //   248: ifnull -169 -> 79
    //   251: aload_3
    //   252: invokevirtual 125	java/io/FileInputStream:close	()V
    //   255: aconst_null
    //   256: areturn
    //   257: astore_1
    //   258: aload_0
    //   259: ldc -125
    //   261: aload_1
    //   262: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   265: aconst_null
    //   266: areturn
    //   267: astore_1
    //   268: aconst_null
    //   269: astore 4
    //   271: aload 4
    //   273: ifnull +8 -> 281
    //   276: aload 4
    //   278: invokevirtual 125	java/io/FileInputStream:close	()V
    //   281: aload_1
    //   282: athrow
    //   283: astore_3
    //   284: aload_0
    //   285: ldc -125
    //   287: aload_3
    //   288: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   291: goto -10 -> 281
    //   294: astore_1
    //   295: goto -24 -> 271
    //   298: astore 5
    //   300: goto -74 -> 226
    //   303: astore_1
    //   304: aload_3
    //   305: astore_1
    //   306: goto -104 -> 202
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	309	0	this	zzn
    //   0	309	1	paramContext	Context
    //   34	127	2	i	int
    //   11	241	3	localFileInputStream1	java.io.FileInputStream
    //   283	22	3	localIOException1	IOException
    //   13	264	4	localFileInputStream2	java.io.FileInputStream
    //   19	167	5	localObject	Object
    //   222	11	5	localIOException2	IOException
    //   298	1	5	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   75	79	81	java/io/IOException
    //   127	131	133	java/io/IOException
    //   181	185	188	java/io/IOException
    //   5	12	199	java/io/FileNotFoundException
    //   206	210	212	java/io/IOException
    //   5	12	222	java/io/IOException
    //   251	255	257	java/io/IOException
    //   5	12	267	finally
    //   276	281	283	java/io/IOException
    //   15	21	294	finally
    //   24	35	294	finally
    //   38	45	294	finally
    //   48	54	294	finally
    //   57	61	294	finally
    //   64	71	294	finally
    //   100	106	294	finally
    //   109	113	294	finally
    //   116	123	294	finally
    //   146	150	294	finally
    //   153	166	294	finally
    //   169	177	294	finally
    //   229	237	294	finally
    //   240	247	294	finally
    //   15	21	298	java/io/IOException
    //   24	35	298	java/io/IOException
    //   38	45	298	java/io/IOException
    //   48	54	298	java/io/IOException
    //   57	61	298	java/io/IOException
    //   64	71	298	java/io/IOException
    //   100	106	298	java/io/IOException
    //   109	113	298	java/io/IOException
    //   116	123	298	java/io/IOException
    //   146	150	298	java/io/IOException
    //   153	166	298	java/io/IOException
    //   169	177	298	java/io/IOException
    //   15	21	303	java/io/FileNotFoundException
    //   24	35	303	java/io/FileNotFoundException
    //   38	45	303	java/io/FileNotFoundException
    //   48	54	303	java/io/FileNotFoundException
    //   57	61	303	java/io/FileNotFoundException
    //   64	71	303	java/io/FileNotFoundException
    //   100	106	303	java/io/FileNotFoundException
    //   109	113	303	java/io/FileNotFoundException
    //   116	123	303	java/io/FileNotFoundException
    //   146	150	303	java/io/FileNotFoundException
    //   153	166	303	java/io/FileNotFoundException
    //   169	177	303	java/io/FileNotFoundException
  }
  
  protected void zzhB() {}
  
  /* Error */
  public String zzjd()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 149	com/google/android/gms/analytics/internal/zzn:zzio	()V
    //   4: aload_0
    //   5: monitorenter
    //   6: aload_0
    //   7: getfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   10: ifnonnull +22 -> 32
    //   13: aload_0
    //   14: aload_0
    //   15: invokevirtual 89	com/google/android/gms/analytics/internal/zzn:zzig	()Lcom/google/android/gms/internal/zzof;
    //   18: new 6	com/google/android/gms/analytics/internal/zzn$1
    //   21: dup
    //   22: aload_0
    //   23: invokespecial 154	com/google/android/gms/analytics/internal/zzn$1:<init>	(Lcom/google/android/gms/analytics/internal/zzn;)V
    //   26: invokevirtual 158	com/google/android/gms/internal/zzof:zzb	(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    //   29: putfield 160	com/google/android/gms/analytics/internal/zzn:zzMG	Ljava/util/concurrent/Future;
    //   32: aload_0
    //   33: getfield 160	com/google/android/gms/analytics/internal/zzn:zzMG	Ljava/util/concurrent/Future;
    //   36: astore_1
    //   37: aload_1
    //   38: ifnull +47 -> 85
    //   41: aload_0
    //   42: aload_0
    //   43: getfield 160	com/google/android/gms/analytics/internal/zzn:zzMG	Ljava/util/concurrent/Future;
    //   46: invokeinterface 166 1 0
    //   51: checkcast 57	java/lang/String
    //   54: putfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   57: aload_0
    //   58: getfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   61: ifnonnull +9 -> 70
    //   64: aload_0
    //   65: ldc 99
    //   67: putfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   70: aload_0
    //   71: ldc -88
    //   73: aload_0
    //   74: getfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   77: invokevirtual 47	com/google/android/gms/analytics/internal/zzn:zza	(Ljava/lang/String;Ljava/lang/Object;)V
    //   80: aload_0
    //   81: aconst_null
    //   82: putfield 160	com/google/android/gms/analytics/internal/zzn:zzMG	Ljava/util/concurrent/Future;
    //   85: aload_0
    //   86: getfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   89: astore_1
    //   90: aload_0
    //   91: monitorexit
    //   92: aload_1
    //   93: areturn
    //   94: astore_1
    //   95: aload_0
    //   96: ldc -86
    //   98: aload_1
    //   99: invokevirtual 173	com/google/android/gms/analytics/internal/zzn:zzd	(Ljava/lang/String;Ljava/lang/Object;)V
    //   102: aload_0
    //   103: ldc 99
    //   105: putfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   108: goto -51 -> 57
    //   111: astore_1
    //   112: aload_0
    //   113: monitorexit
    //   114: aload_1
    //   115: athrow
    //   116: astore_1
    //   117: aload_0
    //   118: ldc -81
    //   120: aload_1
    //   121: invokevirtual 76	com/google/android/gms/analytics/internal/zzn:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   124: aload_0
    //   125: ldc 99
    //   127: putfield 151	com/google/android/gms/analytics/internal/zzn:zzLd	Ljava/lang/String;
    //   130: goto -73 -> 57
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	133	0	this	zzn
    //   36	57	1	localObject1	Object
    //   94	5	1	localInterruptedException	InterruptedException
    //   111	4	1	localObject2	Object
    //   116	5	1	localExecutionException	java.util.concurrent.ExecutionException
    // Exception table:
    //   from	to	target	type
    //   41	57	94	java/lang/InterruptedException
    //   6	32	111	finally
    //   32	37	111	finally
    //   41	57	111	finally
    //   57	70	111	finally
    //   70	85	111	finally
    //   85	92	111	finally
    //   95	108	111	finally
    //   112	114	111	finally
    //   117	130	111	finally
    //   41	57	116	java/util/concurrent/ExecutionException
  }
  
  String zzje()
  {
    try
    {
      zzLd = null;
      zzMG = zzig().zzb(new Callable()
      {
        public String zzji()
          throws Exception
        {
          return zzn.zza(zzn.this);
        }
      });
      return zzjd();
    }
    finally {}
  }
  
  String zzjf()
  {
    String str2 = zzZ(zzig().getContext());
    String str1 = str2;
    if (str2 == null) {
      str1 = zzjg();
    }
    return str1;
  }
  
  protected String zzjh()
  {
    return UUID.randomUUID().toString().toLowerCase();
  }
}
