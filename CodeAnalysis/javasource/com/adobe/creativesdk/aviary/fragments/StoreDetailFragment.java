package com.adobe.creativesdk.aviary.fragments;

import android.os.Bundle;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;

public class StoreDetailFragment
  extends StoreDetailFragmentAbstract
{
  public StoreDetailFragment() {}
  
  public static StoreDetailFragment newInstance(long paramLong, Cds.PackType paramPackType, boolean paramBoolean)
  {
    Bundle localBundle = new Bundle();
    localBundle.putLong("extra-pack-id", paramLong);
    localBundle.putString("extras-details-from", paramPackType.toCdsString());
    localBundle.putBoolean("animateDetailView", paramBoolean);
    paramPackType = new StoreDetailFragment();
    paramPackType.setArguments(localBundle);
    return paramPackType;
  }
  
  public boolean isFragmentVisible()
  {
    return ((StoreContainerFragment)getParentFragment()).isFragmentVisible(this);
  }
}
