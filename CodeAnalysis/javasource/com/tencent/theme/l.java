package com.tencent.theme;

import java.io.IOException;
import java.nio.ByteBuffer;

public class l
{
  private static final int g = 1835009;
  private int[] a;
  private String[] b;
  private int[] c;
  private int[] d;
  private int e;
  private ByteBuffer f;
  
  private l() {}
  
  private static final int a(int[] paramArrayOfInt, int paramInt)
  {
    int i = paramArrayOfInt[(paramInt / 4)];
    if (paramInt % 4 / 2 == 0) {
      return i & 0xFFFF;
    }
    return i >>> 16;
  }
  
  public static l a(ByteBuffer paramByteBuffer)
    throws IOException
  {
    c.a(paramByteBuffer, 1835009);
    int j = paramByteBuffer.getInt();
    int m = paramByteBuffer.getInt();
    int i = paramByteBuffer.getInt();
    int n = paramByteBuffer.getInt();
    int i1 = paramByteBuffer.getInt();
    int k = paramByteBuffer.getInt();
    l localL = new l();
    a = c.c(paramByteBuffer, m);
    if (i != 0) {
      c = c.c(paramByteBuffer, i);
    }
    int i2 = paramByteBuffer.position();
    e = n;
    if (k == 0) {}
    for (i = j;; i = k)
    {
      i -= i1;
      if (i % 4 == 0) {
        break;
      }
      throw new IOException("String data size is not multiple of 4 (" + i + ").");
    }
    ByteBuffer localByteBuffer = ByteBuffer.wrap(paramByteBuffer.array(), i2, i);
    localByteBuffer.order(paramByteBuffer.order());
    f = localByteBuffer;
    b = new String[m];
    c.b(paramByteBuffer, i);
    if ((n != 0) && (n != 256)) {
      throw new IOException("Unknow version xml file: version: " + n);
    }
    if (k != 0)
    {
      i = j - k;
      if (i % 4 != 0) {
        throw new IOException("Style data size is not multiple of 4 (" + i + ").");
      }
      d = c.c(paramByteBuffer, i / 4);
    }
    return localL;
  }
  
  private int[] d(int paramInt)
  {
    int k = 0;
    if ((c == null) || (d == null) || (paramInt >= c.length)) {
      return null;
    }
    paramInt = c[paramInt] / 4;
    int i = paramInt;
    int j = 0;
    for (;;)
    {
      if ((i >= d.length) || (d[i] == -1))
      {
        if ((j != 0) && (j % 3 == 0)) {
          break;
        }
        return null;
      }
      j += 1;
      i += 1;
    }
    int[] arrayOfInt = new int[j];
    i = k;
    for (;;)
    {
      if ((paramInt >= d.length) || (d[paramInt] == -1)) {
        return arrayOfInt;
      }
      arrayOfInt[i] = d[paramInt];
      i += 1;
      paramInt += 1;
    }
  }
  
  public int a()
  {
    if (a != null) {
      return a.length;
    }
    return 0;
  }
  
  public int a(String paramString)
  {
    int j;
    if (paramString == null)
    {
      j = -1;
      return j;
    }
    int i = 0;
    for (;;)
    {
      if (i >= b.length) {
        break label61;
      }
      String str2 = b[i];
      String str1 = str2;
      if (str2 == null) {
        str1 = a(i);
      }
      j = i;
      if (paramString.equals(str1)) {
        break;
      }
      i += 1;
    }
    label61:
    return -1;
  }
  
  public String a(int paramInt)
  {
    if ((paramInt < 0) || (a == null) || (paramInt >= a.length)) {
      localObject = null;
    }
    String str;
    do
    {
      return localObject;
      str = b[paramInt];
      localObject = str;
    } while (str != null);
    int i = a[paramInt];
    f.mark();
    c.b(f, i);
    if (e == 0)
    {
      localObject = new char[f.getShort()];
      i = 0;
      while (i < localObject.length)
      {
        localObject[i] = f.getChar();
        i += 1;
      }
    }
    for (Object localObject = new String((char[])localObject);; localObject = new String(c.d(f, i)))
    {
      b[paramInt] = localObject;
      f.reset();
      return localObject;
      i = f.get();
      f.get();
    }
  }
  
  public CharSequence b(int paramInt)
  {
    return a(paramInt);
  }
  
  public String c(int paramInt)
  {
    String str = a(paramInt);
    if (str == null) {
      return str;
    }
    int[] arrayOfInt = d(paramInt);
    if (arrayOfInt == null) {
      return str;
    }
    StringBuilder localStringBuilder = new StringBuilder(str.length() + 32);
    paramInt = 0;
    int i = 0;
    int k = -1;
    int j;
    if (i != arrayOfInt.length)
    {
      if (arrayOfInt[(i + 1)] == -1) {
        j = k;
      }
      for (;;)
      {
        i += 3;
        k = j;
        break;
        if (k != -1)
        {
          j = k;
          if (arrayOfInt[(k + 1)] <= arrayOfInt[(i + 1)]) {}
        }
        else
        {
          j = i;
        }
      }
    }
    int m;
    label131:
    int n;
    if (k != -1)
    {
      i = arrayOfInt[(k + 1)];
      m = 0;
      if (m == arrayOfInt.length) {
        break label260;
      }
      n = arrayOfInt[(m + 2)];
      j = paramInt;
      if (n != -1)
      {
        if (n < i) {
          break label184;
        }
        j = paramInt;
      }
    }
    for (;;)
    {
      m += 3;
      paramInt = j;
      break label131;
      i = str.length();
      break;
      label184:
      j = paramInt;
      if (paramInt <= n)
      {
        localStringBuilder.append(str, paramInt, n + 1);
        j = n + 1;
      }
      arrayOfInt[(m + 2)] = -1;
      localStringBuilder.append('<');
      localStringBuilder.append('/');
      localStringBuilder.append(a(arrayOfInt[m]));
      localStringBuilder.append('>');
    }
    label260:
    if (paramInt < i)
    {
      localStringBuilder.append(str, paramInt, i);
      paramInt = i;
    }
    for (;;)
    {
      if (k == -1) {
        return localStringBuilder.toString();
      }
      localStringBuilder.append('<');
      localStringBuilder.append(a(arrayOfInt[k]));
      localStringBuilder.append('>');
      arrayOfInt[(k + 1)] = -1;
      break;
    }
  }
}
