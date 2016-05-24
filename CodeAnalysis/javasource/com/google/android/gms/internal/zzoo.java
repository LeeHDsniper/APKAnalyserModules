package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzoo
  extends zzod<zzoo>
{
  private String mCategory;
  private String zzOj;
  private String zzaID;
  private long zzasE;
  
  public zzoo() {}
  
  public String getAction()
  {
    return zzOj;
  }
  
  public String getLabel()
  {
    return zzaID;
  }
  
  public long getValue()
  {
    return zzasE;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("category", mCategory);
    localHashMap.put("action", zzOj);
    localHashMap.put("label", zzaID);
    localHashMap.put("value", Long.valueOf(zzasE));
    return zzA(localHashMap);
  }
  
  public void zzM(long paramLong)
  {
    zzasE = paramLong;
  }
  
  public void zza(zzoo paramZzoo)
  {
    if (!TextUtils.isEmpty(mCategory)) {
      paramZzoo.zzdR(mCategory);
    }
    if (!TextUtils.isEmpty(zzOj)) {
      paramZzoo.zzdS(zzOj);
    }
    if (!TextUtils.isEmpty(zzaID)) {
      paramZzoo.zzdT(zzaID);
    }
    if (zzasE != 0L) {
      paramZzoo.zzM(zzasE);
    }
  }
  
  public void zzdR(String paramString)
  {
    mCategory = paramString;
  }
  
  public void zzdS(String paramString)
  {
    zzOj = paramString;
  }
  
  public void zzdT(String paramString)
  {
    zzaID = paramString;
  }
  
  public String zzxQ()
  {
    return mCategory;
  }
}
