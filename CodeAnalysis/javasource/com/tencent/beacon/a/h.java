package com.tencent.beacon.a;

import android.content.Context;
import android.os.Process;
import com.tencent.beacon.d.a;
import com.tencent.beacon.upload.UploadHandleListener;
import com.tencent.beacon.upload.i;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public final class h
  implements UploadHandleListener
{
  private static h e = null;
  private static long f = 1073741824L;
  private static long g = 209715200L;
  private com.tencent.beacon.a.a.f a;
  private com.tencent.beacon.a.a.f b;
  private com.tencent.beacon.a.a.f c;
  private Context d = null;
  
  private h(Context paramContext)
  {
    d = paramContext;
    i.a(d).a(this);
    d();
    if (f() > 0) {
      g();
    }
  }
  
  private com.tencent.beacon.a.a.f a()
  {
    for (;;)
    {
      boolean bool;
      long l3;
      long l4;
      long l6;
      long l5;
      try
      {
        int i = Process.myUid();
        localObject = Class.forName("android.net.TrafficStats");
        if (localObject == null) {
          break label485;
        }
        l2 = ((Long)((Class)localObject).getMethod("getUidRxBytes", new Class[] { Integer.TYPE }).invoke(null, new Object[] { Integer.valueOf(i) })).longValue();
        l1 = ((Long)((Class)localObject).getMethod("getUidTxBytes", new Class[] { Integer.TYPE }).invoke(null, new Object[] { Integer.valueOf(i) })).longValue();
        e();
        if (c == null) {
          break label431;
        }
        if ((l2 == c.i) && (l1 == c.h)) {
          break label476;
        }
        bool = f.s(d);
        c.b = System.currentTimeMillis();
        l3 = 0L;
        l4 = 0L;
        l6 = 0L;
        l5 = 0L;
        if (l2 - c.i > 0L) {
          l3 = l2 - c.i;
        }
        if (l1 - c.h <= 0L) {
          break label493;
        }
        l4 = l1 - c.h;
      }
      catch (Exception localException)
      {
        Object localObject;
        a.a(localException);
        return null;
      }
      localObject = c;
      g = (l3 + g);
      localObject = c;
      f = (l4 + f);
      localObject = c;
      d = (l6 + d);
      localObject = c;
      e = (l5 + e);
      c.i = l2;
      c.h = l1;
      if ((c.g < f) && (c.f < g) && (c.d < f) && (c.e < f))
      {
        c(c);
        return c;
      }
      c.g = 0L;
      c.f = 0L;
      c.d = 0L;
      c.e = 0L;
      c(c);
      continue;
      label431:
      c = new com.tencent.beacon.a.a.f(2, System.currentTimeMillis(), 0L, 0L, 0L, 0L, 0L);
      c.i = l2;
      c.h = l1;
      c(c);
      label476:
      com.tencent.beacon.a.a.f localF = c;
      return localF;
      label485:
      long l1 = 0L;
      long l2 = 0L;
      continue;
      label493:
      if (bool) {
        l6 = l3 + l4;
      } else {
        l5 = l3 + l4;
      }
    }
  }
  
  public static h a(Context paramContext)
  {
    try
    {
      if (e == null) {
        e = new h(paramContext);
      }
      paramContext = e;
      return paramContext;
    }
    finally {}
  }
  
  private void a(long paramLong1, long paramLong2, boolean paramBoolean)
  {
    for (;;)
    {
      long l3;
      long l2;
      long l1;
      try
      {
        l3 = new Date().getTime();
        l2 = paramLong1 + paramLong2;
        if (paramBoolean)
        {
          l1 = l2;
          break label277;
          if (b == null)
          {
            b = new com.tencent.beacon.a.a.f(1, l3, 1L, l1, l2, paramLong1, paramLong2);
            if (a != null) {
              break label190;
            }
            a = new com.tencent.beacon.a.a.f(0, l3, 1L, l1, l2, paramLong1, paramLong2);
          }
        }
        else
        {
          l1 = 0L;
          break label277;
        }
        long l4 = b.a();
        b = new com.tencent.beacon.a.a.f(1, b.b, 1L + b.c, b.d + l1, b.e + l2, b.f + paramLong1, b.g + paramLong2);
        b.a(l4);
        continue;
        l3 = a.a();
      }
      finally {}
      label190:
      a = new com.tencent.beacon.a.a.f(0, a.b, a.c + 1L, l1 + a.d, l2 + a.e, a.f + paramLong1, a.g + paramLong2);
      a.a(l3);
      continue;
      label277:
      if (paramBoolean) {
        l2 = 0L;
      }
    }
  }
  
  public static void a(Context paramContext, com.tencent.beacon.a.a.f paramF)
  {
    g = 0L;
    f = 0L;
    d = 0L;
    e = 0L;
    a(paramContext).c(paramF);
  }
  
  private void a(com.tencent.beacon.a.a.f paramF)
  {
    try
    {
      a = paramF;
      return;
    }
    finally
    {
      paramF = finally;
      throw paramF;
    }
  }
  
  private com.tencent.beacon.a.a.f b()
  {
    try
    {
      com.tencent.beacon.a.a.f localF = a;
      return localF;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static com.tencent.beacon.a.a.f b(Context paramContext)
  {
    return a(paramContext).b();
  }
  
  private void b(com.tencent.beacon.a.a.f paramF)
  {
    try
    {
      b = paramF;
      return;
    }
    finally
    {
      paramF = finally;
      throw paramF;
    }
  }
  
  private com.tencent.beacon.a.a.f c()
  {
    try
    {
      f();
      com.tencent.beacon.a.a.f localF = b;
      return localF;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static com.tencent.beacon.a.a.f c(Context paramContext)
  {
    return a(paramContext).a();
  }
  
  private void c(com.tencent.beacon.a.a.f paramF)
  {
    try
    {
      ArrayList localArrayList = new ArrayList();
      if (paramF != null) {
        localArrayList.add(paramF);
      }
      if (localArrayList.size() > 0) {
        f.c(d, (com.tencent.beacon.a.a.f[])localArrayList.toArray(new com.tencent.beacon.a.a.f[localArrayList.size()]));
      }
      return;
    }
    finally {}
  }
  
  private void d()
  {
    for (;;)
    {
      com.tencent.beacon.a.a.f localF;
      try
      {
        Object localObject1 = f.m(d);
        if (localObject1 == null) {
          break;
        }
        localObject1 = ((List)localObject1).iterator();
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
        localF = (com.tencent.beacon.a.a.f)((Iterator)localObject1).next();
        if (a == 0)
        {
          a(localF);
          continue;
        }
        if (a != 1) {
          continue;
        }
      }
      finally {}
      b(localF);
    }
  }
  
  public static void d(Context paramContext)
  {
    a(paramContext).h();
  }
  
  private void e()
  {
    try
    {
      Object localObject1 = f.n(d);
      if (localObject1 != null)
      {
        localObject1 = ((List)localObject1).iterator();
        while (((Iterator)localObject1).hasNext()) {
          c = ((com.tencent.beacon.a.a.f)((Iterator)localObject1).next());
        }
      }
    }
    finally {}
  }
  
  public static void e(Context paramContext)
  {
    a(paramContext).i();
  }
  
  private int f()
  {
    for (;;)
    {
      try
      {
        long l1 = f.m();
        long l2 = new Date().getTime();
        int i = 0;
        if ((b == null) || (b.b < l1))
        {
          b = new com.tencent.beacon.a.a.f(1, l2, 0L, 0L, 0L, 0L, 0L);
          i = 1;
        }
        if (a == null)
        {
          a = new com.tencent.beacon.a.a.f(0, l2, 0L, 0L, 0L, 0L, 0L);
          i += 1;
          return i;
        }
      }
      finally {}
    }
  }
  
  public static com.tencent.beacon.a.a.f f(Context paramContext)
  {
    return a(paramContext).c();
  }
  
  private void g()
  {
    try
    {
      ArrayList localArrayList = new ArrayList();
      com.tencent.beacon.a.a.f localF = b();
      if (localF != null) {
        localArrayList.add(localF);
      }
      localF = c();
      if (localF != null) {
        localArrayList.add(localF);
      }
      if (localArrayList.size() > 0) {
        f.a(d, (com.tencent.beacon.a.a.f[])localArrayList.toArray(new com.tencent.beacon.a.a.f[localArrayList.size()]));
      }
      return;
    }
    finally {}
  }
  
  private void h()
  {
    try
    {
      long l = new Date().getTime();
      com.tencent.beacon.a.a.f localF = b();
      if ((localF != null) && (localF.a() >= 0L)) {
        f.b(d, new com.tencent.beacon.a.a.f[] { localF });
      }
      a(new com.tencent.beacon.a.a.f(0, l, 0L, 0L, 0L, 0L, 0L));
      return;
    }
    finally {}
  }
  
  private void i()
  {
    try
    {
      long l = new Date().getTime();
      com.tencent.beacon.a.a.f localF = c;
      if ((localF != null) && (localF.a() >= 0L)) {
        f.b(d, new com.tencent.beacon.a.a.f[] { localF });
      }
      a(new com.tencent.beacon.a.a.f(2, l, 0L, 0L, 0L, 0L, 0L));
      return;
    }
    finally {}
  }
  
  public final void onUploadEnd(int paramInt1, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, String paramString)
  {
    a.h(" req:%d  res:%d  send:%d  recv:%d  result: %b  msg:%s", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Long.valueOf(paramLong1), Long.valueOf(paramLong2), Boolean.valueOf(paramBoolean), paramString });
    if (paramInt1 != 5)
    {
      d();
      f();
      a(paramLong1, paramLong2, f.s(d));
      g();
      a.f(" [total:%s] \n[today:%s]", new Object[] { b(), c() });
    }
  }
}
