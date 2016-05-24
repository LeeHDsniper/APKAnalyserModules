package org.apache.http.impl.io;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CoderResult;
import org.apache.http.MessageConstraintException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.ByteArrayBuffer;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class SessionInputBufferImpl
  implements BufferInfo, SessionInputBuffer
{
  private final byte[] buffer;
  private int bufferlen;
  private int bufferpos;
  private CharBuffer cbuf;
  private final MessageConstraints constraints;
  private final CharsetDecoder decoder;
  private InputStream instream;
  private final ByteArrayBuffer linebuffer;
  private final HttpTransportMetricsImpl metrics;
  private final int minChunkLimit;
  
  public SessionInputBufferImpl(HttpTransportMetricsImpl paramHttpTransportMetricsImpl, int paramInt)
  {
    this(paramHttpTransportMetricsImpl, paramInt, paramInt, null, null);
  }
  
  public SessionInputBufferImpl(HttpTransportMetricsImpl paramHttpTransportMetricsImpl, int paramInt1, int paramInt2, MessageConstraints paramMessageConstraints, CharsetDecoder paramCharsetDecoder)
  {
    Args.notNull(paramHttpTransportMetricsImpl, "HTTP transport metrcis");
    Args.positive(paramInt1, "Buffer size");
    metrics = paramHttpTransportMetricsImpl;
    buffer = new byte[paramInt1];
    bufferpos = 0;
    bufferlen = 0;
    if (paramInt2 >= 0)
    {
      minChunkLimit = paramInt2;
      if (paramMessageConstraints == null) {
        break label86;
      }
    }
    for (;;)
    {
      constraints = paramMessageConstraints;
      linebuffer = new ByteArrayBuffer(paramInt1);
      decoder = paramCharsetDecoder;
      return;
      paramInt2 = 512;
      break;
      label86:
      paramMessageConstraints = MessageConstraints.DEFAULT;
    }
  }
  
  private int appendDecoded(CharArrayBuffer paramCharArrayBuffer, ByteBuffer paramByteBuffer)
    throws IOException
  {
    if (!paramByteBuffer.hasRemaining()) {
      return 0;
    }
    if (cbuf == null) {
      cbuf = CharBuffer.allocate(1024);
    }
    decoder.reset();
    int i = 0;
    while (paramByteBuffer.hasRemaining()) {
      i += handleDecodingResult(decoder.decode(paramByteBuffer, cbuf, true), paramCharArrayBuffer, paramByteBuffer);
    }
    int j = handleDecodingResult(decoder.flush(cbuf), paramCharArrayBuffer, paramByteBuffer);
    cbuf.clear();
    return i + j;
  }
  
  private int handleDecodingResult(CoderResult paramCoderResult, CharArrayBuffer paramCharArrayBuffer, ByteBuffer paramByteBuffer)
    throws IOException
  {
    if (paramCoderResult.isError()) {
      paramCoderResult.throwException();
    }
    cbuf.flip();
    int i = cbuf.remaining();
    while (cbuf.hasRemaining()) {
      paramCharArrayBuffer.append(cbuf.get());
    }
    cbuf.compact();
    return i;
  }
  
  private int lineFromLineBuffer(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    int k = linebuffer.length();
    int i = k;
    if (k > 0)
    {
      int j = k;
      if (linebuffer.byteAt(k - 1) == 10) {
        j = k - 1;
      }
      i = j;
      if (j > 0)
      {
        i = j;
        if (linebuffer.byteAt(j - 1) == 13) {
          i = j - 1;
        }
      }
    }
    if (decoder == null) {
      paramCharArrayBuffer.append(linebuffer, 0, i);
    }
    for (;;)
    {
      linebuffer.clear();
      return i;
      i = appendDecoded(paramCharArrayBuffer, ByteBuffer.wrap(linebuffer.buffer(), 0, i));
    }
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
    if (decoder == null)
    {
      paramCharArrayBuffer.append(buffer, j, paramInt);
      return paramInt;
    }
    return appendDecoded(paramCharArrayBuffer, ByteBuffer.wrap(buffer, j, paramInt));
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
  
  private int streamRead(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    Asserts.notNull(instream, "Input stream");
    return instream.read(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public int available()
  {
    return capacity() - length();
  }
  
  public void bind(InputStream paramInputStream)
  {
    instream = paramInputStream;
  }
  
  public int capacity()
  {
    return buffer.length;
  }
  
  public void clear()
  {
    bufferpos = 0;
    bufferlen = 0;
  }
  
  public int fillBuffer()
    throws IOException
  {
    if (bufferpos > 0)
    {
      i = bufferlen - bufferpos;
      if (i > 0) {
        System.arraycopy(buffer, bufferpos, buffer, 0, i);
      }
      bufferpos = 0;
      bufferlen = i;
    }
    int i = bufferlen;
    int j = buffer.length;
    j = streamRead(buffer, i, j - i);
    if (j == -1) {
      return -1;
    }
    bufferlen = (i + j);
    metrics.incrementBytesTransferred(j);
    return j;
  }
  
  public HttpTransportMetrics getMetrics()
  {
    return metrics;
  }
  
  public boolean hasBufferedData()
  {
    return bufferpos < bufferlen;
  }
  
  public boolean isBound()
  {
    return instream != null;
  }
  
  public boolean isDataAvailable(int paramInt)
    throws IOException
  {
    return hasBufferedData();
  }
  
  public int length()
  {
    return bufferlen - bufferpos;
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
    if (hasBufferedData())
    {
      paramInt2 = Math.min(paramInt2, bufferlen - bufferpos);
      System.arraycopy(buffer, bufferpos, paramArrayOfByte, paramInt1, paramInt2);
      bufferpos += paramInt2;
      return paramInt2;
    }
    if (paramInt2 > minChunkLimit)
    {
      paramInt1 = streamRead(paramArrayOfByte, paramInt1, paramInt2);
      if (paramInt1 > 0) {
        metrics.incrementBytesTransferred(paramInt1);
      }
      return paramInt1;
    }
    while (!hasBufferedData()) {
      if (fillBuffer() == -1) {
        return -1;
      }
    }
    paramInt2 = Math.min(paramInt2, bufferlen - bufferpos);
    System.arraycopy(buffer, bufferpos, paramArrayOfByte, paramInt1, paramInt2);
    bufferpos += paramInt2;
    return paramInt2;
  }
  
  public int readLine(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    int n = -1;
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    int k = 0;
    int j = 1;
    int m;
    int i;
    if (j != 0)
    {
      m = locateLF();
      if (m != -1) {
        if (linebuffer.isEmpty()) {
          i = lineFromReadBuffer(paramCharArrayBuffer, m);
        }
      }
    }
    do
    {
      return i;
      i = 0;
      j = bufferpos;
      linebuffer.append(buffer, bufferpos, m + 1 - j);
      bufferpos = (m + 1);
      m = k;
      for (;;)
      {
        int i1 = constraints.getMaxLineLength();
        k = m;
        j = i;
        if (i1 <= 0) {
          break;
        }
        k = m;
        j = i;
        if (linebuffer.length() < i1) {
          break;
        }
        throw new MessageConstraintException("Maximum line length limit exceeded");
        if (hasBufferedData())
        {
          i = bufferlen;
          k = bufferpos;
          linebuffer.append(buffer, bufferpos, i - k);
          bufferpos = bufferlen;
        }
        k = fillBuffer();
        m = k;
        i = j;
        if (k == -1)
        {
          i = 0;
          m = k;
        }
      }
      if (k != -1) {
        break label230;
      }
      i = n;
    } while (linebuffer.isEmpty());
    label230:
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
