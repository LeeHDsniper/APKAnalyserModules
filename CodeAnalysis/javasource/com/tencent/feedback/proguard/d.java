package com.tencent.feedback.proguard;

import java.nio.ByteBuffer;
import java.util.HashMap;

public final class d
  extends c
{
  private static HashMap<String, byte[]> f = null;
  private static HashMap<String, HashMap<String, byte[]>> g = null;
  private f e = new f();
  
  public d()
  {
    e.a = 2;
  }
  
  public final void a(int paramInt)
  {
    e.b = 1;
  }
  
  public final <T> void a(String paramString, T paramT)
  {
    if (paramString.startsWith(".")) {
      throw new IllegalArgumentException("put name can not startwith . , now is " + paramString);
    }
    super.a(paramString, paramT);
  }
  
  public final void a(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte.length < 4) {
      throw new IllegalArgumentException("decode package must include size head");
    }
    try
    {
      paramArrayOfByte = new h(paramArrayOfByte, 4);
      paramArrayOfByte.a(b);
      e.a(paramArrayOfByte);
      HashMap localHashMap;
      if (e.a == 3)
      {
        paramArrayOfByte = new h(e.e);
        paramArrayOfByte.a(b);
        if (f == null)
        {
          localHashMap = new HashMap();
          f = localHashMap;
          localHashMap.put("", new byte[0]);
        }
        d = paramArrayOfByte.a(f, 0, false);
        return;
      }
      paramArrayOfByte = new h(e.e);
      paramArrayOfByte.a(b);
      if (g == null)
      {
        g = new HashMap();
        localHashMap = new HashMap();
        localHashMap.put("", new byte[0]);
        g.put("", localHashMap);
      }
      a = paramArrayOfByte.a(g, 0, false);
      new HashMap();
      return;
    }
    catch (Exception paramArrayOfByte)
    {
      throw new RuntimeException(paramArrayOfByte);
    }
  }
  
  public final byte[] a()
  {
    if (e.a == 2)
    {
      if (e.c.equals("")) {
        throw new IllegalArgumentException("servantName can not is null");
      }
      if (e.d.equals("")) {
        throw new IllegalArgumentException("funcName can not is null");
      }
    }
    else
    {
      if (e.c == null) {
        e.c = "";
      }
      if (e.d == null) {
        e.d = "";
      }
    }
    Object localObject = new i(0);
    ((i)localObject).a(b);
    if (e.a == 2) {
      ((i)localObject).a(a, 0);
    }
    for (;;)
    {
      e.e = k.a(((i)localObject).a());
      localObject = new i(0);
      ((i)localObject).a(b);
      e.a((i)localObject);
      localObject = k.a(((i)localObject).a());
      int i = localObject.length;
      ByteBuffer localByteBuffer = ByteBuffer.allocate(i + 4);
      localByteBuffer.putInt(i + 4).put((byte[])localObject).flip();
      return localByteBuffer.array();
      ((i)localObject).a(d, 0);
    }
  }
  
  public final void c(String paramString)
  {
    e.c = paramString;
  }
  
  public final void d(String paramString)
  {
    e.d = paramString;
  }
  
  public final void e()
  {
    super.e();
    e.a = 3;
  }
}
