package com.nostra13.universalimageloader.utils;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public final class MemoryCacheUtils
{
  public static Comparator<String> createFuzzyKeyComparator()
  {
    new Comparator()
    {
      public int compare(String paramAnonymousString1, String paramAnonymousString2)
      {
        return paramAnonymousString1.substring(0, paramAnonymousString1.lastIndexOf("_")).compareTo(paramAnonymousString2.substring(0, paramAnonymousString2.lastIndexOf("_")));
      }
    };
  }
  
  public static List<Bitmap> findCachedBitmapsForImageUri(String paramString, MemoryCache paramMemoryCache)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramMemoryCache.keys().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (str.startsWith(paramString)) {
        localArrayList.add(paramMemoryCache.get(str));
      }
    }
    return localArrayList;
  }
  
  public static String generateKey(String paramString, ImageSize paramImageSize)
  {
    return paramString + "_" + paramImageSize.getWidth() + "x" + paramImageSize.getHeight();
  }
}
