package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.MutableContextWrapper;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View.MeasureSpec;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.WindowManager;
import android.webkit.DownloadListener;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzis
  extends WebView
  implements ViewTreeObserver.OnGlobalLayoutListener, DownloadListener, zzip
{
  private String zzBm = "";
  private final zziq zzCq;
  private Boolean zzHi;
  private final zza zzJk;
  private com.google.android.gms.ads.internal.overlay.zzd zzJl;
  private boolean zzJm;
  private boolean zzJn;
  private boolean zzJo;
  private boolean zzJp;
  private int zzJq;
  private boolean zzJr = true;
  private String zzJs;
  private com.google.android.gms.ads.internal.overlay.zzd zzJt;
  private Map<String, zzdr> zzJu;
  private final com.google.android.gms.ads.internal.zzd zzov;
  private final VersionInfoParcel zzpa;
  private final Object zzpc = new Object();
  private zzid zzqG;
  private final WindowManager zzqX;
  private final zzan zzwh;
  private AdSizeParcel zzyK;
  private int zzzQ = -1;
  private int zzzR = -1;
  private int zzzT = -1;
  private int zzzU = -1;
  
  protected zzis(zza paramZza, AdSizeParcel paramAdSizeParcel, boolean paramBoolean1, boolean paramBoolean2, zzan paramZzan, VersionInfoParcel paramVersionInfoParcel, com.google.android.gms.ads.internal.zzd paramZzd)
  {
    super(paramZza);
    zzJk = paramZza;
    zzyK = paramAdSizeParcel;
    zzJo = paramBoolean1;
    zzJq = -1;
    zzwh = paramZzan;
    zzpa = paramVersionInfoParcel;
    zzov = paramZzd;
    zzqX = ((WindowManager)getContext().getSystemService("window"));
    setBackgroundColor(0);
    paramAdSizeParcel = getSettings();
    paramAdSizeParcel.setJavaScriptEnabled(true);
    paramAdSizeParcel.setSavePassword(false);
    paramAdSizeParcel.setSupportMultipleWindows(true);
    paramAdSizeParcel.setJavaScriptCanOpenWindowsAutomatically(true);
    if (Build.VERSION.SDK_INT >= 21) {
      paramAdSizeParcel.setMixedContentMode(0);
    }
    zzp.zzbx().zza(paramZza, zzIz, paramAdSizeParcel);
    zzp.zzbz().zza(getContext(), paramAdSizeParcel);
    setDownloadListener(this);
    zzCq = zzp.zzbz().zzb(this, paramBoolean2);
    setWebViewClient(zzCq);
    setWebChromeClient(zzp.zzbz().zzf(this));
    zzhk();
    if (zzlv.zzpT()) {
      addJavascriptInterface(new zzit(this), "googleAdsJsInterface");
    }
    zzqG = new zzid(zzJk.zzgN(), this, null);
  }
  
  static zzis zzb(Context paramContext, AdSizeParcel paramAdSizeParcel, boolean paramBoolean1, boolean paramBoolean2, zzan paramZzan, VersionInfoParcel paramVersionInfoParcel, com.google.android.gms.ads.internal.zzd paramZzd)
  {
    return new zzis(new zza(paramContext), paramAdSizeParcel, paramBoolean1, paramBoolean2, paramZzan, paramVersionInfoParcel, paramZzd);
  }
  
  private void zzhj()
  {
    synchronized (zzpc)
    {
      zzHi = zzp.zzbA().zzgg();
      Boolean localBoolean = zzHi;
      if (localBoolean == null) {}
      try
      {
        evaluateJavascript("(function(){})()", null);
        zzb(Boolean.valueOf(true));
        return;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        for (;;)
        {
          zzb(Boolean.valueOf(false));
        }
      }
    }
  }
  
  private void zzhk()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if ((zzJo) || (zzyK.zzsH))
        {
          if (Build.VERSION.SDK_INT < 14)
          {
            zzb.zzaC("Disabling hardware acceleration on an overlay.");
            zzhl();
            return;
          }
          zzb.zzaC("Enabling hardware acceleration on an overlay.");
          zzhm();
        }
      }
      if (Build.VERSION.SDK_INT < 18)
      {
        zzb.zzaC("Disabling hardware acceleration on an AdView.");
        zzhl();
      }
      else
      {
        zzb.zzaC("Enabling hardware acceleration on an AdView.");
        zzhm();
      }
    }
  }
  
  private void zzhl()
  {
    synchronized (zzpc)
    {
      if (!zzJp) {
        zzp.zzbz().zzl(this);
      }
      zzJp = true;
      return;
    }
  }
  
  private void zzhm()
  {
    synchronized (zzpc)
    {
      if (zzJp) {
        zzp.zzbz().zzk(this);
      }
      zzJp = false;
      return;
    }
  }
  
  private void zzhn()
  {
    synchronized (zzpc)
    {
      if (zzJu != null)
      {
        Iterator localIterator = zzJu.values().iterator();
        if (localIterator.hasNext()) {
          ((zzdr)localIterator.next()).release();
        }
      }
    }
  }
  
  public void destroy()
  {
    synchronized (zzpc)
    {
      zzqG.zzgE();
      if (zzJl != null)
      {
        zzJl.close();
        zzJl.onDestroy();
        zzJl = null;
      }
      zzCq.reset();
      if (zzJn) {
        return;
      }
      zzp.zzbK().zza(this);
      zzhn();
      zzJn = true;
      zzb.v("Initiating WebView self destruct sequence in 3...");
      zzCq.zzhd();
      return;
    }
  }
  
  public void evaluateJavascript(String paramString, ValueCallback<String> paramValueCallback)
  {
    synchronized (zzpc)
    {
      if (isDestroyed())
      {
        zzb.zzaE("The webview is destroyed. Ignoring action.");
        if (paramValueCallback != null) {
          paramValueCallback.onReceiveValue(null);
        }
        return;
      }
      super.evaluateJavascript(paramString, paramValueCallback);
      return;
    }
  }
  
  public String getRequestId()
  {
    synchronized (zzpc)
    {
      String str = zzBm;
      return str;
    }
  }
  
  public int getRequestedOrientation()
  {
    synchronized (zzpc)
    {
      int i = zzJq;
      return i;
    }
  }
  
  public WebView getWebView()
  {
    return this;
  }
  
  public boolean isDestroyed()
  {
    synchronized (zzpc)
    {
      boolean bool = zzJn;
      return bool;
    }
  }
  
  public void loadData(String paramString1, String paramString2, String paramString3)
  {
    synchronized (zzpc)
    {
      if (!isDestroyed())
      {
        super.loadData(paramString1, paramString2, paramString3);
        return;
      }
      zzb.zzaE("The webview is destroyed. Ignoring action.");
    }
  }
  
  public void loadDataWithBaseURL(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    synchronized (zzpc)
    {
      if (!isDestroyed())
      {
        super.loadDataWithBaseURL(paramString1, paramString2, paramString3, paramString4, paramString5);
        return;
      }
      zzb.zzaE("The webview is destroyed. Ignoring action.");
    }
  }
  
  public void loadUrl(String paramString)
  {
    synchronized (zzpc)
    {
      if (!isDestroyed())
      {
        super.loadUrl(paramString);
        return;
      }
      zzb.zzaE("The webview is destroyed. Ignoring action.");
    }
  }
  
  protected void onAttachedToWindow()
  {
    synchronized (zzpc)
    {
      super.onAttachedToWindow();
      if (!isDestroyed()) {
        zzqG.onAttachedToWindow();
      }
      return;
    }
  }
  
  protected void onDetachedFromWindow()
  {
    synchronized (zzpc)
    {
      if (!isDestroyed()) {
        zzqG.onDetachedFromWindow();
      }
      super.onDetachedFromWindow();
      return;
    }
  }
  
  public void onDownloadStart(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong)
  {
    try
    {
      paramString2 = new Intent("android.intent.action.VIEW");
      paramString2.setDataAndType(Uri.parse(paramString1), paramString4);
      getContext().startActivity(paramString2);
      return;
    }
    catch (ActivityNotFoundException paramString2)
    {
      zzb.zzaC("Couldn't find an Activity to view url/mimetype: " + paramString1 + " / " + paramString4);
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (isDestroyed()) {}
    while ((Build.VERSION.SDK_INT == 21) && (paramCanvas.isHardwareAccelerated()) && (!isAttachedToWindow())) {
      return;
    }
    super.onDraw(paramCanvas);
  }
  
  public void onGlobalLayout()
  {
    boolean bool = zzhi();
    com.google.android.gms.ads.internal.overlay.zzd localZzd = zzgQ();
    if ((localZzd != null) && (bool)) {
      localZzd.zzeC();
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int j = Integer.MAX_VALUE;
    synchronized (zzpc)
    {
      if (isDestroyed())
      {
        setMeasuredDimension(0, 0);
        return;
      }
      if ((isInEditMode()) || (zzJo) || (zzyK.zzsJ))
      {
        super.onMeasure(paramInt1, paramInt2);
        return;
      }
    }
    if (zzyK.zzsH)
    {
      DisplayMetrics localDisplayMetrics = new DisplayMetrics();
      zzqX.getDefaultDisplay().getMetrics(localDisplayMetrics);
      setMeasuredDimension(widthPixels, heightPixels);
      return;
    }
    int n = View.MeasureSpec.getMode(paramInt1);
    int i = View.MeasureSpec.getSize(paramInt1);
    int m = View.MeasureSpec.getMode(paramInt2);
    int k = View.MeasureSpec.getSize(paramInt2);
    if (n != Integer.MIN_VALUE) {
      if (n == 1073741824) {
        break label358;
      }
    }
    for (;;)
    {
      if ((zzyK.widthPixels > paramInt1) || (zzyK.heightPixels > paramInt2))
      {
        float f = zzJk.getResources().getDisplayMetrics().density;
        zzb.zzaE("Not enough space to show ad. Needs " + (int)(zzyK.widthPixels / f) + "x" + (int)(zzyK.heightPixels / f) + " dp, but only has " + (int)(i / f) + "x" + (int)(k / f) + " dp.");
        if (getVisibility() != 8) {
          setVisibility(4);
        }
        setMeasuredDimension(0, 0);
      }
      for (;;)
      {
        return;
        if (getVisibility() != 8) {
          setVisibility(0);
        }
        setMeasuredDimension(zzyK.widthPixels, zzyK.heightPixels);
      }
      paramInt1 = Integer.MAX_VALUE;
      break label361;
      label358:
      paramInt1 = i;
      label361:
      if (m != Integer.MIN_VALUE)
      {
        paramInt2 = j;
        if (m != 1073741824) {}
      }
      else
      {
        paramInt2 = k;
      }
    }
  }
  
  public void onPause()
  {
    if (isDestroyed()) {
      return;
    }
    try
    {
      super.onPause();
      return;
    }
    catch (Exception localException)
    {
      zzb.zzb("Could not pause webview.", localException);
    }
  }
  
  public void onResume()
  {
    if (isDestroyed()) {
      return;
    }
    try
    {
      super.onResume();
      return;
    }
    catch (Exception localException)
    {
      zzb.zzb("Could not resume webview.", localException);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (zzwh != null) {
      zzwh.zza(paramMotionEvent);
    }
    if (isDestroyed()) {
      return false;
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public void setContext(Context paramContext)
  {
    zzJk.setBaseContext(paramContext);
    zzqG.zzl(zzJk.zzgN());
  }
  
  public void setRequestedOrientation(int paramInt)
  {
    synchronized (zzpc)
    {
      zzJq = paramInt;
      if (zzJl != null) {
        zzJl.setRequestedOrientation(zzJq);
      }
      return;
    }
  }
  
  public void stopLoading()
  {
    if (isDestroyed()) {
      return;
    }
    try
    {
      super.stopLoading();
      return;
    }
    catch (Exception localException)
    {
      zzb.zzb("Could not stop loading webview.", localException);
    }
  }
  
  public void zzC(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      zzJo = paramBoolean;
      zzhk();
      return;
    }
  }
  
  public void zzD(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      if (zzJl != null)
      {
        zzJl.zza(zzCq.zzbY(), paramBoolean);
        return;
      }
      zzJm = paramBoolean;
    }
  }
  
  public void zzE(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      zzJr = paramBoolean;
      return;
    }
  }
  
  public void zza(Context paramContext, AdSizeParcel paramAdSizeParcel)
  {
    synchronized (zzpc)
    {
      zzqG.zzgE();
      setContext(paramContext);
      zzJl = null;
      zzyK = paramAdSizeParcel;
      zzJo = false;
      zzJm = false;
      zzBm = "";
      zzJq = -1;
      zzp.zzbz().zzb(this);
      loadUrl("about:blank");
      zzCq.reset();
      setOnTouchListener(null);
      setOnClickListener(null);
      zzJr = true;
      return;
    }
  }
  
  public void zza(AdSizeParcel paramAdSizeParcel)
  {
    synchronized (zzpc)
    {
      zzyK = paramAdSizeParcel;
      requestLayout();
      return;
    }
  }
  
  public void zza(com.google.android.gms.ads.internal.overlay.zzd paramZzd)
  {
    synchronized (zzpc)
    {
      zzJl = paramZzd;
      return;
    }
  }
  
  public void zza(zzaz paramZzaz, boolean paramBoolean)
  {
    HashMap localHashMap = new HashMap();
    if (paramBoolean) {}
    for (paramZzaz = "1";; paramZzaz = "0")
    {
      localHashMap.put("isVisible", paramZzaz);
      zzc("onAdVisibilityChanged", localHashMap);
      return;
    }
  }
  
  protected void zza(String paramString, ValueCallback<String> paramValueCallback)
  {
    synchronized (zzpc)
    {
      if (!isDestroyed()) {
        evaluateJavascript(paramString, paramValueCallback);
      }
      do
      {
        return;
        zzb.zzaE("The webview is destroyed. Ignoring action.");
      } while (paramValueCallback == null);
      paramValueCallback.onReceiveValue(null);
    }
  }
  
  public void zza(String paramString1, String paramString2)
  {
    zzaK(paramString1 + "(" + paramString2 + ");");
  }
  
  public void zza(String paramString, JSONObject paramJSONObject)
  {
    JSONObject localJSONObject = paramJSONObject;
    if (paramJSONObject == null) {
      localJSONObject = new JSONObject();
    }
    zza(paramString, localJSONObject.toString());
  }
  
  public void zzaF(String paramString)
  {
    synchronized (zzpc)
    {
      super.loadUrl(paramString);
      return;
    }
  }
  
  public void zzaG(String paramString)
  {
    Object localObject = zzpc;
    String str = paramString;
    if (paramString == null) {
      str = "";
    }
    try
    {
      zzBm = str;
      return;
    }
    finally {}
  }
  
  public void zzaH(String paramString)
  {
    synchronized (zzpc)
    {
      zzJs = paramString;
      return;
    }
  }
  
  protected void zzaJ(String paramString)
  {
    synchronized (zzpc)
    {
      if (!isDestroyed())
      {
        loadUrl(paramString);
        return;
      }
      zzb.zzaE("The webview is destroyed. Ignoring action.");
    }
  }
  
  protected void zzaK(String paramString)
  {
    if (zzlv.zzpV())
    {
      if (zzgg() == null) {
        zzhj();
      }
      if (zzgg().booleanValue())
      {
        zza(paramString, null);
        return;
      }
      zzaJ("javascript:" + paramString);
      return;
    }
    zzaJ("javascript:" + paramString);
  }
  
  public AdSizeParcel zzaN()
  {
    synchronized (zzpc)
    {
      AdSizeParcel localAdSizeParcel = zzyK;
      return localAdSizeParcel;
    }
  }
  
  public void zzb(com.google.android.gms.ads.internal.overlay.zzd paramZzd)
  {
    synchronized (zzpc)
    {
      zzJt = paramZzd;
      return;
    }
  }
  
  void zzb(Boolean paramBoolean)
  {
    zzHi = paramBoolean;
    zzp.zzbA().zzb(paramBoolean);
  }
  
  public void zzb(String paramString, JSONObject paramJSONObject)
  {
    Object localObject = paramJSONObject;
    if (paramJSONObject == null) {
      localObject = new JSONObject();
    }
    paramJSONObject = ((JSONObject)localObject).toString();
    localObject = new StringBuilder();
    ((StringBuilder)localObject).append("AFMA_ReceiveMessage('");
    ((StringBuilder)localObject).append(paramString);
    ((StringBuilder)localObject).append("'");
    ((StringBuilder)localObject).append(",");
    ((StringBuilder)localObject).append(paramJSONObject);
    ((StringBuilder)localObject).append(");");
    zzb.v("Dispatching AFMA event: " + ((StringBuilder)localObject).toString());
    zzaK(((StringBuilder)localObject).toString());
  }
  
  public void zzc(String paramString, Map<String, ?> paramMap)
  {
    try
    {
      paramMap = zzp.zzbx().zzx(paramMap);
      zzb(paramString, paramMap);
      return;
    }
    catch (JSONException paramString)
    {
      zzb.zzaE("Could not convert parameters to JSON.");
    }
  }
  
  public void zzeD()
  {
    HashMap localHashMap = new HashMap(1);
    localHashMap.put("version", zzpa.zzIz);
    zzc("onshow", localHashMap);
  }
  
  public void zzgM()
  {
    HashMap localHashMap = new HashMap(1);
    localHashMap.put("version", zzpa.zzIz);
    zzc("onhide", localHashMap);
  }
  
  public Activity zzgN()
  {
    return zzJk.zzgN();
  }
  
  public Context zzgO()
  {
    return zzJk.zzgO();
  }
  
  public com.google.android.gms.ads.internal.zzd zzgP()
  {
    return zzov;
  }
  
  public com.google.android.gms.ads.internal.overlay.zzd zzgQ()
  {
    synchronized (zzpc)
    {
      com.google.android.gms.ads.internal.overlay.zzd localZzd = zzJl;
      return localZzd;
    }
  }
  
  public com.google.android.gms.ads.internal.overlay.zzd zzgR()
  {
    synchronized (zzpc)
    {
      com.google.android.gms.ads.internal.overlay.zzd localZzd = zzJt;
      return localZzd;
    }
  }
  
  public zziq zzgS()
  {
    return zzCq;
  }
  
  public boolean zzgT()
  {
    return zzJm;
  }
  
  public zzan zzgU()
  {
    return zzwh;
  }
  
  public VersionInfoParcel zzgV()
  {
    return zzpa;
  }
  
  public boolean zzgW()
  {
    synchronized (zzpc)
    {
      boolean bool = zzJo;
      return bool;
    }
  }
  
  public void zzgX()
  {
    synchronized (zzpc)
    {
      zzb.v("Destroying WebView!");
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          zzis.zza(zzis.this);
        }
      });
      return;
    }
  }
  
  public boolean zzgY()
  {
    synchronized (zzpc)
    {
      boolean bool = zzJr;
      return bool;
    }
  }
  
  public void zzgZ()
  {
    zzqG.zzgD();
  }
  
  Boolean zzgg()
  {
    synchronized (zzpc)
    {
      Boolean localBoolean = zzHi;
      return localBoolean;
    }
  }
  
  public String zzha()
  {
    synchronized (zzpc)
    {
      String str = zzJs;
      return str;
    }
  }
  
  public boolean zzhi()
  {
    if (!zzgS().zzbY()) {
      return false;
    }
    DisplayMetrics localDisplayMetrics = zzp.zzbx().zza(zzqX);
    int k = zzk.zzcE().zzb(localDisplayMetrics, widthPixels);
    int m = zzk.zzcE().zzb(localDisplayMetrics, heightPixels);
    Object localObject = zzgN();
    int j;
    int i;
    if ((localObject == null) || (((Activity)localObject).getWindow() == null))
    {
      j = m;
      i = k;
      label77:
      if ((zzzQ == k) && (zzzR == m) && (zzzT == i) && (zzzU == j)) {
        break label224;
      }
      if ((zzzQ == k) && (zzzR == m)) {
        break label226;
      }
    }
    label224:
    label226:
    for (boolean bool = true;; bool = false)
    {
      zzzQ = k;
      zzzR = m;
      zzzT = i;
      zzzU = j;
      new zzfb(this).zza(k, m, i, j, density, zzqX.getDefaultDisplay().getRotation());
      return bool;
      localObject = zzp.zzbx().zzg((Activity)localObject);
      i = zzk.zzcE().zzb(localDisplayMetrics, localObject[0]);
      j = zzk.zzcE().zzb(localDisplayMetrics, localObject[1]);
      break label77;
      break;
    }
  }
  
  public void zzv(int paramInt)
  {
    HashMap localHashMap = new HashMap(2);
    localHashMap.put("closetype", String.valueOf(paramInt));
    localHashMap.put("version", zzpa.zzIz);
    zzc("onhide", localHashMap);
  }
  
  @zzgk
  public static class zza
    extends MutableContextWrapper
  {
    private Activity zzIs;
    private Context zzJw;
    private Context zzqO;
    
    public zza(Context paramContext)
    {
      super();
      setBaseContext(paramContext);
    }
    
    public Object getSystemService(String paramString)
    {
      return zzJw.getSystemService(paramString);
    }
    
    public void setBaseContext(Context paramContext)
    {
      zzqO = paramContext.getApplicationContext();
      if ((paramContext instanceof Activity)) {}
      for (Activity localActivity = (Activity)paramContext;; localActivity = null)
      {
        zzIs = localActivity;
        zzJw = paramContext;
        super.setBaseContext(zzqO);
        return;
      }
    }
    
    public void startActivity(Intent paramIntent)
    {
      if ((zzIs != null) && (!zzlv.isAtLeastL()))
      {
        zzIs.startActivity(paramIntent);
        return;
      }
      paramIntent.setFlags(268435456);
      zzqO.startActivity(paramIntent);
    }
    
    public Activity zzgN()
    {
      return zzIs;
    }
    
    public Context zzgO()
    {
      return zzJw;
    }
  }
}
