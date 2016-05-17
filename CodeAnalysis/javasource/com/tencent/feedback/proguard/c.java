package com.tencent.feedback.proguard;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class c
  extends a
{
  protected HashMap<String, byte[]> d = null;
  private HashMap<String, Object> e = new HashMap();
  private h f = new h();
  
  public c() {}
  
  public <T> void a(String paramString, T paramT)
  {
    if (d != null)
    {
      if (paramString == null) {
        throw new IllegalArgumentException("put key can not is null");
      }
      if (paramT == null) {
        throw new IllegalArgumentException("put value can not is null");
      }
      if ((paramT instanceof Set)) {
        throw new IllegalArgumentException("can not support Set");
      }
      i localI = new i();
      localI.a(b);
      localI.a(paramT, 0);
      paramT = k.a(localI.a());
      d.put(paramString, paramT);
      return;
    }
    super.a(paramString, paramT);
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    try
    {
      super.a(paramArrayOfByte);
      return;
    }
    catch (Exception localException)
    {
      f.a(paramArrayOfByte);
      f.a(b);
      paramArrayOfByte = new HashMap(1);
      paramArrayOfByte.put("", new byte[0]);
      d = f.a(paramArrayOfByte, 0, false);
    }
  }
  
  public byte[] a()
  {
    if (d != null)
    {
      i localI = new i(0);
      localI.a(b);
      localI.a(d, 0);
      return k.a(localI.a());
    }
    return super.a();
  }
  
  public final <T> T b(String paramString, T paramT)
    throws b
  {
    Object localObject = null;
    if (d != null) {
      if (d.containsKey(paramString)) {}
    }
    while (!a.containsKey(paramString)) {
      for (;;)
      {
        return localObject;
        if (e.containsKey(paramString)) {
          return e.get(paramString);
        }
        localObject = (byte[])d.get(paramString);
        try
        {
          f.a((byte[])localObject);
          f.a(b);
          paramT = f.a(paramT, 0, true);
          localObject = paramT;
          if (paramT != null)
          {
            e.put(paramString, paramT);
            return paramT;
          }
        }
        catch (Exception paramString)
        {
          throw new b(paramString);
        }
      }
    }
    if (e.containsKey(paramString)) {
      return e.get(paramString);
    }
    localObject = ((HashMap)a.get(paramString)).entrySet().iterator();
    if (((Iterator)localObject).hasNext())
    {
      localObject = (Map.Entry)((Iterator)localObject).next();
      ((Map.Entry)localObject).getKey();
    }
    for (localObject = (byte[])((Map.Entry)localObject).getValue();; localObject = new byte[0]) {
      try
      {
        f.a((byte[])localObject);
        f.a(b);
        paramT = f.a(paramT, 0, true);
        e.put(paramString, paramT);
        return paramT;
      }
      catch (Exception paramString)
      {
        throw new b(paramString);
      }
    }
  }
  
  public void e()
  {
    d = new HashMap();
  }
}
