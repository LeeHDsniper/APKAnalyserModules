package com.tencent.beacon.b.a;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.c;

public final class b
  extends c
{
  private static byte[] m;
  public byte a = 0;
  public String b = "";
  public String c = "";
  public String d = "";
  public String e = "";
  public int f = 0;
  public byte[] g = null;
  public byte h = 0;
  public byte i = 0;
  public String j = "";
  public String k = "";
  public String l = "";
  
  public b() {}
  
  public final void a(a paramA)
  {
    a = paramA.a(a, 0, true);
    b = paramA.b(1, true);
    c = paramA.b(2, true);
    d = paramA.b(3, true);
    e = paramA.b(4, true);
    f = paramA.a(f, 5, true);
    if (m == null)
    {
      arrayOfByte = new byte[1];
      m = arrayOfByte;
      arrayOfByte[0] = 0;
    }
    byte[] arrayOfByte = m;
    g = paramA.c(6, true);
    h = paramA.a(h, 7, true);
    i = paramA.a(i, 8, true);
    j = paramA.b(9, false);
    k = paramA.b(10, false);
    l = paramA.b(11, false);
  }
  
  public final void a(com.tencent.beacon.e.b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
    paramB.a(e, 4);
    paramB.a(f, 5);
    paramB.a(g, 6);
    paramB.a(h, 7);
    paramB.a(i, 8);
    if (j != null) {
      paramB.a(j, 9);
    }
    if (k != null) {
      paramB.a(k, 10);
    }
    if (l != null) {
      paramB.a(l, 11);
    }
  }
}
