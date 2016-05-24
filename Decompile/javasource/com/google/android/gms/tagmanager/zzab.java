package com.google.android.gms.tagmanager;

import android.os.Build;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzab
  extends zzak
{
  private static final String ID = zzad.zzbq.toString();
  
  public zzab()
  {
    super(ID, new String[0]);
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    String str2 = Build.MANUFACTURER;
    String str1 = Build.MODEL;
    paramMap = str1;
    if (!str1.startsWith(str2))
    {
      paramMap = str1;
      if (!str2.equals("unknown")) {
        paramMap = str2 + " " + str1;
      }
    }
    return zzdf.zzK(paramMap);
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
