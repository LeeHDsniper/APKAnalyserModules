package com.facebook.ads.internal.util;

import com.facebook.ads.AdSize;
import com.facebook.ads.internal.dto.b;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class d
{
  private static Map<String, Long> a = new ConcurrentHashMap();
  private static Map<String, Long> b = new ConcurrentHashMap();
  private static Map<String, String> c = new ConcurrentHashMap();
  
  private static long a(String paramString, b paramB)
  {
    long l = -1000L;
    if (a.containsKey(paramString))
    {
      l = ((Long)a.get(paramString)).longValue();
      return l;
    }
    switch (1.a[paramB.ordinal()])
    {
    case 2: 
    case 3: 
    default: 
      return -1000L;
    }
    return 15000L;
  }
  
  public static void a(long paramLong, com.facebook.ads.internal.dto.e paramE)
  {
    a.put(d(paramE), Long.valueOf(paramLong));
  }
  
  public static void a(String paramString, com.facebook.ads.internal.dto.e paramE)
  {
    c.put(d(paramE), paramString);
  }
  
  public static boolean a(com.facebook.ads.internal.dto.e paramE)
  {
    String str = d(paramE);
    if (!b.containsKey(str)) {
      return false;
    }
    long l1 = ((Long)b.get(str)).longValue();
    long l2 = a(str, paramE.b());
    if (System.currentTimeMillis() - l1 < l2) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static void b(com.facebook.ads.internal.dto.e paramE)
  {
    b.put(d(paramE), Long.valueOf(System.currentTimeMillis()));
  }
  
  public static String c(com.facebook.ads.internal.dto.e paramE)
  {
    return (String)c.get(d(paramE));
  }
  
  private static String d(com.facebook.ads.internal.dto.e paramE)
  {
    int j = 0;
    String str = paramE.a();
    b localB = paramE.b();
    com.facebook.ads.internal.e localE = e;
    int i;
    if (paramE.c() == null)
    {
      i = 0;
      if (paramE.c() != null) {
        break label95;
      }
    }
    for (;;)
    {
      return String.format("%s:%s:%s:%d:%d:%d", new Object[] { str, localB, localE, Integer.valueOf(i), Integer.valueOf(j), Integer.valueOf(paramE.d()) });
      i = paramE.c().getHeight();
      break;
      label95:
      j = paramE.c().getWidth();
    }
  }
}
