package com.google.android.gms.internal;

import java.security.MessageDigest;

public class zzbo
  extends zzbl
{
  private MessageDigest zzsl;
  
  public zzbo() {}
  
  byte[] zza(String[] paramArrayOfString)
  {
    byte[] arrayOfByte = new byte[paramArrayOfString.length];
    int i = 0;
    while (i < paramArrayOfString.length)
    {
      arrayOfByte[i] = zzj(zzbn.zzC(paramArrayOfString[i]));
      i += 1;
    }
    return arrayOfByte;
  }
  
  byte zzj(int paramInt)
  {
    return (byte)(paramInt & 0xFF ^ (0xFF00 & paramInt) >> 8 ^ (0xFF0000 & paramInt) >> 16 ^ (0xFF000000 & paramInt) >> 24);
  }
  
  public byte[] zzz(String arg1)
  {
    byte[] arrayOfByte1 = zza(???.split(" "));
    zzsl = zzcy();
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzsl == null) {
          return new byte[0];
        }
        zzsl.reset();
        zzsl.update(arrayOfByte1);
        arrayOfByte1 = zzsl.digest();
        i = 4;
        if (arrayOfByte1.length > 4)
        {
          byte[] arrayOfByte2 = new byte[i];
          System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, arrayOfByte2.length);
          return arrayOfByte2;
        }
      }
      int i = localObject.length;
    }
  }
}
