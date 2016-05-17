package com.tencent.beacon.b.e;

import com.tencent.beacon.e.a;
import java.util.ArrayList;

public final class e
  extends com.tencent.beacon.e.c
{
  private static ArrayList<c> d;
  private static ArrayList<b> e;
  private static ArrayList<f> f;
  private ArrayList<c> a = null;
  private ArrayList<b> b = null;
  private ArrayList<f> c = null;
  
  public e() {}
  
  public final void a(a paramA)
  {
    Object localObject;
    if (d == null)
    {
      d = new ArrayList();
      localObject = new c();
      d.add(localObject);
    }
    a = ((ArrayList)paramA.a(d, 0, true));
    if (e == null)
    {
      e = new ArrayList();
      localObject = new b();
      e.add(localObject);
    }
    b = ((ArrayList)paramA.a(e, 1, true));
    if (f == null)
    {
      f = new ArrayList();
      localObject = new f();
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
