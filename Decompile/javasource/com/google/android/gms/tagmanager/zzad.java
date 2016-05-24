package com.google.android.gms.tagmanager;

import android.util.Base64;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzad
  extends zzak
{
  private static final String ID = com.google.android.gms.internal.zzad.zzbL.toString();
  private static final String zzaPY = zzae.zzdz.toString();
  private static final String zzaPZ = zzae.zzfX.toString();
  private static final String zzaQa = zzae.zzft.toString();
  private static final String zzaQb = zzae.zzgf.toString();
  
  public zzad()
  {
    super(ID, new String[] { zzaPY });
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = (zzag.zza)paramMap.get(zzaPY);
    if ((localObject == null) || (localObject == zzdf.zzBg())) {
      return zzdf.zzBg();
    }
    String str2 = zzdf.zzg((zzag.zza)localObject);
    localObject = (zzag.zza)paramMap.get(zzaQa);
    String str1;
    if (localObject == null)
    {
      str1 = "text";
      localObject = (zzag.zza)paramMap.get(zzaQb);
      if (localObject != null) {
        break label148;
      }
      localObject = "base16";
      label75:
      paramMap = (zzag.zza)paramMap.get(zzaPZ);
      if ((paramMap == null) || (!zzdf.zzk(paramMap).booleanValue())) {
        break label322;
      }
    }
    label148:
    label257:
    label296:
    label322:
    for (int i = 3;; i = 2)
    {
      for (;;)
      {
        try
        {
          if ("text".equals(str1))
          {
            paramMap = str2.getBytes();
            if (!"base16".equals(localObject)) {
              break label257;
            }
            paramMap = zzk.zzi(paramMap);
            return zzdf.zzK(paramMap);
            str1 = zzdf.zzg((zzag.zza)localObject);
            break;
            localObject = zzdf.zzg((zzag.zza)localObject);
            break label75;
          }
          if ("base16".equals(str1))
          {
            paramMap = zzk.zzet(str2);
            continue;
          }
          if ("base64".equals(str1))
          {
            paramMap = Base64.decode(str2, i);
            continue;
          }
          if ("base64url".equals(str1))
          {
            paramMap = Base64.decode(str2, i | 0x8);
            continue;
          }
          zzbg.e("Encode: unknown input format: " + str1);
          paramMap = zzdf.zzBg();
          return paramMap;
        }
        catch (IllegalArgumentException paramMap)
        {
          zzbg.e("Encode: invalid input:");
          return zzdf.zzBg();
        }
        if ("base64".equals(localObject))
        {
          paramMap = Base64.encodeToString(paramMap, i);
        }
        else
        {
          if (!"base64url".equals(localObject)) {
            break label296;
          }
          paramMap = Base64.encodeToString(paramMap, i | 0x8);
        }
      }
      zzbg.e("Encode: unknown output format: " + (String)localObject);
      return zzdf.zzBg();
    }
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
