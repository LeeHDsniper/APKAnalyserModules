package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.formats.zza;
import com.google.android.gms.ads.internal.formats.zzc;
import com.google.android.gms.ads.internal.formats.zzf;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzgi
  implements zzgf.zza<zzf>
{
  private final boolean zzDl;
  
  public zzgi(boolean paramBoolean)
  {
    zzDl = paramBoolean;
  }
  
  private void zza(zzgf paramZzgf, JSONObject paramJSONObject, zzlh<String, Future<zzc>> paramZzlh)
    throws JSONException
  {
    paramZzlh.put(paramJSONObject.getString("name"), paramZzgf.zza(paramJSONObject, "image_value", zzDl));
  }
  
  private void zza(JSONObject paramJSONObject, zzlh<String, String> paramZzlh)
    throws JSONException
  {
    paramZzlh.put(paramJSONObject.getString("name"), paramJSONObject.getString("string_value"));
  }
  
  private <K, V> zzlh<K, V> zzc(zzlh<K, Future<V>> paramZzlh)
    throws InterruptedException, ExecutionException
  {
    zzlh localZzlh = new zzlh();
    int i = 0;
    while (i < paramZzlh.size())
    {
      localZzlh.put(paramZzlh.keyAt(i), ((Future)paramZzlh.valueAt(i)).get());
      i += 1;
    }
    return localZzlh;
  }
  
  public zzf zzd(zzgf paramZzgf, JSONObject paramJSONObject)
    throws JSONException, InterruptedException, ExecutionException
  {
    zzlh localZzlh1 = new zzlh();
    zzlh localZzlh2 = new zzlh();
    zzih localZzih = paramZzgf.zze(paramJSONObject);
    JSONArray localJSONArray = paramJSONObject.getJSONArray("custom_assets");
    int i = 0;
    if (i < localJSONArray.length())
    {
      JSONObject localJSONObject = localJSONArray.getJSONObject(i);
      String str = localJSONObject.getString("type");
      if ("string".equals(str)) {
        zza(localJSONObject, localZzlh2);
      }
      for (;;)
      {
        i += 1;
        break;
        if ("image".equals(str)) {
          zza(paramZzgf, localJSONObject, localZzlh1);
        } else {
          zzb.zzaE("Unknown custom asset type: " + str);
        }
      }
    }
    return new zzf(paramJSONObject.getString("custom_template_id"), zzc(localZzlh1), localZzlh2, (zza)localZzih.get());
  }
}
