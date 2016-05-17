package com.tencent.mobileqq.msf.core;

import com.tencent.msf.service.protocol.serverconfig.j;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class d
{
  public static final int a = 0;
  public static final int b = 1;
  public static final String c = "00000";
  public static final String d = "http";
  public static final String e = "socket";
  public byte f = 1;
  public byte g = 0;
  public boolean h = false;
  public String i = "";
  public AtomicInteger j = new AtomicInteger();
  long k = 0L;
  public boolean l = false;
  private String m = "socket";
  private String n;
  private int o;
  private int p = 20000;
  private boolean q = false;
  
  public d() {}
  
  public static d a(j paramJ, int paramInt)
  {
    d localD = new d();
    if ((e == 2) || (e == 3))
    {
      m = "http";
      n = a;
      o = b;
      i = "";
      f = 0;
      g = d;
      if (f <= 20) {
        break label135;
      }
      p = 20000;
      label81:
      if (paramInt != 0) {
        break label168;
      }
      i = "00000";
      localD.a(true);
    }
    for (;;)
    {
      if (g == 1) {
        q = true;
      }
      return localD;
      if ((e != 0) && (e != 1)) {
        break;
      }
      m = "socket";
      break;
      label135:
      if (f < 5)
      {
        p = 5000;
        break label81;
      }
      p = (f * 1000);
      break label81;
      label168:
      localD.a(false);
    }
  }
  
  public static d a(String paramString)
  {
    Object localObject = paramString.toLowerCase();
    paramString = new d();
    localObject = Pattern.compile("([a-zA-Z]+)://([a-zA-Z0-9.]+)(:([0-9]+))?(#([0-9_]*))?(:([0-9]+))?(:([0-9]+))?(:([0-9]+))?(:([a-zA-Z]+))?").matcher((CharSequence)localObject);
    if (((Matcher)localObject).matches())
    {
      if (((Matcher)localObject).group(1) != null) {
        m = ((Matcher)localObject).group(1);
      }
      if (((Matcher)localObject).group(2) != null) {
        n = ((Matcher)localObject).group(2);
      }
      if (((Matcher)localObject).group(4) == null) {
        break label210;
      }
    }
    label210:
    for (o = Integer.parseInt(((Matcher)localObject).group(4));; o = 80)
    {
      if (((Matcher)localObject).group(6) != null) {
        i = ((Matcher)localObject).group(6);
      }
      if (((Matcher)localObject).group(8) != null) {
        f = Byte.parseByte(((Matcher)localObject).group(8));
      }
      if (((Matcher)localObject).group(10) != null) {
        g = Byte.parseByte(((Matcher)localObject).group(10));
      }
      if (((Matcher)localObject).group(12) != null) {
        p = (Integer.parseInt(((Matcher)localObject).group(12)) * 1000);
      }
      if (((Matcher)localObject).group(14) != null) {
        q = Boolean.parseBoolean(((Matcher)localObject).group(14));
      }
      paramString.a(i.equals("00000"));
      return paramString;
    }
  }
  
  public String a()
  {
    return n + ":" + o;
  }
  
  public void a(int paramInt)
  {
    o = paramInt;
  }
  
  public void a(boolean paramBoolean)
  {
    l = paramBoolean;
  }
  
  public boolean a(com.tencent.qphone.base.a paramA)
  {
    boolean bool = false;
    long l1 = System.currentTimeMillis();
    if ((paramA == com.tencent.qphone.base.a.d) || (paramA == com.tencent.qphone.base.a.c)) {
      if ((k == 0L) || (l1 - k > 600000L))
      {
        k = l1;
        j.incrementAndGet();
      }
    }
    for (;;)
    {
      if (j.get() > 19)
      {
        j.set(0);
        bool = true;
      }
      return bool;
      j.addAndGet(com.tencent.mobileqq.msf.core.a.a.aK());
      continue;
      if (paramA == com.tencent.qphone.base.a.e) {
        j.addAndGet(com.tencent.mobileqq.msf.core.a.a.aL());
      } else if (paramA == com.tencent.qphone.base.a.B) {
        j.addAndGet(com.tencent.mobileqq.msf.core.a.a.aM());
      } else if (paramA == com.tencent.qphone.base.a.p) {
        j.addAndGet(com.tencent.mobileqq.msf.core.a.a.aN());
      } else if (paramA == com.tencent.qphone.base.a.j) {
        j.addAndGet(com.tencent.mobileqq.msf.core.a.a.aO());
      } else if (paramA == com.tencent.qphone.base.a.i) {
        j.addAndGet(com.tencent.mobileqq.msf.core.a.a.aP());
      }
    }
  }
  
  public String b()
  {
    return m;
  }
  
  public void b(int paramInt)
  {
    p = paramInt;
  }
  
  public void b(String paramString)
  {
    m = paramString;
  }
  
  public void b(boolean paramBoolean)
  {
    q = paramBoolean;
  }
  
  public String c()
  {
    return n;
  }
  
  public void c(String paramString)
  {
    n = paramString;
  }
  
  public int d()
  {
    return o;
  }
  
  public int e()
  {
    return p;
  }
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof d)) && (((d)paramObject).toString().equals(toString()));
  }
  
  public void f()
  {
    k = System.currentTimeMillis();
  }
  
  public boolean g()
  {
    return l;
  }
  
  public boolean h()
  {
    return q;
  }
  
  public int hashCode()
  {
    return toString().hashCode();
  }
  
  public String toString()
  {
    return m + "://" + n + ":" + o + "#" + i + ":" + f + ":" + g + ":" + p / 1000 + ":" + q;
  }
}
