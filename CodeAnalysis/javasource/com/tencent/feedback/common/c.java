package com.tencent.feedback.common;

import android.content.Context;
import com.tencent.feedback.proguard.o;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class c
{
  private static c E = null;
  private boolean A = true;
  private String B = null;
  private List<o> C;
  private Boolean D = null;
  private final long F;
  private int G = -1;
  private int H = -1;
  private Map<String, String> I = new HashMap();
  private Map<String, String> J = new HashMap();
  private final Object K = new Object();
  private final Object L = new Object();
  private final Object M = new Object();
  private final Object N = new Object();
  private final Object O = new Object();
  private final Object P = new Object();
  private final Object Q = new Object();
  private final Object R = new Object();
  private final Object S = new Object();
  private final Context a;
  private final byte b;
  private String c;
  private String d;
  private final String e;
  private final String f;
  private final String g;
  private final String h;
  private final String i;
  private String j = "10000";
  private String k = "unknown";
  private long l = 0L;
  private String m = "";
  private String n = null;
  private String o = null;
  private String p = null;
  private String q = null;
  private String r = null;
  private String s = null;
  private String t = null;
  private long u = -1L;
  private long v = -1L;
  private long w = -1L;
  private String x = null;
  private String y = null;
  private Map<String, PlugInInfo> z = null;
  
  private c(Context paramContext)
  {
    new Object();
    e.b("rqdp{  init cominfo}", new Object[0]);
    Object localObject;
    if (paramContext == null) {
      localObject = paramContext;
    }
    for (;;)
    {
      a = ((Context)localObject);
      d.a(a);
      b = 1;
      c = a.b(paramContext);
      d = a.c(paramContext);
      e = "1.9.8.9";
      f = d.l();
      g = d.a();
      h = ("Android " + d.b() + ",level " + d.c());
      new StringBuilder().append(g).append(";").append(h).toString();
      F = new Date().getTime();
      i = a.i(a);
      return;
      Context localContext = paramContext.getApplicationContext();
      localObject = localContext;
      if (localContext == null) {
        localObject = paramContext;
      }
    }
  }
  
  private boolean N()
  {
    try
    {
      boolean bool = A;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static c a(Context paramContext)
  {
    try
    {
      if (E == null) {
        E = new c(paramContext);
      }
      paramContext = E;
      return paramContext;
    }
    finally {}
  }
  
  private void b(boolean paramBoolean)
  {
    try
    {
      A = false;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final List<o> A()
  {
    try
    {
      List localList = C;
      return localList;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String B()
  {
    try
    {
      String str = d;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final boolean C()
  {
    synchronized (S)
    {
      if (D == null) {
        D = Boolean.valueOf(h.a(a).a());
      }
      boolean bool = D.booleanValue();
      return bool;
    }
  }
  
  public final long D()
  {
    return F;
  }
  
  public final String E()
  {
    return i;
  }
  
  public final int F()
  {
    try
    {
      int i1 = G;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final int G()
  {
    try
    {
      int i1 = H;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final Map<String, String> H()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 126	com/tencent/feedback/common/c:I	Ljava/util/Map;
    //   6: invokeinterface 263 1 0
    //   11: istore_1
    //   12: iload_1
    //   13: ifgt +9 -> 22
    //   16: aconst_null
    //   17: astore_2
    //   18: aload_0
    //   19: monitorexit
    //   20: aload_2
    //   21: areturn
    //   22: new 123	java/util/HashMap
    //   25: dup
    //   26: aload_0
    //   27: getfield 126	com/tencent/feedback/common/c:I	Ljava/util/Map;
    //   30: invokespecial 266	java/util/HashMap:<init>	(Ljava/util/Map;)V
    //   33: astore_2
    //   34: goto -16 -> 18
    //   37: astore_2
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_2
    //   41: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	42	0	this	c
    //   11	2	1	i1	int
    //   17	17	2	localObject1	Object
    //   37	4	2	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   2	12	37	finally
    //   22	34	37	finally
  }
  
  public final int I()
  {
    try
    {
      int i1 = I.size();
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final Set<String> J()
  {
    try
    {
      Set localSet = I.keySet();
      return localSet;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final Map<String, String> K()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 128	com/tencent/feedback/common/c:J	Ljava/util/Map;
    //   6: invokeinterface 263 1 0
    //   11: istore_1
    //   12: iload_1
    //   13: ifgt +9 -> 22
    //   16: aconst_null
    //   17: astore_2
    //   18: aload_0
    //   19: monitorexit
    //   20: aload_2
    //   21: areturn
    //   22: new 123	java/util/HashMap
    //   25: dup
    //   26: aload_0
    //   27: getfield 128	com/tencent/feedback/common/c:J	Ljava/util/Map;
    //   30: invokespecial 266	java/util/HashMap:<init>	(Ljava/util/Map;)V
    //   33: astore_2
    //   34: goto -16 -> 18
    //   37: astore_2
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_2
    //   41: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	42	0	this	c
    //   11	2	1	i1	int
    //   17	17	2	localObject1	Object
    //   37	4	2	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   2	12	37	finally
    //   22	34	37	finally
  }
  
  public final int L()
  {
    try
    {
      int i1 = J.size();
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final Set<String> M()
  {
    try
    {
      Set localSet = J.keySet();
      return localSet;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final byte a()
  {
    return 1;
  }
  
  public final void a(int paramInt)
  {
    try
    {
      int i1 = G;
      if (i1 != paramInt)
      {
        G = paramInt;
        e.a("user scene tag %d changed to tag %d", new Object[] { Integer.valueOf(i1), Integer.valueOf(G) });
      }
      return;
    }
    finally {}
  }
  
  public final void a(long paramLong)
  {
    try
    {
      l = paramLong;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final void a(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: ifnull +24 -> 27
    //   6: aload_1
    //   7: invokevirtual 289	java/lang/String:trim	()Ljava/lang/String;
    //   10: invokevirtual 292	java/lang/String:length	()I
    //   13: ifeq +14 -> 27
    //   16: aload_1
    //   17: ldc 71
    //   19: invokevirtual 296	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   22: istore_2
    //   23: iload_2
    //   24: ifeq +6 -> 30
    //   27: aload_0
    //   28: monitorexit
    //   29: return
    //   30: aload_0
    //   31: aload_1
    //   32: putfield 73	com/tencent/feedback/common/c:j	Ljava/lang/String;
    //   35: goto -8 -> 27
    //   38: astore_1
    //   39: aload_0
    //   40: monitorexit
    //   41: aload_1
    //   42: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	43	0	this	c
    //   0	43	1	paramString	String
    //   22	2	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   6	23	38	finally
    //   30	35	38	finally
  }
  
  public final void a(String paramString1, String paramString2)
  {
    int i2 = 0;
    if (paramString1 != null) {}
    for (;;)
    {
      int i1;
      try
      {
        if (paramString1.trim().length() > 0)
        {
          i1 = 0;
          if (i1 == 0)
          {
            if ((paramString2 != null) && (paramString2.trim().length() > 0))
            {
              i1 = i2;
              break label123;
            }
          }
          else {
            e.c("key&value should not be empty %s %s", new Object[] { paramString1, paramString2 });
          }
        }
        else
        {
          i1 = 1;
          continue;
        }
        i1 = 1;
      }
      finally {}
      I.put(paramString1, paramString2);
      continue;
      label123:
      if (i1 == 0) {}
    }
  }
  
  public final void a(List<o> paramList)
  {
    try
    {
      C = paramList;
      return;
    }
    finally
    {
      paramList = finally;
      throw paramList;
    }
  }
  
  public final void a(boolean paramBoolean)
  {
    synchronized (S)
    {
      D = Boolean.valueOf(paramBoolean);
      return;
    }
  }
  
  public final boolean a(String paramString1, String paramString2, String paramString3)
  {
    boolean bool = true;
    if ((paramString1 == null) || (paramString2 == null) || (paramString3 == null)) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      try
      {
        if (z == null) {
          z = new HashMap();
        }
        z.put(paramString1, new PlugInInfo(paramString1, paramString2, paramString3));
        e.a("add %s %s %s", new Object[] { paramString1, paramString2, paramString3 });
      }
      finally {}
    }
  }
  
  public final String b()
  {
    try
    {
      String str = c;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void b(String paramString)
  {
    try
    {
      m = paramString;
      if (paramString != null) {
        b(false);
      }
      return;
    }
    finally {}
  }
  
  public final String c()
  {
    return e;
  }
  
  public final void c(String paramString)
  {
    try
    {
      k = paramString;
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
    return f;
  }
  
  public final void d(String paramString)
  {
    synchronized (L)
    {
      p = paramString;
      return;
    }
  }
  
  public final String e()
  {
    return g;
  }
  
  public final void e(String paramString)
  {
    synchronized (M)
    {
      q = paramString;
      return;
    }
  }
  
  public final String f()
  {
    return h;
  }
  
  /* Error */
  public final void f(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: ifnull +12 -> 15
    //   6: aload_0
    //   7: getfield 111	com/tencent/feedback/common/c:z	Ljava/util/Map;
    //   10: astore_2
    //   11: aload_2
    //   12: ifnonnull +6 -> 18
    //   15: aload_0
    //   16: monitorexit
    //   17: return
    //   18: aload_0
    //   19: getfield 111	com/tencent/feedback/common/c:z	Ljava/util/Map;
    //   22: aload_1
    //   23: invokeinterface 321 2 0
    //   28: pop
    //   29: goto -14 -> 15
    //   32: astore_1
    //   33: aload_0
    //   34: monitorexit
    //   35: aload_1
    //   36: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	37	0	this	c
    //   0	37	1	paramString	String
    //   10	2	2	localMap	Map
    // Exception table:
    //   from	to	target	type
    //   6	11	32	finally
    //   18	29	32	finally
  }
  
  public final String g()
  {
    try
    {
      String str = j;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void g(String paramString)
  {
    B = paramString;
  }
  
  /* Error */
  public final String h()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 83	com/tencent/feedback/common/c:m	Ljava/lang/String;
    //   6: ifnull +13 -> 19
    //   9: aload_0
    //   10: getfield 83	com/tencent/feedback/common/c:m	Ljava/lang/String;
    //   13: invokevirtual 292	java/lang/String:length	()I
    //   16: ifne +12 -> 28
    //   19: aload_0
    //   20: invokevirtual 323	com/tencent/feedback/common/c:o	()Ljava/lang/String;
    //   23: astore_1
    //   24: aload_0
    //   25: monitorexit
    //   26: aload_1
    //   27: areturn
    //   28: aload_0
    //   29: getfield 83	com/tencent/feedback/common/c:m	Ljava/lang/String;
    //   32: astore_1
    //   33: goto -9 -> 24
    //   36: astore_1
    //   37: aload_0
    //   38: monitorexit
    //   39: aload_1
    //   40: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	41	0	this	c
    //   23	10	1	str	String
    //   36	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	19	36	finally
    //   19	24	36	finally
    //   28	33	36	finally
  }
  
  public final void h(String paramString)
  {
    try
    {
      d = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public final String i()
  {
    try
    {
      String str = k;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void i(String paramString)
  {
    try
    {
      c = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public final long j()
  {
    try
    {
      long l1 = l;
      return l1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final String j(String paramString)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_1
    //   5: ifnull +51 -> 56
    //   8: aload_1
    //   9: invokevirtual 289	java/lang/String:trim	()Ljava/lang/String;
    //   12: invokevirtual 292	java/lang/String:length	()I
    //   15: ifle +41 -> 56
    //   18: iload_2
    //   19: ifeq +42 -> 61
    //   22: ldc_w 326
    //   25: iconst_1
    //   26: anewarray 4	java/lang/Object
    //   29: dup
    //   30: iconst_0
    //   31: new 188	java/lang/StringBuilder
    //   34: dup
    //   35: invokespecial 209	java/lang/StringBuilder:<init>	()V
    //   38: aload_1
    //   39: invokevirtual 199	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokevirtual 206	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   45: aastore
    //   46: invokestatic 301	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   49: pop
    //   50: aconst_null
    //   51: astore_1
    //   52: aload_0
    //   53: monitorexit
    //   54: aload_1
    //   55: areturn
    //   56: iconst_1
    //   57: istore_2
    //   58: goto -40 -> 18
    //   61: aload_0
    //   62: getfield 126	com/tencent/feedback/common/c:I	Ljava/util/Map;
    //   65: aload_1
    //   66: invokeinterface 321 2 0
    //   71: checkcast 286	java/lang/String
    //   74: astore_1
    //   75: goto -23 -> 52
    //   78: astore_1
    //   79: aload_0
    //   80: monitorexit
    //   81: aload_1
    //   82: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	83	0	this	c
    //   0	83	1	paramString	String
    //   1	57	2	i1	int
    // Exception table:
    //   from	to	target	type
    //   8	18	78	finally
    //   22	50	78	finally
    //   61	75	78	finally
  }
  
  public final String k()
  {
    synchronized (K)
    {
      if (n == null) {
        n = a.d(a);
      }
      String str = n;
      return str;
    }
  }
  
  /* Error */
  public final String k(String paramString)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_1
    //   5: ifnull +51 -> 56
    //   8: aload_1
    //   9: invokevirtual 289	java/lang/String:trim	()Ljava/lang/String;
    //   12: invokevirtual 292	java/lang/String:length	()I
    //   15: ifle +41 -> 56
    //   18: iload_2
    //   19: ifeq +42 -> 61
    //   22: ldc_w 326
    //   25: iconst_1
    //   26: anewarray 4	java/lang/Object
    //   29: dup
    //   30: iconst_0
    //   31: new 188	java/lang/StringBuilder
    //   34: dup
    //   35: invokespecial 209	java/lang/StringBuilder:<init>	()V
    //   38: aload_1
    //   39: invokevirtual 199	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokevirtual 206	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   45: aastore
    //   46: invokestatic 301	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   49: pop
    //   50: aconst_null
    //   51: astore_1
    //   52: aload_0
    //   53: monitorexit
    //   54: aload_1
    //   55: areturn
    //   56: iconst_1
    //   57: istore_2
    //   58: goto -40 -> 18
    //   61: aload_0
    //   62: getfield 126	com/tencent/feedback/common/c:I	Ljava/util/Map;
    //   65: aload_1
    //   66: invokeinterface 331 2 0
    //   71: checkcast 286	java/lang/String
    //   74: astore_1
    //   75: goto -23 -> 52
    //   78: astore_1
    //   79: aload_0
    //   80: monitorexit
    //   81: aload_1
    //   82: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	83	0	this	c
    //   0	83	1	paramString	String
    //   1	57	2	i1	int
    // Exception table:
    //   from	to	target	type
    //   8	18	78	finally
    //   22	50	78	finally
    //   61	75	78	finally
  }
  
  public final String l()
  {
    synchronized (L)
    {
      if (p == null) {
        p = a.h(a);
      }
      String str = p;
      return str;
    }
  }
  
  /* Error */
  public final String l(String paramString)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_1
    //   5: ifnull +51 -> 56
    //   8: aload_1
    //   9: invokevirtual 289	java/lang/String:trim	()Ljava/lang/String;
    //   12: invokevirtual 292	java/lang/String:length	()I
    //   15: ifle +41 -> 56
    //   18: iload_2
    //   19: ifeq +42 -> 61
    //   22: ldc_w 326
    //   25: iconst_1
    //   26: anewarray 4	java/lang/Object
    //   29: dup
    //   30: iconst_0
    //   31: new 188	java/lang/StringBuilder
    //   34: dup
    //   35: invokespecial 209	java/lang/StringBuilder:<init>	()V
    //   38: aload_1
    //   39: invokevirtual 199	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokevirtual 206	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   45: aastore
    //   46: invokestatic 301	com/tencent/feedback/common/e:c	(Ljava/lang/String;[Ljava/lang/Object;)Z
    //   49: pop
    //   50: aconst_null
    //   51: astore_1
    //   52: aload_0
    //   53: monitorexit
    //   54: aload_1
    //   55: areturn
    //   56: iconst_1
    //   57: istore_2
    //   58: goto -40 -> 18
    //   61: aload_0
    //   62: getfield 128	com/tencent/feedback/common/c:J	Ljava/util/Map;
    //   65: aload_1
    //   66: invokeinterface 331 2 0
    //   71: checkcast 286	java/lang/String
    //   74: astore_1
    //   75: goto -23 -> 52
    //   78: astore_1
    //   79: aload_0
    //   80: monitorexit
    //   81: aload_1
    //   82: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	83	0	this	c
    //   0	83	1	paramString	String
    //   1	57	2	i1	int
    // Exception table:
    //   from	to	target	type
    //   8	18	78	finally
    //   22	50	78	finally
    //   61	75	78	finally
  }
  
  public final boolean m()
  {
    synchronized (L)
    {
      if (p != null)
      {
        bool = true;
        return bool;
      }
      boolean bool = false;
    }
  }
  
  public final String n()
  {
    synchronized (M)
    {
      if (q == null)
      {
        q = a.a(a);
        if ((q == null) || (q.equals(""))) {
          q = c;
        }
      }
      String str = q;
      return str;
    }
  }
  
  public final String o()
  {
    if (!N()) {
      return "";
    }
    synchronized (N)
    {
      if (o == null)
      {
        d.a(a);
        o = d.b(a);
      }
      String str = o;
      return str;
    }
  }
  
  public final String p()
  {
    if (!N()) {
      return "";
    }
    synchronized (O)
    {
      if (r == null)
      {
        d.a(a);
        r = d.e(a);
      }
      String str = r;
      return str;
    }
  }
  
  public final String q()
  {
    if (!N()) {
      return "";
    }
    synchronized (P)
    {
      if (s == null)
      {
        d.a(a);
        s = d.c(a);
      }
      String str = s;
      return str;
    }
  }
  
  public final String r()
  {
    if (!N()) {
      return "";
    }
    synchronized (Q)
    {
      if (t == null)
      {
        d.a(a);
        t = d.d(a);
      }
      String str = t;
      return str;
    }
  }
  
  public final long s()
  {
    synchronized (R)
    {
      if (u <= 0L)
      {
        d.a(a);
        u = d.e();
      }
      long l1 = u;
      return l1;
    }
  }
  
  public final long t()
  {
    synchronized (R)
    {
      if (v <= 0L)
      {
        d.a(a);
        v = d.g();
      }
      long l1 = v;
      return l1;
    }
  }
  
  public final long u()
  {
    synchronized (R)
    {
      if (w <= 0L) {
        w = d.a(a).i();
      }
      long l1 = w;
      return l1;
    }
  }
  
  public final String v()
  {
    try
    {
      if (x == null)
      {
        d.a(a);
        x = d.d();
      }
      String str = x;
      return str;
    }
    finally {}
  }
  
  public final String w()
  {
    try
    {
      if (y == null) {
        y = d.a(a).m();
      }
      String str = y;
      return str;
    }
    finally {}
  }
  
  public final Map<String, PlugInInfo> x()
  {
    try
    {
      Map localMap = z;
      return localMap;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final Map<String, PlugInInfo> y()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 111	com/tencent/feedback/common/c:z	Ljava/util/Map;
    //   6: ifnull +17 -> 23
    //   9: aload_0
    //   10: getfield 111	com/tencent/feedback/common/c:z	Ljava/util/Map;
    //   13: invokeinterface 263 1 0
    //   18: istore_1
    //   19: iload_1
    //   20: ifgt +9 -> 29
    //   23: aconst_null
    //   24: astore_2
    //   25: aload_0
    //   26: monitorexit
    //   27: aload_2
    //   28: areturn
    //   29: new 123	java/util/HashMap
    //   32: dup
    //   33: aload_0
    //   34: getfield 111	com/tencent/feedback/common/c:z	Ljava/util/Map;
    //   37: invokeinterface 263 1 0
    //   42: invokespecial 355	java/util/HashMap:<init>	(I)V
    //   45: astore_2
    //   46: aload_2
    //   47: aload_0
    //   48: getfield 111	com/tencent/feedback/common/c:z	Ljava/util/Map;
    //   51: invokeinterface 358 2 0
    //   56: goto -31 -> 25
    //   59: astore_2
    //   60: aload_0
    //   61: monitorexit
    //   62: aload_2
    //   63: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	64	0	this	c
    //   18	2	1	i1	int
    //   24	23	2	localObject1	Object
    //   59	4	2	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   2	19	59	finally
    //   29	56	59	finally
  }
  
  public final String z()
  {
    if (B == null)
    {
      d.a(a);
      B = d.k();
    }
    return B;
  }
}
