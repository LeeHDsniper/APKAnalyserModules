package org.apache.http.util;

import java.io.Serializable;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public final class ByteArrayBuffer
  implements Serializable
{
  private static final long serialVersionUID = 4359112959524048036L;
  private byte[] buffer;
  private int len;
  
  public ByteArrayBuffer(int paramInt)
  {
    Args.notNegative(paramInt, "Buffer capacity");
    buffer = new byte[paramInt];
  }
  
  private void expand(int paramInt)
  {
    byte[] arrayOfByte = new byte[Math.max(buffer.length << 1, paramInt)];
    System.arraycopy(buffer, 0, arrayOfByte, 0, len);
    buffer = arrayOfByte;
  }
  
  public void append(int paramInt)
  {
    int i = len + 1;
    if (i > buffer.length) {
      expand(i);
    }
    buffer[len] = ((byte)paramInt);
    len = i;
  }
  
  public void append(CharArrayBuffer paramCharArrayBuffer, int paramInt1, int paramInt2)
  {
    if (paramCharArrayBuffer == null) {
      return;
    }
    append(paramCharArrayBuffer.buffer(), paramInt1, paramInt2);
  }
  
  public void append(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte == null) {}
    do
    {
      return;
      if ((paramInt1 < 0) || (paramInt1 > paramArrayOfByte.length) || (paramInt2 < 0) || (paramInt1 + paramInt2 < 0) || (paramInt1 + paramInt2 > paramArrayOfByte.length)) {
        throw new IndexOutOfBoundsException("off: " + paramInt1 + " len: " + paramInt2 + " b.length: " + paramArrayOfByte.length);
      }
    } while (paramInt2 == 0);
    int i = len + paramInt2;
    if (i > buffer.length) {
      expand(i);
    }
    System.arraycopy(paramArrayOfByte, paramInt1, buffer, len, paramInt2);
    len = i;
  }
  
  public void append(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfChar == null) {}
    do
    {
      return;
      if ((paramInt1 < 0) || (paramInt1 > paramArrayOfChar.length) || (paramInt2 < 0) || (paramInt1 + paramInt2 < 0) || (paramInt1 + paramInt2 > paramArrayOfChar.length)) {
        throw new IndexOutOfBoundsException("off: " + paramInt1 + " len: " + paramInt2 + " b.length: " + paramArrayOfChar.length);
      }
    } while (paramInt2 == 0);
    int i = len;
    int j = i + paramInt2;
    if (j > buffer.length) {
      expand(j);
    }
    paramInt2 = i;
    while (paramInt2 < j)
    {
      buffer[paramInt2] = ((byte)paramArrayOfChar[paramInt1]);
      paramInt1 += 1;
      paramInt2 += 1;
    }
    len = j;
  }
  
  public byte[] buffer()
  {
    return buffer;
  }
  
  public int byteAt(int paramInt)
  {
    return buffer[paramInt];
  }
  
  public int capacity()
  {
    return buffer.length;
  }
  
  public void clear()
  {
    len = 0;
  }
  
  public void ensureCapacity(int paramInt)
  {
    if (paramInt <= 0) {}
    while (paramInt <= buffer.length - len) {
      return;
    }
    expand(len + paramInt);
  }
  
  public int indexOf(byte paramByte)
  {
    return indexOf(paramByte, 0, len);
  }
  
  public int indexOf(byte paramByte, int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    paramInt1 = i;
    if (i < 0) {
      paramInt1 = 0;
    }
    i = paramInt2;
    paramInt2 = i;
    if (i > len) {
      paramInt2 = len;
    }
    if (paramInt1 > paramInt2)
    {
      i = -1;
      return i;
    }
    for (;;)
    {
      if (paramInt1 >= paramInt2) {
        break label69;
      }
      i = paramInt1;
      if (buffer[paramInt1] == paramByte) {
        break;
      }
      paramInt1 += 1;
    }
    label69:
    return -1;
  }
  
  public boolean isEmpty()
  {
    return len == 0;
  }
  
  public boolean isFull()
  {
    return len == buffer.length;
  }
  
  public int length()
  {
    return len;
  }
  
  public void setLength(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > buffer.length)) {
      throw new IndexOutOfBoundsException("len: " + paramInt + " < 0 or > buffer len: " + buffer.length);
    }
    len = paramInt;
  }
  
  public byte[] toByteArray()
  {
    byte[] arrayOfByte = new byte[len];
    if (len > 0) {
      System.arraycopy(buffer, 0, arrayOfByte, 0, len);
    }
    return arrayOfByte;
  }
}
