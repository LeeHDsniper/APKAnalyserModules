package com.tencent.beacon.upload;

import android.content.Context;
import com.tencent.beacon.a.b.d.a;
import com.tencent.beacon.a.f;

public abstract class a
{
  protected final int a;
  protected final int b;
  protected Context c;
  protected String d;
  protected int e;
  
  public a(Context paramContext, int paramInt1, int paramInt2)
  {
    c = paramContext;
    a = paramInt2;
    b = paramInt1;
  }
  
  public static com.tencent.beacon.b.a.b a(int paramInt, byte[] paramArrayOfByte)
  {
    try
    {
      paramArrayOfByte = f.a(paramInt, com.tencent.beacon.a.d.m(), paramArrayOfByte, 2, 3);
      return paramArrayOfByte;
    }
    catch (Throwable paramArrayOfByte)
    {
      com.tencent.beacon.d.a.c("imposiable comStrategy error:%s", new Object[] { paramArrayOfByte.toString() });
      com.tencent.beacon.d.a.a(paramArrayOfByte);
    }
    return null;
  }
  
  public abstract com.tencent.beacon.b.a.b a();
  
  public void b()
  {
    com.tencent.beacon.d.a.c("encode failed, clear db data", new Object[0]);
  }
  
  public abstract void b(boolean paramBoolean);
  
  public final int c()
  {
    return a;
  }
  
  public final String d()
  {
    try
    {
      String str = d;
      return str;
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
      if (b == 0) {
        return com.tencent.beacon.a.b.b.a(c).e().b();
      }
      String str = com.tencent.beacon.a.b.b.a(c).e().b(b).b();
      return str;
    }
    catch (Throwable localThrowable)
    {
      com.tencent.beacon.d.a.c("imposiable comStrategy error:%s", new Object[] { localThrowable.toString() });
      com.tencent.beacon.d.a.a(localThrowable);
    }
    return null;
  }
  
  public final int f()
  {
    try
    {
      int i = e;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
