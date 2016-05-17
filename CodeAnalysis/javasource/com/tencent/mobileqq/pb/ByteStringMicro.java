package com.tencent.mobileqq.pb;

import java.io.UnsupportedEncodingException;

public final class ByteStringMicro
{
  public static final ByteStringMicro EMPTY = new ByteStringMicro(new byte[0]);
  private final byte[] bytes;
  private volatile int hash = 0;
  
  private ByteStringMicro(byte[] paramArrayOfByte)
  {
    bytes = paramArrayOfByte;
  }
  
  public static ByteStringMicro copyFrom(String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    return new ByteStringMicro(paramString1.getBytes(paramString2));
  }
  
  public static ByteStringMicro copyFrom(byte[] paramArrayOfByte)
  {
    return copyFrom(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static ByteStringMicro copyFrom(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte = new byte[paramInt2];
    System.arraycopy(paramArrayOfByte, paramInt1, arrayOfByte, 0, paramInt2);
    return new ByteStringMicro(arrayOfByte);
  }
  
  public static ByteStringMicro copyFromUtf8(String paramString)
  {
    try
    {
      paramString = new ByteStringMicro(paramString.getBytes("UTF-8"));
      return paramString;
    }
    catch (UnsupportedEncodingException paramString)
    {
      throw new RuntimeException("UTF-8 not supported?");
    }
  }
  
  public byte byteAt(int paramInt)
  {
    return bytes[paramInt];
  }
  
  public void copyTo(byte[] paramArrayOfByte, int paramInt)
  {
    System.arraycopy(bytes, 0, paramArrayOfByte, paramInt, bytes.length);
  }
  
  public void copyTo(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
  {
    System.arraycopy(bytes, paramInt1, paramArrayOfByte, paramInt2, paramInt3);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof ByteStringMicro)) {
        return false;
      }
      Object localObject = (ByteStringMicro)paramObject;
      int j = bytes.length;
      if (j != bytes.length) {
        return false;
      }
      paramObject = bytes;
      localObject = bytes;
      int i = 0;
      while (i < j)
      {
        if (paramObject[i] != localObject[i]) {
          return false;
        }
        i += 1;
      }
    }
  }
  
  public int hashCode()
  {
    int i = hash;
    int j = i;
    if (i == 0)
    {
      byte[] arrayOfByte = bytes;
      int k = bytes.length;
      j = 0;
      int m;
      for (i = k; j < k; i = m + i * 31)
      {
        m = arrayOfByte[j];
        j += 1;
      }
      j = i;
      if (i == 0) {
        j = 1;
      }
      hash = j;
    }
    return j;
  }
  
  public boolean isEmpty()
  {
    return bytes.length == 0;
  }
  
  public int size()
  {
    return bytes.length;
  }
  
  public byte[] toByteArray()
  {
    int i = bytes.length;
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(bytes, 0, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  public String toString(String paramString)
    throws UnsupportedEncodingException
  {
    return new String(bytes, paramString);
  }
  
  public String toStringUtf8()
  {
    try
    {
      String str = new String(bytes, "UTF-8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException("UTF-8 not supported?");
    }
  }
}
