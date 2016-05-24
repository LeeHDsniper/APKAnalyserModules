package com.facebook.ads.internal.adapters;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import com.facebook.ads.AdError;
import com.facebook.ads.AdSize;
import com.facebook.ads.internal.dto.d;
import com.facebook.ads.internal.util.b.a;
import com.facebook.ads.internal.util.f;
import com.facebook.ads.internal.util.h;
import com.facebook.ads.internal.view.a.a;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

public class i
  extends BannerAdapter
{
  private static final String a = i.class.getSimpleName();
  private com.facebook.ads.internal.view.a b;
  private m c;
  private BannerAdapterListener d;
  private Map<String, Object> e;
  private k f;
  private Context g;
  private long h;
  private b.a i;
  
  public i() {}
  
  private void a(d paramD)
  {
    h = 0L;
    i = null;
    final l localL = l.a((JSONObject)e.get("data"));
    if (f.a(g, localL)) {
      d.onBannerError(this, AdError.NO_FILL);
    }
    do
    {
      return;
      b = new com.facebook.ads.internal.view.a(g, new a.a()
      {
        public void a(int paramAnonymousInt)
        {
          if ((paramAnonymousInt == 0) && (i.d(i.this) > 0L) && (i.e(i.this) != null))
          {
            com.facebook.ads.internal.util.c.a(com.facebook.ads.internal.util.b.a(i.d(i.this), i.e(i.this), localL.i()));
            i.a(i.this, 0L);
            i.a(i.this, null);
          }
        }
        
        public void a(String paramAnonymousString)
        {
          if (i.a(i.this) != null) {
            i.a(i.this).onBannerAdClicked(i.this);
          }
          paramAnonymousString = Uri.parse(paramAnonymousString);
          paramAnonymousString = com.facebook.ads.internal.action.b.a(i.b(i.this), paramAnonymousString);
          if (paramAnonymousString != null) {}
          try
          {
            i.a(i.this, paramAnonymousString.a());
            i.a(i.this, System.currentTimeMillis());
            paramAnonymousString.b();
            return;
          }
          catch (Exception paramAnonymousString)
          {
            Log.e(i.a(), "Error executing action", paramAnonymousString);
          }
        }
        
        public void b()
        {
          onViewableImpression();
        }
      }, paramD.e());
      b.a(paramD.f(), paramD.g());
      c = new m(g, b, new c()
      {
        public void d()
        {
          if (i.a(i.this) != null) {
            i.a(i.this).onBannerLoggingImpression(i.this);
          }
        }
      });
      c.a(localL);
      b.loadDataWithBaseURL(h.a(), localL.d(), "text/html", "utf-8", null);
    } while (d == null);
    d.onBannerAdLoaded(this, b);
  }
  
  public void loadBannerAd(Context paramContext, AdSize paramAdSize, BannerAdapterListener paramBannerAdapterListener, Map<String, Object> paramMap)
  {
    g = paramContext;
    d = paramBannerAdapterListener;
    e = paramMap;
    a((d)paramMap.get("definition"));
  }
  
  public void onDestroy()
  {
    if (b != null)
    {
      h.a(b);
      b.destroy();
      b = null;
    }
    if (f != null)
    {
      f.onDestroy();
      f = null;
    }
  }
  
  public void onViewableImpression()
  {
    if (c != null) {
      c.a();
    }
    while (f == null) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("mil", Boolean.valueOf(false));
    f.a(localHashMap);
  }
}
