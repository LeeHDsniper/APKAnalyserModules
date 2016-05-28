package com.google.android.gms.internal;

import java.io.IOException;

class zzas
  implements zzaq
{
  private zzrq zznF;
  private byte[] zznG;
  private final int zznH;
  
  public zzas(int paramInt)
  {
    zznH = paramInt;
    reset();
  }
  
  public void reset()
  {
    zznG = new byte[zznH];
    zznF = zzrq.zzA(zznG);
  }
  
  public byte[] zzac()
    throws IOException
  {
    int i = zznF.zzDi();
    if (i < 0) {
      throw new IOException();
    }
    if (i == 0) {
      return zznG;
    }
    byte[] arrayOfByte = new byte[zznG.length - i];
    System.arraycopy(zznG, 0, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
  
  public void zzb(int paramInt, long paramLong)
    throws IOException
  {
    zznF.zzb(paramInt, paramLong);
  }
  
  public void zzb(int paramInt, String paramString)
    throws IOException
  {
    zznF.zzb(paramInt, paramString);
  }
}
