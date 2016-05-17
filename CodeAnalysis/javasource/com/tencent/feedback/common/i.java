package com.tencent.feedback.common;

import android.content.Context;
import com.tencent.feedback.proguard.s;
import com.tencent.feedback.proguard.t;
import com.tencent.feedback.proguard.w;
import com.tencent.feedback.proguard.w.a;
import com.tencent.feedback.proguard.x;
import com.tencent.feedback.proguard.z;
import com.tencent.feedback.upload.UploadHandleListener;
import com.tencent.feedback.upload.d;

public class i
  implements s, x
{
  protected final Context a;
  private int b;
  private int c;
  private int d;
  private boolean e;
  private boolean f;
  private com.tencent.feedback.upload.e g;
  private d h;
  private int i = 0;
  
  public i(Context paramContext, String paramString, int paramInt1, int paramInt2, int paramInt3, com.tencent.feedback.upload.e paramE, d paramD, UploadHandleListener paramUploadHandleListener)
  {
    if (paramContext == null) {}
    for (;;)
    {
      a = paramContext;
      paramContext = c.a(a);
      if ((paramString != null) && (paramString.trim().length() > 0)) {
        paramContext.a(paramString);
      }
      b = 3;
      c = 530;
      d = 510;
      g = paramE;
      h = paramD;
      if (paramE != null)
      {
        paramE.a(paramD);
        paramE.a(paramUploadHandleListener);
      }
      paramContext = t.a(a);
      paramContext.a(this);
      paramContext.a(this);
      paramContext.a(3, paramE);
      return;
      Context localContext = paramContext.getApplicationContext();
      if (localContext != null) {
        paramContext = localContext;
      }
    }
  }
  
  private void a(int paramInt)
  {
    try
    {
      i = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void c(boolean paramBoolean)
  {
    try
    {
      f = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private d l()
  {
    try
    {
      d localD = h;
      return localD;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(w paramW)
  {
    e.b("rqdp{  com strateyg changed }%s", new Object[] { getClass().toString() });
    if (paramW != null)
    {
      paramW = paramW.c(b);
      if (paramW != null) {
        if ((!paramW.c()) || (!paramW.b())) {
          break label94;
        }
      }
    }
    label94:
    for (boolean bool = true;; bool = false)
    {
      if (a() != bool)
      {
        e.a("rqdp{  module} %d rqdp{  able changed }%b", new Object[] { Integer.valueOf(b), Boolean.valueOf(bool) });
        b(bool);
      }
      return;
    }
  }
  
  public final void a(boolean paramBoolean)
  {
    boolean bool = true;
    Object localObject = t.a(a);
    if (localObject != null)
    {
      localObject = ((t)localObject).b().c(b);
      if ((localObject != null) && (((w.a)localObject).b() != paramBoolean))
      {
        e.a("rqdp{  mid:}%d rqdp{  change user switch} %b", new Object[] { Integer.valueOf(b), Boolean.valueOf(paramBoolean) });
        ((w.a)localObject).a(paramBoolean);
        if ((!((w.a)localObject).b()) || (!((w.a)localObject).c())) {
          break label100;
        }
      }
    }
    label100:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      if (paramBoolean != a()) {
        b(paramBoolean);
      }
      return;
    }
  }
  
  public final boolean a()
  {
    try
    {
      boolean bool = e;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void b(boolean paramBoolean)
  {
    try
    {
      e = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final boolean b()
  {
    try
    {
      boolean bool = f;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final com.tencent.feedback.upload.e c()
  {
    try
    {
      com.tencent.feedback.upload.e localE = g;
      return localE;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void d()
  {
    e.b("rqdp{  com query start }%s", new Object[] { getClass().toString() });
    a(k() + 1);
  }
  
  public void e()
  {
    e.b("rqdp{  com query end }%s", new Object[] { getClass().toString() });
    if (!b())
    {
      e.b("rqdp{  step after query}", new Object[0]);
      c(true);
    }
    for (;;)
    {
      try
      {
        w localW = t.a(a).b();
        w.a localA = localW.c(b);
        if ((a()) && (localA != null))
        {
          e.b("rqdp{  isable}", new Object[0]);
          bool1 = localA.d();
          boolean bool2 = localW.g();
          if (!bool1) {
            break label360;
          }
          if (bool2)
          {
            bool1 = true;
            e.b("rqdp{  needDetail} %b rqdp{  allQ:}%b rqdp{  result:}%b", new Object[] { Boolean.valueOf(localA.d()), Boolean.valueOf(localW.g()), Boolean.valueOf(bool1) });
            if (g() <= 0) {
              break label365;
            }
            j = 1;
            if (j != 0)
            {
              e.b("rqdp{  asyn up module} %d", new Object[] { Integer.valueOf(b) });
              b.b().a(new Runnable()
              {
                public final void run()
                {
                  h();
                }
              });
            }
          }
          else
          {
            if (i()) {
              break label360;
            }
            z localZ = com.tencent.feedback.proguard.a.a(a, d);
            if (localZ != null)
            {
              d localD = l();
              if (localD == null)
              {
                e.c("rqdp{  imposiable eup reshandler not ready}", new Object[0]);
                break label360;
              }
              localD.a(d, localZ.c(), false);
            }
            if (i()) {
              break label360;
            }
            bool1 = true;
            continue;
          }
          if (!bool1) {
            break label359;
          }
          e.b("rqdp{  asyn query module }%d", new Object[] { Integer.valueOf(b) });
          b.b().a(new Runnable()
          {
            public final void run()
            {
              j();
            }
          });
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        if (!e.a(localThrowable)) {
          localThrowable.printStackTrace();
        }
        e.d("rqdp{  common query end error} %s", new Object[] { localThrowable.toString() });
        return;
      }
      e.b("rqdp{  disable}", new Object[0]);
      label359:
      return;
      label360:
      boolean bool1 = false;
      continue;
      label365:
      int j = 0;
    }
  }
  
  public void f()
  {
    e.a("rqdp{  app first start} %s", new Object[] { getClass().toString() });
  }
  
  public int g()
  {
    if (!a()) {
      return -1;
    }
    return 0;
  }
  
  public boolean h()
  {
    return a();
  }
  
  public boolean i()
  {
    return true;
  }
  
  public final boolean j()
  {
    if (!a()) {}
    com.tencent.feedback.upload.e localE;
    do
    {
      return false;
      localE = c();
    } while (localE == null);
    localE.a(new com.tencent.feedback.upload.a(a, b, c));
    return true;
  }
  
  public final int k()
  {
    try
    {
      int j = i;
      return j;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
