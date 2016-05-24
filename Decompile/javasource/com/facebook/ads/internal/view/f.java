package com.facebook.ads.internal.view;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.RelativeLayout.LayoutParams;
import com.facebook.ads.InterstitialAdActivity;
import com.facebook.ads.internal.adapters.l;
import com.facebook.ads.internal.adapters.m;
import com.facebook.ads.internal.util.b.a;

public class f
  implements h
{
  private static final String a = f.class.getSimpleName();
  private h.a b;
  private a c;
  private l d;
  private m e;
  private long f;
  private long g;
  private b.a h;
  
  public f(final InterstitialAdActivity paramInterstitialAdActivity, h.a paramA)
  {
    b = paramA;
    f = System.currentTimeMillis();
    c = new a(paramInterstitialAdActivity, new a.a()
    {
      public void a(int paramAnonymousInt) {}
      
      public void a(String paramAnonymousString)
      {
        paramAnonymousString = Uri.parse(paramAnonymousString);
        if (("fbad".equals(paramAnonymousString.getScheme())) && ("close".equals(paramAnonymousString.getAuthority()))) {
          paramInterstitialAdActivity.finish();
        }
        do
        {
          return;
          f.a(f.this).a("com.facebook.ads.interstitial.clicked");
          paramAnonymousString = com.facebook.ads.internal.action.b.a(paramInterstitialAdActivity, paramAnonymousString);
        } while (paramAnonymousString == null);
        try
        {
          f.a(f.this, paramAnonymousString.a());
          f.a(f.this, System.currentTimeMillis());
          paramAnonymousString.b();
          return;
        }
        catch (Exception paramAnonymousString)
        {
          Log.e(f.d(), "Error executing action", paramAnonymousString);
        }
      }
      
      public void b()
      {
        f.b(f.this).a();
      }
    }, 1);
    c.setId(100001);
    c.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
    e = new m(paramInterstitialAdActivity, c, new com.facebook.ads.internal.adapters.c()
    {
      public void d()
      {
        f.a(f.this).a("com.facebook.ads.interstitial.impression.logged");
      }
    });
    e.d();
    paramA.a(c);
  }
  
  public void a()
  {
    if (c != null) {
      c.onPause();
    }
  }
  
  public void a(Intent paramIntent, Bundle paramBundle)
  {
    if ((paramBundle != null) && (paramBundle.containsKey("dataModel")))
    {
      d = l.a(paramBundle.getBundle("dataModel"));
      if (d != null)
      {
        c.loadDataWithBaseURL(com.facebook.ads.internal.util.h.a(), d.d(), "text/html", "utf-8", null);
        c.a(d.j(), d.k());
      }
    }
    do
    {
      return;
      d = l.b(paramIntent);
    } while (d == null);
    e.a(d);
    c.loadDataWithBaseURL(com.facebook.ads.internal.util.h.a(), d.d(), "text/html", "utf-8", null);
    c.a(d.j(), d.k());
  }
  
  public void a(Bundle paramBundle)
  {
    if (d != null) {
      paramBundle.putBundle("dataModel", d.l());
    }
  }
  
  public void b()
  {
    if ((g > 0L) && (h != null) && (d != null)) {
      com.facebook.ads.internal.util.c.a(com.facebook.ads.internal.util.b.a(g, h, d.i()));
    }
    if (c != null) {
      c.onResume();
    }
  }
  
  public void c()
  {
    if (d != null) {
      com.facebook.ads.internal.util.c.a(com.facebook.ads.internal.util.b.a(f, b.a.c, d.i()));
    }
    if (c != null)
    {
      com.facebook.ads.internal.util.h.a(c);
      c.destroy();
      c = null;
    }
  }
}
