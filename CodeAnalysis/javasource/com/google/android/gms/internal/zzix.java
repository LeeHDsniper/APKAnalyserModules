package com.google.android.gms.internal;

import android.text.TextUtils;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzw;
import java.net.URI;
import java.net.URISyntaxException;

@zzgk
public class zzix
  extends WebViewClient
{
  private final String zzJB = zzaM(paramString);
  private boolean zzJC = false;
  private final zzfx zzJD;
  private final zzip zzoL;
  
  public zzix(zzfx paramZzfx, zzip paramZzip, String paramString)
  {
    zzoL = paramZzip;
    zzJD = paramZzfx;
  }
  
  private String zzaM(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return paramString;
      try
      {
        if (paramString.endsWith("/"))
        {
          String str = paramString.substring(0, paramString.length() - 1);
          return str;
        }
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        zzb.e(localIndexOutOfBoundsException.getMessage());
      }
    }
    return paramString;
  }
  
  public void onLoadResource(WebView paramWebView, String paramString)
  {
    zzb.zzaC("JavascriptAdWebViewClient::onLoadResource: " + paramString);
    if (!zzaL(paramString)) {
      zzoL.zzgS().onLoadResource(zzoL.getWebView(), paramString);
    }
  }
  
  public void onPageFinished(WebView paramWebView, String paramString)
  {
    zzb.zzaC("JavascriptAdWebViewClient::onPageFinished: " + paramString);
    if (!zzJC)
    {
      zzJD.zzfl();
      zzJC = true;
    }
  }
  
  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    zzb.zzaC("JavascriptAdWebViewClient::shouldOverrideUrlLoading: " + paramString);
    if (zzaL(paramString))
    {
      zzb.zzaC("shouldOverrideUrlLoading: received passback url");
      return true;
    }
    return zzoL.zzgS().shouldOverrideUrlLoading(zzoL.getWebView(), paramString);
  }
  
  protected boolean zzaL(String paramString)
  {
    paramString = zzaM(paramString);
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return false;
      try
      {
        Object localObject1 = new URI(paramString);
        if ("passback".equals(((URI)localObject1).getScheme()))
        {
          zzb.zzaC("Passback received");
          zzJD.zzfm();
          return true;
        }
        if (!TextUtils.isEmpty(zzJB))
        {
          Object localObject2 = new URI(zzJB);
          paramString = ((URI)localObject2).getHost();
          String str = ((URI)localObject1).getHost();
          localObject2 = ((URI)localObject2).getPath();
          localObject1 = ((URI)localObject1).getPath();
          if ((zzw.equal(paramString, str)) && (zzw.equal(localObject2, localObject1)))
          {
            zzb.zzaC("Passback received");
            zzJD.zzfm();
            return true;
          }
        }
      }
      catch (URISyntaxException paramString)
      {
        zzb.e(paramString.getMessage());
      }
    }
    return false;
  }
}
