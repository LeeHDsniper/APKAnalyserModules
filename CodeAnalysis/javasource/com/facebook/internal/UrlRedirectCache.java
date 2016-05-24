package com.facebook.internal;

import android.content.Context;
import com.facebook.LoggingBehavior;
import java.io.IOException;

class UrlRedirectCache
{
  private static final String REDIRECT_CONTENT_TAG = TAG + "_Redirect";
  static final String TAG = UrlRedirectCache.class.getSimpleName();
  private static volatile FileLruCache urlRedirectCache;
  
  UrlRedirectCache() {}
  
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
      if (urlRedirectCache == null) {
        urlRedirectCache = new FileLruCache(paramContext.getApplicationContext(), TAG, new FileLruCache.Limits());
      }
      paramContext = urlRedirectCache;
      return paramContext;
    }
    finally {}
  }
}
