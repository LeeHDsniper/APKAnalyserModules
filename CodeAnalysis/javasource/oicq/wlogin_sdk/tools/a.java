package oicq.wlogin_sdk.tools;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.Random;

class a
{
  private byte[] a;
  private byte[] b;
  private byte[] c;
  private int d;
  private int e;
  private int f;
  private int g;
  private byte[] h;
  private boolean i = true;
  private int j;
  private Random k = new Random();
  
  a() {}
  
  private static long a(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    long l = 0L;
    if (paramInt2 > 4) {
      paramInt2 = paramInt1 + 4;
    }
    while (paramInt1 < paramInt2)
    {
      l = l << 8 | paramArrayOfByte[paramInt1] & 0xFF;
      paramInt1 += 1;
      continue;
      paramInt2 = paramInt1 + paramInt2;
    }
    return l & 0xFFFFFFFF;
  }
  
  private void a()
  {
    f = 0;
    byte[] arrayOfByte;
    int m;
    if (f < 8)
    {
      if (i)
      {
        arrayOfByte = a;
        m = f;
        arrayOfByte[m] = ((byte)(arrayOfByte[m] ^ b[f]));
      }
      for (;;)
      {
        f += 1;
        break;
        arrayOfByte = a;
        m = f;
        arrayOfByte[m] = ((byte)(arrayOfByte[m] ^ c[(e + f)]));
      }
    }
    System.arraycopy(a(a), 0, c, d, 8);
    for (f = 0; f < 8; f += 1)
    {
      arrayOfByte = c;
      m = d + f;
      arrayOfByte[m] = ((byte)(arrayOfByte[m] ^ b[f]));
    }
    System.arraycopy(a, 0, b, 0, 8);
    e = d;
    d += 8;
    f = 0;
    i = false;
  }
  
  private byte[] a(byte[] paramArrayOfByte)
  {
    int m = 16;
    for (;;)
    {
      long l3;
      long l2;
      long l4;
      long l5;
      long l6;
      long l7;
      long l1;
      try
      {
        l3 = a(paramArrayOfByte, 0, 4);
        l2 = a(paramArrayOfByte, 4, 4);
        l4 = a(h, 0, 4);
        l5 = a(h, 4, 4);
        l6 = a(h, 8, 4);
        l7 = a(h, 12, 4);
        l1 = 0L;
      }
      catch (IOException paramArrayOfByte)
      {
        DataOutputStream localDataOutputStream;
        return null;
      }
      paramArrayOfByte = new ByteArrayOutputStream(8);
      localDataOutputStream = new DataOutputStream(paramArrayOfByte);
      localDataOutputStream.writeInt((int)l3);
      localDataOutputStream.writeInt((int)l2);
      localDataOutputStream.close();
      paramArrayOfByte = paramArrayOfByte.toByteArray();
      return paramArrayOfByte;
      while (m > 0)
      {
        l1 = l1 + (0xFFFFFFFF9E3779B9 & 0xFFFFFFFF) & 0xFFFFFFFF;
        l3 = l3 + ((l2 << 4) + l4 ^ l2 + l1 ^ (l2 >>> 5) + l5) & 0xFFFFFFFF;
        l2 = l2 + ((l3 << 4) + l6 ^ l3 + l1 ^ (l3 >>> 5) + l7) & 0xFFFFFFFF;
        m -= 1;
      }
    }
  }
  
  private byte[] a(byte[] paramArrayOfByte, int paramInt)
  {
    int m = 16;
    for (;;)
    {
      long l3;
      long l2;
      long l4;
      long l5;
      long l6;
      long l7;
      long l1;
      try
      {
        l3 = a(paramArrayOfByte, paramInt, 4);
        l2 = a(paramArrayOfByte, paramInt + 4, 4);
        l4 = a(h, 0, 4);
        l5 = a(h, 4, 4);
        l6 = a(h, 8, 4);
        l7 = a(h, 12, 4);
        l1 = 0xFFFFFFFFE3779B90 & 0xFFFFFFFF;
        paramInt = m;
      }
      catch (IOException paramArrayOfByte)
      {
        DataOutputStream localDataOutputStream;
        return null;
      }
      paramArrayOfByte = new ByteArrayOutputStream(8);
      localDataOutputStream = new DataOutputStream(paramArrayOfByte);
      localDataOutputStream.writeInt((int)l3);
      localDataOutputStream.writeInt((int)l2);
      localDataOutputStream.close();
      paramArrayOfByte = paramArrayOfByte.toByteArray();
      return paramArrayOfByte;
      while (paramInt > 0)
      {
        l2 = l2 - ((l3 << 4) + l6 ^ l3 + l1 ^ (l3 >>> 5) + l7) & 0xFFFFFFFF;
        l3 = l3 - ((l2 << 4) + l4 ^ l2 + l1 ^ (l2 >>> 5) + l5) & 0xFFFFFFFF;
        l1 = l1 - (0xFFFFFFFF9E3779B9 & 0xFFFFFFFF) & 0xFFFFFFFF;
        paramInt -= 1;
      }
    }
  }
  
