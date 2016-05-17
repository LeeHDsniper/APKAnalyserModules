package android.support.v4.util;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class AsyncLruCache<K, V>
{
  private int createCount;
  private int evictionCount;
  private int hitCount;
  private final LinkedHashMap<K, V> map;
  private int maxSize;
  private int missCount;
  private int putCount;
  private int size;
  
  public AsyncLruCache(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    maxSize = paramInt;
    map = new LinkedHashMap(0, 0.75F, true);
  }
  
  private int safeSizeOf(K paramK, V paramV)
  {
    int i = sizeOf(paramK, paramV);
    if (i < 0) {
      throw new IllegalStateException("Negative size: " + paramK + "=" + paramV);
    }
    return i;
  }
  
  public final int cacheCount()
  {
    if (map != null) {
      return map.size();
    }
    return 0;
  }
  
  protected V create(K paramK)
  {
    return null;
  }
  
  public final int createCount()
  {
    return createCount;
  }
  
  protected void entryRemoved(boolean paramBoolean, K paramK, V paramV1, V paramV2) {}
  
  public final void evictAll()
  {
    trimToSize(-1);
  }
  
  public final int evictionCount()
  {
    return evictionCount;
  }
  
  public final V get(K paramK)
  {
    if (paramK == null) {
      throw new NullPointerException("key == null");
    }
    Object localObject1 = map.get(paramK);
    if (localObject1 != null)
    {
      hitCount += 1;
      return localObject1;
    }
    missCount += 1;
    localObject1 = create(paramK);
    if (localObject1 == null) {
      return null;
    }
    createCount += 1;
    Object localObject2 = map.put(paramK, localObject1);
    if (localObject2 != null) {
      map.put(paramK, localObject2);
    }
    while (localObject2 != null)
    {
      entryRemoved(false, paramK, localObject1, localObject2);
      return localObject2;
      size += safeSizeOf(paramK, localObject1);
    }
    trimToSize(maxSize);
    return localObject1;
  }
  
  public final int hitCount()
  {
    return hitCount;
  }
  
  public final int maxSize()
  {
    return maxSize;
  }
  
  public final int missCount()
  {
    return missCount;
  }
  
  public final V put(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null)) {
      throw new NullPointerException("key == null || value == null");
    }
    putCount += 1;
    size += safeSizeOf(paramK, paramV);
    Object localObject = map.put(paramK, paramV);
    if (localObject != null) {
      size -= safeSizeOf(paramK, localObject);
    }
    if (localObject != null) {
      entryRemoved(false, paramK, localObject, paramV);
    }
    trimToSize(maxSize);
    return localObject;
  }
  
  public final int putCount()
  {
    return putCount;
  }
  
  public final V remove(K paramK)
  {
    if (paramK == null) {
      throw new NullPointerException("key == null");
    }
    Object localObject = map.remove(paramK);
    if (localObject != null) {
      size -= safeSizeOf(paramK, localObject);
    }
    if (localObject != null) {
      entryRemoved(false, paramK, localObject, null);
    }
    return localObject;
  }
  
  public final int size()
  {
    return size;
  }
  
  protected int sizeOf(K paramK, V paramV)
  {
    return 1;
  }
  
  public final Map<K, V> snapshot()
  {
    return new LinkedHashMap(map);
  }
  
  public final String toString()
  {
    int i = hitCount + missCount;
    if (i != 0) {}
    for (i = hitCount * 100 / i;; i = 0) {
      return String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", new Object[] { Integer.valueOf(maxSize), Integer.valueOf(hitCount), Integer.valueOf(missCount), Integer.valueOf(i) });
    }
  }
  
  public void trimToSize(int paramInt)
  {
    for (;;)
    {
      if ((size < 0) || ((map.isEmpty()) && (size != 0))) {
        throw new IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
      }
      if ((size <= paramInt) || (map.isEmpty())) {
        return;
      }
      Object localObject2 = (Map.Entry)map.entrySet().iterator().next();
      Object localObject1 = ((Map.Entry)localObject2).getKey();
      localObject2 = ((Map.Entry)localObject2).getValue();
      map.remove(localObject1);
      size -= safeSizeOf(localObject1, localObject2);
      evictionCount += 1;
      entryRemoved(true, localObject1, localObject2, null);
    }
  }
}
