package com.tencent.beacon.b.e;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.b;

public final class c
  extends com.tencent.beacon.e.c
{
  private String a = "";
  private int b = 0;
  private int c = 0;
  private boolean d = true;
  
  public c() {}
  
  public final void a(a paramA)
  {
    a = paramA.b(0, true);
    b = paramA.a(b, 1, true);
    c = paramA.a(c, 2, false);
    boolean bool = d;
    d = paramA.a(3, false);
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
  }
}
