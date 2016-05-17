package com.tencent.beacon.b.d;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;

public final class d
  extends c
  implements Cloneable
{
  private static byte[] s;
  public String a = "";
  public String b = "";
  public String c = "";
  public long d = 0L;
  public long e = 0L;
  public long f = 0L;
  public long g = 0L;
  public long h = 0L;
  public String i = "";
  public long j = 0L;
  public String k = "";
  public String l = "";
  public int m = 0;
  public String n = "";
  private String o = "";
  private int p = 0;
  private int q = 0;
  private byte[] r = null;
  
  public d() {}
  
  public final void a(a paramA)
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
    o = paramA.b(9, false);
    j = paramA.a(j, 10, true);
    p = paramA.a(p, 11, false);
    q = paramA.a(q, 12, false);
    if (s == null)
    {
      arrayOfByte = new byte[1];
      s = arrayOfByte;
      arrayOfByte[0] = 0;
    }
    byte[] arrayOfByte = s;
    r = paramA.c(13, false);
    k = paramA.b(14, false);
    l = paramA.b(15, false);
    m = paramA.a(m, 16, false);
    n = paramA.b(17, false);
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
    if (o != null) {
      paramB.a(o, 9);
    }
    paramB.a(j, 10);
    paramB.a(p, 11);
    paramB.a(q, 12);
    if (r != null) {
      paramB.a(r, 13);
    }
    if (k != null) {
      paramB.a(k, 14);
    }
    if (l != null) {
      paramB.a(l, 15);
    }
    paramB.a(m, 16);
    if (n != null) {
      paramB.a(n, 17);
    }
  }
}
