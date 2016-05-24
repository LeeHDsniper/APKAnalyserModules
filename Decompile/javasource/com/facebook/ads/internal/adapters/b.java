package com.facebook.ads.internal.adapters;

import android.content.Context;
import com.facebook.ads.internal.util.g;

public abstract class b
{
  protected final c a;
  private final Context b;
  private boolean c;
  
  public b(Context paramContext, c paramC)
  {
    b = paramContext;
    a = paramC;
  }
  
  public final void a()
  {
    if (c) {}
    do
    {
      return;
      if (a != null) {
        a.d();
      }
      b();
      c = true;
      g.a(b, "Impression logged");
    } while (a == null);
    a.e();
  }
  
  protected abstract void b();
}
