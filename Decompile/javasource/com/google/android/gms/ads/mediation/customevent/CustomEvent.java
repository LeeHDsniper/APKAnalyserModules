package com.google.android.gms.ads.mediation.customevent;

public abstract interface CustomEvent
{
  public abstract void onDestroy();
  
  public abstract void onPause();
  
  public abstract void onResume();
}
