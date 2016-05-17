package com.tencent.beacon.b.b;

import com.tencent.beacon.e.c;
import java.util.ArrayList;

public final class b
  extends c
  implements Cloneable
{
  private static ArrayList<a> b;
  public ArrayList<a> a = null;
  
  public b() {}
  
  public final void a(com.tencent.beacon.e.a paramA)
  {
    if (b == null)
    {
      b = new ArrayList();
      a localA = new a();
      b.add(localA);
    }
    a = ((ArrayList)paramA.a(b, 0, true));
  }
  
  public final void a(com.tencent.beacon.e.b paramB)
  {
    paramB.a(a, 0);
  }
}
