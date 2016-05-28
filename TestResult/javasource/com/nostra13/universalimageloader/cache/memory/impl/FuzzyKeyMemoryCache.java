package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;

public class FuzzyKeyMemoryCache
  implements MemoryCache
{
  private final MemoryCache cache;
  private final Comparator<String> keyComparator;
  
  public FuzzyKeyMemoryCache(MemoryCache paramMemoryCache, Comparator<String> paramComparator)
  {
    cache = paramMemoryCache;
    keyComparator = paramComparator;
  }
  
  public Bitmap get(String paramString)
  {
    return (Bitmap)cache.get(paramString);
  }
  
  public Collection<String> keys()
  {
    return cache.keys();
  }
  
  public boolean put(String paramString, Bitmap paramBitmap)
  {
    MemoryCache localMemoryCache = cache;
    Object localObject2 = null;
    try
    {
      Iterator localIterator = cache.keys().iterator();
      Object localObject1;
      do
      {
        localObject1 = localObject2;
        if (!localIterator.hasNext()) {
          break;
        }
        localObject1 = (String)localIterator.next();
      } while (keyComparator.compare(paramString, localObject1) != 0);
      if (localObject1 != null) {
        cache.remove(localObject1);
      }
      return cache.put(paramString, paramBitmap);
    }
    finally {}
  }
  
  public void remove(String paramString)
  {
    cache.remove(paramString);
  }
}
