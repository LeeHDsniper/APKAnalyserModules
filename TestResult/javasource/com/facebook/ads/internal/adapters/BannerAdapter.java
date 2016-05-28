package com.facebook.ads.internal.adapters;

import android.content.Context;
import com.facebook.ads.AdSize;
import com.facebook.ads.internal.server.AdPlacementType;
import java.util.Map;

public abstract class BannerAdapter
  implements AdAdapter
{
  public BannerAdapter() {}
  
  public final AdPlacementType getPlacementType()
  {
    return AdPlacementType.BANNER;
  }
  
  public abstract void loadBannerAd(Context paramContext, AdSize paramAdSize, BannerAdapterListener paramBannerAdapterListener, Map<String, Object> paramMap);
  
  public void onViewableImpression() {}
}
