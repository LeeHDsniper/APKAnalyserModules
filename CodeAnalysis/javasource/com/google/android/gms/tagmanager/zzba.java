package com.google.android.gms.tagmanager;

import android.util.LruCache;

class zzba<K, V>
  implements zzl<K, V>
{
  private LruCache<K, V> zzaQy;
  
  zzba(int paramInt, final zzm.zza<K, V> paramZza)
  {
    zzaQy = new LruCache(paramInt)
    {
      protected int sizeOf(K paramAnonymousK, V paramAnonymousV)
      {
        return paramZza.sizeOf(paramAnonymousK, paramAnonymousV);
      }
    };
  }
  
  public V get(K paramK)
  {
    return zzaQy.get(paramK);
  }
  
  public void zzf(K paramK, V paramV)
  {
    zzaQy.put(paramK, paramV);
  }
}
