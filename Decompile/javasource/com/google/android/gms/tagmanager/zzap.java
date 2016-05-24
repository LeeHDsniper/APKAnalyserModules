package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

class zzap
  extends zzak
{
  private static final String ID = zzad.zzbN.toString();
  private static final String zzaPY = zzae.zzdz.toString();
  private static final String zzaQa = zzae.zzft.toString();
  private static final String zzaQe = zzae.zzdq.toString();
  
  public zzap()
  {
    super(ID, new String[] { zzaPY });
  }
  
  private byte[] zzd(String paramString, byte[] paramArrayOfByte)
    throws NoSuchAlgorithmException
  {
    paramString = MessageDigest.getInstance(paramString);
    paramString.update(paramArrayOfByte);
    return paramString.digest();
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = (zzag.zza)paramMap.get(zzaPY);
    if ((localObject == null) || (localObject == zzdf.zzBg())) {
      return zzdf.zzBg();
    }
    String str = zzdf.zzg((zzag.zza)localObject);
    localObject = (zzag.zza)paramMap.get(zzaQe);
    if (localObject == null)
    {
      localObject = "MD5";
      paramMap = (zzag.zza)paramMap.get(zzaQa);
      if (paramMap != null) {
        break label110;
      }
      paramMap = "text";
      label73:
      if (!"text".equals(paramMap)) {
        break label118;
      }
      paramMap = str.getBytes();
    }
    for (;;)
    {
      try
      {
        paramMap = zzdf.zzK(zzk.zzi(zzd((String)localObject, paramMap)));
        return paramMap;
      }
      catch (NoSuchAlgorithmException paramMap)
      {
        label110:
        label118:
        zzbg.e("Hash: unknown algorithm: " + (String)localObject);
      }
      localObject = zzdf.zzg((zzag.zza)localObject);
      break;
      paramMap = zzdf.zzg(paramMap);
      break label73;
      if ("base16".equals(paramMap))
      {
        paramMap = zzk.zzet(str);
      }
      else
      {
        zzbg.e("Hash: unknown input format: " + paramMap);
        return zzdf.zzBg();
      }
    }
    return zzdf.zzBg();
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
