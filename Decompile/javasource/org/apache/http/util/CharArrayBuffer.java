package org.apache.http.util;

import java.io.Serializable;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.protocol.HTTP;

@NotThreadSafe
public final class CharArrayBuffer
  implements Serializable
{
  private static final long serialVersionUID = -6208952725094867135L;
  private char[] buffer;
  private int len;
  
  public CharArrayBuffer(int paramInt)
  {
    Args.notNegative(paramInt, "Buffer capacity");
    buffer = new char[paramInt];
  }
  
  private void expand(int paramInt)
  {
    char[] arrayOfChar = new char[Math.max(buffer.length << 1, paramInt)];
    System.arraycopy(buffer, 0, arrayOfChar, 0, len);
    buffer = arrayOfChar;
  }
  
  public void append(char paramChar)
  {
    int i = len + 1;
    if (i > buffer.length) {
      expand(i);
    }
    buffer[len] = paramChar;
    len = i;
  }
  
  public void append(Object paramObject)
  {
    append(String.valueOf(paramObject));
  }
  
  public void append(String paramString)
  {
    if (paramString != null) {}
    for (;;)
    {
      int i = paramString.length();
      int j = len + i;
      if (j > buffer.length) {
        expand(j);
      }
      paramString.getChars(0, i, buffer, len);
      len = j;
      return;
      paramString = "null";
    }
  }
  
  public void append(ByteArrayBuffer paramByteArrayBuffer, int paramInt1, int paramInt2)
  {
    if (paramByteArrayBuffer == null) {
      return;
    }
    append(paramByteArrayBuffer.buffer(), paramInt1, paramInt2);
  }
  
  public void append(CharArrayBuffer paramCharArrayBuffer)
  {
    if (paramCharArrayBuffer == null) {
      return;
    }
    append(buffer, 0, len);
  }
  
  public void append(CharArrayBuffer paramCharArrayBuffer, int paramInt1, int paramInt2)
  {
    if (paramCharArrayBuffer == null) {
      return;
    }
    append(buffer, paramInt1, paramInt2);
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
    int i = len;
    int j = i + paramInt2;
    if (j > buffer.length) {
      expand(j);
    }
    paramInt2 = i;
    while (paramInt2 < j)
    {
      buffer[paramInt2] = ((char)(paramArrayOfByte[paramInt1] & 0xFF));
      paramInt1 += 1;
      paramInt2 += 1;
    }
    len = j;
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
    int i = len + paramInt2;
    if (i > buffer.length) {
      expand(i);
    }
    System.arraycopy(paramArrayOfChar, paramInt1, buffer, len, paramInt2);
    len = i;
  }
  
  public char[] buffer()
  {
    return buffer;
  }
  
  public int capacity()
  {
    return buffer.length;
  }
  
  public char charAt(int paramInt)
  {
    return buffer[paramInt];
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
  
  public int indexOf(int paramInt)
  {
    return indexOf(paramInt, 0, len);
  }
  
  public int indexOf(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = paramInt2;
    paramInt2 = i;
    if (i < 0) {
      paramInt2 = 0;
    }
    i = paramInt3;
    paramInt3 = i;
    if (i > len) {
      paramInt3 = len;
    }
    if (paramInt2 > paramInt3)
    {
      i = -1;
      return i;
    }
    for (;;)
    {
      if (paramInt2 >= paramInt3) {
        break label69;
      }
      i = paramInt2;
      if (buffer[paramInt2] == paramInt1) {
        break;
      }
      paramInt2 += 1;
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
  
  public String substring(int paramInt1, int paramInt2)
  {
    return new String(buffer, paramInt1, paramInt2 - paramInt1);
  }
  
  public String substringTrimmed(int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    if (i < 0) {
      throw new IndexOutOfBoundsException("Negative beginIndex: " + i);
    }
    if (paramInt2 > len) {
      throw new IndexOutOfBoundsException("endIndex: " + paramInt2 + " > length: " + len);
    }
    paramInt1 = i;
    if (i > paramInt2) {
      throw new IndexOutOfBoundsException("beginIndex: " + i + " > endIndex: " + paramInt2);
    }
    for (;;)
    {
      i = paramInt2;
      if (paramInt1 >= paramInt2) {
        break;
      }
      i = paramInt2;
      if (!HTTP.isWhitespace(buffer[paramInt1])) {
        break;
      }
      paramInt1 += 1;
    }
    while ((i > paramInt1) && (HTTP.isWhitespace(buffer[(i - 1)]))) {
      i -= 1;
    }
    return new String(buffer, paramInt1, i - paramInt1);
  }
  
  public char[] toCharArray()
  {
    char[] arrayOfChar = new char[len];
    if (len > 0) {
      System.arraycopy(buffer, 0, arrayOfChar, 0, len);
    }
    return arrayOfChar;
  }
  
  public String toString()
  {
    return new String(buffer, 0, len);
  }
}
