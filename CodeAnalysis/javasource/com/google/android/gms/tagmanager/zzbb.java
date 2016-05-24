package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Locale;
import java.util.Map;

public class zzbb
  extends zzak
{
  private static final String ID = zzad.zzby.toString();
  
  public zzbb()
  {
    super(ID, new String[0]);
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    paramMap = Locale.getDefault();
    if (paramMap == null) {
      return zzdf.zzBg();
    }
    paramMap = paramMap.getLanguage();
    if (paramMap == null) {
      return zzdf.zzBg();
    }
    return zzdf.zzK(paramMap.toLowerCase());
  }
  
  public boolean zzzx()
  {
    return false;
  }
}
