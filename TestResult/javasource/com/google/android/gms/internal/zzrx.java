package com.google.android.gms.internal;

import java.io.IOException;

public abstract class zzrx
{
  protected volatile int zzbcl = -1;
  
  public zzrx() {}
  
  public static final <T extends zzrx> T zza(T paramT, byte[] paramArrayOfByte)
    throws zzrw
  {
    return zzb(paramT, paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static final <T extends zzrx> T zzb(T paramT, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws zzrw
  {
    try
    {
      paramArrayOfByte = zzrp.zza(paramArrayOfByte, paramInt1, paramInt2);
      paramT.zzb(paramArrayOfByte);
      paramArrayOfByte.zzli(0);
      return paramT;
    }
    catch (zzrw paramT)
    {
      throw paramT;
    }
    catch (IOException paramT)
    {
      throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).");
    }
  }
  
  public String toString()
  {
    return zzry.zzg(this);
  }
  
  protected int zzB()
  {
    return 0;
  }
  
  public zzrx zzDm()
    throws CloneNotSupportedException
  {
    return (zzrx)super.clone();
  }
  
  public int zzDw()
  {
    if (zzbcl < 0) {
      zzDx();
    }
    return zzbcl;
  }
  
  public int zzDx()
  {
    int i = zzB();
    zzbcl = i;
    return i;
  }
  
  public void zza(zzrq paramZzrq)
    throws IOException
  {}
  
  public abstract zzrx zzb(zzrp paramZzrp)
    throws IOException;
}
