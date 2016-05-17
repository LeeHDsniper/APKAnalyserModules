package com.tencent.beacon.upload;

import com.tencent.beacon.d.a;

public final class e
{
  private long a = 0L;
  private long b = 0L;
  private int c = 0;
  private long d = 0L;
  private String e = "";
  
  public e() {}
  
  private void a(int paramInt)
  {
    try
    {
      c = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final long a()
  {
    try
    {
      long l = a;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(long paramLong1, long paramLong2)
  {
    try
    {
      a.h("recevied: %d", new Object[] { Long.valueOf(paramLong1) });
      b += paramLong1;
      d = paramLong2;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(String paramString1, long paramLong, String paramString2, int paramInt)
  {
    try
    {
      a.h("send: %s sz: %d apn: %s", new Object[] { paramString1, Long.valueOf(paramLong), paramString2 });
      e = paramString2;
      c += 1;
      a += paramLong;
      a(paramInt);
      return;
    }
    finally
    {
      paramString1 = finally;
      throw paramString1;
    }
  }
  
  public final long b()
  {
    try
    {
      long l = b;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final int c()
  {
    try
    {
      int i = c;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final long d()
  {
    try
    {
      long l = d;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String e()
  {
    try
    {
      String str = e;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
