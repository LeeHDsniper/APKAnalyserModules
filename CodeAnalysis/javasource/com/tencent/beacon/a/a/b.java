package com.tencent.beacon.a.a;

import java.io.Serializable;

public final class b
  implements Serializable
{
  public long a;
  public String b;
  public int c;
  public boolean d;
  public boolean e;
  
  public b() {}
  
  public final boolean equals(Object paramObject)
  {
    if (paramObject == null) {}
    do
    {
      do
      {
        return false;
      } while ((getClass() != paramObject.getClass()) || (!(paramObject instanceof b)));
      paramObject = (b)paramObject;
    } while ((b == null) || (!b.equals(b)));
    return true;
  }
}
