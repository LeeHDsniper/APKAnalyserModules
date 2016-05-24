package com.google.android.gms.internal;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

abstract class zzlg<K, V>
{
  zzlg<K, V>.zzb zzaeE;
  zzlg<K, V>.zzc zzaeF;
  zzlg<K, V>.zze zzaeG;
  
  zzlg() {}
  
  public static <K, V> boolean containsAllHelper(Map<K, V> paramMap, Collection<?> paramCollection)
  {
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext()) {
      if (!paramMap.containsKey(paramCollection.next())) {
        return false;
      }
    }
    return true;
  }
  
  public static <T> boolean equalsSetHelper(Set<T> paramSet, Object paramObject)
  {
    boolean bool2 = true;
    boolean bool1 = false;
    if (paramSet == paramObject) {
      bool1 = true;
    }
    while (!(paramObject instanceof Set)) {
      return bool1;
    }
    paramObject = (Set)paramObject;
    try
    {
      if (paramSet.size() == paramObject.size())
      {
        bool1 = paramSet.containsAll(paramObject);
        if (!bool1) {}
      }
      for (bool1 = bool2;; bool1 = false) {
        return bool1;
      }
      return false;
    }
    catch (ClassCastException paramSet)
    {
      return false;
    }
    catch (NullPointerException paramSet) {}
  }
  
  public static <K, V> boolean removeAllHelper(Map<K, V> paramMap, Collection<?> paramCollection)
  {
    int i = paramMap.size();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext()) {
      paramMap.remove(paramCollection.next());
    }
    return i != paramMap.size();
  }
  
  public static <K, V> boolean retainAllHelper(Map<K, V> paramMap, Collection<?> paramCollection)
  {
    int i = paramMap.size();
    Iterator localIterator = paramMap.keySet().iterator();
    while (localIterator.hasNext()) {
      if (!paramCollection.contains(localIterator.next())) {
        localIterator.remove();
      }
    }
    return i != paramMap.size();
  }
  
  protected abstract void colClear();
  
  protected abstract Object colGetEntry(int paramInt1, int paramInt2);
  
  protected abstract Map<K, V> colGetMap();
  
  protected abstract int colGetSize();
  
  protected abstract int colIndexOfKey(Object paramObject);
  
  protected abstract int colIndexOfValue(Object paramObject);
  
  protected abstract void colPut(K paramK, V paramV);
  
  protected abstract void colRemoveAt(int paramInt);
  
  protected abstract V colSetValue(int paramInt, V paramV);
  
  public Set<Map.Entry<K, V>> getEntrySet()
  {
    if (zzaeE == null) {
      zzaeE = new zzb();
    }
    return zzaeE;
  }
  
  public Set<K> getKeySet()
  {
    if (zzaeF == null) {
      zzaeF = new zzc();
    }
    return zzaeF;
  }
  
  public Collection<V> getValues()
  {
    if (zzaeG == null) {
      zzaeG = new zze();
    }
    return zzaeG;
  }
  
  public Object[] toArrayHelper(int paramInt)
  {
    int j = colGetSize();
    Object[] arrayOfObject = new Object[j];
    int i = 0;
    while (i < j)
    {
      arrayOfObject[i] = colGetEntry(i, paramInt);
      i += 1;
    }
    return arrayOfObject;
  }
  
  public <T> T[] toArrayHelper(T[] paramArrayOfT, int paramInt)
  {
    int j = colGetSize();
    Object localObject = paramArrayOfT;
    if (paramArrayOfT.length < j) {
      localObject = (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), j);
    }
    int i = 0;
    while (i < j)
    {
      localObject[i] = colGetEntry(i, paramInt);
      i += 1;
    }
    if (localObject.length > j) {
      localObject[j] = null;
    }
    return localObject;
  }
  
  final class zza<T>
    implements Iterator<T>
  {
    boolean mCanRemove = false;
    int mIndex;
    final int mOffset;
    int mSize;
    
    zza(int paramInt)
    {
      mOffset = paramInt;
      mSize = colGetSize();
    }
    
    public boolean hasNext()
    {
      return mIndex < mSize;
    }
    
    public T next()
    {
      Object localObject = colGetEntry(mIndex, mOffset);
      mIndex += 1;
      mCanRemove = true;
      return localObject;
    }
    
    public void remove()
    {
      if (!mCanRemove) {
        throw new IllegalStateException();
      }
      mIndex -= 1;
      mSize -= 1;
      mCanRemove = false;
      colRemoveAt(mIndex);
    }
  }
  
  final class zzb
    implements Set<Map.Entry<K, V>>
  {
    zzb() {}
    
    public boolean add(Map.Entry<K, V> paramEntry)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean addAll(Collection<? extends Map.Entry<K, V>> paramCollection)
    {
      int i = colGetSize();
      paramCollection = paramCollection.iterator();
      while (paramCollection.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramCollection.next();
        colPut(localEntry.getKey(), localEntry.getValue());
      }
      return i != colGetSize();
    }
    
    public void clear()
    {
      colClear();
    }
    
    public boolean contains(Object paramObject)
    {
      if (!(paramObject instanceof Map.Entry)) {}
      int i;
      do
      {
        return false;
        paramObject = (Map.Entry)paramObject;
        i = colIndexOfKey(paramObject.getKey());
      } while (i < 0);
      return zzle.equal(colGetEntry(i, 1), paramObject.getValue());
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      paramCollection = paramCollection.iterator();
      while (paramCollection.hasNext()) {
        if (!contains(paramCollection.next())) {
          return false;
        }
      }
      return true;
    }
    
    public boolean equals(Object paramObject)
    {
      return zzlg.equalsSetHelper(this, paramObject);
    }
    
    public int hashCode()
    {
      int j = colGetSize() - 1;
      int i = 0;
      if (j >= 0)
      {
        Object localObject1 = colGetEntry(j, 0);
        Object localObject2 = colGetEntry(j, 1);
        int k;
        if (localObject1 == null)
        {
          k = 0;
          label45:
          if (localObject2 != null) {
            break label76;
          }
        }
        label76:
        for (int m = 0;; m = localObject2.hashCode())
        {
          j -= 1;
          i += (m ^ k);
          break;
          k = localObject1.hashCode();
          break label45;
        }
      }
      return i;
    }
    
    public boolean isEmpty()
    {
      return colGetSize() == 0;
    }
    
    public Iterator<Map.Entry<K, V>> iterator()
    {
      return new zzlg.zzd(zzlg.this);
    }
    
    public boolean remove(Object paramObject)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      throw new UnsupportedOperationException();
    }
    
    public int size()
    {
      return colGetSize();
    }
    
    public Object[] toArray()
    {
      throw new UnsupportedOperationException();
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      throw new UnsupportedOperationException();
    }
  }
  
  final class zzc
    implements Set<K>
  {
    zzc() {}
    
    public boolean add(K paramK)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean addAll(Collection<? extends K> paramCollection)
    {
      throw new UnsupportedOperationException();
    }
    
    public void clear()
    {
      colClear();
    }
    
    public boolean contains(Object paramObject)
    {
      return colIndexOfKey(paramObject) >= 0;
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      return zzlg.containsAllHelper(colGetMap(), paramCollection);
    }
    
    public boolean equals(Object paramObject)
    {
      return zzlg.equalsSetHelper(this, paramObject);
    }
    
    public int hashCode()
    {
      int i = colGetSize() - 1;
      int j = 0;
      if (i >= 0)
      {
        Object localObject = colGetEntry(i, 0);
        if (localObject == null) {}
        for (int k = 0;; k = localObject.hashCode())
        {
          j += k;
          i -= 1;
          break;
        }
      }
      return j;
    }
    
    public boolean isEmpty()
    {
      return colGetSize() == 0;
    }
    
    public Iterator<K> iterator()
    {
      return new zzlg.zza(zzlg.this, 0);
    }
    
    public boolean remove(Object paramObject)
    {
      int i = colIndexOfKey(paramObject);
      if (i >= 0)
      {
        colRemoveAt(i);
        return true;
      }
      return false;
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      return zzlg.removeAllHelper(colGetMap(), paramCollection);
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return zzlg.retainAllHelper(colGetMap(), paramCollection);
    }
    
    public int size()
    {
      return colGetSize();
    }
    
    public Object[] toArray()
    {
      return toArrayHelper(0);
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return toArrayHelper(paramArrayOfT, 0);
    }
  }
  
  final class zzd
    implements Iterator<Map.Entry<K, V>>, Map.Entry<K, V>
  {
    int mEnd = colGetSize() - 1;
    boolean mEntryValid = false;
    int mIndex = -1;
    
    zzd() {}
    
    public final boolean equals(Object paramObject)
    {
      boolean bool = true;
      if (!mEntryValid) {
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
      }
      if (!(paramObject instanceof Map.Entry)) {
        return false;
      }
      paramObject = (Map.Entry)paramObject;
      if ((zzle.equal(paramObject.getKey(), colGetEntry(mIndex, 0))) && (zzle.equal(paramObject.getValue(), colGetEntry(mIndex, 1)))) {}
      for (;;)
      {
        return bool;
        bool = false;
      }
    }
    
    public K getKey()
    {
      if (!mEntryValid) {
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
      }
      return colGetEntry(mIndex, 0);
    }
    
    public V getValue()
    {
      if (!mEntryValid) {
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
      }
      return colGetEntry(mIndex, 1);
    }
    
    public boolean hasNext()
    {
      return mIndex < mEnd;
    }
    
    public final int hashCode()
    {
      int j = 0;
      if (!mEntryValid) {
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
      }
      Object localObject1 = colGetEntry(mIndex, 0);
      Object localObject2 = colGetEntry(mIndex, 1);
      int i;
      if (localObject1 == null)
      {
        i = 0;
        if (localObject2 != null) {
          break label69;
        }
      }
      for (;;)
      {
        return j ^ i;
        i = localObject1.hashCode();
        break;
        label69:
        j = localObject2.hashCode();
      }
    }
    
    public Map.Entry<K, V> next()
    {
      mIndex += 1;
      mEntryValid = true;
      return this;
    }
    
    public void remove()
    {
      if (!mEntryValid) {
        throw new IllegalStateException();
      }
      colRemoveAt(mIndex);
      mIndex -= 1;
      mEnd -= 1;
      mEntryValid = false;
    }
    
    public V setValue(V paramV)
    {
      if (!mEntryValid) {
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
      }
      return colSetValue(mIndex, paramV);
    }
    
    public final String toString()
    {
      return getKey() + "=" + getValue();
    }
  }
  
  final class zze
    implements Collection<V>
  {
    zze() {}
    
    public boolean add(V paramV)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean addAll(Collection<? extends V> paramCollection)
    {
      throw new UnsupportedOperationException();
    }
    
    public void clear()
    {
      colClear();
    }
    
    public boolean contains(Object paramObject)
    {
      return colIndexOfValue(paramObject) >= 0;
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      paramCollection = paramCollection.iterator();
      while (paramCollection.hasNext()) {
        if (!contains(paramCollection.next())) {
          return false;
        }
      }
      return true;
    }
    
    public boolean isEmpty()
    {
      return colGetSize() == 0;
    }
    
    public Iterator<V> iterator()
    {
      return new zzlg.zza(zzlg.this, 1);
    }
    
    public boolean remove(Object paramObject)
    {
      int i = colIndexOfValue(paramObject);
      if (i >= 0)
      {
        colRemoveAt(i);
        return true;
      }
      return false;
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      int i = 0;
      int j = colGetSize();
      boolean bool = false;
      while (i < j)
      {
        int m = i;
        int k = j;
        if (paramCollection.contains(colGetEntry(i, 1)))
        {
          colRemoveAt(i);
          m = i - 1;
          k = j - 1;
          bool = true;
        }
        i = m + 1;
        j = k;
      }
      return bool;
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      int i = 0;
      int j = colGetSize();
      boolean bool = false;
      while (i < j)
      {
        int m = i;
        int k = j;
        if (!paramCollection.contains(colGetEntry(i, 1)))
        {
          colRemoveAt(i);
          m = i - 1;
          k = j - 1;
          bool = true;
        }
        i = m + 1;
        j = k;
      }
      return bool;
    }
    
    public int size()
    {
      return colGetSize();
    }
    
    public Object[] toArray()
    {
      return toArrayHelper(1);
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return toArrayHelper(paramArrayOfT, 1);
    }
  }
}
