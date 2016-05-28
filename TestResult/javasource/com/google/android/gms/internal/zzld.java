package com.google.android.gms.internal;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzld<K, V>
  extends zzlh<K, V>
  implements Map<K, V>
{
  zzlg<K, V> zzaev;
  
  public zzld() {}
  
  private zzlg<K, V> zzoV()
  {
    if (zzaev == null) {
      zzaev = new zzlg()
      {
        protected void colClear()
        {
          clear();
        }
        
        protected Object colGetEntry(int paramAnonymousInt1, int paramAnonymousInt2)
        {
          return mArray[((paramAnonymousInt1 << 1) + paramAnonymousInt2)];
        }
        
        protected Map<K, V> colGetMap()
        {
          return zzld.this;
        }
        
        protected int colGetSize()
        {
          return mSize;
        }
        
        protected int colIndexOfKey(Object paramAnonymousObject)
        {
          if (paramAnonymousObject == null) {
            return indexOfNull();
          }
          return indexOf(paramAnonymousObject, paramAnonymousObject.hashCode());
        }
        
        protected int colIndexOfValue(Object paramAnonymousObject)
        {
          return indexOfValue(paramAnonymousObject);
        }
        
        protected void colPut(K paramAnonymousK, V paramAnonymousV)
        {
          put(paramAnonymousK, paramAnonymousV);
        }
        
        protected void colRemoveAt(int paramAnonymousInt)
        {
          removeAt(paramAnonymousInt);
        }
        
        protected V colSetValue(int paramAnonymousInt, V paramAnonymousV)
        {
          return setValueAt(paramAnonymousInt, paramAnonymousV);
        }
      };
    }
    return zzaev;
  }
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    return zzoV().getEntrySet();
  }
  
  public Set<K> keySet()
  {
    return zzoV().getKeySet();
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    ensureCapacity(mSize + paramMap.size());
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      put(localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public Collection<V> values()
  {
    return zzoV().getValues();
  }
}
