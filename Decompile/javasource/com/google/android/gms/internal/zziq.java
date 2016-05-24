package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.webkit.SslErrorHandler;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zza;
import com.google.android.gms.ads.internal.overlay.AdLauncherIntentInfoParcel;
import com.google.android.gms.ads.internal.overlay.AdOverlayInfoParcel;
import com.google.android.gms.ads.internal.overlay.zzd;
import com.google.android.gms.ads.internal.overlay.zzg;
import com.google.android.gms.ads.internal.overlay.zzn;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

@zzgk
public class zziq
  extends WebViewClient
{
  private static final String[] zzIU = { "UNKNOWN", "HOST_LOOKUP", "UNSUPPORTED_AUTH_SCHEME", "AUTHENTICATION", "PROXY_AUTHENTICATION", "CONNECT", "IO", "TIMEOUT", "REDIRECT_LOOP", "UNSUPPORTED_SCHEME", "FAILED_SSL_HANDSHAKE", "BAD_URL", "FILE", "FILE_NOT_FOUND", "TOO_MANY_REQUESTS" };
  private static final String[] zzIV = { "NOT_YET_VALID", "EXPIRED", "ID_MISMATCH", "UNTRUSTED", "DATE_INVALID", "INVALID" };
  private zza zzCv;
  private final HashMap<String, List<zzdg>> zzIW = new HashMap();
  private zzg zzIX;
  private zzb zzIY;
  private boolean zzIZ = false;
  private boolean zzJa;
  private zzn zzJb;
  private final zzfa zzJc;
  private boolean zzJd;
  private boolean zzJe;
  private boolean zzJf;
  private boolean zzJg;
  private int zzJh;
  protected final zzip zzoL;
  private final Object zzpc = new Object();
  private boolean zzqL;
  private zza zzsn;
  private zzdd zzwH;
  private zzdk zzxh;
  private com.google.android.gms.ads.internal.zze zzxj;
  private zzew zzxk;
  private zzdi zzxm;
  private zzfc zzzy;
  
  public zziq(zzip paramZzip, boolean paramBoolean)
  {
    this(paramZzip, paramBoolean, new zzfa(paramZzip, paramZzip.zzgO(), new zzbq(paramZzip.getContext())), null);
  }
  
  zziq(zzip paramZzip, boolean paramBoolean, zzfa paramZzfa, zzew paramZzew)
  {
    zzoL = paramZzip;
    zzqL = paramBoolean;
    zzJc = paramZzfa;
    zzxk = paramZzew;
  }
  
  private void zza(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    if (!((Boolean)zzby.zzva.get()).booleanValue()) {
      return;
    }
    Bundle localBundle = new Bundle();
    localBundle.putString("err", paramString1);
    localBundle.putString("code", paramString2);
    localBundle.putString("host", zzaI(paramString3));
    zzp.zzbx().zza(paramContext, zzoL.zzgV().zzIz, "gmob-apps", localBundle, true);
  }
  
  private String zzaI(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    paramString = Uri.parse(paramString);
    if (paramString.getHost() != null) {
      return paramString.getHost();
    }
    return "";
  }
  
  private static boolean zzg(Uri paramUri)
  {
    paramUri = paramUri.getScheme();
    return ("http".equalsIgnoreCase(paramUri)) || ("https".equalsIgnoreCase(paramUri));
  }
  
  private void zzhe()
  {
    synchronized (zzpc)
    {
      zzJa = true;
      zzJh += 1;
      zzhh();
      return;
    }
  }
  
  private void zzhf()
  {
    zzJh -= 1;
    zzhh();
  }
  
  private void zzhg()
  {
    zzJg = true;
    zzhh();
  }
  
  public final void onLoadResource(WebView paramWebView, String paramString)
  {
    zzb.v("Loading resource: " + paramString);
    paramWebView = Uri.parse(paramString);
    if (("gmsg".equalsIgnoreCase(paramWebView.getScheme())) && ("mobileads.google.com".equalsIgnoreCase(paramWebView.getHost()))) {
      zzh(paramWebView);
    }
  }
  
  public final void onPageFinished(WebView arg1, String paramString)
  {
    synchronized (zzpc)
    {
      if ((zzJe) && ("about:blank".equals(paramString)))
      {
        zzb.v("Blank page loaded, 1...");
        zzoL.zzgX();
        return;
      }
      zzJf = true;
      zzhh();
      return;
    }
  }
  
  public final void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
  {
    if ((paramInt < 0) && (-paramInt - 1 < zzIU.length)) {}
    for (String str = zzIU[(-paramInt - 1)];; str = String.valueOf(paramInt))
    {
      zza(zzoL.getContext(), "http_err", str, paramString2);
      super.onReceivedError(paramWebView, paramInt, paramString1, paramString2);
      return;
    }
  }
  
  public final void onReceivedSslError(WebView paramWebView, SslErrorHandler paramSslErrorHandler, SslError paramSslError)
  {
    int i;
    if (paramSslError != null)
    {
      i = paramSslError.getPrimaryError();
      if ((i < 0) || (i >= zzIV.length)) {
        break label65;
      }
    }
    label65:
    for (String str = zzIV[i];; str = String.valueOf(i))
    {
      zza(zzoL.getContext(), "ssl_err", str, zzp.zzbz().zza(paramSslError));
      super.onReceivedSslError(paramWebView, paramSslErrorHandler, paramSslError);
      return;
    }
  }
  
  public final void reset()
  {
    synchronized (zzpc)
    {
      zzIW.clear();
      zzsn = null;
      zzIX = null;
      zzCv = null;
      zzwH = null;
      zzIZ = false;
      zzqL = false;
      zzJa = false;
      zzxm = null;
      zzJb = null;
      zzIY = null;
      if (zzxk != null)
      {
        zzxk.zzn(true);
        zzxk = null;
      }
      zzJd = false;
      return;
    }
  }
  
  public boolean shouldOverrideKeyEvent(WebView paramWebView, KeyEvent paramKeyEvent)
  {
    switch (paramKeyEvent.getKeyCode())
    {
    default: 
      return false;
    }
    return true;
  }
  
  public final boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    zzb.v("AdWebView shouldOverrideUrlLoading: " + paramString);
    Uri localUri = Uri.parse(paramString);
    if (("gmsg".equalsIgnoreCase(localUri.getScheme())) && ("mobileads.google.com".equalsIgnoreCase(localUri.getHost()))) {
      zzh(localUri);
    }
    for (;;)
    {
      return true;
      if ((zzIZ) && (paramWebView == zzoL) && (zzg(localUri)))
      {
        if (!zzJd)
        {
          zzJd = true;
          if ((zzsn != null) && (((Boolean)zzby.zzuO.get()).booleanValue())) {
            zzsn.onAdClicked();
          }
        }
        return super.shouldOverrideUrlLoading(paramWebView, paramString);
      }
      if (!zzoL.willNotDraw())
      {
        try
        {
          zzan localZzan = zzoL.zzgU();
          paramWebView = localUri;
          if (localZzan != null)
          {
            paramWebView = localUri;
            if (localZzan.zzb(localUri)) {
              paramWebView = localZzan.zza(localUri, zzoL.getContext());
            }
          }
        }
        catch (zzao paramWebView)
        {
          for (;;)
          {
            zzb.zzaE("Unable to append parameter to URL: " + paramString);
            paramWebView = localUri;
          }
          zzxj.zzp(paramString);
        }
        if ((zzxj == null) || (zzxj.zzbe())) {
          zza(new AdLauncherIntentInfoParcel("android.intent.action.VIEW", paramWebView.toString(), null, null, null, null, null));
        }
      }
      else
      {
        zzb.zzaE("AdWebView unable to handle URL: " + paramString);
      }
    }
  }
  
  public void zzF(boolean paramBoolean)
  {
    zzIZ = paramBoolean;
  }
  
  public void zza(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    zzJc.zze(paramInt1, paramInt2);
    if (zzxk != null) {
      zzxk.zza(paramInt1, paramInt2, paramBoolean);
    }
  }
  
  public final void zza(AdLauncherIntentInfoParcel paramAdLauncherIntentInfoParcel)
  {
    zzg localZzg = null;
    boolean bool = zzoL.zzgW();
    zza localZza;
    if ((bool) && (!zzoL.zzaN().zzsH))
    {
      localZza = null;
      if (!bool) {
        break label75;
      }
    }
    for (;;)
    {
      zza(new AdOverlayInfoParcel(paramAdLauncherIntentInfoParcel, localZza, localZzg, zzJb, zzoL.zzgV()));
      return;
      localZza = zzsn;
      break;
      label75:
      localZzg = zzIX;
    }
  }
  
  public void zza(AdOverlayInfoParcel paramAdOverlayInfoParcel)
  {
    boolean bool2 = false;
    if (zzxk != null) {}
    for (boolean bool1 = zzxk.zzdY();; bool1 = false)
    {
      com.google.android.gms.ads.internal.overlay.zze localZze = zzp.zzbv();
      Context localContext = zzoL.getContext();
      if (!bool1) {
        bool2 = true;
      }
      localZze.zza(localContext, paramAdOverlayInfoParcel, bool2);
      return;
    }
  }
  
  public void zza(zza paramZza)
  {
    zzCv = paramZza;
  }
  
  public void zza(zzb paramZzb)
  {
    zzIY = paramZzb;
  }
  
  public final void zza(String paramString, zzdg paramZzdg)
  {
    synchronized (zzpc)
    {
      List localList = (List)zzIW.get(paramString);
      Object localObject1 = localList;
      if (localList == null)
      {
        localObject1 = new CopyOnWriteArrayList();
        zzIW.put(paramString, localObject1);
      }
      ((List)localObject1).add(paramZzdg);
      return;
    }
  }
  
  public final void zza(boolean paramBoolean, int paramInt)
  {
    if ((zzoL.zzgW()) && (!zzoL.zzaN().zzsH)) {}
    for (zza localZza = null;; localZza = zzsn)
    {
      zza(new AdOverlayInfoParcel(localZza, zzIX, zzJb, zzoL, paramBoolean, paramInt, zzoL.zzgV()));
      return;
    }
  }
  
  public final void zza(boolean paramBoolean, int paramInt, String paramString)
  {
    Object localObject = null;
    boolean bool = zzoL.zzgW();
    zza localZza;
    if ((bool) && (!zzoL.zzaN().zzsH))
    {
      localZza = null;
      if (!bool) {
        break label95;
      }
    }
    for (;;)
    {
      zza(new AdOverlayInfoParcel(localZza, (zzg)localObject, zzwH, zzJb, zzoL, paramBoolean, paramInt, paramString, zzoL.zzgV(), zzxm));
      return;
      localZza = zzsn;
      break;
      label95:
      localObject = new zzc(zzoL, zzIX);
    }
  }
  
  public final void zza(boolean paramBoolean, int paramInt, String paramString1, String paramString2)
  {
    boolean bool = zzoL.zzgW();
    zza localZza;
    if ((bool) && (!zzoL.zzaN().zzsH))
    {
      localZza = null;
      if (!bool) {
        break label97;
      }
    }
    label97:
    for (Object localObject = null;; localObject = new zzc(zzoL, zzIX))
    {
      zza(new AdOverlayInfoParcel(localZza, (zzg)localObject, zzwH, zzJb, zzoL, paramBoolean, paramInt, paramString1, paramString2, zzoL.zzgV(), zzxm));
      return;
      localZza = zzsn;
      break;
    }
  }
  
  public void zzb(zza paramZza, zzg paramZzg, zzdd paramZzdd, zzn paramZzn, boolean paramBoolean, zzdi paramZzdi, zzdk paramZzdk, com.google.android.gms.ads.internal.zze paramZze, zzfc paramZzfc)
  {
    com.google.android.gms.ads.internal.zze localZze = paramZze;
    if (paramZze == null) {
      localZze = new com.google.android.gms.ads.internal.zze(false);
    }
    zzxk = new zzew(zzoL, paramZzfc);
    zza("/appEvent", new zzdc(paramZzdd));
    zza("/backButton", zzdf.zzwR);
    zza("/canOpenURLs", zzdf.zzwJ);
    zza("/canOpenIntents", zzdf.zzwK);
    zza("/click", zzdf.zzwL);
    zza("/close", zzdf.zzwM);
    zza("/customClose", zzdf.zzwN);
    zza("/delayPageLoaded", new zzd(null));
    zza("/httpTrack", zzdf.zzwO);
    zza("/log", zzdf.zzwP);
    zza("/mraid", new zzdm(localZze, zzxk));
    zza("/mraidLoaded", zzJc);
    zza("/open", new zzdn(paramZzdi, localZze, zzxk));
    zza("/precache", zzdf.zzwT);
    zza("/touch", zzdf.zzwQ);
    zza("/video", zzdf.zzwS);
    if (paramZzdk != null) {
      zza("/setInterstitialProperties", new zzdj(paramZzdk));
    }
    zzsn = paramZza;
    zzIX = paramZzg;
    zzwH = paramZzdd;
    zzxm = paramZzdi;
    zzJb = paramZzn;
    zzxj = localZze;
    zzzy = paramZzfc;
    zzxh = paramZzdk;
    zzF(paramBoolean);
    zzJd = false;
  }
  
  public final void zzb(String paramString, zzdg paramZzdg)
  {
    synchronized (zzpc)
    {
      paramString = (List)zzIW.get(paramString);
      if (paramString == null) {
        return;
      }
      paramString.remove(paramZzdg);
      return;
    }
  }
  
  public boolean zzbY()
  {
    synchronized (zzpc)
    {
      boolean bool = zzqL;
      return bool;
    }
  }
  
  public void zzd(int paramInt1, int paramInt2)
  {
    if (zzxk != null) {
      zzxk.zzd(paramInt1, paramInt2);
    }
  }
  
  public final void zzeA()
  {
    synchronized (zzpc)
    {
      zzIZ = false;
      zzqL = true;
      zzhu.runOnUiThread(new Runnable()
      {
        public void run()
        {
          zzoL.zzgZ();
          zzd localZzd = zzoL.zzgQ();
          if (localZzd != null) {
            localZzd.zzeA();
          }
          if (zziq.zzd(zziq.this) != null)
          {
            zziq.zzd(zziq.this).zzbf();
            zziq.zza(zziq.this, null);
          }
        }
      });
      return;
    }
  }
  
  public void zzh(Uri paramUri)
  {
    Object localObject2 = paramUri.getPath();
    Object localObject1 = (List)zzIW.get(localObject2);
    if (localObject1 != null)
    {
      paramUri = zzp.zzbx().zze(paramUri);
      if (zzb.zzM(2))
      {
        zzb.v("Received GMSG: " + (String)localObject2);
        localObject2 = paramUri.keySet().iterator();
        while (((Iterator)localObject2).hasNext())
        {
          String str = (String)((Iterator)localObject2).next();
          zzb.v("  " + str + ": " + (String)paramUri.get(str));
        }
      }
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext()) {
        ((zzdg)((Iterator)localObject1).next()).zza(zzoL, paramUri);
      }
    }
    zzb.v("No GMSG handler found for GMSG: " + paramUri);
  }
  
  public com.google.android.gms.ads.internal.zze zzhb()
  {
    return zzxj;
  }
  
  public boolean zzhc()
  {
    synchronized (zzpc)
    {
      boolean bool = zzJa;
      return bool;
    }
  }
  
  public void zzhd()
  {
    synchronized (zzpc)
    {
      zzb.v("Loading blank page in WebView, 2...");
      zzJe = true;
      zzoL.zzaF("about:blank");
      return;
    }
  }
  
  public final void zzhh()
  {
    zza localZza;
    zzip localZzip;
    if ((zzCv != null) && (((zzJf) && (zzJh <= 0)) || (zzJg)))
    {
      localZza = zzCv;
      localZzip = zzoL;
      if (zzJg) {
        break label61;
      }
    }
    label61:
    for (boolean bool = true;; bool = false)
    {
      localZza.zza(localZzip, bool);
      zzCv = null;
      return;
    }
  }
  
  public static abstract interface zza
  {
    public abstract void zza(zzip paramZzip, boolean paramBoolean);
  }
  
  public static abstract interface zzb
  {
    public abstract void zzbf();
  }
  
  private static class zzc
    implements zzg
  {
    private zzg zzIX;
    private zzip zzJj;
    
    public zzc(zzip paramZzip, zzg paramZzg)
    {
      zzJj = paramZzip;
      zzIX = paramZzg;
    }
    
    public void zzaV()
    {
      zzIX.zzaV();
      zzJj.zzgM();
    }
    
    public void zzaW()
    {
      zzIX.zzaW();
      zzJj.zzeD();
    }
  }
  
  private class zzd
    implements zzdg
  {
    private zzd() {}
    
    public void zza(zzip paramZzip, Map<String, String> paramMap)
    {
      if (paramMap.keySet().contains("start")) {
        zziq.zza(zziq.this);
      }
      do
      {
        return;
        if (paramMap.keySet().contains("stop"))
        {
          zziq.zzb(zziq.this);
          return;
        }
      } while (!paramMap.keySet().contains("cancel"));
      zziq.zzc(zziq.this);
    }
  }
}
