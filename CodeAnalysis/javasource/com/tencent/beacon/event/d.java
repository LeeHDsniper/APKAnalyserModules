package com.tencent.beacon.event;

import android.content.Context;
import com.tencent.beacon.a.b;
import com.tencent.beacon.a.f;
import com.tencent.beacon.d.a;
import com.tencent.beacon.upload.i;

public final class d
{
  private static d a = null;
  private String b = "";
  private String c = "";
  private String d = "";
  private String e = "";
  private String f = "";
  private String g = "";
  
  private d(Context paramContext)
  {
    if (paramContext == null) {
      a.d(" DetailUserInfo context == null? pls check!", new Object[0]);
    }
    a.b(" start to create DetailUserInfo", new Object[0]);
    long l = System.currentTimeMillis();
    f.a(paramContext);
    b = f.b(paramContext);
    a.b(" imei:" + b, new Object[0]);
    if (!"".equals(b)) {}
    try
    {
      if ("".equals(b.b(paramContext, "IMEI_DENGTA", ""))) {
        b.a(paramContext, "IMEI_DENGTA", b);
      }
      c = f.e(paramContext);
      d = f.c(paramContext);
      e = f.d(paramContext);
      f = f.c(b.b(paramContext));
      if (i.a(paramContext).a()) {}
      for (g = f.l();; g = "")
      {
        a.b(" detail create cost: %d  values:\n %s", new Object[] { Long.valueOf(System.currentTimeMillis() - l), toString() });
        return;
      }
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public static d a(Context paramContext)
  {
    try
    {
      if (a == null) {
        a = new d(paramContext);
      }
      paramContext = a;
      return paramContext;
    }
    finally {}
  }
  
  public final String a()
  {
    return g;
  }
  
  public final String b()
  {
    try
    {
      String str = b;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String c()
  {
    try
    {
      String str = c;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
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
      String str = e;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final String f()
  {
    try
    {
      String str = f;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
