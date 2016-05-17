package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.cryptor;
import oicq.wlogin_sdk.tools.util;

public class a
{
  int a = 128;
  int b = 0;
  int c = 0;
  int d = 4;
  int e = 0;
  byte[] f = new byte[a];
  int g = 0;
  
  public a() {}
  
  public a(int paramInt)
  {
    g = paramInt;
  }
  
  int a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
  {
    paramInt2 = paramArrayOfByte.length;
    for (;;)
    {
      if ((paramInt1 >= paramInt2) || (paramInt1 + 2 > paramInt2)) {}
      do
      {
        return -1;
        if (util.buf_to_int16(paramArrayOfByte, paramInt1) == paramInt3) {
          return paramInt1;
        }
        paramInt1 += 2;
      } while (paramInt1 + 2 > paramInt2);
      paramInt1 += util.buf_to_int16(paramArrayOfByte, paramInt1) + 2;
    }
  }
  
  public int a(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2)
  {
    int i = a(paramArrayOfByte1, paramInt1, paramInt2, g);
    if (i < 0) {
      return -1;
    }
    paramInt1 = paramInt2 - (i - paramInt1);
    byte[] arrayOfByte = new byte[paramInt1];
    System.arraycopy(paramArrayOfByte1, i, arrayOfByte, 0, paramInt1);
    return a(arrayOfByte, paramInt1, paramArrayOfByte2);
  }
  
  int a(byte[] paramArrayOfByte1, int paramInt, byte[] paramArrayOfByte2)
  {
    if (d >= paramInt) {}
    do
    {
      return -1;
      e = util.buf_to_int16(paramArrayOfByte1, 2);
    } while (d + e > paramInt);
    paramArrayOfByte2 = cryptor.decrypt(paramArrayOfByte1, d, e, paramArrayOfByte2);
    if (paramArrayOfByte2 == null) {
      return 64521;
    }
    if (d + paramArrayOfByte2.length > a)
    {
      a = (d + paramArrayOfByte2.length);
      f = new byte[a];
    }
    b = 0;
    System.arraycopy(paramArrayOfByte1, 0, f, 0, d);
    b += d;
    System.arraycopy(paramArrayOfByte2, 0, f, b, paramArrayOfByte2.length);
    b += paramArrayOfByte2.length;
    e = paramArrayOfByte2.length;
    if (!e().booleanValue()) {
      return 64531;
    }
    return 0;
  }
  
  public void a(int paramInt)
  {
    util.int16_to_buf(f, b, paramInt);
    b += 2;
    util.int16_to_buf(f, b, 0);
    b += 2;
  }
  
  public void a(byte[] paramArrayOfByte, int paramInt)
  {
    if (d + paramInt > a)
    {
      a = (d + paramInt + 128);
      byte[] arrayOfByte = new byte[a];
      System.arraycopy(f, 0, arrayOfByte, 0, d);
      f = arrayOfByte;
    }
    b = (d + paramInt);
    System.arraycopy(paramArrayOfByte, 0, f, d, paramInt);
    e = paramInt;
    util.int16_to_buf(f, 0, g);
    util.int16_to_buf(f, 2, e);
  }
  
  public void a(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramInt2 > a)
    {
      a = (paramInt2 + 128);
      f = new byte[a];
    }
    b = paramInt2;
    System.arraycopy(paramArrayOfByte, paramInt1, f, 0, paramInt2);
    g = util.buf_to_int16(paramArrayOfByte, paramInt1);
    e = (paramInt2 - d);
  }
  
  public byte[] a()
  {
    byte[] arrayOfByte = new byte[b];
    System.arraycopy(f, 0, arrayOfByte, 0, b);
    return arrayOfByte;
  }
  
  public int b(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = a(paramArrayOfByte, paramInt1, paramInt2, g);
    if (i < 0) {}
    do
    {
      do
      {
        return -1;
        paramInt1 = paramInt2 - (i - paramInt1);
      } while (d >= paramInt1);
      e = util.buf_to_int16(paramArrayOfByte, i + 2);
    } while (d + e > paramInt1);
    a(paramArrayOfByte, i, d + e);
    if (!e().booleanValue()) {
      return 64531;
    }
    return d + i + e;
  }
  
  public void b(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramInt > a - d)
    {
      a = (d + paramInt + 64);
      byte[] arrayOfByte = new byte[a];
      System.arraycopy(f, 0, arrayOfByte, 0, b);
      f = arrayOfByte;
    }
    e = paramInt;
    System.arraycopy(paramArrayOfByte, 0, f, b, paramInt);
    b += paramInt;
  }
  
  public byte[] b()
  {
    byte[] arrayOfByte = new byte[e];
    System.arraycopy(f, d, arrayOfByte, 0, e);
    return arrayOfByte;
  }
  
  public int c()
  {
    return e;
  }
  
  public int c(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramArrayOfByte != null)
    {
      if (paramArrayOfByte.length > paramInt) {
        return paramInt;
      }
      return paramArrayOfByte.length;
    }
    return 0;
  }
  
  public void d()
  {
    util.int16_to_buf(f, 2, b - d);
  }
  
  public Boolean e()
  {
    return Boolean.valueOf(true);
  }
}
