package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class zzlf<K, V>
{
  private int size;
  private int zzaeA;
  private int zzaeB;
  private int zzaeC;
  private int zzaeD;
  private final LinkedHashMap<K, V> zzaex;
  private int zzaey;
  private int zzaez;
  
  private int zzc(K paramK, V paramV)
  {
    int i = sizeOf(paramK, paramV);
    if (i < 0) {
      throw new IllegalStateException("Negative size: " + paramK + "=" + paramV);
    }
    return i;
  }
  
  protected V create(K paramK)
  {
    return null;
  }
  
  protected void entryRemoved(boolean paramBoolean, K paramK, V paramV1, V paramV2) {}
  
  public final void evictAll()
  {
    trimToSize(-1);
  }
  
  public final V get(K paramK)
  {
    if (paramK == null) {
      throw new NullPointerException("key == null");
    }
    Object localObject1;
    try
    {
      localObject1 = zzaex.get(paramK);
      if (localObject1 != null)
      {
        zzaeC += 1;
        return localObject1;
      }
      zzaeD += 1;
      localObject1 = create(paramK);
      if (localObject1 == null) {
        return null;
      }
    }
    finally {}
    try
    {
      zzaeA += 1;
      Object localObject2 = zzaex.put(paramK, localObject1);
      if (localObject2 != null) {
        zzaex.put(paramK, localObject2);
      }
      for (;;)
      {
        if (localObject2 == null) {
          break;
        }
        entryRemoved(false, paramK, localObject1, localObject2);
        return localObject2;
        size += zzc(paramK, localObject1);
      }
      trimToSize(zzaey);
    }
    finally {}
    return localObject1;
  }
  
  public final V put(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null)) {
      throw new NullPointerException("key == null || value == null");
    }
    try
    {
      zzaez += 1;
      size += zzc(paramK, paramV);
      Object localObject = zzaex.put(paramK, paramV);
      if (localObject != null) {
        size -= zzc(paramK, localObject);
      }
      if (localObject != null) {
        entryRemoved(false, paramK, localObject, paramV);
      }
      trimToSize(zzaey);
      return localObject;
    }
    finally {}
  }
  
  protected int sizeOf(K paramK, V paramV)
  {
    return 1;
  }
  
  public final String toString()
  {
    int i = 0;
    try
    {
      int j = zzaeC + zzaeD;
      if (j != 0) {
        i = zzaeC * 100 / j;
      }
      String str = String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", new Object[] { Integer.valueOf(zzaey), Integer.valueOf(zzaeC), Integer.valueOf(zzaeD), Integer.valueOf(i) });
      return str;
    }
    finally {}
  }
  
  public void trimToSize(int paramInt)
  {
    Object localObject3;
    Object localObject2;
    try
    {
      if ((size < 0) || ((zzaex.isEmpty()) && (size != 0))) {
        throw new IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
      }
    }
    finally
    {
      throw localObject1;
      if ((size <= paramInt) || (zzaex.isEmpty())) {
        return;
      }
      localObject3 = (Map.Entry)zzaex.entrySet().iterator().next();
      localObject2 = ((Map.Entry)localObject3).getKey();
      localObject3 = ((Map.Entry)localObject3).getValue();
      zzaex.remove(localObject2);
      size -= zzc(localObject2, localObject3);
      zzaeB += 1;
    }
  }
}
