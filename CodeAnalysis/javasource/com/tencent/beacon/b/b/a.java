package com.tencent.beacon.b.b;

import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;

public final class a
  extends c
  implements Cloneable
{
  public String a = "";
  public String b = "";
  public String c = "";
  public boolean d = true;
  public long e = 0L;
  public long f = 0L;
  public String g = "";
  public long h = 0L;
  public int i = 0;
  
  public a() {}
  
  public final void a(com.tencent.beacon.e.a paramA)
  {
    a = paramA.b(0, true);
    b = paramA.b(1, true);
    c = paramA.b(2, true);
    boolean bool = d;
    d = paramA.a(3, true);
    e = paramA.a(e, 4, true);
    f = paramA.a(f, 5, true);
    g = paramA.b(6, true);
    h = paramA.a(h, 7, true);
    i = paramA.a(i, 8, false);
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
    paramB.a(i, 8);
  }
}
