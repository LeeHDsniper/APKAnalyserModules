package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Array;

public class zzrs<M extends zzrr<M>, T>
{
  public final int tag;
  protected final int type;
  protected final Class<T> zzbcb;
  protected final boolean zzbcc;
  
  int zzS(Object paramObject)
  {
    if (zzbcc) {
      return zzT(paramObject);
    }
    return zzU(paramObject);
  }
  
  protected int zzT(Object paramObject)
  {
    int j = 0;
    int m = Array.getLength(paramObject);
    int i = 0;
    while (i < m)
    {
      int k = j;
      if (Array.get(paramObject, i) != null) {
        k = j + zzU(Array.get(paramObject, i));
      }
      i += 1;
      j = k;
    }
    return j;
  }
  
  protected int zzU(Object paramObject)
  {
    int i = zzsa.zzlE(tag);
    switch (type)
    {
    default: 
      throw new IllegalArgumentException("Unknown type " + type);
    case 10: 
      return zzrq.zzb(i, (zzrx)paramObject);
    }
    return zzrq.zzc(i, (zzrx)paramObject);
  }
  
  void zza(Object paramObject, zzrq paramZzrq)
    throws IOException
  {
    if (zzbcc)
    {
      zzc(paramObject, paramZzrq);
      return;
    }
    zzb(paramObject, paramZzrq);
  }
  
  protected void zzb(Object paramObject, zzrq paramZzrq)
  {
    for (;;)
    {
      try
      {
        paramZzrq.zzlw(tag);
        switch (type)
        {
        case 10: 
          throw new IllegalArgumentException("Unknown type " + type);
        }
      }
      catch (IOException paramObject)
      {
        throw new IllegalStateException(paramObject);
      }
      paramObject = (zzrx)paramObject;
      int i = zzsa.zzlE(tag);
      paramZzrq.zzb(paramObject);
      paramZzrq.zzD(i, 4);
      return;
      paramZzrq.zzc((zzrx)paramObject);
      return;
    }
  }
  
  protected void zzc(Object paramObject, zzrq paramZzrq)
  {
    int j = Array.getLength(paramObject);
    int i = 0;
    while (i < j)
    {
      Object localObject = Array.get(paramObject, i);
      if (localObject != null) {
        zzb(localObject, paramZzrq);
      }
      i += 1;
    }
  }
}
