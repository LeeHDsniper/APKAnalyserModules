package com.adobe.creativesdk.foundation.internal.cache;

public abstract interface AdobeCommonCacheHandler<T>
{
  public abstract void onHit(T paramT, AdobeCommonCacheHitLocation paramAdobeCommonCacheHitLocation);
  
  public abstract void onMiss();
}
