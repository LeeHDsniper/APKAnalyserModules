package com.tencent.beacon.a.b;

import android.content.Context;
import android.util.SparseArray;
import com.tencent.beacon.upload.g;
import com.tencent.beacon.upload.h;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public final class b
{
  private static b c = null;
  protected d a = null;
  protected Context b = null;
  private boolean d = false;
  private int e = 0;
  private g f = null;
  private Runnable g = null;
  private List<a> h = new ArrayList(5);
  private SparseArray<h> i = new SparseArray(5);
  private List<e> j = new ArrayList(5);
  private SparseArray<f> k = new SparseArray(2);
  private boolean l = false;
  private Runnable m = new Runnable()
  {
    public final void run()
    {
      if ((b != null) && (a != null)) {
        a.a(b);
      }
    }
  };
  
  private b(Context paramContext)
  {
    b = paramContext;
    a = d.a();
    com.tencent.beacon.a.c.a().a(m);
    f = new g(paramContext);
    g = new c(paramContext);
    com.tencent.beacon.a.c.a().a(g);
  }
  
  public static b a(Context paramContext)
  {
    try
    {
      if ((c == null) && (paramContext != null)) {
        c = new b(paramContext);
      }
      paramContext = c;
      return paramContext;
    }
    finally {}
  }
  
  /* Error */
  public static h c()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 40	com/tencent/beacon/a/b/b:c	Lcom/tencent/beacon/a/b/b;
    //   6: ifnull +15 -> 21
    //   9: getstatic 40	com/tencent/beacon/a/b/b:c	Lcom/tencent/beacon/a/b/b;
    //   12: invokespecial 105	com/tencent/beacon/a/b/b:k	()Lcom/tencent/beacon/upload/h;
    //   15: astore_0
    //   16: ldc 2
    //   18: monitorexit
    //   19: aload_0
    //   20: areturn
    //   21: aconst_null
    //   22: astore_0
    //   23: goto -7 -> 16
    //   26: astore_0
    //   27: ldc 2
    //   29: monitorexit
    //   30: aload_0
    //   31: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   15	8	0	localH	h
    //   26	5	0	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	16	26	finally
  }
  
  /* Error */
  private h k()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 69	com/tencent/beacon/a/b/b:i	Landroid/util/SparseArray;
    //   6: ifnull +29 -> 35
    //   9: aload_0
    //   10: getfield 69	com/tencent/beacon/a/b/b:i	Landroid/util/SparseArray;
    //   13: invokevirtual 109	android/util/SparseArray:size	()I
    //   16: ifle +19 -> 35
    //   19: aload_0
    //   20: getfield 69	com/tencent/beacon/a/b/b:i	Landroid/util/SparseArray;
    //   23: iconst_0
    //   24: invokevirtual 113	android/util/SparseArray:get	(I)Ljava/lang/Object;
    //   27: checkcast 115	com/tencent/beacon/upload/h
    //   30: astore_1
    //   31: aload_0
    //   32: monitorexit
    //   33: aload_1
    //   34: areturn
    //   35: aconst_null
    //   36: astore_1
    //   37: goto -6 -> 31
    //   40: astore_1
    //   41: aload_0
    //   42: monitorexit
    //   43: aload_1
    //   44: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	45	0	this	b
    //   30	7	1	localH	h
    //   40	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	31	40	finally
  }
  
  /* Error */
  private e[] l()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 71	com/tencent/beacon/a/b/b:j	Ljava/util/List;
    //   6: ifnull +36 -> 42
    //   9: aload_0
    //   10: getfield 71	com/tencent/beacon/a/b/b:j	Ljava/util/List;
    //   13: invokeinterface 119 1 0
    //   18: ifle +24 -> 42
    //   21: aload_0
    //   22: getfield 71	com/tencent/beacon/a/b/b:j	Ljava/util/List;
    //   25: iconst_0
    //   26: anewarray 121	com/tencent/beacon/a/b/e
    //   29: invokeinterface 125 2 0
    //   34: checkcast 127	[Lcom/tencent/beacon/a/b/e;
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
    //   0	52	0	this	b
    //   37	7	1	arrayOfE	e[]
    //   47	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	38	47	finally
  }
  
  private SparseArray<f> m()
  {
    try
    {
      SparseArray localSparseArray = k;
      return localSparseArray;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(int paramInt)
  {
    try
    {
      e = paramInt;
      com.tencent.beacon.d.a.f("step:%d", new Object[] { Integer.valueOf(paramInt) });
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final void a(int paramInt, h paramH)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 69	com/tencent/beacon/a/b/b:i	Landroid/util/SparseArray;
    //   6: ifnull +15 -> 21
    //   9: aload_2
    //   10: ifnonnull +14 -> 24
    //   13: aload_0
    //   14: getfield 69	com/tencent/beacon/a/b/b:i	Landroid/util/SparseArray;
    //   17: iload_1
    //   18: invokevirtual 147	android/util/SparseArray:remove	(I)V
    //   21: aload_0
    //   22: monitorexit
    //   23: return
    //   24: aload_0
    //   25: getfield 69	com/tencent/beacon/a/b/b:i	Landroid/util/SparseArray;
    //   28: iload_1
    //   29: aload_2
    //   30: invokevirtual 151	android/util/SparseArray:put	(ILjava/lang/Object;)V
    //   33: aload_2
    //   34: aload_0
    //   35: invokevirtual 154	com/tencent/beacon/a/b/b:f	()Lcom/tencent/beacon/upload/g;
    //   38: invokeinterface 157 2 0
    //   43: pop
    //   44: goto -23 -> 21
    //   47: astore_2
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_2
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	b
    //   0	52	1	paramInt	int
    //   0	52	2	paramH	h
    // Exception table:
    //   from	to	target	type
    //   2	9	47	finally
    //   13	21	47	finally
    //   24	44	47	finally
  }
  
  public final void a(int paramInt, Map<String, String> paramMap)
  {
    Object localObject = m();
    if (localObject != null)
    {
      localObject = (f)((SparseArray)localObject).get(paramInt);
      if (localObject != null) {
        ((f)localObject).a(paramMap);
      }
    }
  }
  
  public final void a(a paramA)
  {
    if (paramA == null) {}
    for (;;)
    {
      return;
      try
      {
        if (h == null) {
          h = new ArrayList();
        }
        if (h.contains(paramA)) {
          continue;
        }
        h.add(paramA);
        final int n = j();
        if (g())
        {
          com.tencent.beacon.d.a.e("add listener should notify app first run! %s", new Object[] { paramA.toString() });
          com.tencent.beacon.a.c.a().a(new Runnable()
          {
            public final void run()
            {
              c();
            }
          });
        }
        if (n < 2) {
          continue;
        }
        com.tencent.beacon.d.a.e("add listener should notify app start query! %s", new Object[] { paramA.toString() });
        com.tencent.beacon.a.c.a().a(new Runnable()
        {
          public final void run()
          {
            a();
            if (n >= 3)
            {
              com.tencent.beacon.d.a.e("query finished should notify", new Object[0]);
              b();
            }
          }
        });
      }
      finally {}
    }
  }
  
  public final void a(d paramD)
  {
    e[] arrayOfE = l();
    if (arrayOfE != null)
    {
      int i1 = arrayOfE.length;
      int n = 0;
      for (;;)
      {
        if (n < i1)
        {
          e localE = arrayOfE[n];
          try
          {
            localE.a(paramD);
            n += 1;
          }
          catch (Throwable localThrowable)
          {
            for (;;)
            {
              com.tencent.beacon.d.a.a(localThrowable);
              com.tencent.beacon.d.a.d("com strategy changed error %s", new Object[] { localThrowable.toString() });
            }
          }
        }
      }
    }
  }
  
  public final void a(e paramE)
  {
    if (paramE != null) {}
    try
    {
      if ((j != null) && (!j.contains(paramE))) {
        j.add(paramE);
      }
      return;
    }
    finally
    {
      paramE = finally;
      throw paramE;
    }
  }
  
  public final void a(f paramF)
  {
    if (paramF != null) {}
    try
    {
      if (k != null) {
        k.put(1, paramF);
      }
      return;
    }
    finally
    {
      paramF = finally;
      throw paramF;
    }
  }
  
  public final boolean a()
  {
    try
    {
      boolean bool = l;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void b()
  {
    try
    {
      l = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final Runnable d()
  {
    try
    {
      Runnable localRunnable = g;
      return localRunnable;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final d e()
  {
    try
    {
      d localD = a;
      return localD;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final g f()
  {
    try
    {
      g localG = f;
      return localG;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final boolean g()
  {
    try
    {
      boolean bool = d;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  protected final void h()
  {
    try
    {
      d = true;
      com.tencent.beacon.d.a.f("isFirst }%b", new Object[] { Boolean.valueOf(true) });
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final a[] i()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 64	com/tencent/beacon/a/b/b:h	Ljava/util/List;
    //   6: ifnull +36 -> 42
    //   9: aload_0
    //   10: getfield 64	com/tencent/beacon/a/b/b:h	Ljava/util/List;
    //   13: invokeinterface 119 1 0
    //   18: ifle +24 -> 42
    //   21: aload_0
    //   22: getfield 64	com/tencent/beacon/a/b/b:h	Ljava/util/List;
    //   25: iconst_0
    //   26: anewarray 223	com/tencent/beacon/a/b/a
    //   29: invokeinterface 125 2 0
    //   34: checkcast 225	[Lcom/tencent/beacon/a/b/a;
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
    //   0	52	0	this	b
    //   37	7	1	arrayOfA	a[]
    //   47	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	38	47	finally
  }
  
  public final int j()
  {
    try
    {
      int n = e;
      return n;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
