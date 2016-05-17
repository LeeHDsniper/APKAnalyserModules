package com.tencent.beacon.event;

import android.content.Context;
import android.os.Process;
import com.tencent.beacon.a.b.d.a;
import com.tencent.beacon.a.k;
import com.tencent.beacon.upload.InitHandleListener;
import com.tencent.beacon.upload.UploadHandleListener;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class o
  implements com.tencent.beacon.a.b.a, com.tencent.beacon.a.b.e, com.tencent.beacon.a.b.f
{
  private static o e = null;
  public g a = null;
  public final Context b;
  public a c = null;
  public com.tencent.beacon.c.b d = null;
  private j f = null;
  private j g = null;
  private boolean h = true;
  private boolean i = false;
  private com.tencent.beacon.upload.h j;
  private boolean k;
  private int l = 0;
  private InitHandleListener m = null;
  private List<e> n = null;
  private Object o = new Object();
  private Object p = new Object();
  
  private o(Context paramContext, com.tencent.beacon.upload.h paramH, UploadHandleListener paramUploadHandleListener, InitHandleListener paramInitHandleListener)
  {
    if (paramContext == null)
    {
      com.tencent.beacon.d.a.c(" the context is null! init UserActionRecord failed!", new Object[0]);
      b = null;
      return;
    }
    Context localContext = paramContext.getApplicationContext();
    if (localContext != null) {}
    for (b = localContext;; b = paramContext)
    {
      if (com.tencent.beacon.a.d.m() == null) {
        com.tencent.beacon.a.d.a(b);
      }
      if (n == null) {
        n = Collections.synchronizedList(new ArrayList(5));
      }
      j = paramH;
      if (paramH != null) {
        paramH.a(paramUploadHandleListener);
      }
      paramUploadHandleListener = com.tencent.beacon.a.b.b.a(b);
      paramUploadHandleListener.a(this);
      paramUploadHandleListener.a(this);
      paramUploadHandleListener.a(this);
      paramUploadHandleListener.a(0, paramH);
      paramUploadHandleListener.a(1, paramH);
      a = new g();
      f = new b(paramContext);
      g = new l(paramContext);
      h = true;
      m = paramInitHandleListener;
      d = new com.tencent.beacon.c.b(b);
      new com.tencent.beacon.a.e().a(b);
      return;
    }
  }
  
  public static o a(Context paramContext, com.tencent.beacon.upload.h paramH, UploadHandleListener paramUploadHandleListener, InitHandleListener paramInitHandleListener)
  {
    try
    {
      if (e == null)
      {
        com.tencent.beacon.d.a.e(" create ua instance ", new Object[0]);
        e = new o(paramContext, paramH, paramUploadHandleListener, paramInitHandleListener);
      }
      com.tencent.beacon.d.a.e(" return ua instance ", new Object[0]);
      paramContext = e;
      return paramContext;
    }
    finally {}
  }
  
  public static com.tencent.beacon.upload.h a(Context paramContext, boolean paramBoolean)
  {
    try
    {
      paramContext = com.tencent.beacon.upload.i.a(paramContext, paramBoolean);
      return paramContext;
    }
    finally
    {
      paramContext = finally;
      throw paramContext;
    }
  }
  
  private void a(int paramInt)
  {
    try
    {
      l = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static boolean a(String paramString, boolean paramBoolean1, long paramLong1, long paramLong2, Map<String, String> paramMap, boolean paramBoolean2, boolean paramBoolean3)
  {
    com.tencent.beacon.d.a.e(" onUA: %s,%b,%d,%d,%b,%b", new Object[] { paramString, Boolean.valueOf(paramBoolean1), Long.valueOf(paramLong1), Long.valueOf(paramLong2), Boolean.valueOf(paramBoolean2), Boolean.valueOf(paramBoolean3) });
    o localO = d();
    if ((localO != null) && (!localO.o()))
    {
      n.add(new e(paramString, paramBoolean1, paramLong1, paramLong2, paramMap, paramBoolean2));
      return true;
    }
    if (!k()) {
      return false;
    }
    if (a.a(paramString))
    {
      com.tencent.beacon.d.a.c("onUserAction return false, because eventName:[%s] is not allowed in server strategy!", new Object[] { paramString });
      return false;
    }
    j localJ;
    if ((!paramBoolean1) || ((paramBoolean1) && (a.b(paramString)))) {
      if (paramBoolean2) {
        localJ = localO.m();
      }
    }
    while (localJ != null)
    {
      return localJ.a(b.a(b, paramString, paramBoolean1, paramLong1, paramLong2, paramMap, paramBoolean2, paramBoolean3));
      localJ = localO.l();
      continue;
      com.tencent.beacon.d.a.c("onUserAction return false, because eventName:[%s] is sampled by svr rate!", new Object[] { paramString });
      return false;
    }
    return false;
  }
  
  public static boolean a(String paramString, boolean paramBoolean, long paramLong, Map<String, String> paramMap)
  {
    return a(paramString, paramBoolean, paramLong, 0L, paramMap, true, false);
  }
  
  public static void c(boolean paramBoolean)
  {
    Object localObject = d();
    if (localObject != null)
    {
      j localJ = ((o)localObject).l();
      if (localJ != null) {
        localJ.b(paramBoolean);
      }
      localObject = ((o)localObject).m();
      if (localObject != null) {
        ((j)localObject).b(paramBoolean);
      }
    }
  }
  
  public static o d()
  {
    try
    {
      o localO = e;
      return localO;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static boolean d(boolean paramBoolean)
  {
    o localO = d();
    if (localO == null) {
      com.tencent.beacon.d.a.c(" ua module not ready!", new Object[0]);
    }
    while (!k()) {
      return false;
    }
    return localO.e(paramBoolean);
  }
  
  public static void e()
  {
    o localO = d();
    if ((localO != null) && (b != null))
    {
      com.tencent.beacon.upload.i.a(b, false);
      HashMap localHashMap = new HashMap();
      com.tencent.beacon.a.f.a(b);
      localHashMap.put("A33", com.tencent.beacon.a.f.l(b));
      a("rqd_appexited", true, 0L, 0L, localHashMap, false, false);
    }
    for (;;)
    {
      if (localO != null) {
        localO.f(false);
      }
      return;
      com.tencent.beacon.d.a.d("onAppExited:ua is null", new Object[0]);
    }
  }
  
  private void f(boolean paramBoolean)
  {
    synchronized (p)
    {
      if (paramBoolean != g())
      {
        j localJ = l();
        if (localJ != null) {
          localJ.a(paramBoolean);
        }
        localJ = m();
        if (localJ != null) {
          localJ.a(paramBoolean);
        }
        k = paramBoolean;
      }
      return;
    }
  }
  
  private static boolean k()
  {
    o localO = d();
    if (localO == null)
    {
      com.tencent.beacon.d.a.d("isModuleAble:not init ua", new Object[0]);
      return false;
    }
    boolean bool2 = localO.g();
    boolean bool1 = bool2;
    if (bool2)
    {
      bool1 = bool2;
      if (localO.n()) {
        bool1 = localO.o();
      }
    }
    if (bool1)
    {
      g localG = a;
      if ((localG != null) && (fb).e >= localG.f()))
      {
        com.tencent.beacon.d.a.c(" reach daily consume limited! %d ", new Object[] { Integer.valueOf(localG.f()) });
        return false;
      }
    }
    return bool1;
  }
  
  private j l()
  {
    try
    {
      j localJ = f;
      return localJ;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private j m()
  {
    try
    {
      j localJ = g;
      return localJ;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private boolean n()
  {
    try
    {
      boolean bool = h;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private boolean o()
  {
    try
    {
      boolean bool = i;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void p()
  {
    try
    {
      i = true;
      if ((com.tencent.beacon.a.b.b.a(b).a()) && (m != null)) {
        m.onStrategyQuerySuccess();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void q()
  {
    try
    {
      if ((n == null) || (n.size() <= 0)) {
        break label101;
      }
      Iterator localIterator = n.iterator();
      while (localIterator.hasNext())
      {
        e localE = (e)localIterator.next();
        a(a, b, c, d, e, f, false);
      }
      n.clear();
    }
    finally {}
    n = null;
    label101:
  }
  
  private static boolean r()
  {
    try
    {
      int i1 = Process.myUid();
      Class localClass = Class.forName("android.net.TrafficStats");
      if (localClass != null)
      {
        long l1 = ((Long)localClass.getMethod("getUidRxBytes", new Class[] { Integer.TYPE }).invoke(null, new Object[] { Integer.valueOf(i1) })).longValue();
        long l2 = ((Long)localClass.getMethod("getUidTxBytes", new Class[] { Integer.TYPE }).invoke(null, new Object[] { Integer.valueOf(i1) })).longValue();
        if ((l1 != -1L) && (l2 != -1L)) {
          return true;
        }
      }
    }
    catch (Exception localException) {}
    return false;
  }
  
  private void s()
  {
    try
    {
      if ((!g()) && (!a.j())) {
        return;
      }
      Object localObject = com.tencent.beacon.a.b.b.a(b);
      if (localObject != null)
      {
        localObject = ((com.tencent.beacon.a.b.b)localObject).e().b(1);
        if (localObject != null)
        {
          localObject = ((d.a)localObject).b();
          if ((localObject != null) && (!"".equals(((String)localObject).trim())))
          {
            new i(b).a(false);
            return;
          }
        }
      }
    }
    catch (Exception localException)
    {
      com.tencent.beacon.d.a.c(" startHeart failed! " + localException.getMessage(), new Object[0]);
    }
  }
  
  private void t()
  {
    if (com.tencent.beacon.a.f.a(b) == null)
    {
      com.tencent.beacon.d.a.c(" DeviceInfo == null?,return", new Object[0]);
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("A33", com.tencent.beacon.a.f.l(b));
    localHashMap.put("A63", "Y");
    if (com.tencent.beacon.a.b.c(b))
    {
      localHashMap.put("A21", "Y");
      label81:
      if (!com.tencent.beacon.a.b.b.a(b).g()) {
        break label300;
      }
      localHashMap.put("A45", "Y");
      label107:
      if (!com.tencent.beacon.a.b.h(b)) {
        break label316;
      }
      localHashMap.put("A66", "F");
      label130:
      localHashMap.put("A68", com.tencent.beacon.a.b.i(b));
      if (!com.tencent.beacon.a.b.a) {
        break label332;
      }
    }
    label300:
    label316:
    label332:
    String str2;
    for (String str1 = "Y";; str2 = "N")
    {
      localHashMap.put("A85", str1);
      a("rqd_applaunched", true, 0L, 0L, localHashMap, true, false);
      try
      {
        if (!a.i()) {
          break;
        }
        int i1 = a.h();
        com.tencent.beacon.a.c.a().a(106, new h(b, i1), i1 * 1000, i1 * 1000);
        return;
      }
      catch (Exception localException)
      {
        com.tencent.beacon.d.a.c(" startAutoLaunchEvent failed! ", new Object[0]);
        com.tencent.beacon.d.a.b(" startAutoLaunchEvent failed! " + localException.getMessage(), new Object[0]);
        return;
      }
      localHashMap.put("A21", "N");
      break label81;
      localHashMap.put("A45", "N");
      break label107;
      localHashMap.put("A66", "B");
      break label130;
    }
  }
  
  public final void a()
  {
    a(j() + 1);
  }
  
  public final void a(com.tencent.beacon.a.b.d paramD)
  {
    if (paramD != null)
    {
      paramD = paramD.b(1);
      if (paramD != null)
      {
        boolean bool = paramD.a();
        if (g() != bool)
        {
          com.tencent.beacon.d.a.f("UAR onCommonStrategyChange setUsable:%b ", new Object[] { Boolean.valueOf(bool) });
          f(bool);
        }
      }
    }
  }
  
  public final void a(Map<String, String> paramMap)
  {
    if ((paramMap != null) && (paramMap.size() > 0) && (a != null)) {
      a.a(paramMap);
    }
  }
  
  public final void a(boolean paramBoolean)
  {
    Object localObject = com.tencent.beacon.a.b.b.a(b);
    if (localObject != null)
    {
      localObject = ((com.tencent.beacon.a.b.b)localObject).e().b(1);
      if ((localObject != null) && (((d.a)localObject).a() != paramBoolean))
      {
        ((d.a)localObject).a(paramBoolean);
        if (paramBoolean != g()) {
          f(paramBoolean);
        }
      }
    }
  }
  
  public final void b()
  {
    p();
    d.a = a.s();
    for (;;)
    {
      try
      {
        localObject1 = com.tencent.beacon.a.b.b.a(b).e();
        if (localObject1 != null) {
          continue;
        }
      }
      catch (Throwable localThrowable)
      {
        Object localObject1;
        Object localObject2;
        long l1;
        long l2;
        long l3;
        com.tencent.beacon.d.a.a(localThrowable);
        com.tencent.beacon.d.a.d(" common query end error %s", new Object[] { localThrowable.toString() });
        continue;
        i1 = -1;
        break label774;
        i1 = 0;
        continue;
        com.tencent.beacon.d.a.b("event module is disable", new Object[0]);
        continue;
      }
      q();
      if (j() < 2)
      {
        if (m != null) {
          m.onInitEnd();
        }
        if ((com.tencent.beacon.upload.i.a(b).a()) && (com.tencent.beacon.a.i.a(b).a("sig_1")))
        {
          com.tencent.beacon.d.a.e(" get lock %s do singleton!", new Object[] { "sig_1" });
          localObject1 = b;
          localObject2 = a;
          com.tencent.beacon.a.f.a("com.tencent.beacon.runinfo.AppRunInfoTask", "startAppRunMonitor", new Class[] { Context.class, Object.class }, new Object[] { localObject1, localObject2 });
          if (com.tencent.beacon.upload.i.a(b).b())
          {
            s();
            t();
            localObject1 = com.tencent.beacon.a.h.b(b);
            if (localObject1 != null)
            {
              l1 = d;
              l2 = e;
              l3 = e;
              localObject1 = new HashMap();
              com.tencent.beacon.a.f.a(b);
              ((HashMap)localObject1).put("A33", com.tencent.beacon.a.f.l(b));
              ((HashMap)localObject1).put("A64", String.valueOf(l1 + l2));
              ((HashMap)localObject1).put("A65", String.valueOf(l3));
              if (a("rqd_sdk_net_consumed", true, 0L, 0L, (Map)localObject1, true, false)) {
                UserAction.clearSDKTotalConsume(b);
              }
            }
          }
        }
      }
      try
      {
        localObject1 = com.tencent.beacon.a.b.b(b, "rqd_model", "");
        boolean bool = com.tencent.beacon.a.f.n().equals(localObject1);
        if (!bool) {
          break label716;
        }
      }
      catch (Exception localException1)
      {
        com.tencent.beacon.d.a.c(" save modelEvent upload flag failed! ", new Object[0]);
        continue;
        Runnable local3 = new Runnable()
        {
          public final void run()
          {
            if (com.tencent.beacon.a.d.m() == null)
            {
              com.tencent.beacon.d.a.c(" model even common info == null?,return", new Object[0]);
              return;
            }
            Object localObject = n.a(b);
            if (localObject == null)
            {
              com.tencent.beacon.d.a.c(" UADeviceInfo == null?,return", new Object[0]);
              return;
            }
            com.tencent.beacon.a.f.a(b);
            HashMap localHashMap = new HashMap();
            localHashMap.put("A9", ((n)localObject).k());
            localHashMap.put("A10", ((n)localObject).b());
            localHashMap.put("A11", ((n)localObject).h());
            localHashMap.put("A12", ((n)localObject).i());
            localHashMap.put("A13", ((n)localObject).j());
            localHashMap.put("A14", ((n)localObject).f());
            localHashMap.put("A15", ((n)localObject).g());
            localHashMap.put("A16", ((n)localObject).d());
            localHashMap.put("A17", ((n)localObject).c());
            localHashMap.put("A18", ((n)localObject).e());
            localHashMap.put("A20", com.tencent.beacon.a.f.f(b));
            localHashMap.put("A22", n.b(b));
            localHashMap.put("A30", com.tencent.beacon.a.f.h() + "m");
            localHashMap.put("A33", com.tencent.beacon.a.f.l(b));
            localHashMap.put("A52", ((n)localObject).l());
            localHashMap.put("A53", ((n)localObject).m());
            localHashMap.put("A54", ((n)localObject).n());
            localHashMap.put("A55", ((n)localObject).o());
            localHashMap.put("A56", ((n)localObject).p());
            localHashMap.put("A57", ((n)localObject).q());
            localHashMap.put("A58", ((n)localObject).r());
            StringBuilder localStringBuilder = new StringBuilder();
            Context localContext = b;
            localObject = "0";
            long l = com.tencent.beacon.a.f.i(localContext);
            if (l > 0L) {
              localObject = l / 1024L / 1024L;
            }
            localHashMap.put("A59", (String)localObject + "m");
            localHashMap.put("A69", com.tencent.beacon.a.f.g(b));
            localObject = com.tencent.beacon.a.f.a(new String[] { "/system/bin/sh", "-c", "getprop ro.build.fingerprint" });
            if ((localObject != null) && (((List)localObject).size() > 0)) {}
            for (localObject = (String)((List)localObject).get(0);; localObject = "")
            {
              localHashMap.put("A82", localObject);
              o.a("rqd_model", true, 0L, localHashMap);
              return;
            }
          }
        };
        com.tencent.beacon.a.c.a().a(local3, 50000L);
        try
        {
          com.tencent.beacon.a.b.a(b, "rqd_model", com.tencent.beacon.a.f.n());
        }
        catch (Exception localException2)
        {
          com.tencent.beacon.d.a.c(" save modelEvent upload flag failed! ", new Object[0]);
          com.tencent.beacon.d.a.a(localException2);
        }
        continue;
        if (i1 <= 0) {
          continue;
        }
        int i1 = 1;
        continue;
      }
      if ((a.o()) || (a.p()))
      {
        c = new a(b, a.o(), a.p(), a.q(), a.r());
        if (a.p()) {
          new k(b).a();
        }
      }
      if ((a.m()) && (r()))
      {
        localObject1 = new Runnable()
        {
          public final void run()
          {
            o.a(o.this);
          }
        };
        com.tencent.beacon.a.c.a().a((Runnable)localObject1, 50000L);
        i1 = a.n();
        if (i1 > 0)
        {
          localObject1 = new Runnable()
          {
            public final void run()
            {
              com.tencent.beacon.a.h.c(b);
            }
          };
          com.tencent.beacon.a.c.a().a(107, (Runnable)localObject1, 0L, i1 * 1000);
        }
      }
      a.k();
      return;
      localObject1 = ((com.tencent.beacon.a.b.d)localObject1).b(1);
      if ((localObject1 != null) && (a != null))
      {
        localObject2 = ((d.a)localObject1).d();
        if ((localObject2 != null) && (((Set)localObject2).size() > 0)) {
          a.a((Set)localObject2);
        }
        localObject2 = ((d.a)localObject1).f();
        if ((localObject2 != null) && (((Set)localObject2).size() > 0)) {
          a.b((Set)localObject2);
        }
      }
      if ((!g()) || (localObject1 == null)) {
        continue;
      }
      if (!g()) {
        continue;
      }
      i1 = com.tencent.beacon.a.f.q(b);
      break label774;
      if (i1 != 0)
      {
        com.tencent.beacon.d.a.e(" asyn up module %d", new Object[] { Integer.valueOf(1) });
        com.tencent.beacon.a.c.a().a(new Runnable()
        {
          public final void run()
          {
            e(true);
          }
        });
      }
    }
  }
  
  public final void b(boolean paramBoolean)
  {
    if ((com.tencent.beacon.upload.i.a(b) != null) && (paramBoolean != com.tencent.beacon.upload.i.a(b).b()))
    {
      if (paramBoolean)
      {
        com.tencent.beacon.upload.i.a(b).a(true);
        s();
        t();
      }
    }
    else {
      return;
    }
    com.tencent.beacon.upload.i.a(b).a(false);
    Context localContext = b;
    com.tencent.beacon.a.c.a().a(108);
    com.tencent.beacon.a.b.a(localContext, "HEART_DENGTA", com.tencent.beacon.a.f.n());
    com.tencent.beacon.d.a.a("heartbeat uploaded sucess!", new Object[0]);
  }
  
  public final void c()
  {
    Context localContext = b;
    com.tencent.beacon.d.a.a(" RecordDAO.deleteRecords() start", new Object[0]);
    com.tencent.beacon.d.a.e(" ua first clean :%d", new Object[] { Integer.valueOf(com.tencent.beacon.a.a.a.a(localContext, new int[] { 1, 2, 3, 4 })) });
    com.tencent.beacon.d.a.e(" ua remove strategy :%d", new Object[] { Integer.valueOf(com.tencent.beacon.a.f.p(b)) });
  }
  
  public final boolean e(boolean paramBoolean)
  {
    for (;;)
    {
      synchronized (o)
      {
        if (g())
        {
          i1 = com.tencent.beacon.a.f.q(b);
          if (i1 > 0) {
            try
            {
              if (j != null)
              {
                c localC = new c(b);
                localC.a(paramBoolean);
                j.a(localC);
              }
              return true;
            }
            catch (Throwable localThrowable)
            {
              com.tencent.beacon.d.a.c(" up common error: %s", new Object[] { localThrowable.toString() });
              com.tencent.beacon.d.a.a(localThrowable);
            }
          }
          return false;
        }
      }
      int i1 = -1;
    }
  }
  
  public final void f()
  {
    com.tencent.beacon.d.a.a(" closeUseInfoEvent start", new Object[0]);
    try
    {
      g localG = a;
      g.g();
      com.tencent.beacon.a.c.a().a(104);
      return;
    }
    catch (Exception localException)
    {
      com.tencent.beacon.d.a.d(" closeUseInfoEvent function error:" + localException.getMessage(), new Object[0]);
    }
  }
  
  public final boolean g()
  {
    synchronized (p)
    {
      boolean bool = k;
      return bool;
    }
  }
  
  public final com.tencent.beacon.upload.h h()
  {
    return j;
  }
  
  public final g i()
  {
    return a;
  }
  
  public final int j()
  {
    try
    {
      int i1 = l;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
