package com.tencent.beacon.event;

import android.content.Context;
import com.tencent.beacon.a.b;
import com.tencent.beacon.a.f;
import com.tencent.beacon.d.a;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public final class h
  implements Runnable
{
  private Context a;
  private int b;
  private int c = -1;
  private Map<String, String> d = new HashMap(2);
  private int e = 0;
  
  public h(Context paramContext, int paramInt)
  {
    a = paramContext;
    b = paramInt;
    e = Calendar.getInstance().get(5);
    d.put("A63", "N");
    d.put("A66", "F");
  }
  
  public final void run()
  {
    boolean bool;
    if (b > 0)
    {
      bool = b.h(a);
      int i = Calendar.getInstance().get(5);
      if (i != e)
      {
        e = i;
        new i(a, bool).a(true);
      }
      if (c == -1) {
        break label182;
      }
      if ((c != 0) || (!bool)) {
        break label164;
      }
      localObject = d;
      f.a(a);
      ((Map)localObject).put("A33", f.l(a));
      localMap = d;
      if (!b.a) {
        break label158;
      }
      localObject = "Y";
      localMap.put("A85", localObject);
      o.a("rqd_applaunched", true, 0L, d);
      a.a(" create a applaunched event", new Object[0]);
      c = 1;
      o.d(true);
    }
    label158:
    label164:
    while ((bool) || (c != 1)) {
      for (;;)
      {
        return;
        localObject = "N";
      }
    }
    label182:
    while (!bool)
    {
      Object localObject;
      Map localMap;
      c = 0;
      return;
    }
    c = 1;
  }
}
