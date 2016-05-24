package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@zzgk
public class zzfk
  implements zzfi
{
  private final Context mContext;
  final Set<WebView> zzBE = Collections.synchronizedSet(new HashSet());
  
  public zzfk(Context paramContext)
  {
    mContext = paramContext;
  }
  
  public void zza(String paramString1, final String paramString2, final String paramString3)
  {
    zzb.zzaC("Fetching assets for the given html");
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        final WebView localWebView = zzfb();
        localWebView.setWebViewClient(new WebViewClient()
        {
          public void onPageFinished(WebView paramAnonymous2WebView, String paramAnonymous2String)
          {
            zzb.zzaC("Loading assets have finished");
            zzBE.remove(localWebView);
          }
          
          public void onReceivedError(WebView paramAnonymous2WebView, int paramAnonymous2Int, String paramAnonymous2String1, String paramAnonymous2String2)
          {
            zzb.zzaE("Loading assets have failed.");
            zzBE.remove(localWebView);
          }
        });
        zzBE.add(localWebView);
        localWebView.loadDataWithBaseURL(paramString2, paramString3, "text/html", "UTF-8", null);
        zzb.zzaC("Fetching assets finished.");
      }
    });
  }
  
  public WebView zzfb()
  {
    WebView localWebView = new WebView(mContext);
    localWebView.getSettings().setJavaScriptEnabled(true);
    return localWebView;
  }
}
