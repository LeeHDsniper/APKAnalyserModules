package com.tencent.feedback.proguard;

import java.util.HashMap;
import java.util.Map;

public final class Q
  extends j
  implements Cloneable
{
  private static P h;
  private static Map<String, String> i;
  public String a = "";
  public Map<String, String> b = null;
  private boolean c = true;
  private boolean d = true;
  private boolean e = true;
  private String f = "";
  private P g = null;
  
  public Q() {}
  
  public final void a(h paramH)
  {
    boolean bool = c;
    c = paramH.a(0, true);
    bool = d;
    d = paramH.a(1, true);
    bool = e;
    e = paramH.a(2, true);
    a = paramH.b(3, false);
    f = paramH.b(4, false);
    if (h == null) {
      h = new P();
    }
    g = ((P)paramH.a(h, 5, false));
    if (i == null)
    {
      i = new HashMap();
      i.put("", "");
    }
    b = ((Map)paramH.a(i, 6, false));
  }
  
  public final void a(i paramI)
  {
    paramI.a(c, 0);
    paramI.a(d, 1);
    paramI.a(e, 2);
    if (a != null) {
      paramI.a(a, 3);
    }
    if (f != null) {
      paramI.a(f, 4);
    }
    if (g != null) {
      paramI.a(g, 5);
    }
    if (b != null) {
      paramI.a(b, 6);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
