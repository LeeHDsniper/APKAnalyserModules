package com.google.android.gms.common;

import android.content.Context;
import android.content.Intent;

public class GoogleApiAvailability
{
  public static final int GOOGLE_PLAY_SERVICES_VERSION_CODE = GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE;
  private static final GoogleApiAvailability zzYk = new GoogleApiAvailability();
  
  GoogleApiAvailability() {}
  
  public static GoogleApiAvailability getInstance()
  {
    return zzYk;
  }
  
  public int isGooglePlayServicesAvailable(Context paramContext)
  {
    int j = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext);
    int i = j;
    if (GooglePlayServicesUtil.zzd(paramContext, j)) {
      i = 18;
    }
    return i;
  }
  
  public void zzac(Context paramContext)
  {
    GooglePlayServicesUtil.zzac(paramContext);
  }
  
  public Intent zzbb(int paramInt)
  {
    return GooglePlayServicesUtil.zzbc(paramInt);
  }
  
  public boolean zzd(Context paramContext, int paramInt)
  {
    return GooglePlayServicesUtil.zzd(paramContext, paramInt);
  }
}
