package com.tencent.beacon.e;

import java.util.HashMap;
import java.util.Map;

public final class e
  extends c
{
  private static byte[] k = null;
  private static Map<String, String> l = null;
  public short a = 3;
  public int b = 0;
  public String c = null;
  public String d = null;
  public byte[] e;
  private byte f = 0;
  private int g = 0;
  private int h = 0;
  private Map<String, String> i;
  private Map<String, String> j;
  
  public e() {}
  
  public final void a(a paramA)
  {
    try
    {
      a = paramA.a(a, 1, true);
      f = paramA.a(f, 2, true);
      g = paramA.a(g, 3, true);
      b = paramA.a(b, 4, true);
      c = paramA.b(5, true);
      d = paramA.b(6, true);
      if (k == null) {
        k = new byte[1];
      }
      Object localObject = k;
      e = paramA.c(7, true);
      h = paramA.a(h, 8, true);
      if (l == null)
      {
        localObject = new HashMap();
        l = (Map)localObject;
        ((Map)localObject).put("", "");
      }
      i = ((Map)paramA.a(l, 9, true));
      if (l == null)
      {
        localObject = new HashMap();
        l = (Map)localObject;
        ((Map)localObject).put("", "");
      }
      j = ((Map)paramA.a(l, 10, true));
      return;
    }
    catch (Exception paramA)
    {
      paramA.printStackTrace();
      throw new RuntimeException(paramA);
    }
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 1);
    paramB.a(f, 2);
    paramB.a(g, 3);
    paramB.a(b, 4);
    paramB.a(c, 5);
    paramB.a(d, 6);
    paramB.a(e, 7);
    paramB.a(h, 8);
    paramB.a(i, 9);
    paramB.a(j, 10);
  }
}
