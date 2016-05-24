package com.google.android.gms.internal;

import java.io.IOException;

public final class zzrp
{
  private final byte[] buffer;
  private int zzbbQ;
  private int zzbbR;
  private int zzbbS;
  private int zzbbT;
  private int zzbbU;
  private int zzbbV = Integer.MAX_VALUE;
  private int zzbbW;
  private int zzbbX = 64;
  private int zzbbY = 67108864;
  
  private zzrp(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    buffer = paramArrayOfByte;
    zzbbQ = paramInt1;
    zzbbR = (paramInt1 + paramInt2);
    zzbbT = paramInt1;
  }
  
  private void zzDe()
  {
    zzbbR += zzbbS;
    int i = zzbbR;
    if (i > zzbbV)
    {
      zzbbS = (i - zzbbV);
      zzbbR -= zzbbS;
      return;
    }
    zzbbS = 0;
  }
  
  public static zzrp zza(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return new zzrp(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public int getPosition()
  {
    return zzbbT - zzbbQ;
  }
  
  public float readFloat()
    throws IOException
  {
    return Float.intBitsToFloat(zzDc());
  }
  
  public String readString()
    throws IOException
  {
    int i = zzDa();
    if ((i <= zzbbR - zzbbT) && (i > 0))
    {
      String str = new String(buffer, zzbbT, i, "UTF-8");
      zzbbT = (i + zzbbT);
      return str;
    }
    return new String(zzlo(i), "UTF-8");
  }
  
  public int zzCT()
    throws IOException
  {
    if (zzDg())
    {
      zzbbU = 0;
      return 0;
    }
    zzbbU = zzDa();
    if (zzbbU == 0) {
      throw zzrw.zzDs();
    }
    return zzbbU;
  }
  
  public void zzCU()
    throws IOException
  {
    int i;
    do
    {
      i = zzCT();
    } while ((i != 0) && (zzlj(i)));
  }
  
  public long zzCV()
    throws IOException
  {
    return zzDb();
  }
  
  public int zzCW()
    throws IOException
  {
    return zzDa();
  }
  
  public boolean zzCX()
    throws IOException
  {
    return zzDa() != 0;
  }
  
  public int zzDa()
    throws IOException
  {
    int i = zzDh();
    if (i >= 0) {}
    int k;
    do
    {
      return i;
      i &= 0x7F;
      j = zzDh();
      if (j >= 0) {
        return i | j << 7;
      }
      i |= (j & 0x7F) << 7;
      j = zzDh();
      if (j >= 0) {
        return i | j << 14;
      }
      i |= (j & 0x7F) << 14;
      k = zzDh();
      if (k >= 0) {
        return i | k << 21;
      }
      j = zzDh();
      k = i | (k & 0x7F) << 21 | j << 28;
      i = k;
    } while (j >= 0);
    int j = 0;
    for (;;)
    {
      if (j >= 5) {
        break label133;
      }
      i = k;
      if (zzDh() >= 0) {
        break;
      }
      j += 1;
    }
    label133:
    throw zzrw.zzDr();
  }
  
  public long zzDb()
    throws IOException
  {
    int i = 0;
    long l = 0L;
    while (i < 64)
    {
      int j = zzDh();
      l |= (j & 0x7F) << i;
      if ((j & 0x80) == 0) {
        return l;
      }
      i += 7;
    }
    throw zzrw.zzDr();
  }
  
  public int zzDc()
    throws IOException
  {
    return zzDh() & 0xFF | (zzDh() & 0xFF) << 8 | (zzDh() & 0xFF) << 16 | (zzDh() & 0xFF) << 24;
  }
  
  public long zzDd()
    throws IOException
  {
    int i = zzDh();
    int j = zzDh();
    int k = zzDh();
    int m = zzDh();
    int n = zzDh();
    int i1 = zzDh();
    int i2 = zzDh();
    int i3 = zzDh();
    long l = i;
    return (j & 0xFF) << 8 | l & 0xFF | (k & 0xFF) << 16 | (m & 0xFF) << 24 | (n & 0xFF) << 32 | (i1 & 0xFF) << 40 | (i2 & 0xFF) << 48 | (i3 & 0xFF) << 56;
  }
  
  public int zzDf()
  {
    if (zzbbV == Integer.MAX_VALUE) {
      return -1;
    }
    int i = zzbbT;
    return zzbbV - i;
  }
  
  public boolean zzDg()
  {
    return zzbbT == zzbbR;
  }
  
  public byte zzDh()
    throws IOException
  {
    if (zzbbT == zzbbR) {
      throw zzrw.zzDp();
    }
    byte[] arrayOfByte = buffer;
    int i = zzbbT;
    zzbbT = (i + 1);
    return arrayOfByte[i];
  }
  
  public void zza(zzrx paramZzrx)
    throws IOException
  {
    int i = zzDa();
    if (zzbbW >= zzbbX) {
      throw zzrw.zzDv();
    }
    i = zzll(i);
    zzbbW += 1;
    paramZzrx.zzb(this);
    zzli(0);
    zzbbW -= 1;
    zzlm(i);
  }
  
  public void zzli(int paramInt)
    throws zzrw
  {
    if (zzbbU != paramInt) {
      throw zzrw.zzDt();
    }
  }
  
  public boolean zzlj(int paramInt)
    throws IOException
  {
    switch (zzsa.zzlD(paramInt))
    {
    default: 
      throw zzrw.zzDu();
    case 0: 
      zzCW();
      return true;
    case 1: 
      zzDd();
      return true;
    case 2: 
      zzlp(zzDa());
      return true;
    case 3: 
      zzCU();
      zzli(zzsa.zzE(zzsa.zzlE(paramInt), 4));
      return true;
    case 4: 
      return false;
    }
    zzDc();
    return true;
  }
  
  public int zzll(int paramInt)
    throws zzrw
  {
    if (paramInt < 0) {
      throw zzrw.zzDq();
    }
    paramInt = zzbbT + paramInt;
    int i = zzbbV;
    if (paramInt > i) {
      throw zzrw.zzDp();
    }
    zzbbV = paramInt;
    zzDe();
    return i;
  }
  
  public void zzlm(int paramInt)
  {
    zzbbV = paramInt;
    zzDe();
  }
  
  public void zzln(int paramInt)
  {
    if (paramInt > zzbbT - zzbbQ) {
      throw new IllegalArgumentException("Position " + paramInt + " is beyond current " + (zzbbT - zzbbQ));
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("Bad position " + paramInt);
    }
    zzbbT = (zzbbQ + paramInt);
  }
  
  public byte[] zzlo(int paramInt)
    throws IOException
  {
    if (paramInt < 0) {
      throw zzrw.zzDq();
    }
    if (zzbbT + paramInt > zzbbV)
    {
      zzlp(zzbbV - zzbbT);
      throw zzrw.zzDp();
    }
    if (paramInt <= zzbbR - zzbbT)
    {
      byte[] arrayOfByte = new byte[paramInt];
      System.arraycopy(buffer, zzbbT, arrayOfByte, 0, paramInt);
      zzbbT += paramInt;
      return arrayOfByte;
    }
    throw zzrw.zzDp();
  }
  
  public void zzlp(int paramInt)
    throws IOException
  {
    if (paramInt < 0) {
      throw zzrw.zzDq();
    }
    if (zzbbT + paramInt > zzbbV)
    {
      zzlp(zzbbV - zzbbT);
      throw zzrw.zzDp();
    }
    if (paramInt <= zzbbR - zzbbT)
    {
      zzbbT += paramInt;
      return;
    }
    throw zzrw.zzDp();
  }
  
  public byte[] zzy(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0) {
      return zzsa.zzbcu;
    }
    byte[] arrayOfByte = new byte[paramInt2];
    int i = zzbbQ;
    System.arraycopy(buffer, i + paramInt1, arrayOfByte, 0, paramInt2);
    return arrayOfByte;
  }
}
