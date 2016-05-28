package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

class zzce
  extends zzak
{
  private static final String ID = zzad.zzbR.toString();
  private static final String zzaRi = zzae.zzdz.toString();
  private static final String zzaRj = zzae.zzdA.toString();
  private static final String zzaRk = zzae.zzfr.toString();
  private static final String zzaRl = zzae.zzfl.toString();
  
  public zzce()
  {
    super(ID, new String[] { zzaRi, zzaRj });
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = (zzag.zza)paramMap.get(zzaRi);
    zzag.zza localZza = (zzag.zza)paramMap.get(zzaRj);
    if ((localObject == null) || (localObject == zzdf.zzBg()) || (localZza == null) || (localZza == zzdf.zzBg())) {
      return zzdf.zzBg();
    }
    int i = 64;
    if (zzdf.zzk((zzag.zza)paramMap.get(zzaRk)).booleanValue()) {
      i = 66;
    }
    paramMap = (zzag.zza)paramMap.get(zzaRl);
    int j;
    if (paramMap != null)
    {
      paramMap = zzdf.zzi(paramMap);
      if (paramMap == zzdf.zzBb()) {
        return zzdf.zzBg();
      }
      int k = paramMap.intValue();
      j = k;
      if (k < 0) {
        return zzdf.zzBg();
      }
    }
    else
    {
      j = 1;
    }
    try
    {
      paramMap = zzdf.zzg((zzag.zza)localObject);
      localObject = zzdf.zzg(localZza);
      localZza = null;
      localObject = Pattern.compile((String)localObject, i).matcher(paramMap);
      paramMap = localZza;
      if (((Matcher)localObject).find())
      {
        paramMap = localZza;
        if (((Matcher)localObject).groupCount() >= j) {
          paramMap = ((Matcher)localObject).group(j);
        }
      }
      if (paramMap == null) {
        return zzdf.zzBg();
      }
      paramMap = zzdf.zzK(paramMap);
      return paramMap;
    }
    catch (PatternSyntaxException paramMap) {}
    return zzdf.zzBg();
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
