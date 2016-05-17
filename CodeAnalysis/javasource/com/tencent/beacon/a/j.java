package com.tencent.beacon.a;

import android.content.Context;
import com.tencent.beacon.d.c;
import com.tencent.beacon.event.UserAction;

public final class j
{
  private static j s;
  private String a = "";
  private String b = "";
  private String c = "";
  private String d = "";
  private String e = "";
  private String f = "";
  private String g = "";
  private String h = "";
  private String i = "";
  private String j = "";
  private boolean k = false;
  private String l = "";
  private String m = "";
  private String n = "";
  private String o = "";
  private String p = "";
  private String q = "";
  private String r = "";
  
  private j(Context paramContext)
  {
    f.a(paramContext);
    c = f.e(paramContext);
    d = f.c(paramContext);
    e = f.d(paramContext);
    if ("".equals(c))
    {
      str = f.f("/sys/class/net/eth0/address");
      if ((!str.trim().equals("")) && (str.length() >= 17)) {
        break label724;
      }
    }
    for (String str = "";; str = str.toLowerCase().substring(0, 17))
    {
      f = str;
      g = UserAction.getQQ();
      h = f.b();
      i = f.k();
      j = f.a();
      k = c.a().b();
      f.l(paramContext);
      str = b.b(paramContext, "f_non_empty_qimei_v2", "");
      Object localObject = str.split("\\|\\|\\|");
      if (localObject.length == 7)
      {
        l = localObject[0];
        m = localObject[1];
        n = localObject[2];
        o = localObject[3];
        p = localObject[4];
        q = localObject[5];
        r = localObject[6];
      }
      if ((!b.equals("")) && (l.trim().equals(""))) {
        l = b;
      }
      if ((!c.equals("")) && (m.trim().equals(""))) {
        m = c;
      }
      if ((!d.equals("")) && (n.trim().equals(""))) {
        n = d;
      }
      if ((!h.equals("")) && (o.trim().equals(""))) {
        o = h;
      }
      if ((!f.equals("")) && (p.trim().equals(""))) {
        p = f;
      }
      if ((!e.equals("")) && (q.trim().equals(""))) {
        q = e;
      }
      if ((!i.equals("")) && (r.trim().equals(""))) {
        r = i;
      }
      localObject = new StringBuilder();
      ((StringBuilder)localObject).append(l);
      ((StringBuilder)localObject).append("|||");
      ((StringBuilder)localObject).append(m);
      ((StringBuilder)localObject).append("|||");
      ((StringBuilder)localObject).append(n);
      ((StringBuilder)localObject).append("|||");
      ((StringBuilder)localObject).append(o);
      ((StringBuilder)localObject).append("|||");
      ((StringBuilder)localObject).append(p);
      ((StringBuilder)localObject).append("|||");
      ((StringBuilder)localObject).append(q);
      ((StringBuilder)localObject).append("|||");
      ((StringBuilder)localObject).append(r);
      if (!((StringBuilder)localObject).toString().equals(str)) {
        b.a(paramContext, "f_non_empty_qimei_v2", ((StringBuilder)localObject).toString());
      }
      label724:
      try
      {
        paramContext = new com.tencent.beacon.d.b(paramContext).a();
        if ((paramContext != null) && (!"".equals(paramContext))) {
          a = paramContext;
        }
        return;
      }
      catch (Exception paramContext) {}
    }
  }
  
  public static j a(Context paramContext)
  {
    if (s == null) {
      s = new j(paramContext);
    }
    return s;
  }
  
  public final String a()
  {
    if ((a == null) || ("".equals(a)))
    {
      if ("".equals(b)) {
        return e;
      }
      return b;
    }
    return a;
  }
  
  public final void a(String paramString)
  {
    a = paramString;
  }
  
  public final String b()
  {
    return a;
  }
  
  public final String c()
  {
    return b;
  }
  
  public final String d()
  {
    return c;
  }
  
  public final String e()
  {
    return d;
  }
  
  public final String f()
  {
    return e;
  }
  
  public final String g()
  {
    return j;
  }
  
  public final boolean h()
  {
    return k;
  }
  
  public final String i()
  {
    return l;
  }
  
  public final String j()
  {
    return m;
  }
  
  public final String k()
  {
    return n;
  }
  
  public final String l()
  {
    return o;
  }
  
  public final String m()
  {
    return p;
  }
  
  public final String n()
  {
    return q;
  }
  
  public final String o()
  {
    return r;
  }
  
  public final String p()
  {
    return g;
  }
  
  public final String q()
  {
    return h;
  }
  
  public final String r()
  {
    return i;
  }
}
