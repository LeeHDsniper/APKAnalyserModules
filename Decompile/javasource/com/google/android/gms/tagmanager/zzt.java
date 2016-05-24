package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzt
  extends zzak
{
  private static final String ID = zzad.zzbw.toString();
  private static final String zzaOL = zzae.zzdn.toString();
  private static final String zzaPx = zzae.zzfk.toString();
  private final zza zzaPy;
  
  public zzt(zza paramZza)
  {
    super(ID, new String[] { zzaPx });
    zzaPy = paramZza;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    String str = zzdf.zzg((zzag.zza)paramMap.get(zzaPx));
    HashMap localHashMap = new HashMap();
    paramMap = (zzag.zza)paramMap.get(zzaOL);
    if (paramMap != null)
    {
      paramMap = zzdf.zzl(paramMap);
      if (!(paramMap instanceof Map))
      {
        zzbg.zzaE("FunctionCallMacro: expected ADDITIONAL_PARAMS to be a map.");
        return zzdf.zzBg();
      }
      paramMap = ((Map)paramMap).entrySet().iterator();
      while (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        localHashMap.put(localEntry.getKey().toString(), localEntry.getValue());
      }
    }
    try
    {
      paramMap = zzdf.zzK(zzaPy.zzd(str, localHashMap));
      return paramMap;
    }
    catch (Exception paramMap)
    {
      zzbg.zzaE("Custom macro/tag " + str + " threw exception " + paramMap.getMessage());
    }
    return zzdf.zzBg();
  }
  
  public boolean zzzx()
  {
    return false;
  }
  
  public static abstract interface zza
  {
    public abstract Object zzd(String paramString, Map<String, Object> paramMap);
  }
}
