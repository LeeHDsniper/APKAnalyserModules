package com.tencent.beacon.upload;

import android.content.Context;
import android.util.SparseArray;
import com.tencent.beacon.a.b.d.a;
import com.tencent.beacon.a.f;
import com.tencent.beacon.event.o;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public final class g
{
  private Context a = null;
  
  public g(Context paramContext)
  {
    a = paramContext;
  }
  
  public final void a(int paramInt, byte[] paramArrayOfByte, boolean paramBoolean)
  {
    if (paramInt != 101) {
      com.tencent.beacon.d.a.c("com strategy unmatch key: %d", new Object[] { Integer.valueOf(paramInt) });
    }
    Object localObject1;
    Object localObject2;
    int i;
    for (;;)
    {
      return;
      if ((paramArrayOfByte != null) && (paramArrayOfByte.length > 0))
      {
        localObject1 = com.tencent.beacon.a.b.b.a(a).e();
        if (localObject1 == null)
        {
          com.tencent.beacon.d.a.c("imposible! common strategy null!", new Object[0]);
          return;
        }
        try
        {
          localObject2 = new com.tencent.beacon.b.e.a();
          ((com.tencent.beacon.b.e.a)localObject2).a(new com.tencent.beacon.e.a(paramArrayOfByte));
          if (localObject1 == null)
          {
            i = 0;
            if (i == 0) {
              continue;
            }
            if (paramBoolean)
            {
              com.tencent.beacon.d.a.e("update common strategy should save ", new Object[0]);
              localObject2 = a;
              if (paramArrayOfByte != null)
              {
                localObject3 = new com.tencent.beacon.a.b.g();
                ((com.tencent.beacon.a.b.g)localObject3).a(paramInt);
                ((com.tencent.beacon.a.b.g)localObject3).a(paramArrayOfByte);
                f.a((Context)localObject2, (com.tencent.beacon.a.b.g)localObject3);
              }
            }
            com.tencent.beacon.d.a.e("com strategy changed notify! ", new Object[0]);
            paramArrayOfByte = com.tencent.beacon.a.b.b.a(a);
            paramArrayOfByte.a((com.tencent.beacon.a.b.d)localObject1);
            if (!paramBoolean) {
              continue;
            }
            paramArrayOfByte.b();
            paramArrayOfByte = null;
            localObject1 = o.d();
            if (localObject1 != null) {
              paramArrayOfByte = a;
            }
            if ((paramArrayOfByte == null) || (!paramArrayOfByte.x())) {
              continue;
            }
            paramInt = com.tencent.beacon.a.b.a(a, "today_success_strategy_query_times");
            com.tencent.beacon.a.b.a(a, "today_success_strategy_query_times", paramInt + 1);
            com.tencent.beacon.a.b.a(a, "last_success_strategy_query_time", System.currentTimeMillis());
          }
        }
        catch (Throwable paramArrayOfByte)
        {
          com.tencent.beacon.d.a.a(paramArrayOfByte);
          com.tencent.beacon.d.a.d("error to common strategy!", new Object[0]);
          return;
        }
      }
    }
    int k = 0;
    if (!c.equals(((com.tencent.beacon.a.b.d)localObject1).b()))
    {
      com.tencent.beacon.d.a.b("strategy url changed to: %s", new Object[] { c });
      k = 1;
      ((com.tencent.beacon.a.b.d)localObject1).a(c);
    }
    if (b != ((com.tencent.beacon.a.b.d)localObject1).c())
    {
      com.tencent.beacon.d.a.b("QueryPeriod changed to: %d", new Object[] { Integer.valueOf(b) });
      k = 1;
      ((com.tencent.beacon.a.b.d)localObject1).a(b);
    }
    Object localObject3 = a;
    label371:
    Object localObject4;
    int n;
    label415:
    label444:
    int m;
    boolean bool;
    label515:
    int j;
    if (localObject1 == null)
    {
      i = 0;
      break label1249;
      localObject2 = d;
      if (localObject1 == null)
      {
        i = 0;
        break label1260;
      }
    }
    else
    {
      i = 0;
      if (localObject3 != null)
      {
        localObject4 = ((com.tencent.beacon.a.b.d)localObject1).e();
        if (localObject4 == null) {
          break label1249;
        }
        n = 0;
        i = 0;
        if (n >= ((SparseArray)localObject4).size()) {
          break label1249;
        }
        d.a localA = (d.a)((SparseArray)localObject4).valueAt(n);
        Iterator localIterator = ((ArrayList)localObject3).iterator();
        if (!localIterator.hasNext()) {
          break label1284;
        }
        Object localObject5 = (com.tencent.beacon.b.e.d)localIterator.next();
        m = i;
        if (a != localA.e()) {
          break label1271;
        }
        com.tencent.beacon.d.a.a("server module strategy mid: %d", new Object[] { Byte.valueOf(a) });
        if (b != 1) {
          break label1278;
        }
        bool = true;
        if (localA.a() != bool)
        {
          com.tencent.beacon.d.a.b("mid: %d , isUsable changed: %b ", new Object[] { Byte.valueOf(a), Boolean.valueOf(bool) });
          i = 1;
          localA.a(bool);
        }
        j = i;
        if (!localA.b().equals(c))
        {
          com.tencent.beacon.d.a.b("mid: %d , url changed: %s", new Object[] { Byte.valueOf(a), c });
          j = 1;
          localA.a(c);
        }
        if (a != 1)
        {
          i = j;
          if (a != 2) {}
        }
        else
        {
          if ((localA.c() == null) || (d == null)) {
            break label943;
          }
          i = j;
          if (!localA.c().equals(d))
          {
            com.tencent.beacon.d.a.b("mid: %d , detail changed...", new Object[] { Byte.valueOf(a) });
            i = 1;
            localA.a(d);
            com.tencent.beacon.a.b.b.a(a).a(a, d);
          }
        }
        j = i;
        if (a == 1)
        {
          if ((localA.d() == null) || (e == null)) {
            break label1023;
          }
          if (!localA.d().equals(e))
          {
            label784:
            com.tencent.beacon.d.a.b("mid: %d , PreventEventCode changed...", new Object[] { Byte.valueOf(a) });
            i = 1;
            localA.a(f.a(e));
          }
          label820:
          if ((localA.f() == null) || (g == null)) {
            break label1042;
          }
          j = i;
          if (localA.f().equals(g)) {}
        }
        for (;;)
        {
          label858:
          com.tencent.beacon.d.a.b("mid: %d , SampleEventSet changed...", new Object[] { Byte.valueOf(a) });
          j = 1;
          localA.b(f.a(g));
          label943:
          label1023:
          label1042:
          do
          {
            m = j;
            if (a != 2) {
              break label1271;
            }
            com.tencent.beacon.d.a.b("mid: %d , SpeedMonitorStrategy", new Object[] { Byte.valueOf(a) });
            localObject5 = f;
            m = j;
            break label1271;
            i = j;
            if (d == null) {
              break;
            }
            i = j;
            if (localA.c() != null) {
              break;
            }
            com.tencent.beacon.d.a.b("mid: %d , detail changed...", new Object[] { Byte.valueOf(a) });
            i = 1;
            localA.a(d);
            com.tencent.beacon.a.b.b.a(a).a(a, d);
            break;
            if (localA.d() != null) {
              break label784;
            }
            if (e == null) {
              break label820;
            }
            break label784;
            if (localA.f() != null) {
              break label858;
            }
            j = i;
          } while (g == null);
        }
      }
      localObject3 = ((com.tencent.beacon.a.b.d)localObject1).e();
      if (localObject3 == null) {
        break label1249;
      }
      m = ((SparseArray)localObject3).size();
      j = 0;
      i = 0;
    }
    for (;;)
    {
      if (j < m)
      {
        localObject4 = (d.a)((SparseArray)localObject3).valueAt(j);
        if (!((d.a)localObject4).a()) {
          break label1293;
        }
        com.tencent.beacon.d.a.b("mid: %d , server not response strategy, sdk local close it!", new Object[] { Integer.valueOf(((d.a)localObject4).e()) });
        i = 1;
        ((d.a)localObject4).a(false);
        break label1293;
        k = 0;
        if ((localObject2 != null) && (((com.tencent.beacon.a.b.d)localObject1).d() != null))
        {
          i = k;
          if (!((Map)localObject2).equals(((com.tencent.beacon.a.b.d)localObject1).d()))
          {
            ((com.tencent.beacon.a.b.d)localObject1).a((Map)localObject2);
            i = 1;
          }
        }
        else
        {
          i = k;
          if (localObject2 != null)
          {
            i = k;
            if (((com.tencent.beacon.a.b.d)localObject1).d() == null)
            {
              ((com.tencent.beacon.a.b.d)localObject1).a((Map)localObject2);
              i = 1;
            }
          }
        }
      }
      label1249:
      label1260:
      while (i == 0)
      {
        i = j;
        break;
        do
        {
          j = k;
          break;
        } while (i == 0);
        j = 1;
        break label371;
      }
      i = 1;
      break;
      label1271:
      i = m;
      break label444;
      label1278:
      bool = false;
      break label515;
      label1284:
      n += 1;
      break label415;
      label1293:
      j += 1;
    }
  }
}
