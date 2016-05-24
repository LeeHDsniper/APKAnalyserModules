package com.google.android.gms.internal;

import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.PowerManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.view.WindowManager;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzaz
  implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener
{
  private boolean zzpB = false;
  private final Object zzpc = new Object();
  private zzib zzqE;
  private final Context zzqO;
  private final WeakReference<zzhj> zzqQ;
  private WeakReference<ViewTreeObserver> zzqR;
  private final WeakReference<View> zzqS;
  private final zzax zzqT;
  private final zzdv zzqU;
  private final zzdv.zzd zzqV;
  private boolean zzqW;
  private final WindowManager zzqX;
  private final PowerManager zzqY;
  private final KeyguardManager zzqZ;
  private zzba zzra;
  private boolean zzrb;
  private boolean zzrc = false;
  private boolean zzrd;
  private boolean zzre;
  private BroadcastReceiver zzrf;
  private final HashSet<zzaw> zzrg = new HashSet();
  private final zzdg zzrh = new zzdg()
  {
    public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
    {
      if (!zzb(paramAnonymousMap)) {
        return;
      }
      zza(paramAnonymousZzip.getWebView(), paramAnonymousMap);
    }
  };
  private final zzdg zzri = new zzdg()
  {
    public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
    {
      if (!zzb(paramAnonymousMap)) {
        return;
      }
      zzb.zzaC("Received request to untrack: " + zzaz.zzb(zzaz.this).zzbX());
      destroy();
    }
  };
  private final zzdg zzrj = new zzdg()
  {
    public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
    {
      if (!zzb(paramAnonymousMap)) {}
      while (!paramAnonymousMap.containsKey("isVisible")) {
        return;
      }
      if (("1".equals(paramAnonymousMap.get("isVisible"))) || ("true".equals(paramAnonymousMap.get("isVisible")))) {}
      for (boolean bool = true;; bool = false)
      {
        zzg(Boolean.valueOf(bool).booleanValue());
        return;
      }
    }
  };
  
  public zzaz(final AdSizeParcel paramAdSizeParcel, zzhj paramZzhj, VersionInfoParcel paramVersionInfoParcel, View paramView, zzdv paramZzdv)
  {
    zzqU = paramZzdv;
    zzqQ = new WeakReference(paramZzhj);
    zzqS = new WeakReference(paramView);
    zzqR = new WeakReference(null);
    zzrd = true;
    zzqE = new zzib(200L);
    zzqT = new zzax(UUID.randomUUID().toString(), paramVersionInfoParcel, zzsG, zzGF, paramZzhj.zzbY());
    zzqV = zzqU.zzdL();
    zzqX = ((WindowManager)paramView.getContext().getSystemService("window"));
    zzqY = ((PowerManager)paramView.getContext().getApplicationContext().getSystemService("power"));
    zzqZ = ((KeyguardManager)paramView.getContext().getSystemService("keyguard"));
    zzqO = paramView.getContext().getApplicationContext();
    try
    {
      paramAdSizeParcel = zzd(paramView);
      zzqV.zza(new zzij.zzc()new zzij.zza
      {
        public void zzb(zzbe paramAnonymousZzbe)
        {
          zza(paramAdSizeParcel);
        }
      }, new zzij.zza()
      {
        public void run() {}
      });
      zzqV.zza(new zzij.zzc()new zzij.zza
      {
        public void zzb(zzbe paramAnonymousZzbe)
        {
          zzaz.zzb(zzaz.this, true);
          zza(paramAnonymousZzbe);
          zzbZ();
          zzh(false);
        }
      }, new zzij.zza()
      {
        public void run()
        {
          destroy();
        }
      });
      zzb.zzaC("Tracking ad unit: " + zzqT.zzbX());
      return;
    }
    catch (RuntimeException paramAdSizeParcel)
    {
      for (;;)
      {
        zzb.zzb("Failure while processing active view data.", paramAdSizeParcel);
      }
    }
    catch (JSONException paramAdSizeParcel)
    {
      for (;;) {}
    }
  }
  
  protected void destroy()
  {
    synchronized (zzpc)
    {
      zzcf();
      zzca();
      zzrd = false;
      zzcc();
      zzqV.release();
      return;
    }
  }
  
  boolean isScreenOn()
  {
    return zzqY.isScreenOn();
  }
  
  public void onGlobalLayout()
  {
    zzh(false);
  }
  
  public void onScrollChanged()
  {
    zzh(true);
  }
  
  public void pause()
  {
    synchronized (zzpc)
    {
      zzpB = true;
      zzh(false);
      return;
    }
  }
  
  public void resume()
  {
    synchronized (zzpc)
    {
      zzpB = false;
      zzh(false);
      return;
    }
  }
  
