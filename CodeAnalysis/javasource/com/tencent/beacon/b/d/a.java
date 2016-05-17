package com.tencent.beacon.b.d;

import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;

public final class a
  extends c
  implements Cloneable
{
  private static byte[] p;
  public String a = "";
  public String b = "";
  public String c = "";
  public long d = 0L;
  public long e = 0L;
  public long f = 0L;
  public long g = 0L;
  public long h = 0L;
  public String i = "";
  public String j = "";
  public long k = 0L;
  public String l = "";
  private int m = 0;
  private int n = 0;
  private byte[] o = null;
  
  public a() {}
  
  public final void a(com.tencent.beacon.e.a paramA)
  {
    a = paramA.b(0, true);
    b = paramA.b(1, true);
    c = paramA.b(2, true);
    d = paramA.a(d, 3, true);
    e = paramA.a(e, 4, true);
    f = paramA.a(f, 5, true);
    g = paramA.a(g, 6, true);
    h = paramA.a(h, 7, true);
    i = paramA.b(8, false);
    j = paramA.b(9, false);
    k = paramA.a(k, 10, true);
    m = paramA.a(m, 11, false);
    n = paramA.a(n, 12, false);
    if (p == null)
    {
      arrayOfByte = new byte[1];
      p = arrayOfByte;
      arrayOfByte[0] = 0;
    }
    byte[] arrayOfByte = p;
    o = paramA.c(13, false);
    l = paramA.b(14, false);
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
    paramB.a(e, 4);
    paramB.a(f, 5);
    paramB.a(g, 6);
    paramB.a(h, 7);
    if (i != null) {
      paramB.a(i, 8);
    }
    if (j != null) {
      paramB.a(j, 9);
    }
    paramB.a(k, 10);
    paramB.a(m, 11);
    paramB.a(n, 12);
    if (o != null) {
      paramB.a(o, 13);
    }
    if (l != null) {
      paramB.a(l, 14);
    }
  }
}
