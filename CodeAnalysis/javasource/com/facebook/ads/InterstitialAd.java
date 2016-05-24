package com.facebook.ads;

import android.content.Context;
import android.view.View;
import com.facebook.ads.internal.a;
import com.facebook.ads.internal.b;
import com.facebook.ads.internal.c;
import com.facebook.ads.internal.e;
import com.facebook.ads.internal.h;
import com.facebook.ads.internal.util.g;

public class InterstitialAd
  implements Ad
{
  private static final c a = c.a;
  private final Context b;
  private final String c;
  private h d;
  private boolean e;
  private boolean f;
  private InterstitialAdListener g;
  private ImpressionListener h;
  
  public InterstitialAd(Context paramContext, String paramString)
  {
    b = paramContext;
    c = paramString;
  }
  
  public boolean isAdLoaded()
  {
    return e;
  }
  
  public void loadAd()
  {
    e = false;
    if (f) {
      throw new IllegalStateException("InterstitialAd cannot be loaded while being displayed. Make sure your adapter calls adapterListener.onInterstitialDismissed().");
    }
    if (d != null)
    {
      d.d();
      d = null;
    }
    AdSize localAdSize = AdSize.INTERSTITIAL;
    e localE = g.a(AdSize.INTERSTITIAL);
    d = new h(b, c, localE, localAdSize, a, 1, true);
    d.a(new a()
    {
      public void a()
      {
        InterstitialAd.a(InterstitialAd.this, true);
        if (InterstitialAd.a(InterstitialAd.this) != null) {
          InterstitialAd.a(InterstitialAd.this).onAdLoaded(InterstitialAd.this);
        }
      }
      
      public void a(View paramAnonymousView) {}
      
      public void a(b paramAnonymousB)
      {
        if (InterstitialAd.a(InterstitialAd.this) != null) {
          InterstitialAd.a(InterstitialAd.this).onError(InterstitialAd.this, paramAnonymousB.b());
        }
      }
      
      public void b()
      {
        if (InterstitialAd.a(InterstitialAd.this) != null) {
          InterstitialAd.a(InterstitialAd.this).onAdClicked(InterstitialAd.this);
        }
      }
      
      public void c()
      {
        if (InterstitialAd.b(InterstitialAd.this) != null) {
          InterstitialAd.b(InterstitialAd.this).onLoggingImpression(InterstitialAd.this);
        }
        if (((InterstitialAd.a(InterstitialAd.this) instanceof ImpressionListener)) && (InterstitialAd.a(InterstitialAd.this) != InterstitialAd.b(InterstitialAd.this))) {
          ((ImpressionListener)InterstitialAd.a(InterstitialAd.this)).onLoggingImpression(InterstitialAd.this);
        }
      }
      
      public void d()
      {
        if (InterstitialAd.a(InterstitialAd.this) != null) {
          InterstitialAd.a(InterstitialAd.this).onInterstitialDisplayed(InterstitialAd.this);
        }
      }
      
      public void e()
      {
        InterstitialAd.b(InterstitialAd.this, false);
        if (InterstitialAd.c(InterstitialAd.this) != null)
        {
          InterstitialAd.c(InterstitialAd.this).d();
          InterstitialAd.a(InterstitialAd.this, null);
        }
        if (InterstitialAd.a(InterstitialAd.this) != null) {
          InterstitialAd.a(InterstitialAd.this).onInterstitialDismissed(InterstitialAd.this);
        }
      }
    });
    d.b();
  }
  
  public boolean show()
  {
    if (!e)
    {
      if (g != null) {
        g.onError(this, AdError.INTERNAL_ERROR);
      }
      return false;
    }
    d.c();
    f = true;
    e = false;
    return true;
  }
}
