package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.formats.zza;
import com.google.android.gms.ads.internal.formats.zzc;
import com.google.android.gms.ads.internal.formats.zzf;
import com.google.android.gms.ads.internal.formats.zzh;
import com.google.android.gms.ads.internal.formats.zzh.zza;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzn;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zze;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzgf
  implements Callable<zzhj>
{
  private static final long zzCS = TimeUnit.SECONDS.toMillis(60L);
  private final Context mContext;
  private final zzhj.zza zzCF;
  private int zzCI;
  private final zzhy zzCT;
  private final zzn zzCU;
  private final zzbc zzCV;
  private boolean zzCW;
  private List<String> zzCX;
  private final Object zzpc = new Object();
  private final zzan zzwh;
  
  public zzgf(Context paramContext, zzn paramZzn, zzbc paramZzbc, zzhy paramZzhy, zzan paramZzan, zzhj.zza paramZza)
  {
    mContext = paramContext;
    zzCU = paramZzn;
    zzCT = paramZzhy;
    zzCV = paramZzbc;
    zzCF = paramZza;
    zzwh = paramZzan;
    zzCW = false;
    zzCI = -2;
    zzCX = null;
  }
  
  private zzh.zza zza(zzbb paramZzbb, zza paramZza, JSONObject paramJSONObject)
    throws ExecutionException, InterruptedException, JSONException
  {
    if (zzft()) {
      return null;
    }
    Object localObject = zzc(paramJSONObject.getJSONObject("tracking_urls_and_actions"), "impression_tracking_urls");
    if (localObject == null) {}
    for (localObject = null;; localObject = Arrays.asList((Object[])localObject))
    {
      zzCX = ((List)localObject);
      paramZza = paramZza.zza(this, paramJSONObject);
      if (paramZza != null) {
        break;
      }
      zzb.e("Failed to retrieve ad assets.");
      return null;
    }
    paramZza.zza(new zzh(mContext, zzCU, paramZzbb, zzwh, paramJSONObject, paramZza, zzCF.zzGL.zzqb));
    return paramZza;
  }
  
  private zzhj zza(zzh.zza paramZza)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        int j = zzCI;
        int i = j;
        if (paramZza == null)
        {
          i = j;
          if (zzCI == -2) {
            i = 0;
          }
        }
        if (i != -2)
        {
          paramZza = null;
          return new zzhj(zzCF.zzGL.zzDy, null, zzCF.zzGM.zzyw, i, zzCF.zzGM.zzyx, zzCX, zzCF.zzGM.orientation, zzCF.zzGM.zzyA, zzCF.zzGL.zzDB, false, null, null, null, null, null, 0L, zzCF.zzqf, zzCF.zzGM.zzDW, zzCF.zzGI, zzCF.zzGJ, zzCF.zzGM.zzEc, zzCF.zzGF, paramZza, zzCF.zzGL.zzDO);
        }
      }
    }
  }
  
  private zzih<zzc> zza(final JSONObject paramJSONObject, final boolean paramBoolean1, boolean paramBoolean2)
    throws JSONException
  {
    if (paramBoolean1) {}
    for (paramJSONObject = paramJSONObject.getString("url"); TextUtils.isEmpty(paramJSONObject); paramJSONObject = paramJSONObject.optString("url"))
    {
      zza(0, paramBoolean1);
      return new zzif(null);
    }
    if (paramBoolean2) {
      return new zzif(new zzc(null, Uri.parse(paramJSONObject)));
    }
    zzCT.zza(paramJSONObject, new zzhy.zza()
    {
      public zzc zzfu()
      {
        zza(2, paramBoolean1);
        return null;
      }
      
      public zzc zzg(InputStream paramAnonymousInputStream)
      {
        try
        {
          paramAnonymousInputStream = zzlr.zzk(paramAnonymousInputStream);
          if (paramAnonymousInputStream == null)
          {
            zza(2, paramBoolean1);
            return null;
          }
        }
        catch (IOException paramAnonymousInputStream)
        {
          for (;;)
          {
            paramAnonymousInputStream = null;
          }
          paramAnonymousInputStream = BitmapFactory.decodeByteArray(paramAnonymousInputStream, 0, paramAnonymousInputStream.length);
          if (paramAnonymousInputStream == null)
          {
            zza(2, paramBoolean1);
            return null;
          }
        }
        return new zzc(new BitmapDrawable(Resources.getSystem(), paramAnonymousInputStream), Uri.parse(paramJSONObject));
      }
    });
  }
  
  private void zza(zzh.zza paramZza, zzbb paramZzbb)
  {
    if (!(paramZza instanceof zzf)) {
      return;
    }
    Object localObject = (zzf)paramZza;
    paramZza = new zzb();
    localObject = new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
      {
        paramAnonymousZzip = (String)paramAnonymousMap.get("asset");
        zzgf.zza(zzgf.this, zzDe, paramAnonymousZzip);
      }
    };
    zzDk = ((zzdg)localObject);
    paramZzbb.zza("/nativeAdCustomClick", (zzdg)localObject);
  }
  
  private Integer zzb(JSONObject paramJSONObject, String paramString)
  {
    try
    {
      paramJSONObject = paramJSONObject.getJSONObject(paramString);
      int i = Color.rgb(paramJSONObject.getInt("r"), paramJSONObject.getInt("g"), paramJSONObject.getInt("b"));
      return Integer.valueOf(i);
    }
    catch (JSONException paramJSONObject) {}
    return null;
  }
  
  private JSONObject zzb(final zzbb paramZzbb)
    throws TimeoutException, JSONException
  {
    if (zzft()) {
      return null;
    }
    final zzie localZzie = new zzie();
    final zzb localZzb = new zzb();
    zzdg local1 = new zzdg()
    {
      public void zza(zzip paramAnonymousZzip, Map<String, String> paramAnonymousMap)
      {
        paramZzbb.zzb("/nativeAdPreProcess", localZzbzzDk);
        try
        {
          paramAnonymousZzip = (String)paramAnonymousMap.get("success");
          if (!TextUtils.isEmpty(paramAnonymousZzip))
          {
            localZzie.zzf(new JSONObject(paramAnonymousZzip).getJSONArray("ads").getJSONObject(0));
            return;
          }
        }
        catch (JSONException paramAnonymousZzip)
        {
          zzb.zzb("Malformed native JSON response.", paramAnonymousZzip);
          zzB(0);
          zzx.zza(zzft(), "Unable to set the ad state error!");
          localZzie.zzf(null);
        }
      }
    };
    zzDk = local1;
    paramZzbb.zza("/nativeAdPreProcess", local1);
    paramZzbb.zza("google.afma.nativeAds.preProcessJsonGmsg", new JSONObject(zzCF.zzGM.body));
    return (JSONObject)localZzie.get(zzCS, TimeUnit.MILLISECONDS);
  }
  
  private void zzb(zzcr paramZzcr, String paramString)
  {
    try
    {
      zzcv localZzcv = zzCU.zzr(paramZzcr.getCustomTemplateId());
      if (localZzcv != null) {
        localZzcv.zza(paramZzcr, paramString);
      }
      return;
    }
    catch (RemoteException paramZzcr)
    {
      zzb.zzd("Failed to call onCustomClick for asset " + paramString + ".", paramZzcr);
    }
  }
  
  private String[] zzc(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    paramJSONObject = paramJSONObject.optJSONArray(paramString);
    if (paramJSONObject == null) {
      return null;
    }
    paramString = new String[paramJSONObject.length()];
    int i = 0;
    while (i < paramJSONObject.length())
    {
      paramString[i] = paramJSONObject.getString(i);
      i += 1;
    }
    return paramString;
  }
  
  private zzbb zzfs()
    throws CancellationException, ExecutionException, InterruptedException, TimeoutException
  {
    if (zzft()) {
      return null;
    }
    String str = (String)zzby.zzuU.get();
    if (zzCF.zzGM.zzAT.indexOf("https") == 0) {}
    for (Object localObject = "https:";; localObject = "http:")
    {
      localObject = (String)localObject + str;
      localObject = (zzbb)zzCV.zza(mContext, zzCF.zzGL.zzqb, (String)localObject, zzwh).get(zzCS, TimeUnit.MILLISECONDS);
      ((zzbb)localObject).zza(zzCU, zzCU, zzCU, zzCU, false, null, null, null, null);
      return localObject;
    }
  }
  
  public void zzB(int paramInt)
  {
    synchronized (zzpc)
    {
      zzCW = true;
      zzCI = paramInt;
      return;
    }
  }
  
  public zzih<zzc> zza(JSONObject paramJSONObject, String paramString, boolean paramBoolean1, boolean paramBoolean2)
    throws JSONException
  {
    if (paramBoolean1) {}
    for (paramJSONObject = paramJSONObject.getJSONObject(paramString);; paramJSONObject = paramJSONObject.optJSONObject(paramString))
    {
      paramString = paramJSONObject;
      if (paramJSONObject == null) {
        paramString = new JSONObject();
      }
      return zza(paramString, paramBoolean1, paramBoolean2);
    }
  }
  
  public List<zzih<zzc>> zza(JSONObject paramJSONObject, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    throws JSONException
  {
    if (paramBoolean1) {}
    ArrayList localArrayList;
    for (paramJSONObject = paramJSONObject.getJSONArray(paramString);; paramJSONObject = paramJSONObject.optJSONArray(paramString))
    {
      localArrayList = new ArrayList();
      if ((paramJSONObject != null) && (paramJSONObject.length() != 0)) {
        break;
      }
      zza(0, paramBoolean1);
      return localArrayList;
    }
    if (paramBoolean3) {}
    for (int i = paramJSONObject.length();; i = 1)
    {
      int j = 0;
      while (j < i)
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject(j);
        paramString = localJSONObject;
        if (localJSONObject == null) {
          paramString = new JSONObject();
        }
        localArrayList.add(zza(paramString, paramBoolean1, paramBoolean2));
        j += 1;
      }
    }
    return localArrayList;
  }
  
  public Future<zzc> zza(JSONObject paramJSONObject, String paramString, boolean paramBoolean)
    throws JSONException
  {
    paramString = paramJSONObject.getJSONObject(paramString);
    boolean bool = paramString.optBoolean("require", true);
    paramJSONObject = paramString;
    if (paramString == null) {
      paramJSONObject = new JSONObject();
    }
    return zza(paramJSONObject, bool, paramBoolean);
  }
  
  public void zza(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {
      zzB(paramInt);
    }
  }
  
  protected zza zzd(JSONObject paramJSONObject)
    throws JSONException, TimeoutException
  {
    if (zzft()) {
      return null;
    }
    final String str = paramJSONObject.getString("template_id");
    boolean bool1;
    if (zzCF.zzGL.zzqt != null)
    {
      bool1 = zzCF.zzGL.zzqt.zzwn;
      if (zzCF.zzGL.zzqt == null) {
        break label98;
      }
    }
    label98:
    for (boolean bool2 = zzCF.zzGL.zzqt.zzwp;; bool2 = false)
    {
      if (!"2".equals(str)) {
        break label103;
      }
      return new zzgg(bool1, bool2);
      bool1 = false;
      break;
    }
    label103:
    if ("1".equals(str)) {
      return new zzgh(bool1, bool2);
    }
    if ("3".equals(str))
    {
      str = paramJSONObject.getString("custom_template_id");
      final zzie localZzie = new zzie();
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          localZzie.zzf(zzgf.zza(zzgf.this).zzbq().get(str));
        }
      });
      if (localZzie.get(zzCS, TimeUnit.MILLISECONDS) != null) {
        return new zzgi(bool1);
      }
      zzb.e("No handler for custom template: " + paramJSONObject.getString("custom_template_id"));
    }
    for (;;)
    {
      return null;
      zzB(0);
    }
  }
  
  public zzih<zza> zze(JSONObject paramJSONObject)
    throws JSONException
  {
    paramJSONObject = paramJSONObject.optJSONObject("attribution");
    if (paramJSONObject == null) {
      return new zzif(null);
    }
    final String str = paramJSONObject.optString("text");
    final int i = paramJSONObject.optInt("text_size", -1);
    final Integer localInteger1 = zzb(paramJSONObject, "text_color");
    final Integer localInteger2 = zzb(paramJSONObject, "bg_color");
    zzig.zza(zza(paramJSONObject, "image", false, false), new zzig.zza()
    {
      public zza zza(zzc paramAnonymousZzc)
      {
        if (paramAnonymousZzc != null) {
          for (;;)
          {
            try
            {
              if (TextUtils.isEmpty(str)) {
                break;
              }
              String str = str;
              Drawable localDrawable = (Drawable)zze.zzp(paramAnonymousZzc.zzdr());
              Integer localInteger1 = localInteger2;
              Integer localInteger2 = localInteger1;
              if (i > 0)
              {
                paramAnonymousZzc = Integer.valueOf(i);
                paramAnonymousZzc = new zza(str, localDrawable, localInteger1, localInteger2, paramAnonymousZzc);
              }
            }
            catch (RemoteException paramAnonymousZzc)
            {
              zzb.zzb("Could not get attribution icon", paramAnonymousZzc);
              return null;
            }
            paramAnonymousZzc = null;
          }
        }
        paramAnonymousZzc = null;
        return paramAnonymousZzc;
      }
    });
  }
  
  public zzhj zzfr()
  {
    try
    {
      Object localObject1 = zzfs();
      Object localObject2 = zzb((zzbb)localObject1);
      localObject2 = zza((zzbb)localObject1, zzd((JSONObject)localObject2), (JSONObject)localObject2);
      zza((zzh.zza)localObject2, (zzbb)localObject1);
      localObject1 = zza((zzh.zza)localObject2);
      return localObject1;
    }
    catch (JSONException localJSONException)
    {
      zzb.zzd("Malformed native JSON response.", localJSONException);
      if (!zzCW) {
        zzB(0);
      }
      return zza(null);
    }
    catch (TimeoutException localTimeoutException)
    {
      for (;;)
      {
        zzb.zzd("Timeout when loading native ad.", localTimeoutException);
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;) {}
    }
    catch (ExecutionException localExecutionException)
    {
      for (;;) {}
    }
    catch (CancellationException localCancellationException)
    {
      for (;;) {}
    }
  }
  
  public boolean zzft()
  {
    synchronized (zzpc)
    {
      boolean bool = zzCW;
      return bool;
    }
  }
  
  public static abstract interface zza<T extends zzh.zza>
  {
    public abstract T zza(zzgf paramZzgf, JSONObject paramJSONObject)
      throws JSONException, InterruptedException, ExecutionException;
  }
  
  class zzb
  {
    public zzdg zzDk;
    
    zzb() {}
  }
}