  public void stop()
  {
    synchronized (zzpc)
    {
      zzrc = true;
      zzh(false);
      return;
    }
  }
  
  protected int zza(int paramInt, DisplayMetrics paramDisplayMetrics)
  {
    float f = density;
    return (int)(paramInt / f);
  }
  
  protected void zza(View paramView, Map<String, String> paramMap)
  {
    zzh(false);
  }
  
  public void zza(zzaw paramZzaw)
  {
    zzrg.add(paramZzaw);
  }
  
  public void zza(zzba paramZzba)
  {
    synchronized (zzpc)
    {
      zzra = paramZzba;
      return;
    }
  }
  
  protected void zza(zzbe paramZzbe)
  {
    paramZzbe.zza("/updateActiveView", zzrh);
    paramZzbe.zza("/untrackActiveViewUnit", zzri);
    paramZzbe.zza("/visibilityChanged", zzrj);
  }
  
  protected void zza(JSONObject paramJSONObject)
  {
    try
    {
      JSONArray localJSONArray = new JSONArray();
      final JSONObject localJSONObject = new JSONObject();
      localJSONArray.put(paramJSONObject);
      localJSONObject.put("units", localJSONArray);
      zzqV.zza(new zzij.zzc()new zzij.zzb
      {
        public void zzb(zzbe paramAnonymousZzbe)
        {
          paramAnonymousZzbe.zza("AFMA_updateActiveView", localJSONObject);
        }
      }, new zzij.zzb());
      return;
    }
    catch (Throwable paramJSONObject)
    {
      zzb.zzb("Skipping active view message.", paramJSONObject);
    }
  }
  
  protected boolean zzb(Map<String, String> paramMap)
  {
    if (paramMap == null) {
      return false;
    }
    paramMap = (String)paramMap.get("hashCode");
    if ((!TextUtils.isEmpty(paramMap)) && (paramMap.equals(zzqT.zzbX()))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  protected void zzbZ()
  {
    synchronized (zzpc)
    {
      if (zzrf != null) {
        return;
      }
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.intent.action.SCREEN_ON");
      localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
      zzrf = new BroadcastReceiver()
      {
        public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
        {
          zzh(false);
        }
      };
      zzqO.registerReceiver(zzrf, localIntentFilter);
      return;
    }
  }
  
  protected void zzca()
  {
    synchronized (zzpc)
    {
      if (zzrf != null)
      {
        zzqO.unregisterReceiver(zzrf);
        zzrf = null;
      }
      return;
    }
  }
  
  public void zzcb()
  {
    synchronized (zzpc)
    {
      if (zzrd) {
        zzre = true;
      }
    }
    try
    {
      zza(zzch());
      zzb.zzaC("Untracking ad unit: " + zzqT.zzbX());
      return;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        zzb.zzb("JSON failure while processing active view data.", localJSONException);
      }
      localObject2 = finally;
      throw localObject2;
    }
    catch (RuntimeException localRuntimeException)
    {
      for (;;)
      {
        zzb.zzb("Failure while processing active view data.", localRuntimeException);
      }
    }
  }
  
  protected void zzcc()
  {
    if (zzra != null) {
      zzra.zza(this);
    }
  }
  
  public boolean zzcd()
  {
    synchronized (zzpc)
    {
      boolean bool = zzrd;
      return bool;
    }
  }
  
  protected void zzce()
  {
    Object localObject = (View)zzqS.get();
    if (localObject == null) {}
    ViewTreeObserver localViewTreeObserver;
    do
    {
      return;
      localViewTreeObserver = (ViewTreeObserver)zzqR.get();
      localObject = ((View)localObject).getViewTreeObserver();
    } while (localObject == localViewTreeObserver);
    zzcf();
    if ((!zzrb) || ((localViewTreeObserver != null) && (localViewTreeObserver.isAlive())))
    {
      zzrb = true;
      ((ViewTreeObserver)localObject).addOnScrollChangedListener(this);
      ((ViewTreeObserver)localObject).addOnGlobalLayoutListener(this);
    }
    zzqR = new WeakReference(localObject);
  }
  
  protected void zzcf()
  {
    ViewTreeObserver localViewTreeObserver = (ViewTreeObserver)zzqR.get();
    if ((localViewTreeObserver == null) || (!localViewTreeObserver.isAlive())) {
      return;
    }
    localViewTreeObserver.removeOnScrollChangedListener(this);
    localViewTreeObserver.removeGlobalOnLayoutListener(this);
  }
  
  protected JSONObject zzcg()
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("afmaVersion", zzqT.zzbV()).put("activeViewJSON", zzqT.zzbW()).put("timestamp", zzp.zzbB().elapsedRealtime()).put("adFormat", zzqT.zzbU()).put("hashCode", zzqT.zzbX()).put("isMraid", zzqT.zzbY());
    return localJSONObject;
  }
  
