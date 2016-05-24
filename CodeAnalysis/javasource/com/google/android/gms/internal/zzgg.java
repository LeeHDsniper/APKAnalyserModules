package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.ads.internal.formats.zza;
import com.google.android.gms.ads.internal.formats.zzd;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzgg
  implements zzgf.zza<zzd>
{
  private final boolean zzDl;
  private final boolean zzDm;
  
  public zzgg(boolean paramBoolean1, boolean paramBoolean2)
  {
    zzDl = paramBoolean1;
    zzDm = paramBoolean2;
  }
  
  public zzd zzb(zzgf paramZzgf, JSONObject paramJSONObject)
    throws JSONException, InterruptedException, ExecutionException
  {
    Object localObject = paramZzgf.zza(paramJSONObject, "images", true, zzDl, zzDm);
    zzih localZzih = paramZzgf.zza(paramJSONObject, "app_icon", true, zzDl);
    paramZzgf = paramZzgf.zze(paramJSONObject);
    ArrayList localArrayList = new ArrayList();
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      localArrayList.add(((zzih)((Iterator)localObject).next()).get());
    }
    return new zzd(paramJSONObject.getString("headline"), localArrayList, paramJSONObject.getString("body"), (zzcj)localZzih.get(), paramJSONObject.getString("call_to_action"), paramJSONObject.optDouble("rating", -1.0D), paramJSONObject.optString("store"), paramJSONObject.optString("price"), (zza)paramZzgf.get(), new Bundle());
  }
}
