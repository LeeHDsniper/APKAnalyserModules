package com.tencent.qphone.base.util;

import java.io.IOException;
import org.apache.http.impl.io.HttpTransportMetricsImpl;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.util.ByteArrayBuffer;
import org.apache.http.util.CharArrayBuffer;

public abstract class AbsSessionInputBuffer
  implements SessionInputBuffer
{
  protected boolean ascii = true;
  protected byte[] buffer;
  protected int bufferlen;
  protected int bufferpos;
  protected String charset = "US-ASCII";
  protected ByteArrayBuffer linebuffer = null;
  protected int maxLineLen = -1;
  protected HttpTransportMetricsImpl metrics;
  
  public AbsSessionInputBuffer() {}
  
  private int lineFromLineBuffer(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    int j = linebuffer.length();
    if (j > 0)
    {
      i = j;
      if (linebuffer.byteAt(j - 1) == 10)
      {
        i = j - 1;
        linebuffer.setLength(i);
      }
      if ((i > 0) && (linebuffer.byteAt(i - 1) == 13)) {
        linebuffer.setLength(i - 1);
      }
    }
    int i = linebuffer.length();
    if (ascii)
    {
      paramCharArrayBuffer.append(linebuffer, 0, i);
      return i;
    }
    paramCharArrayBuffer.append(new String(linebuffer.buffer(), 0, i, charset));
    return i;
  }
  
  private int lineFromReadBuffer(CharArrayBuffer paramCharArrayBuffer, int paramInt)
    throws IOException
  {
    int j = bufferpos;
    bufferpos = (paramInt + 1);
    int i = paramInt;
    if (paramInt > j)
    {
      i = paramInt;
      if (buffer[(paramInt - 1)] == 13) {
        i = paramInt - 1;
      }
    }
    paramInt = i - j;
    if (ascii)
    {
      paramCharArrayBuffer.append(buffer, j, paramInt);
      return paramInt;
    }
    paramCharArrayBuffer.append(new String(buffer, j, paramInt, charset));
    return paramInt;
  }
  
  private int locateLF()
  {
    int i = bufferpos;
    while (i < bufferlen)
    {
      if (buffer[i] == 10) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  protected abstract int fillBuffer()
    throws IOException;
  
  public byte[] getBuffer()
  {
    return buffer;
  }
  
  public int getBufferlen()
  {
    return bufferlen;
  }
  
  public int getBufferpos()
  {
    return bufferpos;
  }
  
  public HttpTransportMetrics getMetrics()
  {
    return metrics;
  }
  
  public boolean hasBufferedData()
  {
    return bufferpos < bufferlen;
  }
  
  public int read()
    throws IOException
  {
    while (!hasBufferedData()) {
      if (fillBuffer() == -1) {
        return -1;
      }
    }
    byte[] arrayOfByte = buffer;
    int i = bufferpos;
    bufferpos = (i + 1);
    return arrayOfByte[i] & 0xFF;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    if (paramArrayOfByte == null) {
      return 0;
    }
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramArrayOfByte == null) {
      return 0;
    }
    while (!hasBufferedData()) {
      if (fillBuffer() == -1) {
        return -1;
      }
    }
    int i = bufferlen - bufferpos;
    if (i > paramInt2) {}
    for (;;)
    {
      System.arraycopy(buffer, bufferpos, paramArrayOfByte, paramInt1, paramInt2);
      bufferpos += paramInt2;
      return paramInt2;
      paramInt2 = i;
    }
  }
  
  public int readLine(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    if (paramCharArrayBuffer == null) {
      throw new IllegalArgumentException("Char array buffer may not be null");
    }
    linebuffer.clear();
    int j = 1;
    int k = 0;
    if (j != 0)
    {
      int i = locateLF();
      int m;
      if (i != -1)
      {
        if (linebuffer.isEmpty()) {
          return lineFromReadBuffer(paramCharArrayBuffer, i);
        }
        j = bufferpos;
        linebuffer.append(buffer, bufferpos, i + 1 - j);
        bufferpos = (i + 1);
        i = 0;
        m = k;
      }
      for (;;)
      {
        j = i;
        k = m;
        if (maxLineLen <= 0) {
          break;
        }
        j = i;
        k = m;
        if (linebuffer.length() < maxLineLen) {
          break;
        }
        throw new IOException("Maximum line length limit exceeded");
        if (hasBufferedData())
        {
          i = bufferlen;
          k = bufferpos;
          linebuffer.append(buffer, bufferpos, i - k);
          bufferpos = bufferlen;
        }
        k = fillBuffer();
        i = j;
        m = k;
        if (k == -1)
        {
          i = 0;
          m = k;
        }
      }
    }
    if ((k == -1) && (linebuffer.isEmpty())) {
      return -1;
    }
    return lineFromLineBuffer(paramCharArrayBuffer);
  }
  
  public String readLine()
    throws IOException
  {
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(64);
    if (readLine(localCharArrayBuffer) != -1) {
      return localCharArrayBuffer.toString();
    }
    return null;
  }
}
