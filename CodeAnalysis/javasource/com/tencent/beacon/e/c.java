package com.tencent.beacon.e;

import java.io.Serializable;

public abstract class c
  implements Serializable
{
  public c() {}
  
  public abstract void a(a paramA);
  
  public abstract void a(b paramB);
  
  public final byte[] a()
  {
    b localB = new b();
    a(localB);
    return localB.b();
  }
}
