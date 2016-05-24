package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzbg;
import com.google.android.gms.tagmanager.zzdf;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class zzqj
{
  static zzag.zza zza(int paramInt, JSONArray paramJSONArray, zzag.zza[] paramArrayOfZza, Set<Integer> paramSet)
    throws zzqp.zzg, JSONException
  {
    int j = 0;
    int i = 0;
    if (paramSet.contains(Integer.valueOf(paramInt))) {
      zzfi("Value cycle detected. Current value reference: " + paramInt + "." + "  Previous value references: " + paramSet + ".");
    }
    Object localObject1 = zza(paramJSONArray, paramInt, "values");
    if (paramArrayOfZza[paramInt] != null) {
      return paramArrayOfZza[paramInt];
    }
    paramSet.add(Integer.valueOf(paramInt));
    zzag.zza localZza = new zzag.zza();
    if ((localObject1 instanceof JSONArray))
    {
      localObject1 = (JSONArray)localObject1;
      type = 2;
      zzje = true;
      zziV = new zzag.zza[((JSONArray)localObject1).length()];
      while (i < zziV.length)
      {
        zziV[i] = zza(((JSONArray)localObject1).getInt(i), paramJSONArray, paramArrayOfZza, paramSet);
        i += 1;
      }
    }
    Object localObject2;
    if ((localObject1 instanceof JSONObject))
    {
      localObject1 = (JSONObject)localObject1;
      localObject2 = ((JSONObject)localObject1).optJSONArray("escaping");
      if (localObject2 != null)
      {
        zzjd = new int[((JSONArray)localObject2).length()];
        i = 0;
        while (i < zzjd.length)
        {
          zzjd[i] = ((JSONArray)localObject2).getInt(i);
          i += 1;
        }
      }
      if (((JSONObject)localObject1).has("function_id"))
      {
        type = 5;
        zziZ = ((JSONObject)localObject1).getString("function_id");
      }
    }
    for (;;)
    {
      paramArrayOfZza[paramInt] = localZza;
      paramSet.remove(Integer.valueOf(paramInt));
      return localZza;
      if (((JSONObject)localObject1).has("macro_reference"))
      {
        type = 4;
        zzje = true;
        zziY = zzdf.zzg(zza(((JSONObject)localObject1).getInt("macro_reference"), paramJSONArray, paramArrayOfZza, paramSet));
      }
      else if (((JSONObject)localObject1).has("template_token"))
      {
        type = 7;
        zzje = true;
        localObject1 = ((JSONObject)localObject1).getJSONArray("template_token");
        zzjc = new zzag.zza[((JSONArray)localObject1).length()];
        i = j;
        while (i < zzjc.length)
        {
          zzjc[i] = zza(((JSONArray)localObject1).getInt(i), paramJSONArray, paramArrayOfZza, paramSet);
          i += 1;
        }
      }
      else
      {
        type = 3;
        zzje = true;
        i = ((JSONObject)localObject1).length();
        zziW = new zzag.zza[i];
        zziX = new zzag.zza[i];
        localObject2 = ((JSONObject)localObject1).keys();
        i = 0;
        while (((Iterator)localObject2).hasNext())
        {
          String str = (String)((Iterator)localObject2).next();
          zziW[i] = zza(new Integer(str).intValue(), paramJSONArray, paramArrayOfZza, paramSet);
          zziX[i] = zza(((JSONObject)localObject1).getInt(str), paramJSONArray, paramArrayOfZza, paramSet);
          i += 1;
        }
        continue;
        if ((localObject1 instanceof String))
        {
          zziU = ((String)localObject1);
          type = 1;
        }
        else if ((localObject1 instanceof Boolean))
        {
          zzjb = ((Boolean)localObject1).booleanValue();
          type = 8;
        }
        else if ((localObject1 instanceof Integer))
        {
          zzja = ((Integer)localObject1).intValue();
          type = 6;
        }
        else
        {
          zzfi("Invalid value type: " + localObject1);
        }
      }
    }
  }
  
  static zzqp.zza zza(JSONObject paramJSONObject, JSONArray paramJSONArray1, JSONArray paramJSONArray2, zzag.zza[] paramArrayOfZza, int paramInt)
    throws zzqp.zzg, JSONException
  {
    zzqp.zzb localZzb = zzqp.zza.zzBC();
    paramJSONObject = paramJSONObject.getJSONArray("property");
    paramInt = 0;
    if (paramInt < paramJSONObject.length())
    {
      Object localObject = (JSONObject)zza(paramJSONArray1, paramJSONObject.getInt(paramInt), "properties");
      String str = (String)zza(paramJSONArray2, ((JSONObject)localObject).getInt("key"), "key");
      localObject = (zzag.zza)zza(paramArrayOfZza, ((JSONObject)localObject).getInt("value"), "value");
      if (zzae.zzgv.toString().equals(str)) {
        localZzb.zzq((zzag.zza)localObject);
      }
      for (;;)
      {
        paramInt += 1;
        break;
        localZzb.zzb(str, (zzag.zza)localObject);
      }
    }
    return localZzb.zzBE();
  }
  
  static zzqp.zze zza(JSONObject paramJSONObject, List<zzqp.zza> paramList1, List<zzqp.zza> paramList2, List<zzqp.zza> paramList3, zzag.zza[] paramArrayOfZza)
    throws JSONException
  {
    zzqp.zzf localZzf = zzqp.zze.zzBJ();
    JSONArray localJSONArray1 = paramJSONObject.optJSONArray("positive_predicate");
    JSONArray localJSONArray2 = paramJSONObject.optJSONArray("negative_predicate");
    JSONArray localJSONArray3 = paramJSONObject.optJSONArray("add_tag");
    JSONArray localJSONArray4 = paramJSONObject.optJSONArray("remove_tag");
    JSONArray localJSONArray5 = paramJSONObject.optJSONArray("add_tag_rule_name");
    JSONArray localJSONArray6 = paramJSONObject.optJSONArray("remove_tag_rule_name");
    JSONArray localJSONArray7 = paramJSONObject.optJSONArray("add_macro");
    JSONArray localJSONArray8 = paramJSONObject.optJSONArray("remove_macro");
    JSONArray localJSONArray9 = paramJSONObject.optJSONArray("add_macro_rule_name");
    paramJSONObject = paramJSONObject.optJSONArray("remove_macro_rule_name");
    int i;
    if (localJSONArray1 != null)
    {
      i = 0;
      while (i < localJSONArray1.length())
      {
        localZzf.zzd((zzqp.zza)paramList3.get(localJSONArray1.getInt(i)));
        i += 1;
      }
    }
    if (localJSONArray2 != null)
    {
      i = 0;
      while (i < localJSONArray2.length())
      {
        localZzf.zze((zzqp.zza)paramList3.get(localJSONArray2.getInt(i)));
        i += 1;
      }
    }
    if (localJSONArray3 != null)
    {
      i = 0;
      while (i < localJSONArray3.length())
      {
        localZzf.zzf((zzqp.zza)paramList1.get(localJSONArray3.getInt(i)));
        i += 1;
      }
    }
    if (localJSONArray4 != null)
    {
      i = 0;
      while (i < localJSONArray4.length())
      {
        localZzf.zzg((zzqp.zza)paramList1.get(localJSONArray4.getInt(i)));
        i += 1;
      }
    }
    if (localJSONArray5 != null)
    {
      i = 0;
      while (i < localJSONArray5.length())
      {
        localZzf.zzfl(getIntzziU);
        i += 1;
      }
    }
    if (localJSONArray6 != null)
    {
      i = 0;
      while (i < localJSONArray6.length())
      {
        localZzf.zzfm(getIntzziU);
        i += 1;
      }
    }
    if (localJSONArray7 != null)
    {
      i = 0;
      while (i < localJSONArray7.length())
      {
        localZzf.zzh((zzqp.zza)paramList2.get(localJSONArray7.getInt(i)));
        i += 1;
      }
    }
    if (localJSONArray8 != null)
    {
      i = 0;
      while (i < localJSONArray8.length())
      {
        localZzf.zzi((zzqp.zza)paramList2.get(localJSONArray8.getInt(i)));
        i += 1;
      }
    }
    if (localJSONArray9 != null)
    {
      i = 0;
      while (i < localJSONArray9.length())
      {
        localZzf.zzfn(getIntzziU);
        i += 1;
      }
    }
    if (paramJSONObject != null)
    {
      i = 0;
      while (i < paramJSONObject.length())
      {
        localZzf.zzfo(getIntzziU);
        i += 1;
      }
    }
    return localZzf.zzBU();
  }
  
  private static <T> T zza(JSONArray paramJSONArray, int paramInt, String paramString)
    throws zzqp.zzg
  {
    if ((paramInt >= 0) && (paramInt < paramJSONArray.length())) {
      try
      {
        paramJSONArray = paramJSONArray.get(paramInt);
        return paramJSONArray;
      }
      catch (JSONException paramJSONArray) {}
    }
    zzfi("Index out of bounds detected: " + paramInt + " in " + paramString);
    return null;
  }
  
  private static <T> T zza(T[] paramArrayOfT, int paramInt, String paramString)
    throws zzqp.zzg
  {
    if ((paramInt < 0) || (paramInt >= paramArrayOfT.length)) {
      zzfi("Index out of bounds detected: " + paramInt + " in " + paramString);
    }
    return paramArrayOfT[paramInt];
  }
  
  static List<zzqp.zza> zza(JSONArray paramJSONArray1, JSONArray paramJSONArray2, JSONArray paramJSONArray3, zzag.zza[] paramArrayOfZza)
    throws JSONException, zzqp.zzg
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (i < paramJSONArray1.length())
    {
      localArrayList.add(zza(paramJSONArray1.getJSONObject(i), paramJSONArray2, paramJSONArray3, paramArrayOfZza, i));
      i += 1;
    }
    return localArrayList;
  }
  
  static zzqp.zzc zzeN(String paramString)
    throws JSONException, zzqp.zzg
  {
    paramString = new JSONObject(paramString);
    Object localObject1 = paramString.get("resource");
    zzag.zza[] arrayOfZza;
    Object localObject3;
    List localList1;
    List localList2;
    if ((localObject1 instanceof JSONObject))
    {
      localObject2 = (JSONObject)localObject1;
      localObject1 = zzqp.zzc.zzBF();
      arrayOfZza = zzj((JSONObject)localObject2);
      localObject3 = ((JSONObject)localObject2).getJSONArray("properties");
      Object localObject4 = ((JSONObject)localObject2).getJSONArray("key");
      localList1 = zza(((JSONObject)localObject2).getJSONArray("tags"), (JSONArray)localObject3, (JSONArray)localObject4, arrayOfZza);
      localList2 = zza(((JSONObject)localObject2).getJSONArray("predicates"), (JSONArray)localObject3, (JSONArray)localObject4, arrayOfZza);
      localObject3 = zza(((JSONObject)localObject2).getJSONArray("macros"), (JSONArray)localObject3, (JSONArray)localObject4, arrayOfZza);
      localObject4 = ((List)localObject3).iterator();
      while (((Iterator)localObject4).hasNext()) {
        ((zzqp.zzd)localObject1).zzc((zzqp.zza)((Iterator)localObject4).next());
      }
    }
    throw new zzqp.zzg("Resource map not found");
    Object localObject2 = ((JSONObject)localObject2).getJSONArray("rules");
    int i = 0;
    while (i < ((JSONArray)localObject2).length())
    {
      ((zzqp.zzd)localObject1).zzb(zza(((JSONArray)localObject2).getJSONObject(i), localList1, (List)localObject3, localList2, arrayOfZza));
      i += 1;
    }
    ((zzqp.zzd)localObject1).zzfk("1");
    ((zzqp.zzd)localObject1).zzjm(1);
    if (paramString.optJSONArray("runtime") != null) {}
    return ((zzqp.zzd)localObject1).zzBI();
  }
  
  private static void zzfi(String paramString)
    throws zzqp.zzg
  {
    zzbg.e(paramString);
    throw new zzqp.zzg(paramString);
  }
  
  static zzag.zza[] zzj(JSONObject paramJSONObject)
    throws JSONException, zzqp.zzg
  {
    paramJSONObject = paramJSONObject.opt("values");
    zzag.zza[] arrayOfZza;
    if ((paramJSONObject instanceof JSONArray))
    {
      paramJSONObject = (JSONArray)paramJSONObject;
      arrayOfZza = new zzag.zza[paramJSONObject.length()];
      int i = 0;
      while (i < arrayOfZza.length)
      {
        zza(i, paramJSONObject, arrayOfZza, new HashSet(0));
        i += 1;
      }
    }
    throw new zzqp.zzg("Missing Values list");
    return arrayOfZza;
  }
}
