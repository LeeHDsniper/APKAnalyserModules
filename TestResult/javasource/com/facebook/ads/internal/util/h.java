package com.facebook.ads.internal.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build.VERSION;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.facebook.ads.AdSettings;
import com.facebook.ads.internal.e;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

public class h
{
  private static String a = null;
  
  public static String a()
  {
    String str = AdSettings.getUrlPrefix();
    if (s.a(str)) {
      return "https://www.facebook.com/";
    }
    return String.format("https://www.%s.facebook.com", new Object[] { str });
  }
  
  @TargetApi(17)
  private static String a(Context paramContext)
  {
    return WebSettings.getDefaultUserAgent(paramContext);
  }
  
  public static String a(Context paramContext, e paramE)
  {
    if ((paramE == e.k) || (paramE == e.j) || (paramE == null)) {
      return System.getProperty("http.agent");
    }
    if (a == null) {
      if (Build.VERSION.SDK_INT >= 17) {
        try
        {
          a = a(paramContext);
          paramE = a;
          return paramE;
        }
        catch (Exception paramE) {}
      }
    }
    try
    {
      a = a(paramContext, "android.webkit.WebSettings", "android.webkit.WebView");
      return a;
    }
    catch (Exception paramE)
    {
      for (;;)
      {
        try
        {
          a = a(paramContext, "android.webkit.WebSettingsClassic", "android.webkit.WebViewClassic");
        }
        catch (Exception paramE)
        {
          paramContext = new WebView(paramContext.getApplicationContext());
          a = paramContext.getSettings().getUserAgentString();
          paramContext.destroy();
        }
      }
    }
  }
  
  private static String a(Context paramContext, String paramString1, String paramString2)
  {
    Class localClass = Class.forName(paramString1);
    paramString1 = localClass.getDeclaredConstructor(new Class[] { Context.class, Class.forName(paramString2) });
    paramString1.setAccessible(true);
    paramString2 = localClass.getMethod("getUserAgentString", new Class[0]);
    try
    {
      paramContext = (String)paramString2.invoke(paramString1.newInstance(new Object[] { paramContext, null }), new Object[0]);
      return paramContext;
    }
    finally
    {
      paramString1.setAccessible(false);
    }
  }
  
  public static void a(WebView paramWebView)
  {
    paramWebView.loadUrl("about:blank");
    paramWebView.clearCache(true);
    if (Build.VERSION.SDK_INT > 11)
    {
      paramWebView.onPause();
      return;
    }
    try
    {
      WebView.class.getMethod("onPause", new Class[0]).invoke(paramWebView, new Object[0]);
      return;
    }
    catch (Exception paramWebView) {}
  }
  
  @TargetApi(21)
  public static void b(WebView paramWebView)
  {
    paramWebView = paramWebView.getSettings();
    if (Build.VERSION.SDK_INT >= 21)
    {
      paramWebView.setMixedContentMode(0);
      return;
    }
    try
    {
      WebSettings.class.getMethod("setMixedContentMode", new Class[0]).invoke(paramWebView, new Object[] { Integer.valueOf(0) });
      return;
    }
    catch (Exception paramWebView) {}
  }
}
