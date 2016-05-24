package com.facebook.ads.internal.view;

import android.content.Context;
import android.net.http.SslError;
import android.webkit.SslErrorHandler;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.facebook.ads.internal.adapters.e;
import com.facebook.ads.internal.adapters.e.a;
import com.facebook.ads.internal.util.g;
import com.facebook.ads.internal.util.h;

public class a
  extends d
{
  private final a a;
  private e b;
  
  public a(Context paramContext, final a paramA, int paramInt)
  {
    super(paramContext);
    a = paramA;
    setWebViewClient(new b(null));
    getSettings().setJavaScriptEnabled(true);
    getSettings().setSupportZoom(false);
    h.b(this);
    setHorizontalScrollBarEnabled(false);
    setHorizontalScrollbarOverlay(false);
    setVerticalScrollBarEnabled(false);
    setVerticalScrollbarOverlay(false);
    addJavascriptInterface(new c(), "AdControl");
    b = new e(getContext(), this, paramInt, new e.a()
    {
      public void a()
      {
        paramA.b();
      }
    });
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    b.a(paramInt1);
    b.b(paramInt2);
  }
  
  public void destroy()
  {
    if (b != null)
    {
      b.b();
      b = null;
    }
    h.a(this);
    super.destroy();
  }
  
  protected void onWindowVisibilityChanged(int paramInt)
  {
    super.onWindowVisibilityChanged(paramInt);
    if (a != null) {
      a.a(paramInt);
    }
    if (paramInt == 0) {
      if (b != null) {
        b.a();
      }
    }
    while ((paramInt != 8) || (b == null)) {
      return;
    }
    b.b();
  }
  
  public static abstract interface a
  {
    public abstract void a(int paramInt);
    
    public abstract void a(String paramString);
    
    public abstract void b();
  }
  
  private class b
    extends WebViewClient
  {
    private b() {}
    
    public void onReceivedSslError(WebView paramWebView, SslErrorHandler paramSslErrorHandler, SslError paramSslError)
    {
      if (g.a())
      {
        paramSslErrorHandler.proceed();
        return;
      }
      paramSslErrorHandler.cancel();
    }
    
    public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
    {
      a.a(a.this).a(paramString);
      return true;
    }
  }
  
  public class c
  {
    private final String b = c.class.getSimpleName();
    
    public c() {}
  }
}
