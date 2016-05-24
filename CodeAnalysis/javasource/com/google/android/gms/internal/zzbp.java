package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.PriorityQueue;

public class zzbp
{
  static long zza(int paramInt1, int paramInt2, long paramLong1, long paramLong2, long paramLong3)
  {
    return ((paramLong1 + 1073807359L - (paramInt1 + 2147483647L) % 1073807359L * paramLong2 % 1073807359L) % 1073807359L * paramLong3 % 1073807359L + (paramInt2 + 2147483647L) % 1073807359L) % 1073807359L;
  }
  
  static long zza(long paramLong, int paramInt)
  {
    long l;
    if (paramInt == 0) {
      l = 1L;
    }
    do
    {
      return l;
      l = paramLong;
    } while (paramInt == 1);
    if (paramInt % 2 == 0) {
      return zza(paramLong * paramLong % 1073807359L, paramInt / 2) % 1073807359L;
    }
    return zza(paramLong * paramLong % 1073807359L, paramInt / 2) % 1073807359L * paramLong % 1073807359L;
  }
  
  static String zza(String[] paramArrayOfString, int paramInt1, int paramInt2)
  {
    if (paramArrayOfString.length < paramInt1 + paramInt2)
    {
      zzb.e("Unable to construct shingle");
      return "";
    }
    StringBuffer localStringBuffer = new StringBuffer();
    int i = paramInt1;
    while (i < paramInt1 + paramInt2 - 1)
    {
      localStringBuffer.append(paramArrayOfString[i]);
      localStringBuffer.append(' ');
      i += 1;
    }
    localStringBuffer.append(paramArrayOfString[(paramInt1 + paramInt2 - 1)]);
    return localStringBuffer.toString();
  }
  
  static void zza(int paramInt, long paramLong, String paramString, PriorityQueue<zza> paramPriorityQueue)
  {
    paramString = new zza(paramLong, paramString);
    if ((paramPriorityQueue.size() == paramInt) && (peekvalue > value)) {}
    do
    {
      do
      {
        return;
      } while (paramPriorityQueue.contains(paramString));
      paramPriorityQueue.add(paramString);
    } while (paramPriorityQueue.size() <= paramInt);
    paramPriorityQueue.poll();
  }
  
  public static void zza(String[] paramArrayOfString, int paramInt1, int paramInt2, PriorityQueue<zza> paramPriorityQueue)
  {
    long l1 = zzb(paramArrayOfString, 0, paramInt2);
    zza(paramInt1, l1, zza(paramArrayOfString, 0, paramInt2), paramPriorityQueue);
    long l2 = zza(16785407L, paramInt2 - 1);
    int i = 1;
    while (i < paramArrayOfString.length - paramInt2 + 1)
    {
      l1 = zza(zzbn.zzC(paramArrayOfString[(i - 1)]), zzbn.zzC(paramArrayOfString[(i + paramInt2 - 1)]), l1, l2, 16785407L);
      zza(paramInt1, l1, zza(paramArrayOfString, i, paramInt2), paramPriorityQueue);
      i += 1;
    }
  }
  
  private static long zzb(String[] paramArrayOfString, int paramInt1, int paramInt2)
  {
    long l = (zzbn.zzC(paramArrayOfString[paramInt1]) + 2147483647L) % 1073807359L;
    int i = paramInt1 + 1;
    while (i < paramInt1 + paramInt2)
    {
      l = (l * 16785407L % 1073807359L + (zzbn.zzC(paramArrayOfString[i]) + 2147483647L) % 1073807359L) % 1073807359L;
      i += 1;
    }
    return l;
  }
  
  public static class zza
  {
    final long value;
    final String zzsm;
    
    zza(long paramLong, String paramString)
    {
      value = paramLong;
      zzsm = paramString;
    }
    
    public boolean equals(Object paramObject)
    {
      if ((paramObject == null) || (!(paramObject instanceof zza))) {}
      while (value != value) {
        return false;
      }
      return true;
    }
    
    public int hashCode()
    {
      return (int)value;
    }
  }
}
