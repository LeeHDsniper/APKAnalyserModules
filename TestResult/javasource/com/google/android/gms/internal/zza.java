package com.google.android.gms.internal;

import android.content.Intent;

public class zza
  extends zzr
{
  private Intent zza;
  
  public zza() {}
  
  public zza(zzi paramZzi)
  {
    super(paramZzi);
  }
  
  public String getMessage()
  {
    if (zza != null) {
      return "User needs to (re)enter credentials.";
    }
    return super.getMessage();
  }
}
