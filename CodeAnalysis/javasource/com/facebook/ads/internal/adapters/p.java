package com.facebook.ads.internal.adapters;

import android.content.Context;
import com.facebook.ads.NativeAd.Image;
import com.facebook.ads.internal.server.AdPlacementType;
import java.util.Map;

public abstract class p
  implements AdAdapter
{
  public p() {}
  
  public abstract void a(Context paramContext, q paramQ, Map<String, Object> paramMap);
  
  public abstract void a(Map<String, Object> paramMap);
  
  public abstract void b(Map<String, Object> paramMap);
  
  public abstract boolean b();
  
  public abstract boolean d();
  
  public abstract int e();
  
  public final AdPlacementType getPlacementType()
  {
    return AdPlacementType.NATIVE;
  }
  
  public abstract NativeAd.Image i();
  
  public abstract String t();
  
  public abstract String u();
  
  public abstract String v();
  
  public abstract boolean w();
}
