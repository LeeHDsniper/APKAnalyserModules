package com.google.android.gms.ads.internal.overlay;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.webkit.WebChromeClient.CustomViewCallback;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.google.android.gms.ads.internal.InterstitialAdParameterParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzca;
import com.google.android.gms.internal.zzcc;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzfe.zza;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzhv;
import com.google.android.gms.internal.zzhw;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import com.google.android.gms.internal.zziq.zza;
import com.google.android.gms.internal.zzir;
import java.util.Collections;

@zzgk
public class zzd
  extends zzfe.zza
  implements zzo
{
  static final int zzAu = Color.argb(0, 0, 0, 0);
  private final Activity mActivity;
  zzm zzAA;
  boolean zzAB = false;
  FrameLayout zzAC;
  WebChromeClient.CustomViewCallback zzAD;
  boolean zzAE = false;
  boolean zzAF = false;
  boolean zzAG = false;
  int zzAH = 0;
  private boolean zzAI;
  private boolean zzAJ = false;
  private boolean zzAK = true;
  private final zzcd zzAv;
  private final zzcc zzAw;
  AdOverlayInfoParcel zzAx;
  zzk zzAy;
  zzc zzAz;
  zzip zzoL;
  RelativeLayout zzzA;
  
  public zzd(Activity paramActivity)
  {
    mActivity = paramActivity;
    zzAv = new zzcd(((Boolean)zzby.zzuB.get()).booleanValue(), "show_interstitial", "interstitial");
    zzAw = zzAv.zzdl();
  }
  
  public void close()
  {
    zzAH = 2;
    mActivity.finish();
  }
  
  public void onBackPressed()
  {
    zzAH = 0;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    boolean bool = false;
    if (paramBundle != null) {
      bool = paramBundle.getBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", false);
    }
    zzAE = bool;
    try
    {
      zzAx = AdOverlayInfoParcel.zzb(mActivity.getIntent());
      if (zzAx != null) {
        break label71;
      }
      throw new zza("Could not get info for ad overlay.");
    }
    catch (zza paramBundle)
    {
      zzb.zzaE(paramBundle.getMessage());
      zzAH = 3;
      mActivity.finish();
    }
    return;
    label71:
    if (zzAx.zzqb.zzIB > 7500000) {
      zzAH = 3;
    }
    if (mActivity.getIntent() != null) {
      zzAK = mActivity.getIntent().getBooleanExtra("shouldCallOnOverlayOpened", true);
    }
    if (zzAx.zzBa != null)
    {
      zzAF = zzAx.zzBa.zzpk;
      label142:
      if (paramBundle == null)
      {
        if ((zzAx.zzAQ != null) && (zzAK)) {
          zzAx.zzAQ.zzaW();
        }
        if ((zzAx.zzAX != 1) && (zzAx.zzAP != null)) {
          zzAx.zzAP.onAdClicked();
        }
      }
      zzzA = new zzb(mActivity, zzAx.zzAZ);
      switch (zzAx.zzAX)
      {
      }
    }
    for (;;)
    {
      throw new zza("Could not determine ad overlay type.");
      zzAF = false;
      break label142;
      zzv(false);
      return;
      zzAz = new zzc(zzAx.zzAR);
      zzv(false);
      return;
      zzv(true);
      return;
      if (zzAE)
      {
        zzAH = 3;
        mActivity.finish();
        return;
      }
      if (zzp.zzbu().zza(mActivity, zzAx.zzAO, zzAx.zzAW)) {
        break;
      }
      zzAH = 3;
      mActivity.finish();
      return;
    }
  }
  
  public void onDestroy()
  {
    if (zzAy != null) {
      zzAy.destroy();
    }
    if (zzoL != null) {
      zzzA.removeView(zzoL.getWebView());
    }
    zzeB();
  }
  
  public void onPause()
  {
    if (zzAy != null) {
      zzAy.pause();
    }
    zzex();
    if ((zzoL != null) && ((!mActivity.isFinishing()) || (zzAz == null))) {
      zzp.zzbz().zza(zzoL.getWebView());
    }
    zzeB();
  }
  
  public void onRestart() {}
  
  public void onResume()
  {
    if ((zzAx != null) && (zzAx.zzAX == 4))
    {
      if (!zzAE) {
        break label73;
      }
      zzAH = 3;
      mActivity.finish();
    }
    while ((zzoL != null) && (!zzoL.isDestroyed()))
    {
      zzp.zzbz().zzb(zzoL.getWebView());
      return;
      label73:
      zzAE = true;
    }
    zzb.zzaE("The webview does not exit. Ignoring action.");
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", zzAE);
  }
  
  public void onStart() {}
  
  public void onStop()
  {
    zzeB();
  }
  
  public void setRequestedOrientation(int paramInt)
  {
    mActivity.setRequestedOrientation(paramInt);
  }
  
  public void zza(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    zzAv.zza(zzAw, new String[] { "vpr" });
    zzcc localZzcc = zzAv.zzdl();
    if (zzAy == null)
    {
      zzAy = new zzk(mActivity, zzoL, paramInt5, zzAv, localZzcc);
      zzzA.addView(zzAy, 0, new ViewGroup.LayoutParams(-1, -1));
      zzAy.zze(paramInt1, paramInt2, paramInt3, paramInt4);
      zzoL.zzgS().zzF(false);
    }
  }
  
  public void zza(View paramView, WebChromeClient.CustomViewCallback paramCustomViewCallback)
  {
    zzAC = new FrameLayout(mActivity);
    zzAC.setBackgroundColor(-16777216);
    zzAC.addView(paramView, -1, -1);
    mActivity.setContentView(zzAC);
    zzaE();
    zzAD = paramCustomViewCallback;
    zzAB = true;
  }
  
  public void zza(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (zzAA != null) {
      zzAA.zza(paramBoolean1, paramBoolean2);
    }
  }
  
  public void zzaE()
  {
    zzAI = true;
  }
  
  public void zzd(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (zzAy != null) {
      zzAy.zze(paramInt1, paramInt2, paramInt3, paramInt4);
    }
  }
  
  public void zzeA()
  {
    zzzA.removeView(zzAA);
    zzu(true);
  }
  
  protected void zzeB()
  {
    if ((!mActivity.isFinishing()) || (zzAJ)) {}
    do
    {
      return;
      zzAJ = true;
      if (zzp.zzbA().zzgc() != null) {
        zzp.zzbA().zzgc().zza(zzAv);
      }
      if (zzoL != null)
      {
        zzv(zzAH);
        zzzA.removeView(zzoL.getWebView());
        if (zzAz != null)
        {
          zzoL.setContext(zzAz.context);
          zzoL.zzC(false);
          zzAz.zzAN.addView(zzoL.getWebView(), zzAz.index, zzAz.zzAM);
          zzAz = null;
        }
        zzoL = null;
      }
    } while ((zzAx == null) || (zzAx.zzAQ == null));
    zzAx.zzAQ.zzaV();
  }
  
  public void zzeC()
  {
    if (zzAG)
    {
      zzAG = false;
      zzeD();
    }
  }
  
  protected void zzeD()
  {
    zzoL.zzeD();
  }
  
  public zzk zzew()
  {
    return zzAy;
  }
  
  public void zzex()
  {
    if ((zzAx != null) && (zzAB)) {
      setRequestedOrientation(zzAx.orientation);
    }
    if (zzAC != null)
    {
      mActivity.setContentView(zzzA);
      zzaE();
      zzAC.removeAllViews();
      zzAC = null;
    }
    if (zzAD != null)
    {
      zzAD.onCustomViewHidden();
      zzAD = null;
    }
    zzAB = false;
  }
  
  public void zzey()
  {
    zzAH = 1;
    mActivity.finish();
  }
  
  public boolean zzez()
  {
    zzAH = 0;
    boolean bool1;
    if (zzoL == null) {
      bool1 = true;
    }
    boolean bool2;
    do
    {
      return bool1;
      bool2 = zzoL.zzgY();
      bool1 = bool2;
    } while (bool2);
    zzoL.zzc("onbackblocked", Collections.emptyMap());
    return bool2;
  }
  
  public void zzu(boolean paramBoolean)
  {
    RelativeLayout.LayoutParams localLayoutParams;
    if (paramBoolean)
    {
      i = 50;
      zzAA = new zzm(mActivity, i, this);
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(10);
      if (!paramBoolean) {
        break label88;
      }
    }
    label88:
    for (int i = 11;; i = 9)
    {
      localLayoutParams.addRule(i);
      zzAA.zza(paramBoolean, zzAx.zzAU);
      zzzA.addView(zzAA, localLayoutParams);
      return;
      i = 32;
      break;
    }
  }
  
  protected void zzv(int paramInt)
  {
    zzoL.zzv(paramInt);
  }
  
  protected void zzv(boolean paramBoolean)
    throws zzd.zza
  {
    if (!zzAI) {
      mActivity.requestWindowFeature(1);
    }
    Object localObject = mActivity.getWindow();
    if (localObject == null) {
      throw new zza("Invalid activity, no window available.");
    }
    if ((!zzAF) || ((zzAx.zzBa != null) && (zzAx.zzBa.zzpl))) {
      ((Window)localObject).setFlags(1024, 1024);
    }
    boolean bool2 = zzAx.zzAR.zzgS().zzbY();
    zzAG = false;
    boolean bool1;
    if (bool2)
    {
      if (zzAx.orientation != zzp.zzbz().zzgv()) {
        break label527;
      }
      if (mActivity.getResources().getConfiguration().orientation == 1)
      {
        bool1 = true;
        zzAG = bool1;
      }
    }
    else
    {
      label147:
      zzb.zzaC("Delay onShow to next orientation change: " + zzAG);
      setRequestedOrientation(zzAx.orientation);
      if (zzp.zzbz().zza((Window)localObject)) {
        zzb.zzaC("Hardware acceleration on the AdActivity window enabled.");
      }
      if (zzAF) {
        break label575;
      }
      zzzA.setBackgroundColor(-16777216);
      label218:
      mActivity.setContentView(zzzA);
      zzaE();
      if (!paramBoolean) {
        break label642;
      }
      zzoL = zzp.zzby().zza(mActivity, zzAx.zzAR.zzaN(), true, bool2, null, zzAx.zzqb);
      zzoL.zzgS().zzb(null, null, zzAx.zzAS, zzAx.zzAW, true, zzAx.zzAY, null, zzAx.zzAR.zzgS().zzhb(), null);
      zzoL.zzgS().zza(new zziq.zza()
      {
        public void zza(zzip paramAnonymousZzip, boolean paramAnonymousBoolean)
        {
          paramAnonymousZzip.zzeD();
        }
      });
      if (zzAx.url == null) {
        break label588;
      }
      zzoL.loadUrl(zzAx.url);
      label372:
      if (zzAx.zzAR != null) {
        zzAx.zzAR.zzb(this);
      }
    }
    for (;;)
    {
      zzoL.zza(this);
      localObject = zzoL.getParent();
      if ((localObject != null) && ((localObject instanceof ViewGroup))) {
        ((ViewGroup)localObject).removeView(zzoL.getWebView());
      }
      if (zzAF) {
        zzoL.setBackgroundColor(zzAu);
      }
      zzzA.addView(zzoL.getWebView(), -1, -1);
      if ((!paramBoolean) && (!zzAG)) {
        zzeD();
      }
      zzu(bool2);
      if (zzoL.zzgT()) {
        zza(bool2, true);
      }
      return;
      bool1 = false;
      break;
      label527:
      if (zzAx.orientation != zzp.zzbz().zzgw()) {
        break label147;
      }
      if (mActivity.getResources().getConfiguration().orientation == 2) {}
      for (bool1 = true;; bool1 = false)
      {
        zzAG = bool1;
        break;
      }
      label575:
      zzzA.setBackgroundColor(zzAu);
      break label218;
      label588:
      if (zzAx.zzAV != null)
      {
        zzoL.loadDataWithBaseURL(zzAx.zzAT, zzAx.zzAV, "text/html", "UTF-8", null);
        break label372;
      }
      throw new zza("No URL or HTML to display in ad overlay.");
      label642:
      zzoL = zzAx.zzAR;
      zzoL.setContext(mActivity);
    }
  }
  
  @zzgk
  private static final class zza
    extends Exception
  {
    public zza(String paramString)
    {
      super();
    }
  }
  
  @zzgk
  static final class zzb
    extends RelativeLayout
  {
    zzhw zzqF;
    
    public zzb(Context paramContext, String paramString)
    {
      super();
      zzqF = new zzhw(paramContext, paramString);
    }
    
    public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
    {
      zzqF.zze(paramMotionEvent);
      return false;
    }
  }
  
  @zzgk
  public static class zzc
  {
    public final Context context;
    public final int index;
    public final ViewGroup.LayoutParams zzAM;
    public final ViewGroup zzAN;
    
    public zzc(zzip paramZzip)
      throws zzd.zza
    {
      zzAM = paramZzip.getLayoutParams();
      ViewParent localViewParent = paramZzip.getParent();
      context = paramZzip.zzgO();
      if ((localViewParent != null) && ((localViewParent instanceof ViewGroup)))
      {
        zzAN = ((ViewGroup)localViewParent);
        index = zzAN.indexOfChild(paramZzip.getWebView());
        zzAN.removeView(paramZzip.getWebView());
        paramZzip.zzC(true);
        return;
      }
      throw new zzd.zza("Could not get the parent of the WebView for an overlay.");
    }
  }
}
