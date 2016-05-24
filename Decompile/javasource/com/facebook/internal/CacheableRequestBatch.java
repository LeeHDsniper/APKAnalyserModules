package com.facebook.internal;

import com.facebook.RequestBatch;

public class CacheableRequestBatch
  extends RequestBatch
{
  private String cacheKey;
  private boolean forceRoundTrip;
  
  public CacheableRequestBatch() {}
  
  public final String getCacheKeyOverride()
  {
    return cacheKey;
  }
  
  public final boolean getForceRoundTrip()
  {
    return forceRoundTrip;
  }
}
