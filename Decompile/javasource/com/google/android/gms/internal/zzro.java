package com.google.android.gms.internal;

public class zzro
{
  private final byte[] zzbbN = new byte['Ā'];
  private int zzbbO;
  private int zzbbP;
  
  public zzro(byte[] paramArrayOfByte)
  {
    int j = 0;
    while (j < 256)
    {
      zzbbN[j] = ((byte)j);
      j += 1;
    }
    int k = 0;
    j = 0;
    while (j < 256)
    {
      k = k + zzbbN[j] + paramArrayOfByte[(j % paramArrayOfByte.length)] & 0xFF;
      int i = zzbbN[j];
      zzbbN[j] = zzbbN[k];
      zzbbN[k] = i;
      j += 1;
    }
    zzbbO = 0;
    zzbbP = 0;
  }
  
  public void zzy(byte[] paramArrayOfByte)
  {
    int m = zzbbO;
    int k = zzbbP;
    int j = 0;
    while (j < paramArrayOfByte.length)
    {
      m = m + 1 & 0xFF;
      k = k + zzbbN[m] & 0xFF;
      int i = zzbbN[m];
      zzbbN[m] = zzbbN[k];
      zzbbN[k] = i;
      paramArrayOfByte[j] = ((byte)(paramArrayOfByte[j] ^ zzbbN[(zzbbN[m] + zzbbN[k] & 0xFF)]));
      j += 1;
    }
    zzbbO = m;
    zzbbP = k;
  }
}
