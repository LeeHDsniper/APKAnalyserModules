package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzom
  extends zzod<zzom>
{
  private String zzUc;
  public int zzaIA;
  public int zzaIB;
  public int zzaIC;
  public int zzzQ;
  public int zzzR;
  
  public zzom() {}
  
  public String getLanguage()
  {
    return zzUc;
  }
  
  public void setLanguage(String paramString)
  {
    zzUc = paramString;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("language", zzUc);
    localHashMap.put("screenColors", Integer.valueOf(zzaIA));
    localHashMap.put("screenWidth", Integer.valueOf(zzzQ));
    localHashMap.put("screenHeight", Integer.valueOf(zzzR));
    localHashMap.put("viewportWidth", Integer.valueOf(zzaIB));
    localHashMap.put("viewportHeight", Integer.valueOf(zzaIC));
    return zzA(localHashMap);
  }
  
  public void zza(zzom paramZzom)
  {
    if (zzaIA != 0) {
      paramZzom.zzhN(zzaIA);
    }
    if (zzzQ != 0) {
      paramZzom.zzhO(zzzQ);
    }
    if (zzzR != 0) {
      paramZzom.zzhP(zzzR);
    }
    if (zzaIB != 0) {
      paramZzom.zzhQ(zzaIB);
    }
    if (zzaIC != 0) {
      paramZzom.zzhR(zzaIC);
    }
    if (!TextUtils.isEmpty(zzUc)) {
      paramZzom.setLanguage(zzUc);
    }
  }
  
  public void zzhN(int paramInt)
  {
    zzaIA = paramInt;
  }
  
  public void zzhO(int paramInt)
  {
    zzzQ = paramInt;
  }
  
  public void zzhP(int paramInt)
  {
    zzzR = paramInt;
  }
  
  public void zzhQ(int paramInt)
  {
    zzaIB = paramInt;
  }
  
  public void zzhR(int paramInt)
  {
    zzaIC = paramInt;
  }
  
  public int zzxH()
  {
    return zzaIA;
  }
  
  public int zzxI()
  {
    return zzzQ;
  }
  
  public int zzxJ()
  {
    return zzzR;
  }
  
  public int zzxK()
  {
    return zzaIB;
  }
  
  public int zzxL()
  {
    return zzaIC;
  }
}
