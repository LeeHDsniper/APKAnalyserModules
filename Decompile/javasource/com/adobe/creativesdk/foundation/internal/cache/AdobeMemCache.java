package com.adobe.creativesdk.foundation.internal.cache;

import android.util.LruCache;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;

public class AdobeMemCache
  extends LruCache<String, Object>
{
  public AdobeMemCache(int paramInt)
  {
    super(paramInt);
  }
  
  protected void entryRemoved(boolean paramBoolean, String paramString, Object paramObject1, Object paramObject2)
  {
    super.entryRemoved(paramBoolean, paramString, paramObject1, paramObject2);
    AdobeLogger.log(Level.INFO, AdobeMemCache.class.getName(), "Removing entry " + paramString + " from mem cache.");
  }
}
