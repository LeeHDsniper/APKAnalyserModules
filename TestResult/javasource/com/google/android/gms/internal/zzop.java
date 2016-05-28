package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzop
  extends zzod<zzop>
{
  public boolean zzaIE;
  public String zzaoB;
  
  public zzop() {}
  
  public String getDescription()
  {
    return zzaoB;
  }
  
  public void setDescription(String paramString)
  {
    zzaoB = paramString;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("description", zzaoB);
    localHashMap.put("fatal", Boolean.valueOf(zzaIE));
    return zzA(localHashMap);
  }
  
  public void zza(zzop paramZzop)
  {
    if (!TextUtils.isEmpty(zzaoB)) {
      paramZzop.setDescription(zzaoB);
    }
    if (zzaIE) {
      paramZzop.zzak(zzaIE);
    }
  }
  
  public void zzak(boolean paramBoolean)
  {
    zzaIE = paramBoolean;
  }
  
  public boolean zzxR()
  {
    return zzaIE;
  }
}
