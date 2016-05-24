package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzol
  extends zzod<zzol>
{
  private String mName;
  private String zzaDI;
  private String zzaIu;
  private String zzaIv;
  private String zzaIw;
  private String zzaIx;
  private String zzaIy;
  private String zzaIz;
  private String zzvx;
  private String zzwj;
  
  public zzol() {}
  
  public String getContent()
  {
    return zzvx;
  }
  
  public String getId()
  {
    return zzwj;
  }
  
  public String getName()
  {
    return mName;
  }
  
  public String getSource()
  {
    return zzaDI;
  }
  
  public void setName(String paramString)
  {
    mName = paramString;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("name", mName);
    localHashMap.put("source", zzaDI);
    localHashMap.put("medium", zzaIu);
    localHashMap.put("keyword", zzaIv);
    localHashMap.put("content", zzvx);
    localHashMap.put("id", zzwj);
    localHashMap.put("adNetworkId", zzaIw);
    localHashMap.put("gclid", zzaIx);
    localHashMap.put("dclid", zzaIy);
    localHashMap.put("aclid", zzaIz);
    return zzA(localHashMap);
  }
  
  public void zza(zzol paramZzol)
  {
    if (!TextUtils.isEmpty(mName)) {
      paramZzol.setName(mName);
    }
    if (!TextUtils.isEmpty(zzaDI)) {
      paramZzol.zzdI(zzaDI);
    }
    if (!TextUtils.isEmpty(zzaIu)) {
      paramZzol.zzdJ(zzaIu);
    }
    if (!TextUtils.isEmpty(zzaIv)) {
      paramZzol.zzdK(zzaIv);
    }
    if (!TextUtils.isEmpty(zzvx)) {
      paramZzol.zzdL(zzvx);
    }
    if (!TextUtils.isEmpty(zzwj)) {
      paramZzol.zzdM(zzwj);
    }
    if (!TextUtils.isEmpty(zzaIw)) {
      paramZzol.zzdN(zzaIw);
    }
    if (!TextUtils.isEmpty(zzaIx)) {
      paramZzol.zzdO(zzaIx);
    }
    if (!TextUtils.isEmpty(zzaIy)) {
      paramZzol.zzdP(zzaIy);
    }
    if (!TextUtils.isEmpty(zzaIz)) {
      paramZzol.zzdQ(zzaIz);
    }
  }
  
  public void zzdI(String paramString)
  {
    zzaDI = paramString;
  }
  
  public void zzdJ(String paramString)
  {
    zzaIu = paramString;
  }
  
  public void zzdK(String paramString)
  {
    zzaIv = paramString;
  }
  
  public void zzdL(String paramString)
  {
    zzvx = paramString;
  }
  
  public void zzdM(String paramString)
  {
    zzwj = paramString;
  }
  
  public void zzdN(String paramString)
  {
    zzaIw = paramString;
  }
  
  public void zzdO(String paramString)
  {
    zzaIx = paramString;
  }
  
  public void zzdP(String paramString)
  {
    zzaIy = paramString;
  }
  
  public void zzdQ(String paramString)
  {
    zzaIz = paramString;
  }
  
  public String zzxB()
  {
    return zzaIu;
  }
  
  public String zzxC()
  {
    return zzaIv;
  }
  
  public String zzxD()
  {
    return zzaIw;
  }
  
  public String zzxE()
  {
    return zzaIx;
  }
  
  public String zzxF()
  {
    return zzaIy;
  }
  
  public String zzxG()
  {
    return zzaIz;
  }
}
