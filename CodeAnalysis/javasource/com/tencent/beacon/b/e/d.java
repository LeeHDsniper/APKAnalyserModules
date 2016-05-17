package com.tencent.beacon.b.e;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public final class d
  extends c
{
  private static Map<String, String> h;
  private static ArrayList<String> i;
  private static e j;
  private static ArrayList<String> k;
  public byte a = 0;
  public byte b = 0;
  public String c = "";
  public Map<String, String> d = null;
  public ArrayList<String> e = null;
  public e f = null;
  public ArrayList<String> g = null;
  
  public d() {}
  
  public final void a(a paramA)
  {
    a = paramA.a(a, 0, true);
    b = paramA.a(b, 1, true);
    c = paramA.b(2, true);
    if (h == null)
    {
      h = new HashMap();
      h.put("", "");
    }
    d = ((Map)paramA.a(h, 3, true));
    if (i == null)
    {
      i = new ArrayList();
      i.add("");
    }
    e = ((ArrayList)paramA.a(i, 4, false));
    if (j == null) {
      j = new e();
    }
    f = ((e)paramA.a(j, 5, false));
    if (k == null)
    {
      k = new ArrayList();
      k.add("");
    }
    g = ((ArrayList)paramA.a(k, 6, false));
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
    if (e != null) {
      paramB.a(e, 4);
    }
    if (f != null) {
      paramB.a(f);
    }
    if (g != null) {
      paramB.a(g, 6);
    }
  }
}
