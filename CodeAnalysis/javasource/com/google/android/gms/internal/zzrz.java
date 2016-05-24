package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;

final class zzrz
{
  final int tag;
  final byte[] zzbcm;
  
  zzrz(int paramInt, byte[] paramArrayOfByte)
  {
    tag = paramInt;
    zzbcm = paramArrayOfByte;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof zzrz)) {
        return false;
      }
      paramObject = (zzrz)paramObject;
    } while ((tag == tag) && (Arrays.equals(zzbcm, zzbcm)));
    return false;
  }
  
  public int hashCode()
  {
    return (tag + 527) * 31 + Arrays.hashCode(zzbcm);
  }
  
  int zzB()
  {
    return 0 + zzrq.zzlx(tag) + zzbcm.length;
  }
  
  void zza(zzrq paramZzrq)
    throws IOException
  {
    paramZzrq.zzlw(tag);
    paramZzrq.zzD(zzbcm);
  }
}
