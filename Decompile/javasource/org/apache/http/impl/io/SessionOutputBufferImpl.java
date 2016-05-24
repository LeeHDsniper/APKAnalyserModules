package org.apache.http.impl.io;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.ByteArrayBuffer;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class SessionOutputBufferImpl
  implements BufferInfo, SessionOutputBuffer
{
  private static final byte[] CRLF = { 13, 10 };
  private ByteBuffer bbuf;
  private final ByteArrayBuffer buffer;
  private final CharsetEncoder encoder;
  private final int fragementSizeHint;
  private final HttpTransportMetricsImpl metrics;
  private OutputStream outstream;
  
  public SessionOutputBufferImpl(HttpTransportMetricsImpl paramHttpTransportMetricsImpl, int paramInt)
  {
    this(paramHttpTransportMetricsImpl, paramInt, paramInt, null);
  }
  
  public SessionOutputBufferImpl(HttpTransportMetricsImpl paramHttpTransportMetricsImpl, int paramInt1, int paramInt2, CharsetEncoder paramCharsetEncoder)
  {
    Args.positive(paramInt1, "Buffer size");
    Args.notNull(paramHttpTransportMetricsImpl, "HTTP transport metrcis");
    metrics = paramHttpTransportMetricsImpl;
    buffer = new ByteArrayBuffer(paramInt1);
    if (paramInt2 >= 0) {}
    for (;;)
    {
      fragementSizeHint = paramInt2;
      encoder = paramCharsetEncoder;
      return;
      paramInt2 = 0;
    }
  }
  
  private void flushBuffer()
    throws IOException
  {
    int i = buffer.length();
    if (i > 0)
    {
      streamWrite(buffer.buffer(), 0, i);
      buffer.clear();
      metrics.incrementBytesTransferred(i);
    }
  }
  
  private void flushStream()
    throws IOException
  {
    if (outstream != null) {
      outstream.flush();
    }
  }
  
  private void handleEncodingResult(CoderResult paramCoderResult)
    throws IOException
  {
    if (paramCoderResult.isError()) {
      paramCoderResult.throwException();
    }
    bbuf.flip();
    while (bbuf.hasRemaining()) {
      write(bbuf.get());
    }
    bbuf.compact();
  }
  
  private void streamWrite(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    Asserts.notNull(outstream, "Output stream");
    outstream.write(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  private void writeEncoded(CharBuffer paramCharBuffer)
    throws IOException
  {
    if (!paramCharBuffer.hasRemaining()) {
      return;
    }
    if (bbuf == null) {
      bbuf = ByteBuffer.allocate(1024);
    }
    encoder.reset();
    while (paramCharBuffer.hasRemaining()) {
      handleEncodingResult(encoder.encode(paramCharBuffer, bbuf, true));
    }
    handleEncodingResult(encoder.flush(bbuf));
    bbuf.clear();
  }
  
  public int available()
  {
    return capacity() - length();
  }
  
  public void bind(OutputStream paramOutputStream)
  {
    outstream = paramOutputStream;
  }
  
  public int capacity()
  {
    return buffer.capacity();
  }
  
  public void flush()
    throws IOException
  {
    flushBuffer();
    flushStream();
  }
  
  public HttpTransportMetrics getMetrics()
  {
    return metrics;
  }
  
  public boolean isBound()
  {
    return outstream != null;
  }
  
  public int length()
  {
    return buffer.length();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (fragementSizeHint > 0)
    {
      if (buffer.isFull()) {
        flushBuffer();
      }
      buffer.append(paramInt);
      return;
    }
    flushBuffer();
    outstream.write(paramInt);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    if (paramArrayOfByte == null) {
      return;
    }
    write(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramArrayOfByte == null) {
      return;
    }
    if ((paramInt2 > fragementSizeHint) || (paramInt2 > buffer.capacity()))
    {
      flushBuffer();
      streamWrite(paramArrayOfByte, paramInt1, paramInt2);
      metrics.incrementBytesTransferred(paramInt2);
      return;
    }
    if (paramInt2 > buffer.capacity() - buffer.length()) {
      flushBuffer();
    }
    buffer.append(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public void writeLine(String paramString)
    throws IOException
  {
    if (paramString == null) {
      return;
    }
    if (paramString.length() > 0)
    {
      if (encoder == null)
      {
        int i = 0;
        while (i < paramString.length())
        {
          write(paramString.charAt(i));
          i += 1;
        }
      }
      writeEncoded(CharBuffer.wrap(paramString));
    }
    write(CRLF);
  }
  
  public void writeLine(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    if (paramCharArrayBuffer == null) {
      return;
    }
    if (encoder == null)
    {
      int j = 0;
      int i = paramCharArrayBuffer.length();
      while (i > 0)
      {
        int k = Math.min(buffer.capacity() - buffer.length(), i);
        if (k > 0) {
          buffer.append(paramCharArrayBuffer, j, k);
        }
        if (buffer.isFull()) {
          flushBuffer();
        }
        j += k;
        i -= k;
      }
    }
    writeEncoded(CharBuffer.wrap(paramCharArrayBuffer.buffer(), 0, paramCharArrayBuffer.length()));
    write(CRLF);
  }
}
