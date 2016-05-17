package com.tencent.beacon.event;

import java.util.HashMap;
import java.util.Map;

public final class e
{
  public String a;
  public boolean b;
  public long c;
  public long d;
  public Map<String, String> e;
  boolean f;
  
  public e(String paramString, boolean paramBoolean1, long paramLong1, long paramLong2, Map<String, String> paramMap, boolean paramBoolean2)
  {
    a = paramString;
    b = paramBoolean1;
    c = paramLong1;
    d = paramLong2;
    if (paramMap != null)
    {
      e = new HashMap();
      e.putAll(paramMap);
    }
    f = paramBoolean2;
  }
}
