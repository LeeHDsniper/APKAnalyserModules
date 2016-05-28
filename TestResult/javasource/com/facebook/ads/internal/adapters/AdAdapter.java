package com.facebook.ads.internal.adapters;

import com.facebook.ads.internal.server.AdPlacementType;

public abstract interface AdAdapter
{
  public abstract AdPlacementType getPlacementType();
  
  public abstract void onDestroy();
}
