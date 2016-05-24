package com.google.android.gms.internal;

class zzrt
  implements Cloneable
{
  private static final zzru zzbcd = new zzru();
  private int mSize;
  private boolean zzbce = false;
  private int[] zzbcf;
  private zzru[] zzbcg;
  
  public zzrt()
  {
    this(10);
  }
  
  public zzrt(int paramInt)
  {
    paramInt = idealIntArraySize(paramInt);
    zzbcf = new int[paramInt];
    zzbcg = new zzru[paramInt];
    mSize = 0;
  }
  
  private void gc()
  {
    int m = mSize;
    int[] arrayOfInt = zzbcf;
    zzru[] arrayOfZzru = zzbcg;
    int i = 0;
    int k;
    for (int j = 0; i < m; j = k)
    {
      zzru localZzru = arrayOfZzru[i];
      k = j;
      if (localZzru != zzbcd)
      {
        if (i != j)
        {
          arrayOfInt[j] = arrayOfInt[i];
          arrayOfZzru[j] = localZzru;
          arrayOfZzru[i] = null;
        }
        k = j + 1;
      }
      i += 1;
    }
    zzbce = false;
    mSize = j;
  }
  
  private int idealByteArraySize(int paramInt)
  {
    int i = 4;
    for (;;)
    {
      int j = paramInt;
      if (i < 32)
      {
        if (paramInt <= (1 << i) - 12) {
          j = (1 << i) - 12;
        }
      }
      else {
        return j;
      }
      i += 1;
    }
  }
  
  private int idealIntArraySize(int paramInt)
  {
    return idealByteArraySize(paramInt * 4) / 4;
  }
  
  private boolean zza(int[] paramArrayOfInt1, int[] paramArrayOfInt2, int paramInt)
  {
    int i = 0;
    while (i < paramInt)
    {
      if (paramArrayOfInt1[i] != paramArrayOfInt2[i]) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  private boolean zza(zzru[] paramArrayOfZzru1, zzru[] paramArrayOfZzru2, int paramInt)
  {
    int i = 0;
    while (i < paramInt)
    {
      if (!paramArrayOfZzru1[i].equals(paramArrayOfZzru2[i])) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  private int zzlC(int paramInt)
  {
    int i = 0;
    int j = mSize - 1;
    while (i <= j)
    {
      int k = i + j >>> 1;
      int m = zzbcf[k];
      if (m < paramInt) {
        i = k + 1;
      } else if (m > paramInt) {
        j = k - 1;
      } else {
        return k;
      }
    }
    return i ^ 0xFFFFFFFF;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof zzrt)) {
        return false;
      }
      paramObject = (zzrt)paramObject;
      if (size() != paramObject.size()) {
        return false;
      }
    } while ((zza(zzbcf, zzbcf, mSize)) && (zza(zzbcg, zzbcg, mSize)));
    return false;
  }
  
  public int hashCode()
  {
    if (zzbce) {
      gc();
    }
    int j = 17;
    int i = 0;
    while (i < mSize)
    {
      j = (j * 31 + zzbcf[i]) * 31 + zzbcg[i].hashCode();
      i += 1;
    }
    return j;
  }
  
  public boolean isEmpty()
  {
    return size() == 0;
  }
  
  public int size()
  {
    if (zzbce) {
      gc();
    }
    return mSize;
  }
  
  public final zzrt zzDn()
  {
    int i = 0;
    int j = size();
    zzrt localZzrt = new zzrt(j);
    System.arraycopy(zzbcf, 0, zzbcf, 0, j);
    while (i < j)
    {
      if (zzbcg[i] != null) {
        zzbcg[i] = zzbcg[i].zzDo();
      }
      i += 1;
    }
    mSize = j;
    return localZzrt;
  }
  
  public void zza(int paramInt, zzru paramZzru)
  {
    int i = zzlC(paramInt);
    if (i >= 0)
    {
      zzbcg[i] = paramZzru;
      return;
    }
    int j = i ^ 0xFFFFFFFF;
    if ((j < mSize) && (zzbcg[j] == zzbcd))
    {
      zzbcf[j] = paramInt;
      zzbcg[j] = paramZzru;
      return;
    }
    i = j;
    if (zzbce)
    {
      i = j;
      if (mSize >= zzbcf.length)
      {
        gc();
        i = zzlC(paramInt) ^ 0xFFFFFFFF;
      }
    }
    if (mSize >= zzbcf.length)
    {
      j = idealIntArraySize(mSize + 1);
      int[] arrayOfInt = new int[j];
      zzru[] arrayOfZzru = new zzru[j];
      System.arraycopy(zzbcf, 0, arrayOfInt, 0, zzbcf.length);
      System.arraycopy(zzbcg, 0, arrayOfZzru, 0, zzbcg.length);
      zzbcf = arrayOfInt;
      zzbcg = arrayOfZzru;
    }
    if (mSize - i != 0)
    {
      System.arraycopy(zzbcf, i, zzbcf, i + 1, mSize - i);
      System.arraycopy(zzbcg, i, zzbcg, i + 1, mSize - i);
    }
    zzbcf[i] = paramInt;
    zzbcg[i] = paramZzru;
    mSize += 1;
  }
  
  public zzru zzlA(int paramInt)
  {
    paramInt = zzlC(paramInt);
    if ((paramInt < 0) || (zzbcg[paramInt] == zzbcd)) {
      return null;
    }
    return zzbcg[paramInt];
  }
  
  public zzru zzlB(int paramInt)
  {
    if (zzbce) {
      gc();
    }
    return zzbcg[paramInt];
  }
}
