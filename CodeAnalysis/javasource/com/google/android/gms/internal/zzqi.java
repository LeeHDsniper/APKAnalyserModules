package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;

public class zzqi
{
  private final String zzaOS;
  private final String zzaRq;
  private final Integer zzaTv;
  private final String zzaTw;
  private final boolean zzaTx;
  
  public zzqi(String paramString1, Integer paramInteger, String paramString2, boolean paramBoolean)
  {
    this(paramString1, paramInteger, paramString2, paramBoolean, "");
  }
  
  public zzqi(String paramString1, Integer paramInteger, String paramString2, boolean paramBoolean, String paramString3)
  {
    zzx.zzv(paramString1);
    zzx.zzv(paramString3);
    zzaOS = paramString1;
    zzaTv = paramInteger;
    zzaTw = paramString2;
    zzaTx = paramBoolean;
    zzaRq = paramString3;
  }
  
  public String getContainerId()
  {
    return zzaOS;
  }
  
  public Integer zzBp()
  {
    return zzaTv;
  }
  
  public String zzBq()
  {
    return zzaTw;
  }
  
  public String zzBr()
  {
    if (zzaTw != null) {
      return zzaTw + "_" + zzaOS;
    }
    return zzaOS;
  }
  
  public boolean zzBs()
  {
    return zzaTx;
  }
  
  public String zzBt()
  {
    return zzaRq;
  }
}
