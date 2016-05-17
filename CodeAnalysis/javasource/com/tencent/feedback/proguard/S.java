package com.tencent.feedback.proguard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public final class S
  extends j
  implements Cloneable
{
  private static ArrayList<R> f;
  private static Map<String, String> g;
  public byte a = 0;
  public String b = "";
  public ArrayList<R> c = null;
  public Map<String, String> d = null;
  private String e = "";
  
  public S() {}
  
  public final void a(h paramH)
  {
    a = paramH.a(a, 0, true);
    b = paramH.b(1, false);
    e = paramH.b(2, false);
    if (f == null)
    {
      f = new ArrayList();
      R localR = new R();
      f.add(localR);
    }
    c = ((ArrayList)paramH.a(f, 3, false));
    if (g == null)
    {
      g = new HashMap();
      g.put("", "");
    }
    d = ((Map)paramH.a(g, 4, false));
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    if (b != null) {
      paramI.a(b, 1);
    }
    if (e != null) {
      paramI.a(e, 2);
    }
    if (c != null) {
      paramI.a(c, 3);
    }
    if (d != null) {
      paramI.a(d, 4);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
