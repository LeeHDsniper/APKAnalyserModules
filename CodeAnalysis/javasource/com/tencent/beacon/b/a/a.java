package com.tencent.beacon.b.a;

import com.tencent.beacon.e.b;
import com.tencent.beacon.e.c;
import java.util.HashMap;
import java.util.Map;

public final class a
  extends c
  implements Cloneable
{
  private static Map<Integer, byte[]> b;
  public Map<Integer, byte[]> a = null;
  
  public a() {}
  
  public final void a(com.tencent.beacon.e.a paramA)
  {
    if (b == null)
    {
      b = new HashMap();
      b.put(Integer.valueOf(0), new byte[] { 0 });
    }
    a = ((Map)paramA.a(b, 0, true));
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
  }
}
