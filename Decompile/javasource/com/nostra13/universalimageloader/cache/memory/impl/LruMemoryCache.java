package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class LruMemoryCache
  implements MemoryCache
{
  private final LinkedHashMap<String, Bitmap> map;
  private final int maxSize;
  private int size;
  
  public LruMemoryCache(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    maxSize = paramInt;
    map = new LinkedHashMap(0, 0.75F, true);
  }
  
  private int sizeOf(String paramString, Bitmap paramBitmap)
  {
    return paramBitmap.getRowBytes() * paramBitmap.getHeight();
  }
  
  private void trimToSize(int paramInt)
  {
    try
    {
      if ((size < 0) || ((map.isEmpty()) && (size != 0))) {
        throw new IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
      }
    }
    finally
    {
      throw localObject1;
      if ((size <= paramInt) || (map.isEmpty())) {
        return;
      }
      Object localObject2 = (Map.Entry)map.entrySet().iterator().next();
      if (localObject2 == null) {
        return;
      }
      String str = (String)((Map.Entry)localObject2).getKey();
      localObject2 = (Bitmap)((Map.Entry)localObject2).getValue();
      map.remove(str);
      size -= sizeOf(str, (Bitmap)localObject2);
    }
  }
  
  public final Bitmap get(String paramString)
  {
    if (paramString == null) {
      throw new NullPointerException("key == null");
    }
    try
    {
      paramString = (Bitmap)map.get(paramString);
      return paramString;
    }
    finally {}
  }
  
  public Collection<String> keys()
  {
    try
    {
      HashSet localHashSet = new HashSet(map.keySet());
      return localHashSet;
    }
    finally {}
  }
  
  public final boolean put(String paramString, Bitmap paramBitmap)
  {
    if ((paramString == null) || (paramBitmap == null)) {
      throw new NullPointerException("key == null || value == null");
    }
    try
    {
      size += sizeOf(paramString, paramBitmap);
      paramBitmap = (Bitmap)map.put(paramString, paramBitmap);
      if (paramBitmap != null) {
        size -= sizeOf(paramString, paramBitmap);
      }
      trimToSize(maxSize);
      return true;
    }
    finally {}
  }
  
  public final void remove(String paramString)
  {
    if (paramString == null) {
      throw new NullPointerException("key == null");
    }
    try
    {
      Bitmap localBitmap = (Bitmap)map.remove(paramString);
      if (localBitmap != null) {
        size -= sizeOf(paramString, localBitmap);
      }
      return;
    }
    finally {}
  }
  
  public final String toString()
  {
    try
    {
      String str = String.format("LruCache[maxSize=%d]", new Object[] { Integer.valueOf(maxSize) });
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
