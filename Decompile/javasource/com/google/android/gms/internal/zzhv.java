package com.google.android.gms.internal;

import android.app.Activity;
import android.app.DownloadManager.Request;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.net.http.SslError;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.io.File;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

@zzgk
public class zzhv
{
  private zzhv() {}
  
  public static zzhv zzL(int paramInt)
  {
    if (paramInt >= 19) {
      return new zzg();
    }
    if (paramInt >= 18) {
      return new zze();
    }
    if (paramInt >= 17) {
      return new zzd();
    }
    if (paramInt >= 16) {
      return new zzf();
    }
    if (paramInt >= 14) {
      return new zzc();
    }
    if (paramInt >= 11) {
      return new zzb();
    }
    if (paramInt >= 9) {
      return new zza();
    }
    return new zzhv();
  }
  
  public String getDefaultUserAgent(Context paramContext)
  {
    return "";
  }
  
  public boolean isAttachedToWindow(View paramView)
  {
    return (paramView.getWindowToken() != null) || (paramView.getWindowVisibility() != 8);
  }
  
  public String zza(SslError paramSslError)
  {
    return "";
  }
  
  public void zza(View paramView, Drawable paramDrawable)
  {
    paramView.setBackgroundDrawable(paramDrawable);
  }
  
  public void zza(ViewTreeObserver paramViewTreeObserver, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
  {
    paramViewTreeObserver.removeGlobalOnLayoutListener(paramOnGlobalLayoutListener);
  }
  
  public boolean zza(DownloadManager.Request paramRequest)
  {
    return false;
  }
  
  public boolean zza(Context paramContext, WebSettings paramWebSettings)
  {
    return false;
  }
  
  public boolean zza(Window paramWindow)
  {
    return false;
  }
  
  public boolean zza(WebView paramWebView)
  {
    return false;
  }
  
  public zziq zzb(zzip paramZzip, boolean paramBoolean)
  {
    return new zziq(paramZzip, paramBoolean);
  }
  
  public void zzb(Activity paramActivity, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
  {
    paramActivity = paramActivity.getWindow();
    if ((paramActivity != null) && (paramActivity.getDecorView() != null) && (paramActivity.getDecorView().getViewTreeObserver() != null)) {
      zza(paramActivity.getDecorView().getViewTreeObserver(), paramOnGlobalLayoutListener);
    }
  }
  
  public boolean zzb(WebView paramWebView)
  {
    return false;
  }
  
  public WebChromeClient zzf(zzip paramZzip)
  {
    return null;
  }
  
  public Set<String> zzf(Uri paramUri)
  {
    if (paramUri.isOpaque()) {
      return Collections.emptySet();
    }
    paramUri = paramUri.getEncodedQuery();
    if (paramUri == null) {
      return Collections.emptySet();
    }
    LinkedHashSet localLinkedHashSet = new LinkedHashSet();
    int j = 0;
    int i;
    do
    {
      int k = paramUri.indexOf('&', j);
      i = k;
      if (k == -1) {
        i = paramUri.length();
      }
      int m = paramUri.indexOf('=', j);
      if (m <= i)
      {
        k = m;
        if (m != -1) {}
      }
      else
      {
        k = i;
      }
      localLinkedHashSet.add(Uri.decode(paramUri.substring(j, k)));
      i += 1;
      j = i;
    } while (i < paramUri.length());
    return Collections.unmodifiableSet(localLinkedHashSet);
  }
  
  public int zzgv()
  {
    return 0;
  }
  
  public int zzgw()
  {
    return 1;
  }
  
  public int zzgx()
  {
    return 5;
  }
  
  public ViewGroup.LayoutParams zzgy()
  {
    return new ViewGroup.LayoutParams(-2, -2);
  }
  
  public boolean zzk(View paramView)
  {
    return false;
  }
  
  public boolean zzl(View paramView)
  {
    return false;
  }
  
  static class zza
    extends zzhv
  {
    zza()
    {
      super();
    }
    
    public boolean zza(DownloadManager.Request paramRequest)
    {
      paramRequest.setShowRunningNotification(true);
      return true;
    }
    
    public int zzgv()
    {
      return 6;
    }
    
    public int zzgw()
    {
      return 7;
    }
  }
  
  static class zzb
    extends zzhv.zza
  {
    zzb() {}
    
    public boolean zza(DownloadManager.Request paramRequest)
    {
      paramRequest.allowScanningByMediaScanner();
      paramRequest.setNotificationVisibility(1);
      return true;
    }
    
    public boolean zza(Context paramContext, WebSettings paramWebSettings)
    {
      if (paramContext.getCacheDir() != null)
      {
        paramWebSettings.setAppCachePath(paramContext.getCacheDir().getAbsolutePath());
        paramWebSettings.setAppCacheMaxSize(0L);
        paramWebSettings.setAppCacheEnabled(true);
      }
      paramWebSettings.setDatabasePath(paramContext.getDatabasePath("com.google.android.gms.ads.db").getAbsolutePath());
      paramWebSettings.setDatabaseEnabled(true);
      paramWebSettings.setDomStorageEnabled(true);
      paramWebSettings.setDisplayZoomControls(false);
      paramWebSettings.setBuiltInZoomControls(true);
      paramWebSettings.setSupportZoom(true);
      return true;
    }
    
    public boolean zza(Window paramWindow)
    {
      paramWindow.setFlags(16777216, 16777216);
      return true;
    }
    
    public boolean zza(WebView paramWebView)
    {
      paramWebView.onPause();
      return true;
    }
    
    public zziq zzb(zzip paramZzip, boolean paramBoolean)
    {
      return new zziv(paramZzip, paramBoolean);
    }
    
    public boolean zzb(WebView paramWebView)
    {
      paramWebView.onResume();
      return true;
    }
    
    public WebChromeClient zzf(zzip paramZzip)
    {
      return new zziu(paramZzip);
    }
    
    public Set<String> zzf(Uri paramUri)
    {
      return paramUri.getQueryParameterNames();
    }
    
    public boolean zzk(View paramView)
    {
      paramView.setLayerType(0, null);
      return true;
    }
    
    public boolean zzl(View paramView)
    {
      paramView.setLayerType(1, null);
      return true;
    }
  }
  
  static class zzc
    extends zzhv.zzb
  {
    zzc() {}
    
    public String zza(SslError paramSslError)
    {
      return paramSslError.getUrl();
    }
    
    public WebChromeClient zzf(zzip paramZzip)
    {
      return new zziw(paramZzip);
    }
  }
  
  static class zzd
    extends zzhv.zzf
  {
    zzd() {}
    
    public String getDefaultUserAgent(Context paramContext)
    {
      return WebSettings.getDefaultUserAgent(paramContext);
    }
    
    public boolean zza(Context paramContext, WebSettings paramWebSettings)
    {
      super.zza(paramContext, paramWebSettings);
      paramWebSettings.setMediaPlaybackRequiresUserGesture(false);
      return true;
    }
  }
  
  static class zze
    extends zzhv.zzd
  {
    zze() {}
    
    public boolean isAttachedToWindow(View paramView)
    {
      return (super.isAttachedToWindow(paramView)) || (paramView.getWindowId() != null);
    }
    
    public int zzgx()
    {
      return 14;
    }
  }
  
  static class zzf
    extends zzhv.zzc
  {
    zzf() {}
    
    public void zza(View paramView, Drawable paramDrawable)
    {
      paramView.setBackground(paramDrawable);
    }
    
    public void zza(ViewTreeObserver paramViewTreeObserver, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
    {
      paramViewTreeObserver.removeOnGlobalLayoutListener(paramOnGlobalLayoutListener);
    }
    
    public void zzb(Activity paramActivity, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
    {
      paramActivity = paramActivity.getWindow();
      if ((paramActivity != null) && (paramActivity.getDecorView() != null) && (paramActivity.getDecorView().getViewTreeObserver() != null)) {
        zza(paramActivity.getDecorView().getViewTreeObserver(), paramOnGlobalLayoutListener);
      }
    }
  }
  
  static class zzg
    extends zzhv.zze
  {
    zzg() {}
    
    public boolean isAttachedToWindow(View paramView)
    {
      return paramView.isAttachedToWindow();
    }
    
    public ViewGroup.LayoutParams zzgy()
    {
      return new ViewGroup.LayoutParams(-1, -1);
    }
  }
}
