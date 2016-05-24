package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class zzay
  extends zzak
{
  private static final String ID = zzad.zzbP.toString();
  private static final String zzaPY = zzae.zzdz.toString();
  private static final String zzaQq = zzae.zzfx.toString();
  private static final String zzaQr = zzae.zzfB.toString();
  private static final String zzaQs = zzae.zzeU.toString();
  
  public zzay()
  {
    super(ID, new String[] { zzaPY });
  }
  
  private String zza(String paramString, zza paramZza, Set<Character> paramSet)
  {
    switch (1.zzaQt[paramZza.ordinal()])
    {
    default: 
      return paramString;
    case 1: 
      try
      {
        paramZza = zzdj.zzff(paramString);
        return paramZza;
      }
      catch (UnsupportedEncodingException paramZza)
      {
        zzbg.zzb("Joiner: unsupported encoding", paramZza);
        return paramString;
      }
    }
    paramString = paramString.replace("\\", "\\\\");
    paramZza = paramSet.iterator();
    while (paramZza.hasNext())
    {
      paramSet = ((Character)paramZza.next()).toString();
      paramString = paramString.replace(paramSet, "\\" + paramSet);
    }
    return paramString;
  }
  
  private void zza(StringBuilder paramStringBuilder, String paramString, zza paramZza, Set<Character> paramSet)
  {
    paramStringBuilder.append(zza(paramString, paramZza, paramSet));
  }
  
  private void zza(Set<Character> paramSet, String paramString)
  {
    int i = 0;
    while (i < paramString.length())
    {
      paramSet.add(Character.valueOf(paramString.charAt(i)));
      i += 1;
    }
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    zzag.zza localZza = (zzag.zza)paramMap.get(zzaPY);
    if (localZza == null) {
      return zzdf.zzBg();
    }
    Object localObject1 = (zzag.zza)paramMap.get(zzaQq);
    String str1;
    Object localObject2;
    if (localObject1 != null)
    {
      str1 = zzdf.zzg((zzag.zza)localObject1);
      localObject1 = (zzag.zza)paramMap.get(zzaQr);
      if (localObject1 == null) {
        break label186;
      }
      localObject2 = zzdf.zzg((zzag.zza)localObject1);
      label75:
      localObject1 = zza.zzaQu;
      paramMap = (zzag.zza)paramMap.get(zzaQs);
      if (paramMap == null) {
        break label418;
      }
      paramMap = zzdf.zzg(paramMap);
      if (!"url".equals(paramMap)) {
        break label193;
      }
      localObject1 = zza.zzaQv;
      paramMap = null;
    }
    for (;;)
    {
      label118:
      StringBuilder localStringBuilder = new StringBuilder();
      switch (type)
      {
      default: 
        zza(localStringBuilder, zzdf.zzg(localZza), (zza)localObject1, paramMap);
      }
      for (;;)
      {
        return zzdf.zzK(localStringBuilder.toString());
        str1 = "";
        break;
        label186:
        localObject2 = "=";
        break label75;
        label193:
        if ("backslash".equals(paramMap))
        {
          localObject1 = zza.zzaQw;
          paramMap = new HashSet();
          zza(paramMap, str1);
          zza(paramMap, (String)localObject2);
          paramMap.remove(Character.valueOf('\\'));
          break label118;
        }
        zzbg.e("Joiner: unsupported escape type: " + paramMap);
        return zzdf.zzBg();
        int j = 1;
        localObject2 = zziV;
        int k = localObject2.length;
        int i = 0;
        while (i < k)
        {
          localZza = localObject2[i];
          if (j == 0) {
            localStringBuilder.append(str1);
          }
          zza(localStringBuilder, zzdf.zzg(localZza), (zza)localObject1, paramMap);
          i += 1;
          j = 0;
        }
        i = 0;
        while (i < zziW.length)
        {
          if (i > 0) {
            localStringBuilder.append(str1);
          }
          String str2 = zzdf.zzg(zziW[i]);
          String str3 = zzdf.zzg(zziX[i]);
          zza(localStringBuilder, str2, (zza)localObject1, paramMap);
          localStringBuilder.append((String)localObject2);
          zza(localStringBuilder, str3, (zza)localObject1, paramMap);
          i += 1;
        }
      }
      label418:
      paramMap = null;
    }
  }
  
  public boolean zzzx()
  {
    return true;
  }
  
  private static enum zza
  {
    private zza() {}
  }
}
