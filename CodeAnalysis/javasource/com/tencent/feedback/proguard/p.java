package com.tencent.feedback.proguard;

import com.tencent.feedback.common.e;
import java.io.Serializable;
import java.util.Locale;

public class p
  implements Serializable
{
  public final int a;
  public final long b;
  public final long c;
  public final long d;
  public final long e;
  public final long f;
  public final long g;
  private long h = -1L;
  
  public p(int paramInt, long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6)
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
      long l = h;
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
      h = paramLong;
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
      if (!e.a(localThrowable)) {
        localThrowable.printStackTrace();
      }
    }
    return null;
  }
}
