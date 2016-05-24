package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzos
  extends zzod<zzos>
{
  public String mCategory;
  public String zzaID;
  public String zzaIP;
  public long zzaIQ;
  
  public zzos() {}
  
  public String getLabel()
  {
    return zzaID;
  }
  
  public long getTimeInMillis()
  {
    return zzaIQ;
  }
  
  public void setTimeInMillis(long paramLong)
  {
    zzaIQ = paramLong;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("variableName", zzaIP);
    localHashMap.put("timeInMillis", Long.valueOf(zzaIQ));
    localHashMap.put("category", mCategory);
    localHashMap.put("label", zzaID);
    return zzA(localHashMap);
  }
  
  public void zza(zzos paramZzos)
  {
    if (!TextUtils.isEmpty(zzaIP)) {
      paramZzos.zzdY(zzaIP);
    }
    if (zzaIQ != 0L) {
      paramZzos.setTimeInMillis(zzaIQ);
    }
    if (!TextUtils.isEmpty(mCategory)) {
      paramZzos.zzdR(mCategory);
    }
    if (!TextUtils.isEmpty(zzaID)) {
      paramZzos.zzdT(zzaID);
    }
  }
  
  public void zzdR(String paramString)
  {
    mCategory = paramString;
  }
  
  public void zzdT(String paramString)
  {
    zzaID = paramString;
  }
  
  public void zzdY(String paramString)
  {
    zzaIP = paramString;
  }
  
  public String zzxQ()
  {
    return mCategory;
  }
  
  public String zzyb()
  {
    return zzaIP;
  }
}
