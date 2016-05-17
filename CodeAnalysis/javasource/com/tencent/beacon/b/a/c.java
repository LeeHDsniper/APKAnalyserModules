package com.tencent.beacon.b.a;

import com.tencent.beacon.e.a;
import com.tencent.beacon.e.b;

public final class c
  extends com.tencent.beacon.e.c
{
  private static byte[] j;
  public byte a = 0;
  public int b = 0;
  public byte[] c = null;
  public String d = "";
  public long e = 0L;
  public String f = "";
  private byte g = 0;
  private byte h = 0;
  private String i = "";
  
  public c() {}
  
  public final void a(a paramA)
  {
    a = paramA.a(a, 0, true);
    b = paramA.a(b, 1, true);
    if (j == null)
    {
      arrayOfByte = new byte[1];
      j = arrayOfByte;
      arrayOfByte[0] = 0;
    }
    byte[] arrayOfByte = j;
    c = paramA.c(2, true);
    d = paramA.b(3, true);
    g = paramA.a(g, 4, true);
    h = paramA.a(h, 5, true);
    e = paramA.a(e, 6, true);
    f = paramA.b(7, false);
    i = paramA.b(8, false);
  }
  
  public final void a(b paramB)
  {
    paramB.a(a, 0);
    paramB.a(b, 1);
    paramB.a(c, 2);
    paramB.a(d, 3);
    paramB.a(g, 4);
    paramB.a(h, 5);
    paramB.a(e, 6);
    if (f != null) {
      paramB.a(f, 7);
    }
    if (i != null) {
      paramB.a(i, 8);
    }
  }
}
