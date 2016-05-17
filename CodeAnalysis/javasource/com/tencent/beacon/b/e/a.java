package com.tencent.beacon.b.e;

import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public final class a
  extends c
{
  private static ArrayList<d> e;
  private static Map<String, String> f;
  public ArrayList<d> a = null;
  public int b = 0;
  public String c = "";
  public Map<String, String> d = null;
  
  public a() {}
  
  public final void a(com.tencent.beacon.e.a paramA)
  {
    if (e == null)
    {
      e = new ArrayList();
      d localD = new d();
      e.add(localD);
    }
    a = ((ArrayList)paramA.a(e, 0, true));
    b = paramA.a(b, 1, true);
    c = paramA.b(2, true);
    if (f == null)
    {
      f = new HashMap();
      f.put("", "");
    }
    d = ((Map)paramA.a(f, 3, false));
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    if (d != null) {
      paramB.a(d, 3);
    }
  }
}
