package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import java.util.Map;
import org.json.JSONObject;

@zzgk
public abstract interface zzip
  extends zzaw
{
  public abstract void destroy();
  
  public abstract Context getContext();
  
  public abstract ViewGroup.LayoutParams getLayoutParams();
  
  public abstract void getLocationOnScreen(int[] paramArrayOfInt);
  
  public abstract int getMeasuredHeight();
  
  public abstract int getMeasuredWidth();
  
  public abstract ViewParent getParent();
  
  public abstract String getRequestId();
  
  public abstract int getRequestedOrientation();
  
  public abstract WebView getWebView();
  
  public abstract boolean isDestroyed();
  
  public abstract void loadData(String paramString1, String paramString2, String paramString3);
  
  public abstract void loadDataWithBaseURL(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5);
  
  public abstract void loadUrl(String paramString);
  
  public abstract void measure(int paramInt1, int paramInt2);
  
  public abstract void setBackgroundColor(int paramInt);
  
  public abstract void setContext(Context paramContext);
  
  public abstract void setOnClickListener(View.OnClickListener paramOnClickListener);
  
  public abstract void setOnTouchListener(View.OnTouchListener paramOnTouchListener);
  
  public abstract void setRequestedOrientation(int paramInt);
  
  public abstract void setWebViewClient(WebViewClient paramWebViewClient);
  
  public abstract void setWillNotDraw(boolean paramBoolean);
  
  public abstract void stopLoading();
  
  public abstract boolean willNotDraw();
  
  public abstract void zzC(boolean paramBoolean);
  
  public abstract void zzD(boolean paramBoolean);
  
  public abstract void zzE(boolean paramBoolean);
  
  public abstract void zza(Context paramContext, AdSizeParcel paramAdSizeParcel);
  
  public abstract void zza(AdSizeParcel paramAdSizeParcel);
  
  public abstract void zza(com.google.android.gms.ads.internal.overlay.zzd paramZzd);
  
  public abstract void zza(String paramString1, String paramString2);
  
  public abstract void zza(String paramString, JSONObject paramJSONObject);
  
  public abstract void zzaF(String paramString);
  
  public abstract void zzaG(String paramString);
  
  public abstract void zzaH(String paramString);
  
  public abstract AdSizeParcel zzaN();
  
  public abstract void zzb(com.google.android.gms.ads.internal.overlay.zzd paramZzd);
  
  public abstract void zzb(String paramString, JSONObject paramJSONObject);
  
  public abstract void zzc(String paramString, Map<String, ?> paramMap);
  
  public abstract void zzeD();
  
  public abstract void zzgM();
  
  public abstract Activity zzgN();
  
  public abstract Context zzgO();
  
  public abstract com.google.android.gms.ads.internal.zzd zzgP();
  
  public abstract com.google.android.gms.ads.internal.overlay.zzd zzgQ();
  
  public abstract com.google.android.gms.ads.internal.overlay.zzd zzgR();
  
  public abstract zziq zzgS();
  
  public abstract boolean zzgT();
  
  public abstract zzan zzgU();
  
  public abstract VersionInfoParcel zzgV();
  
  public abstract boolean zzgW();
  
  public abstract void zzgX();
  
  public abstract boolean zzgY();
  
  public abstract void zzgZ();
  
  public abstract String zzha();
  
  public abstract void zzv(int paramInt);
}
