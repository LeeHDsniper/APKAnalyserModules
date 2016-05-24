package com.facebook.internal;

import android.content.Context;
import java.util.HashMap;
import java.util.Map;

public class ImageDownloader
{
  private static WorkQueue cacheReadQueue = new WorkQueue(2);
  private static WorkQueue downloadQueue = new WorkQueue(8);
  private static final Map<Object, Object> pendingRequests = new HashMap();
  
  public static void clearCache(Context paramContext)
  {
    ImageResponseCache.clearCache(paramContext);
    UrlRedirectCache.clearCache(paramContext);
  }
}
