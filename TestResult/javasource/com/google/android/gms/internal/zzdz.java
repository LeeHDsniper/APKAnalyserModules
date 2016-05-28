package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.zzp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public final class zzdz
{
  public final String zzyk;
  public final String zzyl;
  public final List<String> zzym;
  public final String zzyn;
  public final String zzyo;
  public final List<String> zzyp;
  public final List<String> zzyq;
  public final String zzyr;
  public final List<String> zzys;
  public final List<String> zzyt;
  
  public zzdz(JSONObject paramJSONObject)
    throws JSONException
  {
    zzyl = paramJSONObject.getString("id");
    Object localObject1 = paramJSONObject.getJSONArray("adapters");
    ArrayList localArrayList = new ArrayList(((JSONArray)localObject1).length());
    int i = 0;
    while (i < ((JSONArray)localObject1).length())
    {
      localArrayList.add(((JSONArray)localObject1).getString(i));
      i += 1;
    }
    zzym = Collections.unmodifiableList(localArrayList);
    zzyn = paramJSONObject.optString("allocation_id", null);
    zzyp = zzp.zzbJ().zza(paramJSONObject, "clickurl");
    zzyq = zzp.zzbJ().zza(paramJSONObject, "imp_urls");
    zzys = zzp.zzbJ().zza(paramJSONObject, "video_start_urls");
    zzyt = zzp.zzbJ().zza(paramJSONObject, "video_complete_urls");
    localObject1 = paramJSONObject.optJSONObject("ad");
    if (localObject1 != null)
    {
      localObject1 = ((JSONObject)localObject1).toString();
      zzyk = ((String)localObject1);
      localObject1 = paramJSONObject.optJSONObject("data");
      if (localObject1 == null) {
        break label206;
      }
    }
    label206:
    for (paramJSONObject = ((JSONObject)localObject1).toString();; paramJSONObject = null)
    {
      zzyr = paramJSONObject;
      paramJSONObject = localObject2;
      if (localObject1 != null) {
        paramJSONObject = ((JSONObject)localObject1).optString("class_name");
      }
      zzyo = paramJSONObject;
      return;
      localObject1 = null;
      break;
    }
  }
}
