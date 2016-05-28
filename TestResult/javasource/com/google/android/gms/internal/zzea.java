package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public final class zzea
{
  public final long zzyA;
  public final String zzyB;
  public final int zzyC;
  public int zzyD;
  public int zzyE;
  public final List<zzdz> zzyu;
  public final long zzyv;
  public final List<String> zzyw;
  public final List<String> zzyx;
  public final List<String> zzyy;
  public final String zzyz;
  
  public zzea(String paramString)
    throws JSONException
  {
    paramString = new JSONObject(paramString);
    if (zzb.zzM(2)) {
      zzb.v("Mediation Response JSON: " + paramString.toString(2));
    }
    JSONArray localJSONArray = paramString.getJSONArray("ad_networks");
    ArrayList localArrayList = new ArrayList(localJSONArray.length());
    int j = -1;
    int i = 0;
    while (i < localJSONArray.length())
    {
      zzdz localZzdz = new zzdz(localJSONArray.getJSONObject(i));
      localArrayList.add(localZzdz);
      int k = j;
      if (j < 0)
      {
        k = j;
        if (zza(localZzdz)) {
          k = i;
        }
      }
      i += 1;
      j = k;
    }
    zzyD = j;
    zzyE = localJSONArray.length();
    zzyu = Collections.unmodifiableList(localArrayList);
    zzyz = paramString.getString("qdata");
    paramString = paramString.optJSONObject("settings");
    if (paramString != null)
    {
      zzyv = paramString.optLong("ad_network_timeout_millis", -1L);
      zzyw = zzp.zzbJ().zza(paramString, "click_urls");
      zzyx = zzp.zzbJ().zza(paramString, "imp_urls");
      zzyy = zzp.zzbJ().zza(paramString, "nofill_urls");
      long l = paramString.optLong("refresh", -1L);
      if (l > 0L) {}
      for (l *= 1000L;; l = -1L)
      {
        zzyA = l;
        paramString = paramString.optJSONArray("rewards");
        if ((paramString != null) && (paramString.length() != 0)) {
          break;
        }
        zzyB = null;
        zzyC = 0;
        return;
      }
      zzyB = paramString.getJSONObject(0).optString("rb_type");
      zzyC = paramString.getJSONObject(0).optInt("rb_amount");
      return;
    }
    zzyv = -1L;
    zzyw = null;
    zzyx = null;
    zzyy = null;
    zzyA = -1L;
    zzyB = null;
    zzyC = 0;
  }
  
  private boolean zza(zzdz paramZzdz)
  {
    paramZzdz = zzym.iterator();
    while (paramZzdz.hasNext()) {
      if (((String)paramZzdz.next()).equals("com.google.ads.mediation.admob.AdMobAdapter")) {
        return true;
      }
    }
    return false;
  }
}
