package com.google.android.gms.tagmanager;

import android.text.TextUtils;

class zzaq
{
  private final long zzOa;
  private final long zzaQf;
  private final long zzaQg;
  private String zzaQh;
  
  zzaq(long paramLong1, long paramLong2, long paramLong3)
  {
    zzaQf = paramLong1;
    zzOa = paramLong2;
    zzaQg = paramLong3;
  }
  
  long zzAe()
  {
    return zzaQf;
  }
  
  long zzAf()
  {
    return zzaQg;
  }
  
  String zzAg()
  {
    return zzaQh;
  }
  
  void zzeK(String paramString)
  {
    if ((paramString == null) || (TextUtils.isEmpty(paramString.trim()))) {
      return;
    }
    zzaQh = paramString;
  }
}
