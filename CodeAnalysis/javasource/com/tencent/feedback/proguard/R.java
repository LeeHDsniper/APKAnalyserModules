package com.tencent.feedback.proguard;

import java.util.HashMap;
import java.util.Map;

public final class R
  extends j
  implements Cloneable
{
  private static Map<String, String> g = new HashMap();
  public long a = 0L;
  public byte b = 0;
  public String c = "";
  public String d = "";
  public Map<String, String> e = null;
  private String f = "";
  
  static
  {
    g.put("", "");
  }
  
  public R() {}
  
  public final void a(h paramH)
  {
    a = paramH.a(a, 0, true);
    b = paramH.a(b, 1, true);
    c = paramH.b(2, false);
    d = paramH.b(3, false);
    f = paramH.b(4, false);
    e = ((Map)paramH.a(g, 5, false));
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    paramI.a(b, 1);
    if (c != null) {
      paramI.a(c, 2);
    }
    if (d != null) {
      paramI.a(d, 3);
    }
    if (f != null) {
      paramI.a(f, 4);
    }
    if (e != null) {
      paramI.a(e, 5);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
