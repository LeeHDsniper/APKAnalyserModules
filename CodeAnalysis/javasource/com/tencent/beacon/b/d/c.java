package com.tencent.beacon.b.d;

import java.util.ArrayList;

public final class c
  extends com.tencent.beacon.e.c
  implements Cloneable
{
  private static ArrayList<b> d;
  private static ArrayList<a> e;
  private static ArrayList<d> f;
  public ArrayList<b> a = null;
  public ArrayList<a> b = null;
  public ArrayList<d> c = null;
  
  public c() {}
  
  public final void a(com.tencent.beacon.e.a paramA)
  {
    Object localObject;
    if (d == null)
    {
      d = new ArrayList();
      localObject = new b();
      d.add(localObject);
    }
    a = ((ArrayList)paramA.a(d, 0, true));
    if (e == null)
    {
      e = new ArrayList();
      localObject = new a();
      e.add(localObject);
    }
    b = ((ArrayList)paramA.a(e, 1, true));
    if (f == null)
    {
      f = new ArrayList();
      localObject = new d();
      f.add(localObject);
    }
    c = ((ArrayList)paramA.a(f, 2, false));
  }
  
  public final void a(com.tencent.beacon.e.b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    if (c != null) {
      paramB.a(c, 2);
    }
  }
}
