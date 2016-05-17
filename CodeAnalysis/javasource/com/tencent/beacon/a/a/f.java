package com.tencent.beacon.a.a;

import com.tencent.beacon.d.a;
import java.io.Serializable;
import java.util.Locale;

public class f
  implements Serializable
{
  public int a;
  public long b;
  public long c;
  public long d;
  public long e;
  public long f;
  public long g;
  public long h;
  public long i;
  private long j = -1L;
  
  public f(int paramInt, long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6)
  {
    a = paramInt;
    b = paramLong1;
    c = paramLong2;
    d = paramLong3;
    e = paramLong4;
    f = paramLong5;
    g = paramLong6;
  }
  
  public final long a()
  {
    try
    {
      long l = j;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(long paramLong)
  {
    try
    {
      j = paramLong;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public String toString()
  {
    try
    {
      String str = String.format(Locale.US, "[tp:%d , st:%d ,counts:%d, wifi:%d , notWifi:%d , up:%d , dn:%d]", new Object[] { Integer.valueOf(a), Long.valueOf(b), Long.valueOf(c), Long.valueOf(d), Long.valueOf(e), Long.valueOf(f), Long.valueOf(g) });
      return str;
    }
    catch (Throwable localThrowable)
    {
      a.a(localThrowable);
    }
    return null;
  }
}
