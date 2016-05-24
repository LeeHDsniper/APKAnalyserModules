package it.sephiroth.android.library.picasso;

import android.content.Context;
import android.graphics.Bitmap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class LruCache
  implements Cache
{
  private int evictionCount;
  private int hitCount;
  final LinkedHashMap<String, Bitmap> map;
  private final int maxSize;
  private int missCount;
  private int putCount;
  private int size;
  
  public LruCache(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("Max size must be positive.");
    }
    maxSize = paramInt;
    map = new LinkedHashMap(0, 0.75F, true);
  }
  
  public LruCache(Context paramContext)
  {
    this(Utils.calculateMemoryCacheSize(paramContext));
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
      String str = (String)((Map.Entry)localObject2).getKey();
      localObject2 = (Bitmap)((Map.Entry)localObject2).getValue();
      map.remove(str);
      size -= Utils.getBitmapBytes((Bitmap)localObject2);
      evictionCount += 1;
    }
  }
  
  public final void clear()
  {
    try
    {
      evictAll();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void evictAll()
  {
    trimToSize(-1);
  }
  
  public Bitmap get(String paramString)
  {
    if (paramString == null) {
      throw new NullPointerException("key == null");
    }
    try
    {
      paramString = (Bitmap)map.get(paramString);
      if (paramString != null)
      {
        hitCount += 1;
        return paramString;
      }
      missCount += 1;
      return null;
    }
    finally {}
  }
  
  public final int maxSize()
  {
    try
    {
      int i = maxSize;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void set(String paramString, Bitmap paramBitmap)
  {
    if ((paramString == null) || (paramBitmap == null)) {
      throw new NullPointerException("key == null || bitmap == null");
    }
    try
    {
      putCount += 1;
      size += Utils.getBitmapBytes(paramBitmap);
      paramString = (Bitmap)map.put(paramString, paramBitmap);
      if (paramString != null) {
        size -= Utils.getBitmapBytes(paramString);
      }
      trimToSize(maxSize);
      return;
    }
    finally {}
  }
  
  public final int size()
  {
    try
    {
      int i = size;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
