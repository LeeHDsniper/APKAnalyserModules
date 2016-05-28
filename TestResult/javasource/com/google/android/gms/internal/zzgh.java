package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.ads.internal.formats.zza;
import com.google.android.gms.ads.internal.formats.zze;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzgh
  implements zzgf.zza<zze>
{
  private final boolean zzDl;
  private final boolean zzDm;
  
  public zzgh(boolean paramBoolean1, boolean paramBoolean2)
  {
    zzDl = paramBoolean1;
    zzDm = paramBoolean2;
  }
  
  public zze zzc(zzgf paramZzgf, JSONObject paramJSONObject)
    throws JSONException, InterruptedException, ExecutionException
  {
    Object localObject = paramZzgf.zza(paramJSONObject, "images", true, zzDl, zzDm);
    zzih localZzih = paramZzgf.zza(paramJSONObject, "secondary_image", false, zzDl);
    paramZzgf = paramZzgf.zze(paramJSONObject);
    ArrayList localArrayList = new ArrayList();
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      localArrayList.add(((zzih)((Iterator)localObject).next()).get());
    }
    return new zze(paramJSONObject.getString("headline"), localArrayList, paramJSONObject.getString("body"), (zzcj)localZzih.get(), paramJSONObject.getString("call_to_action"), paramJSONObject.getString("advertiser"), (zza)paramZzgf.get(), new Bundle());
  }
}
