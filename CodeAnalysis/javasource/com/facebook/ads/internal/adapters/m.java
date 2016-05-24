package com.facebook.ads.internal.adapters;

import android.content.Context;
import android.util.Log;
import com.facebook.ads.internal.util.o;
import com.facebook.ads.internal.util.s;
import com.facebook.ads.internal.view.d;
import java.util.Collections;
import java.util.Map;

public class m
  extends b
{
  private static final String b = m.class.getSimpleName();
  private final d c;
  private l d;
  
  public m(Context paramContext, d paramD, c paramC)
  {
    super(paramContext, paramC);
    c = paramD;
  }
  
  private void a(Map<String, String> paramMap)
  {
    if (d == null) {}
    String str;
    do
    {
      return;
      str = d.f();
    } while (s.a(str));
    new o(paramMap).execute(new String[] { str });
  }
  
  public void a(l paramL)
  {
    d = paramL;
  }
  
  protected void b()
  {
    if (d == null) {
      return;
    }
    if ((c != null) && (!s.a(d.g())))
    {
      if (!c.b()) {
        break label59;
      }
      Log.w(b, "Webview already destroyed, cannot send impression");
    }
    for (;;)
    {
      a(Collections.singletonMap("evt", "native_imp"));
      return;
      label59:
      c.loadUrl("javascript:" + d.g());
    }
  }
  
  public void d()
  {
    a(Collections.singletonMap("evt", "interstitial_displayed"));
  }
}
