package com.tencent.beacon.a;

import android.content.Context;
import com.tencent.beacon.d.a;
import com.tencent.beacon.event.UserAction;

public final class d
{
  private static d m = null;
  private Context a = null;
  private String b = "";
  private String c = "";
  private byte d = -1;
  private String e = "";
  private String f = "";
  private String g = "";
  private String h = "";
  private String i = "";
  private long j = 0L;
  private String k = "";
  private String l = "";
  
  private d() {}
  
  public static void a(Context paramContext)
  {
    if (paramContext != null) {}
    for (;;)
    {
      try
      {
        if (m == null) {
          m = new d();
        }
        synchronized (m)
        {
          a.e("init cominfo", new Object[0]);
          ma = paramContext;
          f.a(paramContext);
          mb = f.b();
          mc = f.a();
          m.n();
          m.d(b.e(paramContext));
          m.a(b.f(paramContext));
          m.e("beacon");
          m.f("2.3.4");
          m.b("unknown");
          m.g(f.b(paramContext));
          paramContext = b.a(paramContext);
          if (!"".equals(paramContext))
          {
            m.c(paramContext);
            return;
          }
          if ((UserAction.getAppkey() != null) && (!"".equals(UserAction.getAppkey()))) {
            m.c(UserAction.getAppkey());
          }
        }
        m.c(m.o());
      }
      finally {}
    }
  }
  
  private void d(String paramString)
  {
    try
    {
      e = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  private void e(String paramString)
  {
    try
    {
      g = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  private void f(String paramString)
  {
    try
    {
      h = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  /* Error */
  private void g(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: ldc 34
    //   4: aload_1
    //   5: invokevirtual 114	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   8: istore_2
    //   9: iload_2
    //   10: ifne +14 -> 24
    //   13: aload_0
    //   14: getfield 32	com/tencent/beacon/a/d:a	Landroid/content/Context;
    //   17: ldc -128
    //   19: aload_1
    //   20: invokestatic 131	com/tencent/beacon/a/b:a	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    //   23: pop
    //   24: aload_0
    //   25: aload_1
    //   26: putfield 54	com/tencent/beacon/a/d:k	Ljava/lang/String;
    //   29: aload_0
    //   30: monitorexit
    //   31: return
    //   32: astore_1
    //   33: aload_0
    //   34: monitorexit
    //   35: aload_1
    //   36: athrow
    //   37: astore_3
    //   38: goto -14 -> 24
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	41	0	this	d
    //   0	41	1	paramString	String
    //   8	2	2	bool	boolean
    //   37	1	3	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   2	9	32	finally
    //   13	24	32	finally
    //   24	29	32	finally
    //   13	24	37	java/lang/Exception
  }
  
  public static d m()
  {
    try
    {
      d localD = m;
      return localD;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void n()
  {
    try
    {
      d = 1;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private String o()
  {
    try
    {
      String str = e;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String a()
  {
    return b;
  }
  
  public final void a(long paramLong)
  {
    try
    {
      j = paramLong;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(String paramString)
  {
    try
    {
      f = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public final String b()
  {
    return c;
  }
  
  public final void b(String paramString)
  {
    try
    {
      i = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public final byte c()
  {
    try
    {
      byte b1 = d;
      return b1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void c(String paramString)
  {
    try
    {
      l = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public final String d()
  {
    try
    {
      String str = f;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String e()
  {
    try
    {
      String str = g;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String f()
  {
    try
    {
      String str = h;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String g()
  {
    try
    {
      String str = i;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final long h()
  {
    try
    {
      long l1 = j;
      return l1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final String i()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: ldc 34
    //   4: aload_0
    //   5: getfield 54	com/tencent/beacon/a/d:k	Ljava/lang/String;
    //   8: invokevirtual 114	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   11: istore_1
    //   12: iload_1
    //   13: ifeq +18 -> 31
    //   16: aload_0
    //   17: aload_0
    //   18: getfield 32	com/tencent/beacon/a/d:a	Landroid/content/Context;
    //   21: ldc -128
    //   23: ldc 34
    //   25: invokestatic 138	com/tencent/beacon/a/b:b	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   28: putfield 54	com/tencent/beacon/a/d:k	Ljava/lang/String;
    //   31: aload_0
    //   32: getfield 54	com/tencent/beacon/a/d:k	Ljava/lang/String;
    //   35: astore_2
    //   36: aload_0
    //   37: monitorexit
    //   38: aload_2
    //   39: areturn
    //   40: astore_2
    //   41: aload_0
    //   42: monitorexit
    //   43: aload_2
    //   44: athrow
    //   45: astore_2
    //   46: goto -15 -> 31
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	49	0	this	d
    //   11	2	1	bool	boolean
    //   35	4	2	str	String
    //   40	4	2	localObject	Object
    //   45	1	2	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   2	12	40	finally
    //   16	31	40	finally
    //   31	36	40	finally
    //   16	31	45	java/lang/Exception
  }
  
  public final String j()
  {
    try
    {
      String str = l;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void k() {}
  
  public final Context l()
  {
    try
    {
      Context localContext = a;
      return localContext;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
