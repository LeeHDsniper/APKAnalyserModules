package com.tencent.beacon.b.d;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.c;

public final class b
  extends c
  implements Cloneable
{
  private static byte[] n;
  public String a = "";
  public String b = "";
  public String c = "";
  public int d = 0;
  public long e = 0L;
  public long f = 0L;
  public String g = "";
  private long h = 0L;
  private long i = 0L;
  private long j = 0L;
  private int k = 0;
  private int l = 0;
  private byte[] m = null;
  
  public b() {}
  
  public final void a(a paramA)
  {
    a = paramA.b(0, true);
    b = paramA.b(1, true);
    c = paramA.b(2, true);
    d = paramA.a(d, 3, true);
    e = paramA.a(e, 4, true);
    f = paramA.a(f, 5, true);
    h = paramA.a(h, 6, false);
    i = paramA.a(i, 7, false);
    j = paramA.a(j, 8, false);
    k = paramA.a(k, 9, false);
    l = paramA.a(l, 10, false);
    if (n == null)
    {
      arrayOfByte = new byte[1];
      n = arrayOfByte;
      arrayOfByte[0] = 0;
    }
    byte[] arrayOfByte = n;
    m = paramA.c(11, false);
    g = paramA.b(12, false);
  }
  
  public final void a(com.tencent.beacon.e.b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
    paramB.a(e, 4);
    paramB.a(f, 5);
    paramB.a(h, 6);
    paramB.a(i, 7);
    paramB.a(j, 8);
    paramB.a(k, 9);
    paramB.a(l, 10);
    if (m != null) {
      paramB.a(m, 11);
    }
    if (g != null) {
      paramB.a(g, 12);
    }
  }
}