  protected JSONObject zzch()
    throws JSONException
  {
    JSONObject localJSONObject = zzcg();
    localJSONObject.put("doneReasonCode", "u");
    return localJSONObject;
  }
  
  protected JSONObject zzd(View paramView)
    throws JSONException
  {
    boolean bool1 = zzp.zzbz().isAttachedToWindow(paramView);
    Object localObject2 = new int[2];
    Object localObject1 = new int[2];
    try
    {
      paramView.getLocationOnScreen((int[])localObject2);
      paramView.getLocationInWindow((int[])localObject1);
      localObject1 = paramView.getContext().getResources().getDisplayMetrics();
      Rect localRect1 = new Rect();
      left = localObject2[0];
      top = localObject2[1];
      right = (left + paramView.getWidth());
      bottom = (top + paramView.getHeight());
      localObject2 = new Rect();
      right = zzqX.getDefaultDisplay().getWidth();
      bottom = zzqX.getDefaultDisplay().getHeight();
      Rect localRect2 = new Rect();
      boolean bool2 = paramView.getGlobalVisibleRect(localRect2, null);
      Rect localRect3 = new Rect();
      boolean bool3 = paramView.getLocalVisibleRect(localRect3);
      Rect localRect4 = new Rect();
      paramView.getHitRect(localRect4);
      JSONObject localJSONObject = zzcg();
      localJSONObject.put("windowVisibility", paramView.getWindowVisibility()).put("isStopped", zzrc).put("isPaused", zzpB).put("isAttachedToWindow", bool1).put("viewBox", new JSONObject().put("top", zza(top, (DisplayMetrics)localObject1)).put("bottom", zza(bottom, (DisplayMetrics)localObject1)).put("left", zza(left, (DisplayMetrics)localObject1)).put("right", zza(right, (DisplayMetrics)localObject1))).put("adBox", new JSONObject().put("top", zza(top, (DisplayMetrics)localObject1)).put("bottom", zza(bottom, (DisplayMetrics)localObject1)).put("left", zza(left, (DisplayMetrics)localObject1)).put("right", zza(right, (DisplayMetrics)localObject1))).put("globalVisibleBox", new JSONObject().put("top", zza(top, (DisplayMetrics)localObject1)).put("bottom", zza(bottom, (DisplayMetrics)localObject1)).put("left", zza(left, (DisplayMetrics)localObject1)).put("right", zza(right, (DisplayMetrics)localObject1))).put("globalVisibleBoxVisible", bool2).put("localVisibleBox", new JSONObject().put("top", zza(top, (DisplayMetrics)localObject1)).put("bottom", zza(bottom, (DisplayMetrics)localObject1)).put("left", zza(left, (DisplayMetrics)localObject1)).put("right", zza(right, (DisplayMetrics)localObject1))).put("localVisibleBoxVisible", bool3).put("hitBox", new JSONObject().put("top", zza(top, (DisplayMetrics)localObject1)).put("bottom", zza(bottom, (DisplayMetrics)localObject1)).put("left", zza(left, (DisplayMetrics)localObject1)).put("right", zza(right, (DisplayMetrics)localObject1))).put("screenDensity", density).put("isVisible", zze(paramView));
      return localJSONObject;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        zzb.zzb("Failure getting view location.", localException);
      }
    }
  }
  
  protected boolean zze(View paramView)
  {
    return (paramView.getVisibility() == 0) && (paramView.isShown()) && (isScreenOn()) && ((!zzqZ.inKeyguardRestrictedInputMode()) || (zzp.zzbx().zzgq()));
  }
  
  protected void zzg(boolean paramBoolean)
  {
    Iterator localIterator = zzrg.iterator();
    while (localIterator.hasNext()) {
      ((zzaw)localIterator.next()).zza(this, paramBoolean);
    }
  }
  
  protected void zzh(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      if ((!zzqW) || (!zzrd)) {
        return;
      }
      if ((paramBoolean) && (!zzqE.tryAcquire())) {
        return;
      }
    }
    zzhj localZzhj = (zzhj)zzqQ.get();
    View localView = (View)zzqS.get();
    if (localView != null) {
      if (localZzhj == null) {
        break label139;
      }
    }
    for (;;)
    {
      int i;
      if (i != 0)
      {
        zzcb();
        return;
        i = 0;
        continue;
      }
      try
      {
        zza(zzd(localView));
        for (;;)
        {
          zzce();
          zzcc();
          return;
          zzb.zza("Active view update failed.", localZzhj);
        }
      }
      catch (RuntimeException localRuntimeException)
      {
        for (;;) {}
        i = 1;
      }
      catch (JSONException localJSONException)
      {
        label139:
        for (;;) {}
      }
    }
  }
}
