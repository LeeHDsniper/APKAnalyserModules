package com.tencent.feedback.proguard;

import android.content.Context;
import com.tencent.feedback.common.b;
import com.tencent.feedback.common.c;
import com.tencent.feedback.common.g;
import com.tencent.feedback.upload.d;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public final class u
  implements Runnable
{
  private static long a = 0L;
  private Context b = null;
  
  public u(Context paramContext)
  {
    b = paramContext;
  }
  
  private static long a()
  {
    try
    {
      long l = a;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static void a(long paramLong)
  {
    try
    {
      a = paramLong;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void a(long paramLong1, long paramLong2)
  {
    com.tencent.feedback.upload.e localE = t.a();
    Object localObject = y.a(b, b.b(), localE);
    boolean bool = ((y)localObject).b();
    if (!bool) {
      ((y)localObject).a(60000L);
    }
    if (new Date().getTime() < paramLong1 + paramLong2)
    {
      com.tencent.feedback.common.e.a("lastUpdate:%d ,return not query", new Object[] { Long.valueOf(paramLong1) });
      return;
    }
    int i = 0;
    for (;;)
    {
      if (localE == null)
      {
        i += 1;
        if (i < 5)
        {
          com.tencent.feedback.common.e.b("rqdp{  wait uphandler:} %d", new Object[] { Integer.valueOf(200) });
          try
          {
            Thread.sleep(200L);
            localE = t.a();
          }
          catch (InterruptedException localInterruptedException1)
          {
            for (;;)
            {
              if (!com.tencent.feedback.common.e.a(localInterruptedException1)) {
                localInterruptedException1.printStackTrace();
              }
            }
          }
        }
      }
    }
    if ((localInterruptedException1 != null) && (g.b(b)))
    {
      if ((!bool) && (((y)localObject).b(c.a(b).E()) <= 0)) {
        com.tencent.feedback.common.e.b("rqdp{  wait lanch record:} %d", new Object[] { Integer.valueOf(500) });
      }
      try
      {
        Thread.sleep(500L);
        localObject = A.a(b, (y)localObject, (byte)2);
        if (localObject != null) {
          com.tencent.feedback.common.e.c("create uPkg fail!", new Object[0]);
        }
        localInterruptedException1.a(new v(b, 1111, 540, (S)localObject));
        return;
      }
      catch (InterruptedException localInterruptedException2)
      {
        for (;;)
        {
          if (!com.tencent.feedback.common.e.a(localInterruptedException2)) {
            localInterruptedException2.printStackTrace();
          }
        }
      }
    }
    com.tencent.feedback.common.e.a("rqdp{  no uphandler or offline ,not query!!}", new Object[0]);
  }
  
  private long b()
  {
    z localZ = a.a(b, 510);
    if ((localZ != null) && (localZ.b() == 510) && (localZ.c() != null)) {
      try
      {
        d localD = t.a(b).c();
        if (localD != null)
        {
          localD.a(510, localZ.c(), false);
          com.tencent.feedback.common.e.b("rqdp{  common strategy setted by history}", new Object[0]);
        }
        long l = localZ.d();
        return l;
      }
      catch (Throwable localThrowable)
      {
        if (!com.tencent.feedback.common.e.a(localThrowable)) {
          localThrowable.printStackTrace();
        }
      }
    }
    return -1L;
  }
  
  private void c()
  {
    com.tencent.feedback.common.e.a("rqdp{  AppFirstRun } %s", new Object[] { c.a(b).k() });
    com.tencent.feedback.common.e.a("rqdp{  clear ao count} %d", new Object[] { Integer.valueOf(l.a(b, null, -1L, Long.MAX_VALUE, -1, -1)) });
    synchronized (t.a(b))
    {
      s[] arrayOfS = ???.d();
      t.a(b).a(true);
      if (arrayOfS != null)
      {
        int j = arrayOfS.length;
        int i = 0;
        if (i < j)
        {
          arrayOfS[i].f();
          i += 1;
        }
      }
    }
  }
  
  public final void run()
  {
    long l2 = b();
    t localT = t.a(b);
    Object localObject1 = localT.b();
    long l1;
    String str1;
    boolean bool;
    if (localObject1 == null)
    {
      l1 = -1L;
      if (localT.e() == 0)
      {
        com.tencent.feedback.common.e.a("rqdp{  onlaunch}", new Object[0]);
        localT.a(1);
        str1 = com.tencent.feedback.common.a.a(b, c.a(b).b());
        if ((str1 != null) && (str1.trim().length() != 0)) {
          break label206;
        }
        com.tencent.feedback.common.e.d("not found apk %s", new Object[] { str1 });
        bool = false;
        label108:
        if (!bool) {
          break label830;
        }
        c();
      }
    }
    int j;
    int i;
    for (;;)
    {
      com.tencent.feedback.common.e.b("rqdp{  on Query Start}", new Object[0]);
      label206:
      try
      {
        localObject1 = localT.d();
        localT.a(2);
        if (localObject1 == null) {
          break label887;
        }
        com.tencent.feedback.common.e.b("rqdp{  notify Query Start}", new Object[0]);
        j = localObject1.length;
        i = 0;
        while (i < j)
        {
          localObject1[i].d();
          i += 1;
        }
        l1 = ((w)localObject1).c() * 3600 * 1000;
      }
      finally {}
      localObject1 = new File(str1);
      if ((!((File)localObject1).exists()) || (!((File)localObject1).canRead()))
      {
        com.tencent.feedback.common.e.d("apk not exist or read %s", new Object[] { str1 });
        bool = false;
        break label108;
      }
      long l3 = ((File)localObject1).lastModified();
      long l4 = ((File)localObject1).length();
      String str2 = c.a(b).B();
      Object localObject5 = l.a(b, str1, 0, 10);
      Object localObject4 = null;
      localObject1 = localObject4;
      if (localObject5 != null)
      {
        localObject1 = localObject4;
        if (((List)localObject5).size() > 0) {
          localObject1 = (o)((List)localObject5).get(0);
        }
      }
      localObject4 = c.a(b);
      if (localObject1 == null)
      {
        localObject1 = new ArrayList();
        localObject5 = new o();
        ((o)localObject5).a(0);
        ((o)localObject5).a(str1);
        ((o)localObject5).b(((c)localObject4).l());
        ((o)localObject5).c(str2);
        ((o)localObject5).b(l3);
        ((o)localObject5).c(l4);
        ((List)localObject1).add(localObject5);
        l.c(b, (List)localObject1);
        com.tencent.feedback.common.e.a("new app %s ", new Object[] { ((o)localObject5).d() });
        bool = true;
        break label108;
      }
      if (((c)localObject4).m())
      {
        if (((c)localObject4).l().equals(((o)localObject1).d()))
        {
          bool = false;
          break label108;
        }
        l.d(b, (List)localObject5);
        localObject1 = new ArrayList();
        localObject5 = new o();
        ((o)localObject5).a(0);
        ((o)localObject5).a(str1);
        ((o)localObject5).b(((c)localObject4).l());
        ((o)localObject5).c(str2);
        ((o)localObject5).b(l3);
        ((o)localObject5).c(l4);
        ((List)localObject1).add(localObject5);
        l.c(b, (List)localObject1);
        com.tencent.feedback.common.e.a("new app %s ", new Object[] { ((o)localObject5).d() });
        bool = true;
        break label108;
      }
      if ((((o)localObject1).d() != null) && (str2.equals(((o)localObject1).f())) && (l3 == ((o)localObject1).b()) && (l4 == ((o)localObject1).c()))
      {
        c.a(b).d(((o)localObject1).d());
        bool = false;
        break label108;
      }
      localObject4 = c.a(b).l();
      if (localObject4 == null)
      {
        com.tencent.feedback.common.e.d("rqdp{  apkid get error!return false}", new Object[0]);
        bool = false;
        break label108;
      }
      bool = ((String)localObject4).equals(((o)localObject1).d());
      l.d(b, (List)localObject5);
      localObject1 = new ArrayList();
      localObject5 = new o();
      ((o)localObject5).a(0);
      ((o)localObject5).a(str1);
      ((o)localObject5).b((String)localObject4);
      ((o)localObject5).c(str2);
      ((o)localObject5).b(l3);
      ((o)localObject5).c(l4);
      ((List)localObject1).add(localObject5);
      l.c(b, (List)localObject1);
      com.tencent.feedback.common.e.a("is new :%b %s ", new Object[] { Boolean.valueOf(bool), ((o)localObject5).toString() });
      break label108;
      label830:
      l3 = a();
      if (l3 > 0L)
      {
        com.tencent.feedback.common.e.b("rqdp{  delay:} %d", new Object[] { Long.valueOf(l3) });
        try
        {
          Thread.sleep(l3);
        }
        catch (InterruptedException localInterruptedException) {}
        if (!com.tencent.feedback.common.e.a(localInterruptedException)) {
          localInterruptedException.printStackTrace();
        }
      }
    }
    label887:
    com.tencent.feedback.common.e.b("rqdp{  on query end!}", new Object[0]);
    try
    {
      s[] arrayOfS = localT.d();
      localT.a(3);
      if (arrayOfS != null)
      {
        com.tencent.feedback.common.e.b("rqdp{  notify Query end}", new Object[0]);
        j = arrayOfS.length;
        i = 0;
        while (i < j)
        {
          arrayOfS[i].e();
          i += 1;
        }
      }
    }
    finally {}
    tmp996_993[0] = Long.valueOf(l1);
    com.tencent.feedback.common.e.c("periodLimit %d return", tmp996_993);
    return;
    if (l1 > 0L)
    {
      b.b().a(this, l1);
      com.tencent.feedback.common.e.b("rqdp{  next time} %d", new Object[] { Long.valueOf(l1) });
      t.a(b).a(4);
      return;
    }
    com.tencent.feedback.common.e.b("rqdp{  stop loop query}", new Object[0]);
  }
}
