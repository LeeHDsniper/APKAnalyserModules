package com.facebook.ads.internal;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import com.facebook.ads.AdError;
import com.facebook.ads.AdSettings;
import com.facebook.ads.AdSize;
import com.facebook.ads.internal.adapters.AdAdapter;
import com.facebook.ads.internal.adapters.BannerAdapter;
import com.facebook.ads.internal.adapters.BannerAdapterListener;
import com.facebook.ads.internal.adapters.InterstitialAdapter;
import com.facebook.ads.internal.adapters.InterstitialAdapterListener;
import com.facebook.ads.internal.adapters.f;
import com.facebook.ads.internal.adapters.p;
import com.facebook.ads.internal.adapters.q;
import com.facebook.ads.internal.server.AdPlacementType;
import com.facebook.ads.internal.server.a.a;
import com.facebook.ads.internal.util.g;
import com.facebook.ads.internal.util.s;
import com.facebook.ads.internal.util.u;
import java.util.HashMap;
import java.util.Map;

public class h
  implements a.a
{
  private static final String b = h.class.getSimpleName();
  protected a a;
  private final Context c;
  private final String d;
  private final com.facebook.ads.internal.server.a e;
  private final Handler f;
  private final Runnable g;
  private final Runnable h;
  private volatile boolean i;
  private boolean j;
  private volatile boolean k;
  private AdAdapter l;
  private View m;
  private com.facebook.ads.internal.dto.c n;
  private com.facebook.ads.internal.dto.e o;
  private e p;
  private c q;
  private AdSize r;
  private int s;
  private final c t;
  private boolean u;
  
  public h(Context paramContext, String paramString, e paramE, AdSize paramAdSize, c paramC, int paramInt, boolean paramBoolean)
  {
    c = paramContext;
    d = paramString;
    p = paramE;
    r = paramAdSize;
    q = paramC;
    s = paramInt;
    t = new c(null);
    e = new com.facebook.ads.internal.server.a();
    e.a(this);
    f = new Handler();
    g = new a(this);
    h = new b(this);
    j = paramBoolean;
    i();
  }
  
  private void a(AdAdapter paramAdAdapter)
  {
    if (paramAdAdapter != null) {
      paramAdAdapter.onDestroy();
    }
  }
  
  private void i()
  {
    if (j) {
      return;
    }
    IntentFilter localIntentFilter = new IntentFilter("android.intent.action.SCREEN_ON");
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    c.registerReceiver(t, localIntentFilter);
    u = true;
  }
  
  private void j()
  {
    if (u) {}
    try
    {
      c.unregisterReceiver(t);
      u = false;
      return;
    }
    catch (Exception localException)
    {
      com.facebook.ads.internal.util.c.a(com.facebook.ads.internal.util.b.a(localException, "Error unregistering screen state receiever"));
    }
  }
  
  private void k()
  {
    if (Looper.myLooper() != Looper.getMainLooper()) {
      throw new IllegalStateException("Adapter listener must be called on the main thread.");
    }
  }
  
  private AdPlacementType l()
  {
    if (r == null) {
      return AdPlacementType.NATIVE;
    }
    if (r == AdSize.INTERSTITIAL) {
      return AdPlacementType.INTERSTITIAL;
    }
    return AdPlacementType.BANNER;
  }
  
  private void m()
  {
    o = new com.facebook.ads.internal.dto.e(c, d, r, p, q, s, AdSettings.isTestMode(c));
    e.a(c, o);
  }
  
  private void n()
  {
    Object localObject4 = n;
    Object localObject2 = ((com.facebook.ads.internal.dto.c)localObject4).c();
    if (localObject2 == null)
    {
      a.a(AdErrorType.NO_FILL.getAdErrorWrapper(""));
      o();
      return;
    }
    Object localObject1 = b;
    Object localObject3 = f.a((String)localObject1, ((com.facebook.ads.internal.dto.c)localObject4).a().a());
    if (localObject3 == null)
    {
      Log.e(b, "Adapter does not exist: " + (String)localObject1);
      n();
      return;
    }
    if (l() != ((AdAdapter)localObject3).getPlacementType())
    {
      a.a(AdErrorType.INTERNAL_ERROR.getAdErrorWrapper(""));
      return;
    }
    localObject1 = new HashMap();
    localObject4 = ((com.facebook.ads.internal.dto.c)localObject4).a();
    ((Map)localObject1).put("data", c);
    ((Map)localObject1).put("definition", localObject4);
    if (o == null) {
      a.a(AdErrorType.UNKNOWN_ERROR.getAdErrorWrapper("environment is empty"));
    }
    switch (7.a[localObject3.getPlacementType().ordinal()])
    {
    default: 
      Log.e(b, "attempt unexpected adapter type");
      return;
    case 2: 
      localObject2 = (BannerAdapter)localObject3;
      localObject3 = new Runnable()
      {
        public void run()
        {
          h.a(h.this, a);
          h.c(h.this);
        }
      };
      f.postDelayed((Runnable)localObject3, 10000L);
      ((BannerAdapter)localObject2).loadBannerAd(c, r, new BannerAdapterListener()
      {
        public void onBannerAdClicked(BannerAdapter paramAnonymousBannerAdapter)
        {
          h.d(h.this);
          a.b();
        }
        
        public void onBannerAdLoaded(BannerAdapter paramAnonymousBannerAdapter, View paramAnonymousView)
        {
          h.d(h.this);
          h.e(h.this).removeCallbacks(a);
          AdAdapter localAdAdapter = h.f(h.this);
          h.b(h.this, paramAnonymousBannerAdapter);
          h.a(h.this, paramAnonymousView);
          if (!h.g(h.this))
          {
            a.a();
            return;
          }
          a.a(paramAnonymousView);
          h.a(h.this, localAdAdapter);
          h.b(h.this);
        }
        
        public void onBannerError(BannerAdapter paramAnonymousBannerAdapter, AdError paramAnonymousAdError)
        {
          h.d(h.this);
          h.e(h.this).removeCallbacks(a);
          h.a(h.this, paramAnonymousBannerAdapter);
          h.c(h.this);
        }
        
        public void onBannerLoggingImpression(BannerAdapter paramAnonymousBannerAdapter)
        {
          h.d(h.this);
          a.c();
        }
      }, (Map)localObject1);
      return;
    case 1: 
      localObject2 = (InterstitialAdapter)localObject3;
      localObject3 = new Runnable()
      {
        public void run()
        {
          h.a(h.this, a);
          h.c(h.this);
        }
      };
      f.postDelayed((Runnable)localObject3, 10000L);
      ((InterstitialAdapter)localObject2).loadInterstitialAd(c, new InterstitialAdapterListener()
      {
        public void onInterstitialAdClicked(InterstitialAdapter paramAnonymousInterstitialAdapter, String paramAnonymousString, boolean paramAnonymousBoolean)
        {
          h.d(h.this);
          a.b();
          if (!s.a(paramAnonymousString)) {}
          for (int i = 1;; i = 0)
          {
            if ((paramAnonymousBoolean) && (i != 0))
            {
              paramAnonymousInterstitialAdapter = new Intent("android.intent.action.VIEW");
              if (!(id instanceof Activity)) {
                paramAnonymousInterstitialAdapter.addFlags(268435456);
              }
              paramAnonymousInterstitialAdapter.setData(Uri.parse(paramAnonymousString));
              id.startActivity(paramAnonymousInterstitialAdapter);
            }
            return;
          }
        }
        
        public void onInterstitialAdDismissed(InterstitialAdapter paramAnonymousInterstitialAdapter)
        {
          h.d(h.this);
          a.e();
        }
        
        public void onInterstitialAdDisplayed(InterstitialAdapter paramAnonymousInterstitialAdapter)
        {
          h.d(h.this);
          a.d();
        }
        
        public void onInterstitialAdLoaded(InterstitialAdapter paramAnonymousInterstitialAdapter)
        {
          h.d(h.this);
          h.e(h.this).removeCallbacks(a);
          h.b(h.this, paramAnonymousInterstitialAdapter);
          a.a();
          h.b(h.this);
        }
        
        public void onInterstitialError(InterstitialAdapter paramAnonymousInterstitialAdapter, AdError paramAnonymousAdError)
        {
          h.d(h.this);
          h.e(h.this).removeCallbacks(a);
          h.a(h.this, paramAnonymousInterstitialAdapter);
          h.c(h.this);
        }
        
        public void onInterstitialLoggingImpression(InterstitialAdapter paramAnonymousInterstitialAdapter)
        {
          h.d(h.this);
          a.c();
        }
      }, (Map)localObject1);
      return;
    }
    localObject2 = (p)localObject3;
    localObject3 = new Runnable()
    {
      public void run()
      {
        h.a(h.this, a);
        h.c(h.this);
      }
    };
    f.postDelayed((Runnable)localObject3, 10000L);
    ((p)localObject2).a(c, new q()
    {
      public void a(p paramAnonymousP)
      {
        h.d(h.this);
        h.e(h.this).removeCallbacks(a);
        h.b(h.this, paramAnonymousP);
        a.a();
      }
      
      public void a(p paramAnonymousP, AdError paramAnonymousAdError)
      {
        h.d(h.this);
        h.e(h.this).removeCallbacks(a);
        h.a(h.this, paramAnonymousP);
        h.c(h.this);
      }
    }, (Map)localObject1);
  }
  
  private void o()
  {
    if ((j) || (i)) {
      return;
    }
    switch (7.a[l().ordinal()])
    {
    default: 
      return;
    case 1: 
      if (!g.a(c)) {
        f.postDelayed(h, 1000L);
      }
      label74:
      if (n != null) {
        break;
      }
    }
    for (long l1 = 30000L; l1 > 0L; l1 = n.a().b())
    {
      f.postDelayed(g, l1);
      i = true;
      return;
      if (n == null) {}
      for (int i1 = 1; (m != null) && (!g.a(c, m, i1)); i1 = n.a().e())
      {
        f.postDelayed(h, 1000L);
        return;
      }
      break label74;
    }
  }
  
  private void p()
  {
    if (!i) {
      return;
    }
    f.removeCallbacks(g);
    i = false;
  }
  
  public void a(a paramA)
  {
    a = paramA;
  }
  
  public void a(b paramB)
  {
    a.a(paramB);
    if ((j) || (i)) {
      return;
    }
    switch (paramB.a().getErrorCode())
    {
    case 1001: 
    default: 
      return;
    }
    switch (7.a[l().ordinal()])
    {
    default: 
      return;
    }
    f.postDelayed(g, 30000L);
    i = true;
  }
  
  public void a(com.facebook.ads.internal.server.d paramD)
  {
    paramD = paramD.b();
    if ((paramD == null) || (paramD.a() == null)) {
      throw new IllegalStateException("invalid placement in response");
    }
    n = paramD;
    n();
  }
  
  public void b()
  {
    m();
  }
  
  public void c()
  {
    if (l == null) {
      throw new IllegalStateException("no adapter ready to start");
    }
    if (k) {
      throw new IllegalStateException("ad already started");
    }
    k = true;
    Object localObject = l.getPlacementType();
    switch (7.a[localObject.ordinal()])
    {
    default: 
      Log.e(b, "start unexpected adapter type");
    case 1: 
    case 2: 
      do
      {
        return;
        ((InterstitialAdapter)l).show();
        return;
      } while (m == null);
      a.a(m);
      o();
      return;
    }
    localObject = (p)l;
    if (!((p)localObject).w()) {
      throw new IllegalStateException("ad is not ready or already displayed");
    }
    a.a((p)localObject);
  }
  
  public void d()
  {
    j();
    if (!k) {
      return;
    }
    p();
    a(l);
    m = null;
    k = false;
  }
  
  private static final class a
    extends u<h>
  {
    public a(h paramH)
    {
      super();
    }
    
    public void run()
    {
      h localH = (h)a();
      if (localH == null) {
        return;
      }
      h.a(localH, false);
      h.a(localH);
    }
  }
  
  private static final class b
    extends u<h>
  {
    public b(h paramH)
    {
      super();
    }
    
    public void run()
    {
      h localH = (h)a();
      if (localH == null) {
        return;
      }
      h.b(localH);
    }
  }
  
  private class c
    extends BroadcastReceiver
  {
    private c() {}
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      paramContext = paramIntent.getAction();
      if ("android.intent.action.SCREEN_OFF".equals(paramContext)) {
        h.h(h.this);
      }
      while (!"android.intent.action.SCREEN_ON".equals(paramContext)) {
        return;
      }
      h.b(h.this);
    }
  }
}
