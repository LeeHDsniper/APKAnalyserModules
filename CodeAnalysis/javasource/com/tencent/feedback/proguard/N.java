package com.tencent.feedback.proguard;

import java.util.HashMap;
import java.util.Map;

public final class N
  extends j
  implements Cloneable
{
  private static byte[] m;
  private static Map<String, String> n;
  public int a = 0;
  public String b = "";
  public String c = "";
  public String d = "";
  public String e = "";
  public String f = "";
  public int g = 0;
  public byte[] h = null;
  public String i = "";
  public String j = "";
  private Map<String, String> k = null;
  private String l = "";
  
  public N() {}
  
  public final void a(h paramH)
  {
    a = paramH.a(a, 0, true);
    b = paramH.b(1, true);
    c = paramH.b(2, true);
    d = paramH.b(3, true);
    e = paramH.b(4, false);
    f = paramH.b(5, true);
    g = paramH.a(g, 6, true);
    if (m == null)
    {
      arrayOfByte = (byte[])new byte[1];
      m = arrayOfByte;
      ((byte[])arrayOfByte)[0] = 0;
    }
    byte[] arrayOfByte = m;
    h = ((byte[])paramH.c(7, true));
    i = paramH.b(8, false);
    j = paramH.b(9, false);
    if (n == null)
    {
      n = new HashMap();
      n.put("", "");
    }
    k = ((Map)paramH.a(n, 10, false));
    l = paramH.b(11, false);
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    paramI.a(b, 1);
    paramI.a(c, 2);
    paramI.a(d, 3);
    if (e != null) {
      paramI.a(e, 4);
    }
    paramI.a(f, 5);
    paramI.a(g, 6);
    paramI.a(h, 7);
    if (i != null) {
      paramI.a(i, 8);
    }
    if (j != null) {
      paramI.a(j, 9);
    }
    if (k != null) {
      paramI.a(k, 10);
    }
    if (l != null) {
      paramI.a(l, 11);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
