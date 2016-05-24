package com.facebook.internal;

import android.content.Context;
import com.facebook.LoggingBehavior;
import java.io.IOException;

class ImageResponseCache
{
  static final String TAG = ImageResponseCache.class.getSimpleName();
  private static volatile FileLruCache imageCache;
  
  ImageResponseCache() {}
  
  static void clearCache(Context paramContext)
  {
    try
    {
      getCache(paramContext).clearCache();
      return;
    }
    catch (IOException paramContext)
    {
      Logger.log(LoggingBehavior.CACHE, 5, TAG, "clearCache failed " + paramContext.getMessage());
    }
  }
  
  static FileLruCache getCache(Context paramContext)
    throws IOException
  {
    try
    {
      if (imageCache == null) {
        imageCache = new FileLruCache(paramContext.getApplicationContext(), TAG, new FileLruCache.Limits());
      }
      paramContext = imageCache;
      return paramContext;
    }
    finally {}
  }
}
