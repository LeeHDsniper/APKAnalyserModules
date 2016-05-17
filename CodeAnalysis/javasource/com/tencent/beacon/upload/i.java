package com.tencent.beacon.upload;

import android.content.Context;
import android.util.SparseArray;
import com.tencent.beacon.a.j;
import com.tencent.beacon.b.a.c;
import com.tencent.beacon.event.o;
import java.util.ArrayList;
import java.util.List;

public final class i
  implements h
{
  private static i a = null;
  private SparseArray<g> b = new SparseArray(5);
  private List<UploadHandleListener> c = new ArrayList(5);
  private f d;
  private Context e = null;
  private boolean f = true;
  private boolean g = true;
  
  private i(Context paramContext, boolean paramBoolean)
  {
    if (paramContext != null) {
      localContext = paramContext.getApplicationContext();
    }
    if (localContext != null) {}
    for (e = localContext;; e = paramContext)
    {
      f = paramBoolean;
      d = f.a(e);
      return;
    }
  }
  
  private static c a(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte != null) {}
    for (;;)
    {
      try
      {
        Object localObject = com.tencent.beacon.a.b.d.a();
        if (localObject == null) {
          break label85;
        }
        int i = ((com.tencent.beacon.a.b.d)localObject).k();
        paramArrayOfByte = com.tencent.beacon.a.f.b(paramArrayOfByte, ((com.tencent.beacon.a.b.d)localObject).l(), i, ((com.tencent.beacon.a.b.d)localObject).o());
        if (paramArrayOfByte != null)
        {
          localObject = new com.tencent.beacon.e.d();
          ((com.tencent.beacon.e.d)localObject).a(paramArrayOfByte);
          paramArrayOfByte = new c();
          com.tencent.beacon.d.a.b(" covert to ResponsePackage ", new Object[0]);
          paramArrayOfByte = (c)((com.tencent.beacon.e.d)localObject).b("detail", paramArrayOfByte);
          return paramArrayOfByte;
        }
      }
      catch (Throwable paramArrayOfByte)
      {
        com.tencent.beacon.d.a.a(paramArrayOfByte);
      }
      return null;
      label85:
      paramArrayOfByte = null;
    }
  }
  
  public static i a(Context paramContext)
  {
    try
    {
      if (a == null)
      {
        a = new i(paramContext, true);
        com.tencent.beacon.d.a.h(" create uphandler up:true", new Object[0]);
      }
      paramContext = a;
      return paramContext;
    }
    finally {}
  }
  
  public static i a(Context paramContext, boolean paramBoolean)
  {
    try
    {
      if (a == null)
      {
        a = new i(paramContext, paramBoolean);
        com.tencent.beacon.d.a.h(" create uphandler up: %b", new Object[] { Boolean.valueOf(paramBoolean) });
      }
      if (a.a() != paramBoolean)
      {
        a.b(paramBoolean);
        com.tencent.beacon.d.a.h(" change uphandler up: %b", new Object[] { Boolean.valueOf(paramBoolean) });
      }
      paramContext = a;
      return paramContext;
    }
    finally {}
  }
  
  private void a(int paramInt1, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, String paramString)
  {
    UploadHandleListener[] arrayOfUploadHandleListener = c();
    if (arrayOfUploadHandleListener != null)
    {
      int j = arrayOfUploadHandleListener.length;
      int i = 0;
      while (i < j)
      {
        arrayOfUploadHandleListener[i].onUploadEnd(paramInt1, paramInt2, paramLong1, paramLong2, paramBoolean, paramString);
        i += 1;
      }
    }
  }
  
  private static void a(int paramInt1, long paramLong1, boolean paramBoolean, long paramLong2, int paramInt2, int paramInt3, String paramString1, String paramString2, int paramInt4, String paramString3)
  {
    if ((paramInt1 != 0) && (paramLong1 != 0L))
    {
      o localO = o.d();
      if ((localO != null) && (d != null)) {
        d.a(paramInt1, paramBoolean, paramLong2, paramLong1, paramInt2, paramInt3, paramString1, paramString2, paramInt4, paramString3);
      }
    }
  }
  
  private boolean a(SparseArray<g> paramSparseArray, int paramInt, byte[] paramArrayOfByte)
  {
    if ((paramSparseArray == null) || (paramArrayOfByte == null)) {
      return true;
    }
    switch (paramInt)
    {
    default: 
      paramSparseArray = (g)paramSparseArray.get(paramInt);
      if (paramSparseArray == null)
      {
        com.tencent.beacon.d.a.c(" no handler key:%d", new Object[] { Integer.valueOf(paramInt) });
        return false;
      }
      break;
    case 103: 
      try
      {
        com.tencent.beacon.d.a.a(" process CMD_RESPONSE_GEN_QIMEI", new Object[0]);
        paramSparseArray = new com.tencent.beacon.e.a(paramArrayOfByte);
        paramArrayOfByte = new com.tencent.beacon.b.c.a();
        paramArrayOfByte.a(paramSparseArray);
        if (a != null)
        {
          j.a(e).a(a);
          new com.tencent.beacon.d.b(e).a(a);
        }
        com.tencent.beacon.d.a.h(" Qimei:%s  imei:%s  imsi:%s  aid:%s  mac:%s ", new Object[] { a, b, d, e, c });
      }
      catch (Throwable paramSparseArray)
      {
        for (;;)
        {
          com.tencent.beacon.d.a.a(paramSparseArray);
        }
      }
      return true;
    }
    try
    {
      com.tencent.beacon.d.a.b(" key:%d  handler: %s", new Object[] { Integer.valueOf(paramInt), paramSparseArray.getClass().toString() });
      paramSparseArray.a(paramInt, paramArrayOfByte, true);
      return true;
    }
    catch (Throwable paramSparseArray)
    {
      com.tencent.beacon.d.a.a(paramSparseArray);
      com.tencent.beacon.d.a.d(" handle error key:%d", new Object[] { Integer.valueOf(paramInt) });
    }
    return false;
  }
  
  private void b(boolean paramBoolean)
  {
    try
    {
      f = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private static byte[] b(a paramA)
  {
    if (paramA != null) {
      try
      {
        Object localObject1 = paramA.a();
        if (localObject1 != null)
        {
          com.tencent.beacon.d.a.b(" RequestPackage info appkey:%s sdkid:%s appVersion:%s cmd: %d", new Object[] { b, d, c, Integer.valueOf(f) });
          Object localObject2 = new com.tencent.beacon.e.d();
          ((com.tencent.beacon.e.d)localObject2).a();
          ((com.tencent.beacon.e.d)localObject2).b("test");
          ((com.tencent.beacon.e.d)localObject2).a("test");
          ((com.tencent.beacon.e.d)localObject2).a("detail", localObject1);
          localObject1 = ((com.tencent.beacon.e.d)localObject2).b();
          localObject2 = com.tencent.beacon.a.b.d.a();
          if (localObject2 != null)
          {
            int i = ((com.tencent.beacon.a.b.d)localObject2).k();
            localObject1 = com.tencent.beacon.a.f.a((byte[])localObject1, ((com.tencent.beacon.a.b.d)localObject2).l(), i, ((com.tencent.beacon.a.b.d)localObject2).o());
            return localObject1;
          }
        }
      }
      catch (Throwable localThrowable)
      {
        com.tencent.beacon.d.a.d(" parseSendDatas error", new Object[0]);
        com.tencent.beacon.d.a.a(localThrowable);
        paramA.b();
      }
    }
    return null;
  }
  
  /* Error */
  private UploadHandleListener[] c()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 42	com/tencent/beacon/upload/i:c	Ljava/util/List;
    //   6: ifnull +36 -> 42
    //   9: aload_0
    //   10: getfield 42	com/tencent/beacon/upload/i:c	Ljava/util/List;
    //   13: invokeinterface 275 1 0
    //   18: ifle +24 -> 42
    //   21: aload_0
    //   22: getfield 42	com/tencent/beacon/upload/i:c	Ljava/util/List;
    //   25: iconst_0
    //   26: anewarray 140	com/tencent/beacon/upload/UploadHandleListener
    //   29: invokeinterface 279 2 0
    //   34: checkcast 281	[Lcom/tencent/beacon/upload/UploadHandleListener;
    //   37: astore_1
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_1
    //   41: areturn
    //   42: aconst_null
    //   43: astore_1
    //   44: goto -6 -> 38
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	i
    //   37	7	1	arrayOfUploadHandleListener	UploadHandleListener[]
    //   47	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	38	47	finally
  }
  
  private f d()
  {
    try
    {
      f localF = d;
      return localF;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  private SparseArray<g> e()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 37	com/tencent/beacon/upload/i:b	Landroid/util/SparseArray;
    //   6: ifnull +33 -> 39
    //   9: aload_0
    //   10: getfield 37	com/tencent/beacon/upload/i:b	Landroid/util/SparseArray;
    //   13: invokevirtual 284	android/util/SparseArray:size	()I
    //   16: ifle +23 -> 39
    //   19: new 286	com/tencent/beacon/d/d
    //   22: dup
    //   23: invokespecial 287	com/tencent/beacon/d/d:<init>	()V
    //   26: pop
    //   27: aload_0
    //   28: getfield 37	com/tencent/beacon/upload/i:b	Landroid/util/SparseArray;
    //   31: invokestatic 290	com/tencent/beacon/d/d:a	(Landroid/util/SparseArray;)Landroid/util/SparseArray;
    //   34: astore_1
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_1
    //   38: areturn
    //   39: aconst_null
    //   40: astore_1
    //   41: goto -6 -> 35
    //   44: astore_1
    //   45: aload_0
    //   46: monitorexit
    //   47: aload_1
    //   48: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	49	0	this	i
    //   34	7	1	localSparseArray	SparseArray
    //   44	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	35	44	finally
  }
  
  /* Error */
  public final void a(a paramA)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 129	com/tencent/beacon/upload/i:a	()Z
    //   4: ifeq +10 -> 14
    //   7: aload_0
    //   8: invokevirtual 296	com/tencent/beacon/upload/i:b	()Z
    //   11: ifne +64 -> 75
    //   14: aload_1
    //   15: invokevirtual 298	com/tencent/beacon/upload/a:c	()I
    //   18: iconst_2
    //   19: if_icmpne +18 -> 37
    //   22: ldc_w 300
    //   25: iconst_0
    //   26: anewarray 4	java/lang/Object
    //   29: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   32: aload_1
    //   33: iconst_0
    //   34: invokevirtual 301	com/tencent/beacon/upload/a:b	(Z)V
    //   37: aload_1
    //   38: getfield 303	com/tencent/beacon/upload/a:b	I
    //   41: ifeq +24 -> 65
    //   44: ldc_w 305
    //   47: iconst_1
    //   48: anewarray 4	java/lang/Object
    //   51: dup
    //   52: iconst_0
    //   53: aload_1
    //   54: invokevirtual 298	com/tencent/beacon/upload/a:c	()I
    //   57: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   60: aastore
    //   61: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   64: return
    //   65: ldc_w 307
    //   68: iconst_0
    //   69: anewarray 4	java/lang/Object
    //   72: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   75: aload_0
    //   76: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   79: invokestatic 311	com/tencent/beacon/a/f:t	(Landroid/content/Context;)Z
    //   82: ifne +27 -> 109
    //   85: ldc_w 313
    //   88: iconst_0
    //   89: anewarray 4	java/lang/Object
    //   92: invokestatic 173	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   95: aload_1
    //   96: invokevirtual 298	com/tencent/beacon/upload/a:c	()I
    //   99: iconst_2
    //   100: if_icmpne -36 -> 64
    //   103: aload_1
    //   104: iconst_0
    //   105: invokevirtual 301	com/tencent/beacon/upload/a:b	(Z)V
    //   108: return
    //   109: aload_0
    //   110: aload_0
    //   111: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   114: invokestatic 318	com/tencent/beacon/a/h:a	(Landroid/content/Context;)Lcom/tencent/beacon/a/h;
    //   117: invokevirtual 321	com/tencent/beacon/upload/i:a	(Lcom/tencent/beacon/upload/UploadHandleListener;)Z
    //   120: pop
    //   121: aload_1
    //   122: ifnonnull +14 -> 136
    //   125: ldc_w 323
    //   128: iconst_0
    //   129: anewarray 4	java/lang/Object
    //   132: invokestatic 232	com/tencent/beacon/d/a:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   135: return
    //   136: aload_1
    //   137: invokevirtual 298	com/tencent/beacon/upload/a:c	()I
    //   140: istore 4
    //   142: aload_1
    //   143: invokevirtual 325	com/tencent/beacon/upload/a:e	()Ljava/lang/String;
    //   146: astore 18
    //   148: aload 18
    //   150: ifnull +17 -> 167
    //   153: ldc_w 327
    //   156: aload 18
    //   158: invokevirtual 332	java/lang/String:trim	()Ljava/lang/String;
    //   161: invokevirtual 336	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   164: ifeq +40 -> 204
    //   167: ldc_w 338
    //   170: iconst_0
    //   171: anewarray 4	java/lang/Object
    //   174: invokestatic 232	com/tencent/beacon/d/a:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   177: aload_1
    //   178: invokevirtual 298	com/tencent/beacon/upload/a:c	()I
    //   181: iconst_2
    //   182: if_icmpne +8 -> 190
    //   185: aload_1
    //   186: iconst_0
    //   187: invokevirtual 301	com/tencent/beacon/upload/a:b	(Z)V
    //   190: aload_0
    //   191: iload 4
    //   193: iconst_m1
    //   194: lconst_0
    //   195: lconst_0
    //   196: iconst_0
    //   197: ldc_w 340
    //   200: invokespecial 342	com/tencent/beacon/upload/i:a	(IIJJZLjava/lang/String;)V
    //   203: return
    //   204: aload_1
    //   205: invokestatic 344	com/tencent/beacon/upload/i:b	(Lcom/tencent/beacon/upload/a;)[B
    //   208: astore 20
    //   210: aload_1
    //   211: invokevirtual 346	com/tencent/beacon/upload/a:d	()Ljava/lang/String;
    //   214: astore 17
    //   216: aconst_null
    //   217: astore 16
    //   219: aload 17
    //   221: ifnull +23 -> 244
    //   224: new 348	java/lang/StringBuilder
    //   227: dup
    //   228: ldc_w 350
    //   231: invokespecial 352	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   234: aload 17
    //   236: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   239: invokevirtual 357	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   242: astore 16
    //   244: invokestatic 69	com/tencent/beacon/a/b/d:a	()Lcom/tencent/beacon/a/b/d;
    //   247: astore 19
    //   249: aload 16
    //   251: astore 17
    //   253: aload 19
    //   255: ifnull +59 -> 314
    //   258: aload 19
    //   260: invokevirtual 360	com/tencent/beacon/a/b/d:p	()Ljava/lang/String;
    //   263: astore 19
    //   265: aload 16
    //   267: astore 17
    //   269: aload 19
    //   271: ifnull +43 -> 314
    //   274: aload 16
    //   276: astore 17
    //   278: ldc_w 327
    //   281: aload 19
    //   283: invokevirtual 336	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   286: ifne +28 -> 314
    //   289: aload 16
    //   291: ifnonnull +112 -> 403
    //   294: new 348	java/lang/StringBuilder
    //   297: dup
    //   298: ldc_w 362
    //   301: invokespecial 352	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   304: aload 19
    //   306: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   309: invokevirtual 357	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   312: astore 17
    //   314: aload 17
    //   316: ifnull +1444 -> 1760
    //   319: new 348	java/lang/StringBuilder
    //   322: dup
    //   323: invokespecial 363	java/lang/StringBuilder:<init>	()V
    //   326: aload 18
    //   328: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   331: aload 17
    //   333: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   336: invokevirtual 357	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   339: astore 16
    //   341: ldc_w 365
    //   344: iconst_3
    //   345: anewarray 4	java/lang/Object
    //   348: dup
    //   349: iconst_0
    //   350: iload 4
    //   352: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   355: aastore
    //   356: dup
    //   357: iconst_1
    //   358: aload 16
    //   360: aastore
    //   361: dup
    //   362: iconst_2
    //   363: aload_1
    //   364: invokevirtual 220	java/lang/Object:getClass	()Ljava/lang/Class;
    //   367: invokevirtual 225	java/lang/Class:toString	()Ljava/lang/String;
    //   370: aastore
    //   371: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   374: aload 20
    //   376: ifnonnull +58 -> 434
    //   379: ldc_w 367
    //   382: iconst_0
    //   383: anewarray 4	java/lang/Object
    //   386: invokestatic 173	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   389: aload_0
    //   390: iload 4
    //   392: iconst_m1
    //   393: lconst_0
    //   394: lconst_0
    //   395: iconst_0
    //   396: ldc_w 369
    //   399: invokespecial 342	com/tencent/beacon/upload/i:a	(IIJJZLjava/lang/String;)V
    //   402: return
    //   403: new 348	java/lang/StringBuilder
    //   406: dup
    //   407: invokespecial 363	java/lang/StringBuilder:<init>	()V
    //   410: aload 16
    //   412: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   415: ldc_w 371
    //   418: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   421: aload 19
    //   423: invokevirtual 356	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   426: invokevirtual 357	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   429: astore 17
    //   431: goto -117 -> 314
    //   434: aload_0
    //   435: invokespecial 373	com/tencent/beacon/upload/i:d	()Lcom/tencent/beacon/upload/f;
    //   438: astore 21
    //   440: aload 21
    //   442: ifnonnull +27 -> 469
    //   445: ldc_w 375
    //   448: iconst_0
    //   449: anewarray 4	java/lang/Object
    //   452: invokestatic 232	com/tencent/beacon/d/a:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   455: aload_0
    //   456: iload 4
    //   458: iconst_m1
    //   459: lconst_0
    //   460: lconst_0
    //   461: iconst_0
    //   462: ldc_w 377
    //   465: invokespecial 342	com/tencent/beacon/upload/i:a	(IIJJZLjava/lang/String;)V
    //   468: return
    //   469: aload_0
    //   470: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   473: invokestatic 380	com/tencent/beacon/a/f:k	(Landroid/content/Context;)Ljava/lang/String;
    //   476: astore 18
    //   478: new 382	com/tencent/beacon/upload/e
    //   481: dup
    //   482: invokespecial 383	com/tencent/beacon/upload/e:<init>	()V
    //   485: astore 19
    //   487: invokestatic 389	com/tencent/beacon/a/d:m	()Lcom/tencent/beacon/a/d;
    //   490: invokevirtual 392	com/tencent/beacon/a/d:h	()J
    //   493: new 394	java/util/Date
    //   496: dup
    //   497: invokespecial 395	java/util/Date:<init>	()V
    //   500: invokevirtual 398	java/util/Date:getTime	()J
    //   503: ladd
    //   504: ldc2_w 399
    //   507: ldiv
    //   508: lstore 7
    //   510: aload 21
    //   512: aload 16
    //   514: aload 20
    //   516: aload 19
    //   518: aload_1
    //   519: invokevirtual 403	com/tencent/beacon/upload/f:a	(Ljava/lang/String;[BLcom/tencent/beacon/upload/e;Lcom/tencent/beacon/upload/a;)[B
    //   522: astore 17
    //   524: aload 17
    //   526: ifnonnull +1227 -> 1753
    //   529: iload 4
    //   531: bipush 100
    //   533: if_icmpne +1220 -> 1753
    //   536: ldc_w 405
    //   539: aload 16
    //   541: invokevirtual 336	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   544: ifne +1209 -> 1753
    //   547: aload 21
    //   549: ldc_w 405
    //   552: aload 20
    //   554: aload 19
    //   556: aload_1
    //   557: invokevirtual 403	com/tencent/beacon/upload/f:a	(Ljava/lang/String;[BLcom/tencent/beacon/upload/e;Lcom/tencent/beacon/upload/a;)[B
    //   560: astore 16
    //   562: aload 19
    //   564: invokevirtual 407	com/tencent/beacon/upload/e:a	()J
    //   567: lstore 9
    //   569: aload 19
    //   571: invokevirtual 409	com/tencent/beacon/upload/e:b	()J
    //   574: lstore 11
    //   576: aload 16
    //   578: invokestatic 411	com/tencent/beacon/upload/i:a	([B)Lcom/tencent/beacon/b/a/c;
    //   581: astore 16
    //   583: aload 16
    //   585: ifnull +1160 -> 1745
    //   588: aload 16
    //   590: getfield 412	com/tencent/beacon/b/a/c:b	I
    //   593: istore_3
    //   594: aload 16
    //   596: getfield 415	com/tencent/beacon/b/a/c:a	B
    //   599: istore_2
    //   600: iload_2
    //   601: ifne +143 -> 744
    //   604: iconst_1
    //   605: istore 13
    //   607: iload_3
    //   608: istore_2
    //   609: iload 13
    //   611: istore 14
    //   613: iload 13
    //   615: istore 15
    //   617: ldc_w 417
    //   620: iconst_2
    //   621: anewarray 4	java/lang/Object
    //   624: dup
    //   625: iconst_0
    //   626: aload 16
    //   628: getfield 412	com/tencent/beacon/b/a/c:b	I
    //   631: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   634: aastore
    //   635: dup
    //   636: iconst_1
    //   637: aload 16
    //   639: getfield 415	com/tencent/beacon/b/a/c:a	B
    //   642: invokestatic 422	java/lang/Byte:valueOf	(B)Ljava/lang/Byte;
    //   645: aastore
    //   646: invokestatic 101	com/tencent/beacon/d/a:b	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   649: goto +1118 -> 1767
    //   652: iload_3
    //   653: istore_2
    //   654: iload 13
    //   656: istore 14
    //   658: iload 13
    //   660: istore 15
    //   662: aload_0
    //   663: iload 4
    //   665: iload_3
    //   666: lload 9
    //   668: lload 11
    //   670: iload 13
    //   672: aconst_null
    //   673: invokespecial 342	com/tencent/beacon/upload/i:a	(IIJJZLjava/lang/String;)V
    //   676: iload_3
    //   677: istore_2
    //   678: iload 13
    //   680: istore 14
    //   682: iload 13
    //   684: istore 15
    //   686: iload 4
    //   688: lload 9
    //   690: iload 13
    //   692: lload 7
    //   694: aload 19
    //   696: invokevirtual 424	com/tencent/beacon/upload/e:d	()J
    //   699: l2i
    //   700: aload_1
    //   701: invokevirtual 426	com/tencent/beacon/upload/a:f	()I
    //   704: aload 18
    //   706: aload 19
    //   708: invokevirtual 427	com/tencent/beacon/upload/e:e	()Ljava/lang/String;
    //   711: aload 19
    //   713: invokevirtual 428	com/tencent/beacon/upload/e:c	()I
    //   716: new 348	java/lang/StringBuilder
    //   719: dup
    //   720: invokespecial 363	java/lang/StringBuilder:<init>	()V
    //   723: aload 16
    //   725: getfield 415	com/tencent/beacon/b/a/c:a	B
    //   728: invokevirtual 431	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   731: invokevirtual 357	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   734: invokestatic 433	com/tencent/beacon/upload/i:a	(IJZJIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    //   737: aload_1
    //   738: iload 13
    //   740: invokevirtual 301	com/tencent/beacon/upload/a:b	(Z)V
    //   743: return
    //   744: iconst_0
    //   745: istore 13
    //   747: goto -140 -> 607
    //   750: iload_3
    //   751: istore_2
    //   752: iload 13
    //   754: istore 14
    //   756: iload 13
    //   758: istore 15
    //   760: invokestatic 389	com/tencent/beacon/a/d:m	()Lcom/tencent/beacon/a/d;
    //   763: astore 17
    //   765: aload 17
    //   767: ifnull +128 -> 895
    //   770: iload_3
    //   771: istore_2
    //   772: iload 13
    //   774: istore 14
    //   776: iload 13
    //   778: istore 15
    //   780: aload 16
    //   782: getfield 434	com/tencent/beacon/b/a/c:d	Ljava/lang/String;
    //   785: ifnull +26 -> 811
    //   788: iload_3
    //   789: istore_2
    //   790: iload 13
    //   792: istore 14
    //   794: iload 13
    //   796: istore 15
    //   798: aload 17
    //   800: aload 16
    //   802: getfield 434	com/tencent/beacon/b/a/c:d	Ljava/lang/String;
    //   805: invokevirtual 332	java/lang/String:trim	()Ljava/lang/String;
    //   808: invokevirtual 435	com/tencent/beacon/a/d:b	(Ljava/lang/String;)V
    //   811: iload_3
    //   812: istore_2
    //   813: iload 13
    //   815: istore 14
    //   817: iload 13
    //   819: istore 15
    //   821: new 394	java/util/Date
    //   824: dup
    //   825: invokespecial 395	java/util/Date:<init>	()V
    //   828: astore 20
    //   830: iload_3
    //   831: istore_2
    //   832: iload 13
    //   834: istore 14
    //   836: iload 13
    //   838: istore 15
    //   840: aload 17
    //   842: aload 16
    //   844: getfield 438	com/tencent/beacon/b/a/c:e	J
    //   847: aload 20
    //   849: invokevirtual 398	java/util/Date:getTime	()J
    //   852: lsub
    //   853: invokevirtual 441	com/tencent/beacon/a/d:a	(J)V
    //   856: iload_3
    //   857: istore_2
    //   858: iload 13
    //   860: istore 14
    //   862: iload 13
    //   864: istore 15
    //   866: ldc_w 443
    //   869: iconst_2
    //   870: anewarray 4	java/lang/Object
    //   873: dup
    //   874: iconst_0
    //   875: aload 17
    //   877: invokevirtual 445	com/tencent/beacon/a/d:g	()Ljava/lang/String;
    //   880: aastore
    //   881: dup
    //   882: iconst_1
    //   883: aload 17
    //   885: invokevirtual 392	com/tencent/beacon/a/d:h	()J
    //   888: invokestatic 450	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   891: aastore
    //   892: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   895: iload_3
    //   896: istore_2
    //   897: iload 13
    //   899: istore 14
    //   901: iload 13
    //   903: istore 15
    //   905: aload 16
    //   907: getfield 412	com/tencent/beacon/b/a/c:b	I
    //   910: bipush 101
    //   912: if_icmpeq +43 -> 955
    //   915: iload_3
    //   916: istore_2
    //   917: iload 13
    //   919: istore 14
    //   921: iload 13
    //   923: istore 15
    //   925: aload 16
    //   927: getfield 412	com/tencent/beacon/b/a/c:b	I
    //   930: bipush 103
    //   932: if_icmpeq +23 -> 955
    //   935: iload_3
    //   936: istore_2
    //   937: iload 13
    //   939: istore 14
    //   941: iload 13
    //   943: istore 15
    //   945: aload 16
    //   947: getfield 412	com/tencent/beacon/b/a/c:b	I
    //   950: bipush 105
    //   952: if_icmpne +112 -> 1064
    //   955: iload_3
    //   956: istore_2
    //   957: iload 13
    //   959: istore 14
    //   961: iload 13
    //   963: istore 15
    //   965: aload_0
    //   966: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   969: invokestatic 455	com/tencent/beacon/a/b/b:a	(Landroid/content/Context;)Lcom/tencent/beacon/a/b/b;
    //   972: invokevirtual 457	com/tencent/beacon/a/b/b:e	()Lcom/tencent/beacon/a/b/d;
    //   975: astore 17
    //   977: aload 17
    //   979: ifnull +85 -> 1064
    //   982: iload_3
    //   983: istore_2
    //   984: iload 13
    //   986: istore 14
    //   988: iload 13
    //   990: istore 15
    //   992: aload 17
    //   994: invokevirtual 459	com/tencent/beacon/a/b/d:m	()Ljava/lang/String;
    //   997: ifnull +47 -> 1044
    //   1000: iload_3
    //   1001: istore_2
    //   1002: iload 13
    //   1004: istore 14
    //   1006: iload 13
    //   1008: istore 15
    //   1010: aload 16
    //   1012: getfield 461	com/tencent/beacon/b/a/c:f	Ljava/lang/String;
    //   1015: ifnull +49 -> 1064
    //   1018: iload_3
    //   1019: istore_2
    //   1020: iload 13
    //   1022: istore 14
    //   1024: iload 13
    //   1026: istore 15
    //   1028: aload 17
    //   1030: invokevirtual 459	com/tencent/beacon/a/b/d:m	()Ljava/lang/String;
    //   1033: aload 16
    //   1035: getfield 461	com/tencent/beacon/b/a/c:f	Ljava/lang/String;
    //   1038: invokevirtual 336	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1041: ifne +23 -> 1064
    //   1044: iload_3
    //   1045: istore_2
    //   1046: iload 13
    //   1048: istore 14
    //   1050: iload 13
    //   1052: istore 15
    //   1054: aload 17
    //   1056: aload 16
    //   1058: getfield 461	com/tencent/beacon/b/a/c:f	Ljava/lang/String;
    //   1061: invokevirtual 462	com/tencent/beacon/a/b/d:b	(Ljava/lang/String;)V
    //   1064: iload_3
    //   1065: istore_2
    //   1066: iload 13
    //   1068: istore 14
    //   1070: iload 13
    //   1072: istore 15
    //   1074: aload 16
    //   1076: getfield 465	com/tencent/beacon/b/a/c:c	[B
    //   1079: astore 17
    //   1081: aload 17
    //   1083: ifnonnull +135 -> 1218
    //   1086: iload_3
    //   1087: istore_2
    //   1088: iload 13
    //   1090: istore 14
    //   1092: iload 13
    //   1094: istore 15
    //   1096: ldc_w 467
    //   1099: iconst_0
    //   1100: anewarray 4	java/lang/Object
    //   1103: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1106: goto -454 -> 652
    //   1109: astore 16
    //   1111: iload 14
    //   1113: istore 13
    //   1115: aload 19
    //   1117: invokevirtual 407	com/tencent/beacon/upload/e:a	()J
    //   1120: lstore 9
    //   1122: aload 19
    //   1124: invokevirtual 409	com/tencent/beacon/upload/e:b	()J
    //   1127: lstore 11
    //   1129: aload 16
    //   1131: invokevirtual 468	java/lang/Throwable:toString	()Ljava/lang/String;
    //   1134: ldc_w 470
    //   1137: ldc_w 327
    //   1140: invokevirtual 474	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   1143: astore 17
    //   1145: aload_0
    //   1146: iload 4
    //   1148: iload_2
    //   1149: lload 9
    //   1151: lload 11
    //   1153: iconst_0
    //   1154: aload 17
    //   1156: invokespecial 342	com/tencent/beacon/upload/i:a	(IIJJZLjava/lang/String;)V
    //   1159: iload 4
    //   1161: lload 9
    //   1163: iconst_0
    //   1164: lload 7
    //   1166: aload 19
    //   1168: invokevirtual 424	com/tencent/beacon/upload/e:d	()J
    //   1171: l2i
    //   1172: aload_1
    //   1173: invokevirtual 426	com/tencent/beacon/upload/a:f	()I
    //   1176: aload 18
    //   1178: aload 19
    //   1180: invokevirtual 427	com/tencent/beacon/upload/e:e	()Ljava/lang/String;
    //   1183: aload 19
    //   1185: invokevirtual 428	com/tencent/beacon/upload/e:c	()I
    //   1188: aload 17
    //   1190: invokestatic 433	com/tencent/beacon/upload/i:a	(IJZJIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    //   1193: ldc_w 476
    //   1196: iconst_1
    //   1197: anewarray 4	java/lang/Object
    //   1200: dup
    //   1201: iconst_0
    //   1202: aload 16
    //   1204: invokevirtual 468	java/lang/Throwable:toString	()Ljava/lang/String;
    //   1207: aastore
    //   1208: invokestatic 232	com/tencent/beacon/d/a:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1211: aload_1
    //   1212: iload 13
    //   1214: invokevirtual 301	com/tencent/beacon/upload/a:b	(Z)V
    //   1217: return
    //   1218: iload_3
    //   1219: istore_2
    //   1220: iload 13
    //   1222: istore 14
    //   1224: iload 13
    //   1226: istore 15
    //   1228: aload_0
    //   1229: invokespecial 478	com/tencent/beacon/upload/i:e	()Landroid/util/SparseArray;
    //   1232: astore 20
    //   1234: aload 20
    //   1236: ifnull +21 -> 1257
    //   1239: iload_3
    //   1240: istore_2
    //   1241: iload 13
    //   1243: istore 14
    //   1245: iload 13
    //   1247: istore 15
    //   1249: aload 20
    //   1251: invokevirtual 284	android/util/SparseArray:size	()I
    //   1254: ifgt +37 -> 1291
    //   1257: iload_3
    //   1258: istore_2
    //   1259: iload 13
    //   1261: istore 14
    //   1263: iload 13
    //   1265: istore 15
    //   1267: ldc_w 480
    //   1270: iconst_0
    //   1271: anewarray 4	java/lang/Object
    //   1274: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1277: goto -625 -> 652
    //   1280: astore 16
    //   1282: aload_1
    //   1283: iload 15
    //   1285: invokevirtual 301	com/tencent/beacon/upload/a:b	(Z)V
    //   1288: aload 16
    //   1290: athrow
    //   1291: iload_3
    //   1292: istore_2
    //   1293: iload 13
    //   1295: istore 14
    //   1297: iload 13
    //   1299: istore 15
    //   1301: aload_1
    //   1302: invokevirtual 298	com/tencent/beacon/upload/a:c	()I
    //   1305: istore 5
    //   1307: iload_3
    //   1308: istore_2
    //   1309: iload 13
    //   1311: istore 14
    //   1313: iload 13
    //   1315: istore 15
    //   1317: aload 16
    //   1319: getfield 412	com/tencent/beacon/b/a/c:b	I
    //   1322: istore 6
    //   1324: iload_3
    //   1325: istore_2
    //   1326: iload 13
    //   1328: istore 14
    //   1330: iload 13
    //   1332: istore 15
    //   1334: aload 16
    //   1336: getfield 415	com/tencent/beacon/b/a/c:a	B
    //   1339: ifne +143 -> 1482
    //   1342: iload 5
    //   1344: ifle +138 -> 1482
    //   1347: iload 5
    //   1349: iconst_5
    //   1350: if_icmpgt +132 -> 1482
    //   1353: iload_3
    //   1354: istore_2
    //   1355: iload 13
    //   1357: istore 14
    //   1359: iload 13
    //   1361: istore 15
    //   1363: new 200	com/tencent/beacon/d/b
    //   1366: dup
    //   1367: aload_0
    //   1368: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   1371: invokespecial 203	com/tencent/beacon/d/b:<init>	(Landroid/content/Context;)V
    //   1374: astore 21
    //   1376: iload_3
    //   1377: istore_2
    //   1378: iload 13
    //   1380: istore 14
    //   1382: iload 13
    //   1384: istore 15
    //   1386: ldc_w 327
    //   1389: aload_0
    //   1390: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   1393: invokestatic 195	com/tencent/beacon/a/j:a	(Landroid/content/Context;)Lcom/tencent/beacon/a/j;
    //   1396: invokevirtual 482	com/tencent/beacon/a/j:b	()Ljava/lang/String;
    //   1399: invokevirtual 336	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1402: ifeq +80 -> 1482
    //   1405: iload_3
    //   1406: istore_2
    //   1407: iload 13
    //   1409: istore 14
    //   1411: iload 13
    //   1413: istore 15
    //   1415: invokestatic 69	com/tencent/beacon/a/b/d:a	()Lcom/tencent/beacon/a/b/d;
    //   1418: invokevirtual 485	com/tencent/beacon/a/b/d:j	()Z
    //   1421: ifne +61 -> 1482
    //   1424: iload_3
    //   1425: istore_2
    //   1426: iload 13
    //   1428: istore 14
    //   1430: iload 13
    //   1432: istore 15
    //   1434: new 487	com/tencent/beacon/upload/d
    //   1437: dup
    //   1438: aload_0
    //   1439: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   1442: invokespecial 488	com/tencent/beacon/upload/d:<init>	(Landroid/content/Context;)V
    //   1445: astore 22
    //   1447: iload_3
    //   1448: istore_2
    //   1449: iload 13
    //   1451: istore 14
    //   1453: iload 13
    //   1455: istore 15
    //   1457: invokestatic 491	com/tencent/beacon/a/b/b:c	()Lcom/tencent/beacon/upload/h;
    //   1460: aload 22
    //   1462: invokeinterface 493 2 0
    //   1467: iload_3
    //   1468: istore_2
    //   1469: iload 13
    //   1471: istore 14
    //   1473: iload 13
    //   1475: istore 15
    //   1477: aload 21
    //   1479: invokevirtual 495	com/tencent/beacon/d/b:c	()V
    //   1482: iload 6
    //   1484: ifne +295 -> 1779
    //   1487: iload_3
    //   1488: istore_2
    //   1489: iload 13
    //   1491: istore 14
    //   1493: iload 13
    //   1495: istore 15
    //   1497: ldc_w 497
    //   1500: iconst_0
    //   1501: anewarray 4	java/lang/Object
    //   1504: invokestatic 117	com/tencent/beacon/d/a:h	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1507: goto -855 -> 652
    //   1510: iload_3
    //   1511: istore_2
    //   1512: iload 13
    //   1514: istore 14
    //   1516: iload 13
    //   1518: istore 15
    //   1520: ldc_w 499
    //   1523: iconst_1
    //   1524: anewarray 4	java/lang/Object
    //   1527: dup
    //   1528: iconst_0
    //   1529: iload 5
    //   1531: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1534: aastore
    //   1535: invokestatic 173	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1538: goto -886 -> 652
    //   1541: iload 6
    //   1543: bipush 101
    //   1545: if_icmpeq +134 -> 1679
    //   1548: iload_3
    //   1549: istore_2
    //   1550: iload 13
    //   1552: istore 14
    //   1554: iload 13
    //   1556: istore 15
    //   1558: ldc_w 501
    //   1561: iconst_2
    //   1562: anewarray 4	java/lang/Object
    //   1565: dup
    //   1566: iconst_0
    //   1567: iload 5
    //   1569: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1572: aastore
    //   1573: dup
    //   1574: iconst_1
    //   1575: iload 6
    //   1577: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1580: aastore
    //   1581: invokestatic 173	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1584: goto -932 -> 652
    //   1587: iload 6
    //   1589: bipush 105
    //   1591: if_icmpeq +88 -> 1679
    //   1594: iload_3
    //   1595: istore_2
    //   1596: iload 13
    //   1598: istore 14
    //   1600: iload 13
    //   1602: istore 15
    //   1604: ldc_w 501
    //   1607: iconst_2
    //   1608: anewarray 4	java/lang/Object
    //   1611: dup
    //   1612: iconst_0
    //   1613: iload 5
    //   1615: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1618: aastore
    //   1619: dup
    //   1620: iconst_1
    //   1621: iload 6
    //   1623: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1626: aastore
    //   1627: invokestatic 173	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1630: goto -978 -> 652
    //   1633: iload 6
    //   1635: bipush 103
    //   1637: if_icmpeq +42 -> 1679
    //   1640: iload_3
    //   1641: istore_2
    //   1642: iload 13
    //   1644: istore 14
    //   1646: iload 13
    //   1648: istore 15
    //   1650: ldc_w 503
    //   1653: iconst_2
    //   1654: anewarray 4	java/lang/Object
    //   1657: dup
    //   1658: iconst_0
    //   1659: iload 5
    //   1661: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1664: aastore
    //   1665: dup
    //   1666: iconst_1
    //   1667: iload 6
    //   1669: invokestatic 171	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1672: aastore
    //   1673: invokestatic 173	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1676: goto -1024 -> 652
    //   1679: iload_3
    //   1680: istore_2
    //   1681: iload 13
    //   1683: istore 14
    //   1685: iload 13
    //   1687: istore 15
    //   1689: aload_0
    //   1690: aload 20
    //   1692: iload 6
    //   1694: aload 17
    //   1696: invokespecial 505	com/tencent/beacon/upload/i:a	(Landroid/util/SparseArray;I[B)Z
    //   1699: pop
    //   1700: goto -1048 -> 652
    //   1703: astore 16
    //   1705: iconst_0
    //   1706: istore 15
    //   1708: goto -426 -> 1282
    //   1711: astore 16
    //   1713: iload 13
    //   1715: istore 15
    //   1717: goto -435 -> 1282
    //   1720: astore 16
    //   1722: iconst_m1
    //   1723: istore_2
    //   1724: iconst_0
    //   1725: istore 13
    //   1727: goto -612 -> 1115
    //   1730: astore 16
    //   1732: iconst_0
    //   1733: istore 13
    //   1735: iload_3
    //   1736: istore_2
    //   1737: goto -622 -> 1115
    //   1740: astore 21
    //   1742: goto -260 -> 1482
    //   1745: iconst_m1
    //   1746: istore_3
    //   1747: iconst_0
    //   1748: istore 13
    //   1750: goto +17 -> 1767
    //   1753: aload 17
    //   1755: astore 16
    //   1757: goto -1195 -> 562
    //   1760: aload 18
    //   1762: astore 16
    //   1764: goto -1423 -> 341
    //   1767: aload_1
    //   1768: ifnull -1116 -> 652
    //   1771: aload 16
    //   1773: ifnonnull -1023 -> 750
    //   1776: goto -1124 -> 652
    //   1779: iload 5
    //   1781: lookupswitch	default:+35->1816, 4:+-194->1587, 100:+-240->1541, 102:+-148->1633
    //   1816: goto -306 -> 1510
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1819	0	this	i
    //   0	1819	1	paramA	a
    //   599	1138	2	i	int
    //   593	1154	3	j	int
    //   140	1020	4	k	int
    //   1305	475	5	m	int
    //   1322	371	6	n	int
    //   508	657	7	l1	long
    //   567	595	9	l2	long
    //   574	578	11	l3	long
    //   605	1144	13	bool1	boolean
    //   611	1073	14	bool2	boolean
    //   615	1101	15	bool3	boolean
    //   217	858	16	localObject1	Object
    //   1109	94	16	localThrowable1	Throwable
    //   1280	55	16	localObject2	Object
    //   1703	1	16	localObject3	Object
    //   1711	1	16	localObject4	Object
    //   1720	1	16	localThrowable2	Throwable
    //   1730	1	16	localThrowable3	Throwable
    //   1755	17	16	localObject5	Object
    //   214	1540	17	localObject6	Object
    //   146	1615	18	str	String
    //   247	937	19	localObject7	Object
    //   208	1483	20	localObject8	Object
    //   438	1040	21	localObject9	Object
    //   1740	1	21	localException	Exception
    //   1445	16	22	localD	d
    // Exception table:
    //   from	to	target	type
    //   617	649	1109	java/lang/Throwable
    //   662	676	1109	java/lang/Throwable
    //   686	737	1109	java/lang/Throwable
    //   760	765	1109	java/lang/Throwable
    //   780	788	1109	java/lang/Throwable
    //   798	811	1109	java/lang/Throwable
    //   821	830	1109	java/lang/Throwable
    //   840	856	1109	java/lang/Throwable
    //   866	895	1109	java/lang/Throwable
    //   905	915	1109	java/lang/Throwable
    //   925	935	1109	java/lang/Throwable
    //   945	955	1109	java/lang/Throwable
    //   965	977	1109	java/lang/Throwable
    //   992	1000	1109	java/lang/Throwable
    //   1010	1018	1109	java/lang/Throwable
    //   1028	1044	1109	java/lang/Throwable
    //   1054	1064	1109	java/lang/Throwable
    //   1074	1081	1109	java/lang/Throwable
    //   1096	1106	1109	java/lang/Throwable
    //   1228	1234	1109	java/lang/Throwable
    //   1249	1257	1109	java/lang/Throwable
    //   1267	1277	1109	java/lang/Throwable
    //   1301	1307	1109	java/lang/Throwable
    //   1317	1324	1109	java/lang/Throwable
    //   1334	1342	1109	java/lang/Throwable
    //   1363	1376	1109	java/lang/Throwable
    //   1386	1405	1109	java/lang/Throwable
    //   1415	1424	1109	java/lang/Throwable
    //   1434	1447	1109	java/lang/Throwable
    //   1457	1467	1109	java/lang/Throwable
    //   1477	1482	1109	java/lang/Throwable
    //   1497	1507	1109	java/lang/Throwable
    //   1520	1538	1109	java/lang/Throwable
    //   1558	1584	1109	java/lang/Throwable
    //   1604	1630	1109	java/lang/Throwable
    //   1650	1676	1109	java/lang/Throwable
    //   1689	1700	1109	java/lang/Throwable
    //   617	649	1280	finally
    //   662	676	1280	finally
    //   686	737	1280	finally
    //   760	765	1280	finally
    //   780	788	1280	finally
    //   798	811	1280	finally
    //   821	830	1280	finally
    //   840	856	1280	finally
    //   866	895	1280	finally
    //   905	915	1280	finally
    //   925	935	1280	finally
    //   945	955	1280	finally
    //   965	977	1280	finally
    //   992	1000	1280	finally
    //   1010	1018	1280	finally
    //   1028	1044	1280	finally
    //   1054	1064	1280	finally
    //   1074	1081	1280	finally
    //   1096	1106	1280	finally
    //   1228	1234	1280	finally
    //   1249	1257	1280	finally
    //   1267	1277	1280	finally
    //   1301	1307	1280	finally
    //   1317	1324	1280	finally
    //   1334	1342	1280	finally
    //   1363	1376	1280	finally
    //   1386	1405	1280	finally
    //   1415	1424	1280	finally
    //   1434	1447	1280	finally
    //   1457	1467	1280	finally
    //   1477	1482	1280	finally
    //   1497	1507	1280	finally
    //   1520	1538	1280	finally
    //   1558	1584	1280	finally
    //   1604	1630	1280	finally
    //   1650	1676	1280	finally
    //   1689	1700	1280	finally
    //   510	524	1703	finally
    //   536	562	1703	finally
    //   562	583	1703	finally
    //   588	594	1703	finally
    //   594	600	1703	finally
    //   1115	1211	1711	finally
    //   510	524	1720	java/lang/Throwable
    //   536	562	1720	java/lang/Throwable
    //   562	583	1720	java/lang/Throwable
    //   588	594	1720	java/lang/Throwable
    //   594	600	1730	java/lang/Throwable
    //   1386	1405	1740	java/lang/Exception
    //   1415	1424	1740	java/lang/Exception
    //   1434	1447	1740	java/lang/Exception
    //   1457	1467	1740	java/lang/Exception
    //   1477	1482	1740	java/lang/Exception
  }
  
  public final void a(boolean paramBoolean)
  {
    try
    {
      g = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final boolean a()
  {
    try
    {
      boolean bool = f;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final boolean a(UploadHandleListener paramUploadHandleListener)
  {
    boolean bool;
    if (paramUploadHandleListener == null) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      try
      {
        if (!c.contains(paramUploadHandleListener)) {
          c.add(paramUploadHandleListener);
        }
        bool = true;
      }
      finally {}
    }
  }
  
  public final boolean a(g paramG)
  {
    boolean bool;
    if (paramG == null) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      try
      {
        b.append(101, paramG);
        bool = true;
      }
      finally {}
    }
  }
  
  /* Error */
  public final boolean b()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 44	com/tencent/beacon/upload/i:e	Landroid/content/Context;
    //   6: invokestatic 518	com/tencent/beacon/a/f:s	(Landroid/content/Context;)Z
    //   9: istore_1
    //   10: iload_1
    //   11: ifeq +9 -> 20
    //   14: iconst_1
    //   15: istore_1
    //   16: aload_0
    //   17: monitorexit
    //   18: iload_1
    //   19: ireturn
    //   20: aload_0
    //   21: getfield 48	com/tencent/beacon/upload/i:g	Z
    //   24: istore_1
    //   25: goto -9 -> 16
    //   28: astore_2
    //   29: aload_0
    //   30: monitorexit
    //   31: aload_2
    //   32: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	33	0	this	i
    //   9	16	1	bool	boolean
    //   28	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	10	28	finally
    //   20	25	28	finally
  }
}
