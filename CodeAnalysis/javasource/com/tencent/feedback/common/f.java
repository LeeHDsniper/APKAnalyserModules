package com.tencent.feedback.common;

import android.content.Context;
import com.tencent.feedback.proguard.a;
import com.tencent.feedback.proguard.p;
import com.tencent.feedback.upload.UploadHandleListener;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public final class f
  implements UploadHandleListener
{
  private static f d = null;
  private p a;
  private p b;
  private Context c = null;
  
  private f(Context paramContext)
  {
    if (paramContext == null) {}
    for (;;)
    {
      c = paramContext;
      com.tencent.feedback.upload.f.a(c).a(this);
      c();
      if (d() > 0) {
        e();
      }
      return;
      Context localContext = paramContext.getApplicationContext();
      if (localContext != null) {
        paramContext = localContext;
      }
    }
  }
  
  public static f a(Context paramContext)
  {
    try
    {
      if (d == null) {
        d = new f(paramContext);
      }
      paramContext = d;
      return paramContext;
    }
    finally {}
  }
  
  private p a()
  {
    try
    {
      p localP = a;
      return localP;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void a(long paramLong1, long paramLong2, boolean paramBoolean)
  {
    for (;;)
    {
      long l3;
      long l2;
      long l1;
      try
      {
        l3 = new Date().getTime();
        l2 = paramLong1 + paramLong2;
        if (paramBoolean)
        {
          l1 = l2;
          break label277;
          if (b == null)
          {
            b = new p(1, l3, 1L, l1, l2, paramLong1, paramLong2);
            if (a != null) {
              break label190;
            }
            a = new p(0, l3, 1L, l1, l2, paramLong1, paramLong2);
          }
        }
        else
        {
          l1 = 0L;
          break label277;
        }
        long l4 = b.a();
        b = new p(1, b.b, 1L + b.c, b.d + l1, b.e + l2, b.f + paramLong1, b.g + paramLong2);
        b.a(l4);
        continue;
        l3 = a.a();
      }
      finally {}
      label190:
      a = new p(0, a.b, a.c + 1L, l1 + a.d, l2 + a.e, a.f + paramLong1, a.g + paramLong2);
      a.a(l3);
      continue;
      label277:
      if (paramBoolean) {
        l2 = 0L;
      }
    }
  }
  
  private void a(p paramP)
  {
    try
    {
      a = paramP;
      return;
    }
    finally
    {
      paramP = finally;
      throw paramP;
    }
  }
  
  private p b()
  {
    try
    {
      d();
      p localP = b;
      return localP;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static p b(Context paramContext)
  {
    return a(paramContext).a();
  }
  
  private void b(p paramP)
  {
    try
    {
      b = paramP;
      return;
    }
    finally
    {
      paramP = finally;
      throw paramP;
    }
  }
  
  private void c()
  {
    Object localObject = a.a(c);
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        p localP = (p)((Iterator)localObject).next();
        if (a == 0) {
          a(localP);
        } else if (a == 1) {
          b(localP);
        }
      }
    }
  }
  
  public static void c(Context paramContext)
  {
    paramContext = a(paramContext);
    long l = new Date().getTime();
    p localP = paramContext.a();
    if ((localP != null) && (localP.a() >= 0L)) {
      a.b(c, new p[] { localP });
    }
    paramContext.a(new p(0, l, 0L, 0L, 0L, 0L, 0L));
  }
  
  private int d()
  {
    for (;;)
    {
      try
      {
        long l1 = a.c();
        long l2 = new Date().getTime();
        int i = 0;
        if ((b == null) || (b.b < l1))
        {
          b = new p(1, l2, 0L, 0L, 0L, 0L, 0L);
          i = 1;
        }
        if (a == null)
        {
          a = new p(0, l2, 0L, 0L, 0L, 0L, 0L);
          i += 1;
          return i;
        }
      }
      finally {}
    }
  }
  
  private void e()
  {
    ArrayList localArrayList = new ArrayList();
    p localP = a();
    if (localP != null) {
      localArrayList.add(localP);
    }
    localP = b();
    if (localP != null) {
      localArrayList.add(localP);
    }
    if (localArrayList.size() > 0) {
      a.a(c, (p[])localArrayList.toArray(new p[localArrayList.size()]));
    }
  }
  
  public final void onUploadEnd(int paramInt1, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, String paramString)
  {
    e.a("rqdp{  req:}%d rqdp{  res:}%d rqdp{  send:}%d rqdp{  recv:}%d rqdp{  result:}%b rqdp{  msg:}%s", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Long.valueOf(paramLong1), Long.valueOf(paramLong2), Boolean.valueOf(paramBoolean), paramString });
    c();
    d();
    a(paramLong1, paramLong2, g.a(c));
    e();
    e.b("rqdp{  [total:}%s]rqdp{  \n[today:}%s]", new Object[] { a(), b() });
  }
  
  public final void onUploadStart(int paramInt) {}
}
