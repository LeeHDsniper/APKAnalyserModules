package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.FrameLayout.LayoutParams;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zzn;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzan;
import com.google.android.gms.internal.zzbb;
import com.google.android.gms.internal.zzdg;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import com.google.android.gms.internal.zziq.zza;
import com.google.android.gms.internal.zzir;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzh
{
  private final Context mContext;
  private zzip zzoL;
  private final VersionInfoParcel zzpa;
  private final Object zzpc = new Object();
  private final zzn zzwb;
  private final JSONObject zzwe;
  private final zzbb zzwf;
  private final zza zzwg;
  private final zzan zzwh;
  private boolean zzwi;
  private String zzwj;
  
  public zzh(Context paramContext, zzn paramZzn, zzbb paramZzbb, zzan paramZzan, JSONObject paramJSONObject, zza paramZza, VersionInfoParcel paramVersionInfoParcel)
  {
    mContext = paramContext;
    zzwb = paramZzn;
    zzwf = paramZzbb;
    zzwh = paramZzan;
    zzwe = paramJSONObject;
    zzwg = paramZza;
    zzpa = paramVersionInfoParcel;
  }
  
  public void performClick(String paramString)
  {
    zzx.zzch("performClick must be called on the main UI thread.");
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("asset", paramString);
      localJSONObject.put("template", zzwg.zzdu());
      paramString = new JSONObject();
      paramString.put("ad", zzwe);
      paramString.put("click", localJSONObject);
      if (zzwb.zzr(zzwg.getCustomTemplateId()) != null) {}
      for (boolean bool = true;; bool = false)
      {
        paramString.put("has_custom_click_handler", bool);
        zzwf.zza("google.afma.nativeAds.handleClickGmsg", paramString);
        return;
      }
      return;
    }
    catch (JSONException paramString)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzb("Unable to create click JSON.", paramString);
    }
  }
  
  public void recordImpression()
  {
    zzx.zzch("recordImpression must be called on the main UI thread.");
    zzl(true);
    zzwb.zzaP();
  }
  
  public zzb zza(View.OnClickListener paramOnClickListener)
  {
    Object localObject = zzwg.zzdv();
    if (localObject == null) {
      return null;
    }
    localObject = new zzb(mContext, (zza)localObject);
    ((zzb)localObject).setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
    ((zzb)localObject).zzdq().setOnClickListener(paramOnClickListener);
    ((zzb)localObject).zzdq().setContentDescription("Ad attribution icon");
    return localObject;
  }
  
  public void zzb(MotionEvent paramMotionEvent)
  {
    zzwh.zza(paramMotionEvent);
  }
  
  public void zzb(View paramView, Map<String, WeakReference<View>> paramMap)
  {
    zzx.zzch("performClick must be called on the main UI thread.");
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      if (paramView.equals((View)((WeakReference)localEntry.getValue()).get())) {
        performClick((String)localEntry.getKey());
      }
    }
  }
  
  public zzip zzdy()
  {
    zzoL = zzdz();
    zzoL.getWebView().setVisibility(8);
    zzwf.zza("/loadHtml", new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, final Map<String, String> paramAnonymousMap)
      {
        zzh.zze(zzh.this).zzgS().zza(new zziq.zza()
        {
          public void zza(zzip paramAnonymous2Zzip, boolean paramAnonymous2Boolean)
          {
            zzh.zza(zzh.this, (String)paramAnonymousMap.get("id"));
            paramAnonymous2Zzip = new JSONObject();
            try
            {
              paramAnonymous2Zzip.put("messageType", "htmlLoaded");
              paramAnonymous2Zzip.put("id", zzh.zzc(zzh.this));
              zzh.zzd(zzh.this).zzb("sendMessageToNativeJs", paramAnonymous2Zzip);
              return;
            }
            catch (JSONException paramAnonymous2Zzip)
            {
              com.google.android.gms.ads.internal.util.client.zzb.zzb("Unable to dispatch sendMessageToNativeJsevent", paramAnonymous2Zzip);
            }
          }
        });
        paramAnonymousZzip = (String)paramAnonymousMap.get("overlayHtml");
        zzh.zze(zzh.this).loadData(paramAnonymousZzip, "text/html", "UTF-8");
      }
    });
    zzwf.zza("/showOverlay", new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
      {
        zzh.zze(zzh.this).getWebView().setVisibility(0);
      }
    });
    zzwf.zza("/hideOverlay", new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
      {
        zzh.zze(zzh.this).getWebView().setVisibility(8);
      }
    });
    zzoL.zzgS().zza("/hideOverlay", new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
      {
        zzh.zze(zzh.this).getWebView().setVisibility(8);
      }
    });
    zzoL.zzgS().zza("/sendMessageToSdk", new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
      {
        paramAnonymousZzip = new JSONObject();
        try
        {
          Iterator localIterator = paramAnonymousMap.keySet().iterator();
          while (localIterator.hasNext())
          {
            String str = (String)localIterator.next();
            paramAnonymousZzip.put(str, paramAnonymousMap.get(str));
          }
          paramAnonymousZzip.put("id", zzh.zzc(zzh.this));
        }
        catch (JSONException paramAnonymousZzip)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzb("Unable to dispatch sendMessageToNativeJs event", paramAnonymousZzip);
          return;
        }
        zzh.zzd(zzh.this).zzb("sendMessageToNativeJs", paramAnonymousZzip);
      }
    });
    return zzoL;
  }
  
  zzip zzdz()
  {
    return zzp.zzby().zza(mContext, AdSizeParcel.zzs(mContext), false, false, zzwh, zzpa);
  }
  
  public void zzh(View paramView) {}
  
  public void zzi(View paramView)
  {
    synchronized (zzpc)
    {
      if (zzwi) {
        return;
      }
      if (!paramView.isShown()) {
        return;
      }
    }
    if (!paramView.getGlobalVisibleRect(new Rect(), null)) {
      return;
    }
    recordImpression();
  }
  
  protected void zzl(boolean paramBoolean)
  {
    zzwi = paramBoolean;
  }
  
  public static abstract interface zza
  {
    public abstract String getCustomTemplateId();
    
    public abstract void zza(zzh paramZzh);
    
    public abstract String zzdu();
    
    public abstract zza zzdv();
  }
}
