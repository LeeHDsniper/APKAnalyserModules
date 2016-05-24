package com.google.android.gms.ads.mediation;

public abstract interface MediationAdapter
{
  public abstract void onDestroy();
  
  public abstract void onPause();
  
  public abstract void onResume();
}
