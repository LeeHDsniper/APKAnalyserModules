package com.facebook.ads.internal.server;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Looper;
import com.facebook.ads.AdSettings;
import com.facebook.ads.internal.AdErrorType;
import com.facebook.ads.internal.dto.f;
import com.facebook.ads.internal.util.AdInternalSettings;
import com.facebook.ads.internal.util.p;
import com.facebook.ads.internal.util.s;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import org.json.JSONException;

public class a
{
  private static final p g = new p();
  private static final ThreadPoolExecutor h = (ThreadPoolExecutor)Executors.newCachedThreadPool(g);
  Map<String, String> a;
  private final b b = b.a();
  private a c;
  private com.facebook.ads.internal.dto.e d;
  private com.facebook.ads.internal.http.a e;
  private final String f;
  
  public a()
  {
    String str = AdSettings.getUrlPrefix();
    if (AdInternalSettings.shouldUseLiveRailEndpoint())
    {
      if (s.a(str)) {}
      for (str = "https://ad6.liverail.com/";; str = String.format("https://ad6.%s.liverail.com/", new Object[] { str }))
      {
        f = str;
        return;
      }
    }
    if (s.a(str)) {}
    for (str = "https://graph.facebook.com/network_ads_common/";; str = String.format("https://graph.%s.facebook.com/network_ads_common/", new Object[] { str }))
    {
      f = str;
      return;
    }
  }
  
  private void a(final com.facebook.ads.internal.b paramB)
  {
    if (c != null) {
      new Handler(Looper.getMainLooper()).post(new Runnable()
      {
        public void run()
        {
          a.f(a.this).a(paramB);
        }
      });
    }
    a();
  }
  
  private void a(final d paramD)
  {
    if (c != null) {
      new Handler(Looper.getMainLooper()).post(new Runnable()
      {
        public void run()
        {
          a.f(a.this).a(paramD);
        }
      });
    }
    a();
  }
  
  private void a(String paramString)
  {
    for (;;)
    {
      try
      {
        localObject2 = b.a(paramString);
        localObject1 = ((c)localObject2).b();
        if (localObject1 != null) {
          com.facebook.ads.internal.util.d.a(((com.facebook.ads.internal.dto.c)localObject1).a().c(), d);
        }
        switch (5.a[localObject2.a().ordinal()])
        {
        case 1: 
          a(AdErrorType.UNKNOWN_RESPONSE.getAdErrorWrapper(paramString));
          return;
        }
      }
      catch (Exception paramString)
      {
        a(AdErrorType.PARSER_FAILURE.getAdErrorWrapper(paramString.getMessage()));
        return;
      }
      Object localObject2 = (d)localObject2;
      if ((localObject1 != null) && (((com.facebook.ads.internal.dto.c)localObject1).a().d())) {
        com.facebook.ads.internal.util.d.a(paramString, d);
      }
      a((d)localObject2);
      return;
      Object localObject1 = ((e)localObject2).c();
      localObject2 = AdErrorType.ERROR_MESSAGE;
      if (localObject1 != null) {
        paramString = (String)localObject1;
      }
      a(((AdErrorType)localObject2).getAdErrorWrapper(paramString));
      return;
    }
  }
  
  private boolean a(Context paramContext)
  {
    if (paramContext.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") != 0) {
      return true;
    }
    paramContext = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((paramContext != null) && (paramContext.isConnected())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private com.facebook.ads.internal.http.c b()
  {
    new com.facebook.ads.internal.http.c()
    {
      public void a() {}
      
      public void a(int paramAnonymousInt, String paramAnonymousString)
      {
        com.facebook.ads.internal.util.d.b(a.d(a.this));
        a.a(a.this, null);
        a.a(a.this, paramAnonymousString);
      }
      
      public void a(Throwable paramAnonymousThrowable, String paramAnonymousString)
      {
        com.facebook.ads.internal.util.d.b(a.d(a.this));
        a.a(a.this, null);
        try
        {
          Object localObject = a.e(a.this).a(paramAnonymousString);
          if (((c)localObject).a() == c.a.b)
          {
            localObject = ((e)localObject).c();
            a localA = a.this;
            AdErrorType localAdErrorType = AdErrorType.ERROR_MESSAGE;
            if (localObject == null) {}
            for (;;)
            {
              a.a(localA, localAdErrorType.getAdErrorWrapper(paramAnonymousString));
              return;
              paramAnonymousString = (String)localObject;
            }
          }
          return;
        }
        catch (JSONException paramAnonymousString)
        {
          a.a(a.this, new com.facebook.ads.internal.b(AdErrorType.NETWORK_ERROR, paramAnonymousThrowable.getMessage()));
        }
      }
    };
  }
  
  public void a()
  {
    if (e != null)
    {
      e.a(true);
      e = null;
    }
  }
  
  public void a(final Context paramContext, final com.facebook.ads.internal.dto.e paramE)
  {
    a();
    if (!a(paramContext))
    {
      a(new com.facebook.ads.internal.b(AdErrorType.NETWORK_ERROR, "No network connection"));
      return;
    }
    d = paramE;
    if (com.facebook.ads.internal.util.d.a(paramE))
    {
      paramContext = com.facebook.ads.internal.util.d.c(paramE);
      if (paramContext != null)
      {
        a(paramContext);
        return;
      }
      a(AdErrorType.LOAD_TOO_FREQUENTLY.getAdErrorWrapper(null));
      return;
    }
    h.submit(new Runnable()
    {
      public void run()
      {
        f.b(paramContext);
        a = paramE.e();
        try
        {
          a.a(a.this, new com.facebook.ads.internal.http.a(paramContext, paramEe));
          a.c(a.this).a(a.a(a.this), new com.facebook.ads.internal.http.d(a), a.b(a.this));
          return;
        }
        catch (Exception localException)
        {
          a.a(a.this, AdErrorType.AD_REQUEST_FAILED.getAdErrorWrapper(localException.getMessage()));
        }
      }
    });
  }
  
  public void a(a paramA)
  {
    c = paramA;
  }
  
  public static abstract interface a
  {
    public abstract void a(com.facebook.ads.internal.b paramB);
    
    public abstract void a(d paramD);
  }
}
