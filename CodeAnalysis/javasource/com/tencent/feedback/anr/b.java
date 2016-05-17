package com.tencent.feedback.anr;

import android.app.ActivityManager;
import android.app.ActivityManager.ProcessErrorStateInfo;
import android.content.Context;
import com.tencent.feedback.eup.CrashStrategyBean;
import com.tencent.feedback.eup.jni.d;
import com.tencent.feedback.proguard.t;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public final class b
{
  private static b d = null;
  private AtomicInteger a = new AtomicInteger(0);
  private long b = -1L;
  private Context c;
  private Object e = new Object();
  
  private b(Context paramContext)
  {
    c = paramContext;
    long l = com.tencent.feedback.proguard.a.c();
    t.a(paramContext).a(new d(paramContext, paramContext.getFilesDir().getAbsolutePath() + "/eup", l - 604800L, 10, "tomb_", ".txt"));
  }
  
  private ActivityManager.ProcessErrorStateInfo a(Context paramContext, long paramLong)
  {
    int i;
    if (10000L < 0L)
    {
      paramLong = 0L;
      com.tencent.feedback.common.e.b("to find!", new Object[0]);
      paramContext = (ActivityManager)paramContext.getSystemService("activity");
      paramLong /= 500L;
      i = 0;
    }
    for (;;)
    {
      com.tencent.feedback.common.e.b("waiting!", new Object[0]);
      ??? = paramContext.getProcessesInErrorState();
      if (??? != null)
      {
        ??? = ((List)???).iterator();
        for (;;)
        {
          if (((Iterator)???).hasNext())
          {
            ActivityManager.ProcessErrorStateInfo localProcessErrorStateInfo = (ActivityManager.ProcessErrorStateInfo)((Iterator)???).next();
            if (condition == 2)
            {
              com.tencent.feedback.common.e.b("found!", new Object[0]);
              return localProcessErrorStateInfo;
              paramLong = 10000L;
              break;
            }
          }
        }
      }
      synchronized (e)
      {
        try
        {
          com.tencent.feedback.common.e.a("use wait", new Object[0]);
          e.wait(500L);
          if (i >= paramLong)
          {
            com.tencent.feedback.common.e.b("end!", new Object[0]);
            return null;
          }
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;)
          {
            localInterruptedException.printStackTrace();
          }
        }
      }
      i += 1;
    }
  }
  
  public static b a(Context paramContext)
  {
    try
    {
      if (d == null) {
        d = new b(paramContext);
      }
      paramContext = d;
      return paramContext;
    }
    finally {}
  }
  
  private static boolean a(Context paramContext, a paramA, com.tencent.feedback.common.c paramC, CrashStrategyBean paramCrashStrategyBean)
  {
    if ((paramContext == null) || (paramA == null) || (paramC == null) || (paramCrashStrategyBean == null))
    {
      com.tencent.feedback.common.e.d("args error %s %s %s %s ", new Object[] { paramContext, paramA, paramC, paramCrashStrategyBean });
      return true;
    }
    if ((b == null) || (b.get("main") == null))
    {
      com.tencent.feedback.common.e.d("error can't get stacks of anr %s ,drop this anr error", new Object[] { b });
      return false;
    }
    for (;;)
    {
      try
      {
        String str2 = (String)b.get("main");
        int i = str2.indexOf("\n");
        if (i > 0)
        {
          str1 = str2.substring(0, i);
          paramC = com.tencent.feedback.eup.b.a(paramContext, paramC.g(), paramC.h(), paramC.j(), paramC.x(), a, "main", str1, "ANR_RQD_EXCEPTION", f, str2, c, e, null);
          paramC.C().putAll(b);
          paramC.a((byte)3);
          paramC.h(d);
          boolean bool = com.tencent.feedback.eup.c.a(paramContext).a(paramC, paramCrashStrategyBean);
          com.tencent.feedback.common.e.b("sha1:%s %d", new Object[] { paramC.o(), Integer.valueOf(paramC.m()) });
          com.tencent.feedback.common.e.b("handle anr %b", new Object[] { Boolean.valueOf(bool) });
          return bool;
        }
      }
      catch (Throwable paramContext)
      {
        if (!com.tencent.feedback.common.e.a(paramContext)) {
          paramContext.printStackTrace();
        }
        com.tencent.feedback.common.e.d("recordANR error %s", new Object[] { paramContext.getClass().getName() + ":" + paramContext.getMessage() });
        return false;
      }
      String str1 = "unknown";
    }
  }
  
  /* Error */
  private static boolean a(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: aload_2
    //   1: aload_0
    //   2: iconst_1
    //   3: invokestatic 300	com/tencent/feedback/anr/a:a	(Ljava/lang/String;Ljava/lang/String;Z)Lcom/tencent/feedback/anr/f;
    //   6: astore_3
    //   7: aload_3
    //   8: ifnull +22 -> 30
    //   11: aload_3
    //   12: getfield 304	com/tencent/feedback/anr/f:d	Ljava/util/Map;
    //   15: ifnull +15 -> 30
    //   18: aload_3
    //   19: getfield 304	com/tencent/feedback/anr/f:d	Ljava/util/Map;
    //   22: invokeinterface 307 1 0
    //   27: ifgt +20 -> 47
    //   30: ldc_w 309
    //   33: iconst_1
    //   34: anewarray 4	java/lang/Object
    //   37: dup
    //   38: iconst_0
    //   39: aload_2
    //   40: aastore
    //   41: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   44: pop
    //   45: iconst_0
    //   46: ireturn
    //   47: new 61	java/io/File
    //   50: dup
    //   51: aload_1
    //   52: invokespecial 311	java/io/File:<init>	(Ljava/lang/String;)V
    //   55: astore_2
    //   56: aload_2
    //   57: invokevirtual 314	java/io/File:exists	()Z
    //   60: ifne +26 -> 86
    //   63: aload_2
    //   64: invokevirtual 317	java/io/File:getParentFile	()Ljava/io/File;
    //   67: invokevirtual 314	java/io/File:exists	()Z
    //   70: ifne +11 -> 81
    //   73: aload_2
    //   74: invokevirtual 317	java/io/File:getParentFile	()Ljava/io/File;
    //   77: invokevirtual 320	java/io/File:mkdirs	()Z
    //   80: pop
    //   81: aload_2
    //   82: invokevirtual 323	java/io/File:createNewFile	()Z
    //   85: pop
    //   86: aload_2
    //   87: invokevirtual 314	java/io/File:exists	()Z
    //   90: ifeq +10 -> 100
    //   93: aload_2
    //   94: invokevirtual 326	java/io/File:canWrite	()Z
    //   97: ifne +85 -> 182
    //   100: ldc_w 328
    //   103: iconst_1
    //   104: anewarray 4	java/lang/Object
    //   107: dup
    //   108: iconst_0
    //   109: aload_1
    //   110: aastore
    //   111: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   114: pop
    //   115: iconst_0
    //   116: ireturn
    //   117: astore_0
    //   118: aload_0
    //   119: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   122: ifne +7 -> 129
    //   125: aload_0
    //   126: invokevirtual 329	java/lang/Exception:printStackTrace	()V
    //   129: ldc_w 331
    //   132: iconst_2
    //   133: anewarray 4	java/lang/Object
    //   136: dup
    //   137: iconst_0
    //   138: new 52	java/lang/StringBuilder
    //   141: dup
    //   142: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   145: aload_0
    //   146: invokevirtual 280	java/lang/Object:getClass	()Ljava/lang/Class;
    //   149: invokevirtual 285	java/lang/Class:getName	()Ljava/lang/String;
    //   152: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   155: ldc_w 287
    //   158: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   161: aload_0
    //   162: invokevirtual 332	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   165: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   171: aastore
    //   172: dup
    //   173: iconst_1
    //   174: aload_1
    //   175: aastore
    //   176: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   179: pop
    //   180: iconst_0
    //   181: ireturn
    //   182: aconst_null
    //   183: astore_0
    //   184: new 334	java/io/BufferedWriter
    //   187: dup
    //   188: new 336	java/io/FileWriter
    //   191: dup
    //   192: aload_2
    //   193: iconst_0
    //   194: invokespecial 339	java/io/FileWriter:<init>	(Ljava/io/File;Z)V
    //   197: invokespecial 342	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
    //   200: astore_1
    //   201: aload_3
    //   202: getfield 304	com/tencent/feedback/anr/f:d	Ljava/util/Map;
    //   205: ldc -85
    //   207: invokeinterface 177 2 0
    //   212: checkcast 344	[Ljava/lang/String;
    //   215: astore 4
    //   217: aload 4
    //   219: ifnull +77 -> 296
    //   222: aload 4
    //   224: arraylength
    //   225: iconst_3
    //   226: if_icmplt +70 -> 296
    //   229: aload 4
    //   231: iconst_0
    //   232: aaload
    //   233: astore_0
    //   234: aload 4
    //   236: iconst_1
    //   237: aaload
    //   238: astore_2
    //   239: aload 4
    //   241: iconst_2
    //   242: aaload
    //   243: astore 4
    //   245: aload_1
    //   246: new 52	java/lang/StringBuilder
    //   249: dup
    //   250: ldc_w 346
    //   253: invokespecial 347	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   256: aload 4
    //   258: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: ldc_w 349
    //   264: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   267: aload_0
    //   268: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   271: ldc -73
    //   273: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   276: aload_2
    //   277: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   280: ldc_w 351
    //   283: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   286: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   289: invokevirtual 354	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   292: aload_1
    //   293: invokevirtual 357	java/io/BufferedWriter:flush	()V
    //   296: aload_3
    //   297: getfield 304	com/tencent/feedback/anr/f:d	Ljava/util/Map;
    //   300: invokeinterface 361 1 0
    //   305: invokeinterface 364 1 0
    //   310: astore_0
    //   311: aload_0
    //   312: invokeinterface 126 1 0
    //   317: ifeq +237 -> 554
    //   320: aload_0
    //   321: invokeinterface 130 1 0
    //   326: checkcast 366	java/util/Map$Entry
    //   329: astore_2
    //   330: aload_2
    //   331: invokeinterface 369 1 0
    //   336: checkcast 181	java/lang/String
    //   339: ldc -85
    //   341: invokevirtual 373	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   344: ifne -33 -> 311
    //   347: aload_2
    //   348: invokeinterface 376 1 0
    //   353: ifnull -42 -> 311
    //   356: aload_2
    //   357: invokeinterface 376 1 0
    //   362: checkcast 344	[Ljava/lang/String;
    //   365: arraylength
    //   366: iconst_3
    //   367: if_icmplt -56 -> 311
    //   370: aload_2
    //   371: invokeinterface 376 1 0
    //   376: checkcast 344	[Ljava/lang/String;
    //   379: iconst_0
    //   380: aaload
    //   381: astore_3
    //   382: aload_2
    //   383: invokeinterface 376 1 0
    //   388: checkcast 344	[Ljava/lang/String;
    //   391: iconst_1
    //   392: aaload
    //   393: astore 4
    //   395: aload_2
    //   396: invokeinterface 376 1 0
    //   401: checkcast 344	[Ljava/lang/String;
    //   404: iconst_2
    //   405: aaload
    //   406: astore 5
    //   408: aload_1
    //   409: new 52	java/lang/StringBuilder
    //   412: dup
    //   413: ldc_w 378
    //   416: invokespecial 347	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   419: aload_2
    //   420: invokeinterface 369 1 0
    //   425: checkcast 181	java/lang/String
    //   428: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   431: ldc_w 380
    //   434: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   437: aload 5
    //   439: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   442: ldc_w 349
    //   445: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   448: aload_3
    //   449: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   452: ldc -73
    //   454: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   457: aload 4
    //   459: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   462: ldc_w 351
    //   465: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   468: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   471: invokevirtual 354	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   474: aload_1
    //   475: invokevirtual 357	java/io/BufferedWriter:flush	()V
    //   478: goto -167 -> 311
    //   481: astore_2
    //   482: aload_1
    //   483: astore_0
    //   484: aload_2
    //   485: astore_1
    //   486: aload_1
    //   487: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   490: ifne +7 -> 497
    //   493: aload_1
    //   494: invokevirtual 381	java/io/IOException:printStackTrace	()V
    //   497: ldc_w 383
    //   500: iconst_1
    //   501: anewarray 4	java/lang/Object
    //   504: dup
    //   505: iconst_0
    //   506: new 52	java/lang/StringBuilder
    //   509: dup
    //   510: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   513: aload_1
    //   514: invokevirtual 280	java/lang/Object:getClass	()Ljava/lang/Class;
    //   517: invokevirtual 285	java/lang/Class:getName	()Ljava/lang/String;
    //   520: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   523: ldc_w 287
    //   526: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   529: aload_1
    //   530: invokevirtual 384	java/io/IOException:getMessage	()Ljava/lang/String;
    //   533: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   536: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   539: aastore
    //   540: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   543: pop
    //   544: aload_0
    //   545: ifnull +7 -> 552
    //   548: aload_0
    //   549: invokevirtual 387	java/io/BufferedWriter:close	()V
    //   552: iconst_0
    //   553: ireturn
    //   554: aload_1
    //   555: invokevirtual 387	java/io/BufferedWriter:close	()V
    //   558: iconst_1
    //   559: ireturn
    //   560: astore_0
    //   561: aload_0
    //   562: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   565: ifne -7 -> 558
    //   568: aload_0
    //   569: invokevirtual 381	java/io/IOException:printStackTrace	()V
    //   572: goto -14 -> 558
    //   575: astore_0
    //   576: aload_0
    //   577: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   580: ifne -28 -> 552
    //   583: aload_0
    //   584: invokevirtual 381	java/io/IOException:printStackTrace	()V
    //   587: goto -35 -> 552
    //   590: astore_0
    //   591: aconst_null
    //   592: astore_1
    //   593: aload_1
    //   594: ifnull +7 -> 601
    //   597: aload_1
    //   598: invokevirtual 387	java/io/BufferedWriter:close	()V
    //   601: aload_0
    //   602: athrow
    //   603: astore_1
    //   604: aload_1
    //   605: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   608: ifne -7 -> 601
    //   611: aload_1
    //   612: invokevirtual 381	java/io/IOException:printStackTrace	()V
    //   615: goto -14 -> 601
    //   618: astore_0
    //   619: goto -26 -> 593
    //   622: astore_2
    //   623: aload_0
    //   624: astore_1
    //   625: aload_2
    //   626: astore_0
    //   627: goto -34 -> 593
    //   630: astore_1
    //   631: goto -145 -> 486
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	634	0	paramString1	String
    //   0	634	1	paramString2	String
    //   0	634	2	paramString3	String
    //   6	443	3	localObject1	Object
    //   215	243	4	localObject2	Object
    //   406	32	5	str	String
    // Exception table:
    //   from	to	target	type
    //   56	81	117	java/lang/Exception
    //   81	86	117	java/lang/Exception
    //   201	217	481	java/io/IOException
    //   222	229	481	java/io/IOException
    //   245	296	481	java/io/IOException
    //   296	311	481	java/io/IOException
    //   311	478	481	java/io/IOException
    //   554	558	560	java/io/IOException
    //   548	552	575	java/io/IOException
    //   184	201	590	finally
    //   597	601	603	java/io/IOException
    //   201	217	618	finally
    //   222	229	618	finally
    //   245	296	618	finally
    //   296	311	618	finally
    //   311	478	618	finally
    //   486	497	622	finally
    //   497	544	622	finally
    //   184	201	630	java/io/IOException
  }
  
  /* Error */
  public final void a(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   6: invokevirtual 389	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   9: ifeq +17 -> 26
    //   12: ldc_w 391
    //   15: iconst_0
    //   16: anewarray 4	java/lang/Object
    //   19: invokestatic 98	com/tencent/feedback/common/e:b	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   22: pop
    //   23: aload_0
    //   24: monitorexit
    //   25: return
    //   26: aload_0
    //   27: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   30: iconst_1
    //   31: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   34: aload_0
    //   35: monitorexit
    //   36: aload_0
    //   37: getfield 38	com/tencent/feedback/anr/b:c	Landroid/content/Context;
    //   40: invokestatic 397	com/tencent/feedback/common/c:a	(Landroid/content/Context;)Lcom/tencent/feedback/common/c;
    //   43: astore 7
    //   45: aload 7
    //   47: ifnonnull +28 -> 75
    //   50: ldc_w 399
    //   53: iconst_0
    //   54: anewarray 4	java/lang/Object
    //   57: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   60: pop
    //   61: aload_0
    //   62: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   65: iconst_0
    //   66: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   69: return
    //   70: astore_1
    //   71: aload_0
    //   72: monitorexit
    //   73: aload_1
    //   74: athrow
    //   75: invokestatic 405	com/tencent/feedback/eup/CrashReport:getCrashRuntimeStrategy	()Lcom/tencent/feedback/eup/CrashStrategyBean;
    //   78: astore 8
    //   80: aload 8
    //   82: ifnull +12 -> 94
    //   85: invokestatic 411	com/tencent/feedback/eup/f:l	()Lcom/tencent/feedback/eup/f;
    //   88: invokevirtual 413	com/tencent/feedback/eup/f:a	()Z
    //   91: ifne +23 -> 114
    //   94: ldc_w 415
    //   97: iconst_0
    //   98: anewarray 4	java/lang/Object
    //   101: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   104: pop
    //   105: aload_0
    //   106: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   109: iconst_0
    //   110: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   113: return
    //   114: ldc_w 417
    //   117: iconst_0
    //   118: anewarray 4	java/lang/Object
    //   121: invokestatic 98	com/tencent/feedback/common/e:b	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   124: pop
    //   125: aload_1
    //   126: iconst_0
    //   127: invokestatic 420	com/tencent/feedback/anr/a:a	(Ljava/lang/String;Z)Lcom/tencent/feedback/anr/f;
    //   130: astore 9
    //   132: aload 9
    //   134: ifnull +624 -> 758
    //   137: aload 9
    //   139: getfield 421	com/tencent/feedback/anr/f:c	J
    //   142: lstore_3
    //   143: lload_3
    //   144: lstore 5
    //   146: lload_3
    //   147: ldc2_w 31
    //   150: lcmp
    //   151: ifne +26 -> 177
    //   154: ldc_w 423
    //   157: iconst_0
    //   158: anewarray 4	java/lang/Object
    //   161: invokestatic 425	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   164: pop
    //   165: new 427	java/util/Date
    //   168: dup
    //   169: invokespecial 428	java/util/Date:<init>	()V
    //   172: invokevirtual 431	java/util/Date:getTime	()J
    //   175: lstore 5
    //   177: lload 5
    //   179: aload_0
    //   180: getfield 34	com/tencent/feedback/anr/b:b	J
    //   183: lsub
    //   184: invokestatic 437	java/lang/Math:abs	(J)J
    //   187: ldc2_w 90
    //   190: lcmp
    //   191: ifge +32 -> 223
    //   194: ldc_w 439
    //   197: iconst_1
    //   198: anewarray 4	java/lang/Object
    //   201: dup
    //   202: iconst_0
    //   203: sipush 10000
    //   206: invokestatic 263	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   209: aastore
    //   210: invokestatic 425	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   213: pop
    //   214: aload_0
    //   215: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   218: iconst_0
    //   219: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   222: return
    //   223: aload_0
    //   224: lload 5
    //   226: putfield 34	com/tencent/feedback/anr/b:b	J
    //   229: aload_0
    //   230: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   233: iconst_1
    //   234: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   237: invokestatic 441	com/tencent/feedback/proguard/a:b	()Ljava/util/Map;
    //   240: astore 10
    //   242: aload 10
    //   244: ifnull +13 -> 257
    //   247: aload 10
    //   249: invokeinterface 307 1 0
    //   254: ifgt +49 -> 303
    //   257: ldc_w 443
    //   260: iconst_0
    //   261: anewarray 4	java/lang/Object
    //   264: invokestatic 425	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   267: pop
    //   268: aload_0
    //   269: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   272: iconst_0
    //   273: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   276: return
    //   277: astore_1
    //   278: aload_1
    //   279: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   282: pop
    //   283: ldc_w 445
    //   286: iconst_0
    //   287: anewarray 4	java/lang/Object
    //   290: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   293: pop
    //   294: aload_0
    //   295: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   298: iconst_0
    //   299: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   302: return
    //   303: aload_0
    //   304: aload_0
    //   305: getfield 38	com/tencent/feedback/anr/b:c	Landroid/content/Context;
    //   308: ldc2_w 90
    //   311: invokespecial 447	com/tencent/feedback/anr/b:a	(Landroid/content/Context;J)Landroid/app/ActivityManager$ProcessErrorStateInfo;
    //   314: astore 11
    //   316: aload 11
    //   318: ifnonnull +23 -> 341
    //   321: ldc_w 449
    //   324: iconst_0
    //   325: anewarray 4	java/lang/Object
    //   328: invokestatic 98	com/tencent/feedback/common/e:b	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   331: pop
    //   332: aload_0
    //   333: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   336: iconst_0
    //   337: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   340: return
    //   341: aload 11
    //   343: getfield 452	android/app/ActivityManager$ProcessErrorStateInfo:pid	I
    //   346: invokestatic 457	android/os/Process:myPid	()I
    //   349: if_icmpeq +31 -> 380
    //   352: ldc_w 459
    //   355: iconst_1
    //   356: anewarray 4	java/lang/Object
    //   359: dup
    //   360: iconst_0
    //   361: aload 11
    //   363: getfield 462	android/app/ActivityManager$ProcessErrorStateInfo:processName	Ljava/lang/String;
    //   366: aastore
    //   367: invokestatic 98	com/tencent/feedback/common/e:b	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   370: pop
    //   371: aload_0
    //   372: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   375: iconst_0
    //   376: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   379: return
    //   380: ldc_w 464
    //   383: iconst_0
    //   384: anewarray 4	java/lang/Object
    //   387: invokestatic 142	com/tencent/feedback/common/e:a	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   390: pop
    //   391: new 61	java/io/File
    //   394: dup
    //   395: aload_0
    //   396: getfield 38	com/tencent/feedback/anr/b:c	Landroid/content/Context;
    //   399: invokevirtual 59	android/content/Context:getFilesDir	()Ljava/io/File;
    //   402: new 52	java/lang/StringBuilder
    //   405: dup
    //   406: ldc_w 466
    //   409: invokespecial 347	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   412: lload 5
    //   414: invokevirtual 469	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   417: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   420: invokespecial 472	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   423: astore 12
    //   425: new 166	com/tencent/feedback/anr/a
    //   428: dup
    //   429: invokespecial 473	com/tencent/feedback/anr/a:<init>	()V
    //   432: astore 9
    //   434: aload 9
    //   436: lload 5
    //   438: putfield 216	com/tencent/feedback/anr/a:c	J
    //   441: aload 9
    //   443: aload 12
    //   445: invokevirtual 65	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   448: putfield 237	com/tencent/feedback/anr/a:d	Ljava/lang/String;
    //   451: aload 9
    //   453: aload 11
    //   455: getfield 462	android/app/ActivityManager$ProcessErrorStateInfo:processName	Ljava/lang/String;
    //   458: putfield 209	com/tencent/feedback/anr/a:a	Ljava/lang/String;
    //   461: aload 9
    //   463: aload 11
    //   465: getfield 476	android/app/ActivityManager$ProcessErrorStateInfo:shortMsg	Ljava/lang/String;
    //   468: putfield 214	com/tencent/feedback/anr/a:f	Ljava/lang/String;
    //   471: aload 9
    //   473: aload 11
    //   475: getfield 479	android/app/ActivityManager$ProcessErrorStateInfo:longMsg	Ljava/lang/String;
    //   478: putfield 218	com/tencent/feedback/anr/a:e	Ljava/lang/String;
    //   481: aload 9
    //   483: aload 10
    //   485: putfield 169	com/tencent/feedback/anr/a:b	Ljava/util/Map;
    //   488: aload 9
    //   490: getfield 216	com/tencent/feedback/anr/a:c	J
    //   493: lstore_3
    //   494: aload 9
    //   496: getfield 237	com/tencent/feedback/anr/a:d	Ljava/lang/String;
    //   499: astore 10
    //   501: aload 9
    //   503: getfield 209	com/tencent/feedback/anr/a:a	Ljava/lang/String;
    //   506: astore 11
    //   508: aload 9
    //   510: getfield 214	com/tencent/feedback/anr/a:f	Ljava/lang/String;
    //   513: astore 12
    //   515: aload 9
    //   517: getfield 218	com/tencent/feedback/anr/a:e	Ljava/lang/String;
    //   520: astore 13
    //   522: aload 9
    //   524: getfield 169	com/tencent/feedback/anr/a:b	Ljava/util/Map;
    //   527: ifnonnull +87 -> 614
    //   530: iconst_0
    //   531: istore_2
    //   532: ldc_w 481
    //   535: bipush 6
    //   537: anewarray 4	java/lang/Object
    //   540: dup
    //   541: iconst_0
    //   542: lload_3
    //   543: invokestatic 486	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   546: aastore
    //   547: dup
    //   548: iconst_1
    //   549: aload 10
    //   551: aastore
    //   552: dup
    //   553: iconst_2
    //   554: aload 11
    //   556: aastore
    //   557: dup
    //   558: iconst_3
    //   559: aload 12
    //   561: aastore
    //   562: dup
    //   563: iconst_4
    //   564: aload 13
    //   566: aastore
    //   567: dup
    //   568: iconst_5
    //   569: iload_2
    //   570: invokestatic 263	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   573: aastore
    //   574: invokestatic 98	com/tencent/feedback/common/e:b	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   577: pop
    //   578: aload_0
    //   579: getfield 38	com/tencent/feedback/anr/b:c	Landroid/content/Context;
    //   582: aload 9
    //   584: aload 7
    //   586: aload 8
    //   588: invokestatic 488	com/tencent/feedback/anr/b:a	(Landroid/content/Context;Lcom/tencent/feedback/anr/a;Lcom/tencent/feedback/common/c;Lcom/tencent/feedback/eup/CrashStrategyBean;)Z
    //   591: ifne +37 -> 628
    //   594: ldc_w 490
    //   597: iconst_0
    //   598: anewarray 4	java/lang/Object
    //   601: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   604: pop
    //   605: aload_0
    //   606: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   609: iconst_0
    //   610: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   613: return
    //   614: aload 9
    //   616: getfield 169	com/tencent/feedback/anr/a:b	Ljava/util/Map;
    //   619: invokeinterface 307 1 0
    //   624: istore_2
    //   625: goto -93 -> 532
    //   628: aload_0
    //   629: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   632: iconst_3
    //   633: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   636: aload_1
    //   637: aload 9
    //   639: getfield 237	com/tencent/feedback/anr/a:d	Ljava/lang/String;
    //   642: aload 9
    //   644: getfield 209	com/tencent/feedback/anr/a:a	Ljava/lang/String;
    //   647: invokestatic 492	com/tencent/feedback/anr/b:a	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   650: ifne +27 -> 677
    //   653: ldc_w 494
    //   656: iconst_1
    //   657: anewarray 4	java/lang/Object
    //   660: dup
    //   661: iconst_0
    //   662: aload_1
    //   663: aastore
    //   664: invokestatic 425	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   667: pop
    //   668: aload_0
    //   669: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   672: iconst_0
    //   673: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   676: return
    //   677: ldc_w 496
    //   680: iconst_1
    //   681: anewarray 4	java/lang/Object
    //   684: dup
    //   685: iconst_0
    //   686: aload 9
    //   688: getfield 237	com/tencent/feedback/anr/a:d	Ljava/lang/String;
    //   691: aastore
    //   692: invokestatic 142	com/tencent/feedback/common/e:a	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   695: pop
    //   696: aload_0
    //   697: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   700: iconst_0
    //   701: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   704: return
    //   705: astore_1
    //   706: aload_1
    //   707: invokestatic 273	com/tencent/feedback/common/e:a	(Ljava/lang/Throwable;)Z
    //   710: ifne +7 -> 717
    //   713: aload_1
    //   714: invokevirtual 274	java/lang/Throwable:printStackTrace	()V
    //   717: ldc_w 498
    //   720: iconst_1
    //   721: anewarray 4	java/lang/Object
    //   724: dup
    //   725: iconst_0
    //   726: aload_1
    //   727: invokevirtual 280	java/lang/Object:getClass	()Ljava/lang/Class;
    //   730: invokevirtual 499	java/lang/Class:toString	()Ljava/lang/String;
    //   733: aastore
    //   734: invokestatic 164	com/tencent/feedback/common/e:d	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   737: pop
    //   738: aload_0
    //   739: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   742: iconst_0
    //   743: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   746: return
    //   747: astore_1
    //   748: aload_0
    //   749: getfield 30	com/tencent/feedback/anr/b:a	Ljava/util/concurrent/atomic/AtomicInteger;
    //   752: iconst_0
    //   753: invokevirtual 394	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   756: aload_1
    //   757: athrow
    //   758: ldc2_w 31
    //   761: lstore_3
    //   762: goto -619 -> 143
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	765	0	this	b
    //   0	765	1	paramString	String
    //   531	94	2	i	int
    //   142	620	3	l1	long
    //   144	293	5	l2	long
    //   43	542	7	localC	com.tencent.feedback.common.c
    //   78	509	8	localCrashStrategyBean	CrashStrategyBean
    //   130	557	9	localObject1	Object
    //   240	310	10	localObject2	Object
    //   314	241	11	localObject3	Object
    //   423	137	12	localObject4	Object
    //   520	45	13	str	String
    // Exception table:
    //   from	to	target	type
    //   2	25	70	finally
    //   26	36	70	finally
    //   237	242	277	java/lang/Throwable
    //   36	45	705	java/lang/Throwable
    //   50	61	705	java/lang/Throwable
    //   75	80	705	java/lang/Throwable
    //   85	94	705	java/lang/Throwable
    //   94	105	705	java/lang/Throwable
    //   114	132	705	java/lang/Throwable
    //   137	143	705	java/lang/Throwable
    //   154	177	705	java/lang/Throwable
    //   177	214	705	java/lang/Throwable
    //   223	237	705	java/lang/Throwable
    //   247	257	705	java/lang/Throwable
    //   257	268	705	java/lang/Throwable
    //   278	294	705	java/lang/Throwable
    //   303	316	705	java/lang/Throwable
    //   321	332	705	java/lang/Throwable
    //   341	371	705	java/lang/Throwable
    //   380	530	705	java/lang/Throwable
    //   532	605	705	java/lang/Throwable
    //   614	625	705	java/lang/Throwable
    //   628	668	705	java/lang/Throwable
    //   677	696	705	java/lang/Throwable
    //   36	45	747	finally
    //   50	61	747	finally
    //   75	80	747	finally
    //   85	94	747	finally
    //   94	105	747	finally
    //   114	132	747	finally
    //   137	143	747	finally
    //   154	177	747	finally
    //   177	214	747	finally
    //   223	237	747	finally
    //   237	242	747	finally
    //   247	257	747	finally
    //   257	268	747	finally
    //   278	294	747	finally
    //   303	316	747	finally
    //   321	332	747	finally
    //   341	371	747	finally
    //   380	530	747	finally
    //   532	605	747	finally
    //   614	625	747	finally
    //   628	668	747	finally
    //   677	696	747	finally
    //   706	717	747	finally
    //   717	738	747	finally
  }
  
  public final boolean a()
  {
    return a.get() != 0;
  }
}
