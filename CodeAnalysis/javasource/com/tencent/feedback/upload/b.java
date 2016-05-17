package com.tencent.feedback.upload;

import com.tencent.feedback.common.e;

public class b
{
  private long a = 0L;
  private long b = 0L;
  private int c = 0;
  
  public b() {}
  
  public long a()
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
  
  public void a(long paramLong)
  {
    try
    {
      e.b("rqdp{  recevied:}%d", new Object[] { Long.valueOf(paramLong) });
      b += paramLong;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void a(String paramString1, long paramLong, String paramString2)
  {
    try
    {
      e.b("rqdp{  send:}%s rqdp{  sz:}%d rqdp{  apn:}%s", new Object[] { paramString1, Long.valueOf(paramLong), paramString2 });
      c += 1;
      a += paramLong;
      return;
    }
    finally
    {
      paramString1 = finally;
      throw paramString1;
    }
  }
  
  public long b()
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
}
