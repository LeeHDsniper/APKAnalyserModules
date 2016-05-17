package com.tencent.beacon.b.e;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;

public final class f
  extends c
{
  private String a = "";
  private int b = 0;
  private String c = "";
  private String d = "";
  
  public f() {}
  
  public final void a(a paramA)
  {
    a = paramA.b(0, true);
    b = paramA.a(b, 1, true);
    c = paramA.b(2, true);
    d = paramA.b(3, true);
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
  }
}