  private int b()
  {
    return k.nextInt();
  }
  
  private boolean b(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    for (f = 0; f < 8; f += 1)
    {
      if (j + f >= paramInt2) {
        return true;
      }
      byte[] arrayOfByte = b;
      int m = f;
      arrayOfByte[m] = ((byte)(arrayOfByte[m] ^ paramArrayOfByte[(d + paramInt1 + f)]));
    }
    b = b(b);
    if (b == null) {
      return false;
    }
    j += 8;
    d += 8;
    f = 0;
    return true;
  }
  
  private byte[] b(byte[] paramArrayOfByte)
  {
    return a(paramArrayOfByte, 0);
  }
  
  private byte[] b(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2)
  {
    a = new byte[8];
    b = new byte[8];
    f = 1;
    g = 0;
    e = 0;
    d = 0;
    h = paramArrayOfByte2;
    i = true;
    f = ((paramInt2 + 10) % 8);
    if (f != 0) {
      f = (8 - f);
    }
    c = new byte[f + paramInt2 + 10];
    a[0] = ((byte)(b() & 0xF8 | f));
    int m = 1;
    while (m <= f)
    {
      a[m] = ((byte)(b() & 0xFF));
      m += 1;
    }
    f += 1;
    m = 0;
    while (m < 8)
    {
      b[m] = 0;
      m += 1;
    }
    g = 1;
    while (g <= 2)
    {
      if (f < 8)
      {
        paramArrayOfByte2 = a;
        m = f;
        f = (m + 1);
        paramArrayOfByte2[m] = ((byte)(b() & 0xFF));
        g += 1;
      }
      if (f == 8) {
        a();
      }
    }
    if (paramInt2 > 0)
    {
      if (f >= 8) {
        break label414;
      }
      paramArrayOfByte2 = a;
      int n = f;
      f = (n + 1);
      m = paramInt1 + 1;
      paramArrayOfByte2[n] = paramArrayOfByte1[paramInt1];
      paramInt2 -= 1;
      paramInt1 = m;
    }
    label414:
    for (;;)
    {
      if (f == 8)
      {
        a();
        break;
        g = 1;
        while (g <= 7)
        {
          if (f < 8)
          {
            paramArrayOfByte1 = a;
            paramInt1 = f;
            f = (paramInt1 + 1);
            paramArrayOfByte1[paramInt1] = 0;
            g += 1;
          }
          if (f == 8) {
            a();
          }
        }
        return c;
      }
      break;
    }
  }
  
  protected byte[] a(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2)
  {
    e = 0;
    d = 0;
    h = paramArrayOfByte2;
    paramArrayOfByte2 = new byte[paramInt1 + 8];
    if ((paramInt2 % 8 != 0) || (paramInt2 < 16)) {
      return null;
    }
    b = a(paramArrayOfByte1, paramInt1);
    f = (b[0] & 0x7);
    int n = paramInt2 - f - 10;
    if (n < 0) {
      return null;
    }
    int m = paramInt1;
    while (m < paramArrayOfByte2.length)
    {
      paramArrayOfByte2[m] = 0;
      m += 1;
    }
    c = new byte[n];
    e = 0;
    d = 8;
    j = 8;
    f += 1;
    g = 1;
    for (;;)
    {
      if (g <= 2)
      {
        if (f < 8)
        {
          f += 1;
          g += 1;
        }
        if (f != 8) {
          continue;
        }
        if (!b(paramArrayOfByte1, paramInt1, paramInt2)) {
          return null;
        }
      }
      else
      {
        m = n;
        int i1 = 0;
        for (;;)
        {
          int i2;
          if (m != 0)
          {
            i2 = i1;
            n = m;
            if (f < 8)
            {
              c[i1] = ((byte)(paramArrayOfByte2[(e + paramInt1 + f)] ^ b[f]));
              i2 = i1 + 1;
              n = m - 1;
              f += 1;
            }
            i1 = i2;
            m = n;
            if (f != 8) {
              continue;
            }
            e = (d - 8);
            if (!b(paramArrayOfByte1, paramInt1, paramInt2)) {
              return null;
            }
          }
          else
          {
            for (g = 1; g < 8; g += 1)
            {
              if (f < 8)
              {
                if ((paramArrayOfByte2[(e + paramInt1 + f)] ^ b[f]) != 0) {
                  return null;
                }
                f += 1;
              }
              if (f == 8)
              {
                e = d;
                if (!b(paramArrayOfByte1, paramInt1, paramInt2)) {
                  return null;
                }
                paramArrayOfByte2 = paramArrayOfByte1;
              }
            }
            return c;
          }
          paramArrayOfByte2 = paramArrayOfByte1;
          i1 = i2;
          m = n;
        }
      }
      paramArrayOfByte2 = paramArrayOfByte1;
    }
  }
  
  protected byte[] a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    return a(paramArrayOfByte1, 0, paramArrayOfByte1.length, paramArrayOfByte2);
  }
  
  protected byte[] b(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    return b(paramArrayOfByte1, 0, paramArrayOfByte1.length, paramArrayOfByte2);
  }
}
