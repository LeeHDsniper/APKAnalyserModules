package com.google.android.gms.analytics.internal;

import com.google.android.gms.internal.zzof;
import com.google.android.gms.internal.zzok;

public class zzk
  extends zzd
{
  private final zzok zzMm = new zzok();
  
  zzk(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  protected void zzhB()
  {
    zzig().zzxu().zza(zzMm);
    zzhw();
  }
  
  public void zzhw()
  {
    Object localObject = zzhA();
    String str = ((zzan)localObject).zzjZ();
    if (str != null) {
      zzMm.setAppName(str);
    }
    localObject = ((zzan)localObject).zzkb();
    if (localObject != null) {
      zzMm.setAppVersion((String)localObject);
    }
  }
  
  public zzok zziL()
  {
    zzio();
    return zzMm;
  }
}
