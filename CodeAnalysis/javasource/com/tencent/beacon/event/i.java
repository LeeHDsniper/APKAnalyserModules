package com.tencent.beacon.event;

import android.content.Context;
import com.tencent.beacon.a.c;
import com.tencent.beacon.a.f;
import com.tencent.beacon.d.a;
import com.tencent.beacon.upload.h;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class i
{
  private k a;
  private Context b;
  private final boolean c;
  private int d = 20000;
  private int e = 0;
  private Runnable f = new Runnable()
  {
    public final void run()
    {
      try
      {
        a();
        return;
      }
      catch (Throwable localThrowable)
      {
        a.a(localThrowable);
      }
    }
  };
  
  public i(Context paramContext)
  {
    b = paramContext;
    c = com.tencent.beacon.a.b.h(b);
  }
  
  public i(Context paramContext, boolean paramBoolean)
  {
    b = paramContext;
    c = paramBoolean;
  }
  
  private void a(int paramInt)
  {
    try
    {
      e = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private int b()
  {
    try
    {
      int i = e;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  protected final void a()
  {
    if (!f.t(b)) {}
    do
    {
      return;
      h localH = o.d().h();
      if (localH != null)
      {
        ArrayList localArrayList = new ArrayList(2);
        localArrayList.add(a);
        dd.b();
        localH.a(new l.a(b, localArrayList));
      }
      a(b() + 1);
    } while (b() % 10 != 0);
    c.a().a(108, f, 600000L, d);
    a(0);
  }
  
  public final void a(boolean paramBoolean)
  {
    String str = com.tencent.beacon.a.b.b(b, "HEART_DENGTA", "");
    if (f.n().equals(str))
    {
      a.a("heartbeat has been uploaded today!", new Object[0]);
      return;
    }
    HashMap localHashMap = new HashMap(3);
    f.a(b);
    localHashMap.put("A33", f.l(b));
    if (c)
    {
      localHashMap.put("A66", "F");
      localHashMap.put("A68", com.tencent.beacon.a.b.i(b));
      if (!com.tencent.beacon.a.b.a) {
        break label203;
      }
      str = "Y";
      label125:
      localHashMap.put("A85", str);
      a = b.a(b, "rqd_heartbeat", localHashMap);
      if (!paramBoolean) {
        break label209;
      }
    }
    label203:
    label209:
    for (int i = (int)(Math.random() * 600.0D) * 1000;; i = 0)
    {
      c.a().a(108, f, i, d);
      return;
      localHashMap.put("A66", "B");
      break;
      str = "N";
      break label125;
    }
  }
}
