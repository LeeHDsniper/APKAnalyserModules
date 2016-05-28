package com.google.android.gms.internal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

class zzru
  implements Cloneable
{
  private zzrs<?, ?> zzbch;
  private Object zzbci;
  private List<zzrz> zzbcj = new ArrayList();
  
  zzru() {}
  
  private byte[] toByteArray()
    throws IOException
  {
    byte[] arrayOfByte = new byte[zzB()];
    zza(zzrq.zzA(arrayOfByte));
    return arrayOfByte;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1;
    if (paramObject == this) {
      bool1 = true;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (!(paramObject instanceof zzru));
      paramObject = (zzru)paramObject;
      if ((zzbci == null) || (zzbci == null)) {
        break;
      }
      bool1 = bool2;
    } while (zzbch != zzbch);
    if (!zzbch.zzbcb.isArray()) {
      return zzbci.equals(zzbci);
    }
    if ((zzbci instanceof byte[])) {
      return Arrays.equals((byte[])zzbci, (byte[])zzbci);
    }
    if ((zzbci instanceof int[])) {
      return Arrays.equals((int[])zzbci, (int[])zzbci);
    }
    if ((zzbci instanceof long[])) {
      return Arrays.equals((long[])zzbci, (long[])zzbci);
    }
    if ((zzbci instanceof float[])) {
      return Arrays.equals((float[])zzbci, (float[])zzbci);
    }
    if ((zzbci instanceof double[])) {
      return Arrays.equals((double[])zzbci, (double[])zzbci);
    }
    if ((zzbci instanceof boolean[])) {
      return Arrays.equals((boolean[])zzbci, (boolean[])zzbci);
    }
    return Arrays.deepEquals((Object[])zzbci, (Object[])zzbci);
    if ((zzbcj != null) && (zzbcj != null)) {
      return zzbcj.equals(zzbcj);
    }
    try
    {
      bool1 = Arrays.equals(toByteArray(), paramObject.toByteArray());
      return bool1;
    }
    catch (IOException paramObject)
    {
      throw new IllegalStateException(paramObject);
    }
  }
  
  public int hashCode()
  {
    try
    {
      int i = Arrays.hashCode(toByteArray());
      return i + 527;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  int zzB()
  {
    int j;
    if (zzbci != null)
    {
      j = zzbch.zzS(zzbci);
      return j;
    }
    Iterator localIterator = zzbcj.iterator();
    for (int i = 0;; i = ((zzrz)localIterator.next()).zzB() + i)
    {
      j = i;
      if (!localIterator.hasNext()) {
        break;
      }
    }
  }
  
  public final zzru zzDo()
  {
    int i = 0;
    zzru localZzru = new zzru();
    try
    {
      zzbch = zzbch;
      if (zzbcj == null) {
        zzbcj = null;
      }
      while (zzbci == null)
      {
        return localZzru;
        zzbcj.addAll(zzbcj);
      }
      if (!(zzbci instanceof zzrx)) {
        break label92;
      }
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      throw new AssertionError(localCloneNotSupportedException);
    }
    zzbci = ((zzrx)zzbci).zzDm();
    return localCloneNotSupportedException;
    label92:
    if ((zzbci instanceof byte[]))
    {
      zzbci = ((byte[])zzbci).clone();
      return localCloneNotSupportedException;
    }
    Object localObject1;
    Object localObject2;
    if ((zzbci instanceof byte[][]))
    {
      localObject1 = (byte[][])zzbci;
      localObject2 = new byte[localObject1.length][];
      zzbci = localObject2;
      i = 0;
      while (i < localObject1.length)
      {
        localObject2[i] = ((byte[])localObject1[i].clone());
        i += 1;
      }
    }
    if ((zzbci instanceof boolean[]))
    {
      zzbci = ((boolean[])zzbci).clone();
      return localCloneNotSupportedException;
    }
    if ((zzbci instanceof int[]))
    {
      zzbci = ((int[])zzbci).clone();
      return localCloneNotSupportedException;
    }
    if ((zzbci instanceof long[]))
    {
      zzbci = ((long[])zzbci).clone();
      return localCloneNotSupportedException;
    }
    if ((zzbci instanceof float[]))
    {
      zzbci = ((float[])zzbci).clone();
      return localCloneNotSupportedException;
    }
    if ((zzbci instanceof double[]))
    {
      zzbci = ((double[])zzbci).clone();
      return localCloneNotSupportedException;
    }
    if ((zzbci instanceof zzrx[]))
    {
      localObject1 = (zzrx[])zzbci;
      localObject2 = new zzrx[localObject1.length];
      zzbci = localObject2;
      while (i < localObject1.length)
      {
        localObject2[i] = localObject1[i].zzDm();
        i += 1;
      }
    }
    return localCloneNotSupportedException;
  }
  
  void zza(zzrq paramZzrq)
    throws IOException
  {
    if (zzbci != null) {
      zzbch.zza(zzbci, paramZzrq);
    }
    for (;;)
    {
      return;
      Iterator localIterator = zzbcj.iterator();
      while (localIterator.hasNext()) {
        ((zzrz)localIterator.next()).zza(paramZzrq);
      }
    }
  }
  
  void zza(zzrz paramZzrz)
  {
    zzbcj.add(paramZzrz);
  }
}
