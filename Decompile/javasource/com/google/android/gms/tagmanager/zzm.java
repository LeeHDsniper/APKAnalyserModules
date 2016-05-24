package com.google.android.gms.tagmanager;

import android.os.Build.VERSION;

class zzm<K, V>
{
  final zza<K, V> zzaOQ = new zza()
  {
    public int sizeOf(K paramAnonymousK, V paramAnonymousV)
    {
      return 1;
    }
  };
  
  public zzm() {}
  
  public zzl<K, V> zza(int paramInt, zza<K, V> paramZza)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (zzzz() < 12) {
      return new zzcw(paramInt, paramZza);
    }
    return new zzba(paramInt, paramZza);
  }
  
  int zzzz()
  {
    return Build.VERSION.SDK_INT;
  }
  
  public static abstract interface zza<K, V>
  {
    public abstract int sizeOf(K paramK, V paramV);
  }
}
