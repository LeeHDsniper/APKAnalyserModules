package com.facebook.ads.internal.adapters;

import android.content.Context;
import android.os.Handler;
import android.view.View;
import com.facebook.ads.internal.util.g;
import com.facebook.ads.internal.util.u;

public class e
{
  private int a = 0;
  private int b = 1000;
  private final Context c;
  private final View d;
  private final int e;
  private final a f;
  private final Handler g = new Handler();
  private final Runnable h = new b(this);
  private final boolean i;
  private volatile boolean j;
  
  public e(Context paramContext, View paramView, int paramInt, a paramA)
  {
    this(paramContext, paramView, paramInt, false, paramA);
  }
  
  public e(Context paramContext, View paramView, int paramInt, boolean paramBoolean, a paramA)
  {
    c = paramContext;
    d = paramView;
    e = paramInt;
    f = paramA;
    i = paramBoolean;
  }
  
  public void a()
  {
    if ((!i) && (!j)) {
      g.postDelayed(h, a);
    }
  }
  
  public void a(int paramInt)
  {
    a = paramInt;
  }
  
  public void b()
  {
    g.removeCallbacks(h);
  }
  
  public void b(int paramInt)
  {
    b = paramInt;
  }
  
  public static abstract class a
  {
    public a() {}
    
    public abstract void a();
    
    public void b() {}
  }
  
  private static final class b
    extends u<e>
  {
    public b(e paramE)
    {
      super();
    }
    
    public void run()
    {
      e localE = (e)a();
      if (localE == null) {}
      View localView;
      e.a localA;
      do
      {
        do
        {
          return;
        } while ((!e.a(localE)) && (e.b(localE)));
        localView = e.c(localE);
        localA = e.d(localE);
      } while ((localView == null) || (localA == null));
      if (g.a(e.e(localE), localView, e.f(localE)))
      {
        localA.a();
        e.a(localE, true);
        return;
      }
      localA.b();
      e.i(localE).postDelayed(e.g(localE), e.h(localE));
    }
  }
}
