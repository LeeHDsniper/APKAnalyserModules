package org.apache.http.impl.io;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import org.apache.http.Consts;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.ByteArrayBuffer;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@NotThreadSafe
public abstract class AbstractSessionInputBuffer
  implements BufferInfo, SessionInputBuffer
{
  private boolean ascii;
  private byte[] buffer;
  private int bufferlen;
  private int bufferpos;
  private CharBuffer cbuf;
  private Charset charset;
  private CharsetDecoder decoder;
  private InputStream instream;
  private ByteArrayBuffer linebuffer;
  private int maxLineLen;
  private HttpTransportMetricsImpl metrics;
  private int minChunkLimit;
  private CodingErrorAction onMalformedCharAction;
  private CodingErrorAction onUnmappableCharAction;
  
  public AbstractSessionInputBuffer() {}
  
  private int appendDecoded(CharArrayBuffer paramCharArrayBuffer, ByteBuffer paramByteBuffer)
    throws IOException
  {
    if (!paramByteBuffer.hasRemaining()) {
      return 0;
    }
    if (decoder == null)
    {
      decoder = charset.newDecoder();
      decoder.onMalformedInput(onMalformedCharAction);
      decoder.onUnmappableCharacter(onUnmappableCharAction);
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
    if (ascii) {
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
    if (ascii)
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
  
  public int available()
  {
    return capacity() - length();
  }
  
  public int capacity()
  {
    return buffer.length;
  }
  
  protected HttpTransportMetricsImpl createTransportMetrics()
  {
    return new HttpTransportMetricsImpl();
  }
  
  protected int fillBuffer()
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
    j = instream.read(buffer, i, j - i);
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
  
  protected boolean hasBufferedData()
  {
    return bufferpos < bufferlen;
  }
  
  protected void init(InputStream paramInputStream, int paramInt, HttpParams paramHttpParams)
  {
    Args.notNull(paramInputStream, "Input stream");
    Args.notNegative(paramInt, "Buffer size");
    Args.notNull(paramHttpParams, "HTTP parameters");
    instream = paramInputStream;
    buffer = new byte[paramInt];
    bufferpos = 0;
    bufferlen = 0;
    linebuffer = new ByteArrayBuffer(paramInt);
    paramInputStream = (String)paramHttpParams.getParameter("http.protocol.element-charset");
    if (paramInputStream != null)
    {
      paramInputStream = Charset.forName(paramInputStream);
      charset = paramInputStream;
      ascii = charset.equals(Consts.ASCII);
      decoder = null;
      maxLineLen = paramHttpParams.getIntParameter("http.connection.max-line-length", -1);
      minChunkLimit = paramHttpParams.getIntParameter("http.connection.min-chunk-limit", 512);
      metrics = createTransportMetrics();
      paramInputStream = (CodingErrorAction)paramHttpParams.getParameter("http.malformed.input.action");
      if (paramInputStream == null) {
        break label189;
      }
      label154:
      onMalformedCharAction = paramInputStream;
      paramInputStream = (CodingErrorAction)paramHttpParams.getParameter("http.unmappable.input.action");
      if (paramInputStream == null) {
        break label196;
      }
    }
    for (;;)
    {
      onUnmappableCharAction = paramInputStream;
      return;
      paramInputStream = Consts.ASCII;
      break;
      label189:
      paramInputStream = CodingErrorAction.REPORT;
      break label154;
      label196:
      paramInputStream = CodingErrorAction.REPORT;
    }
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
      paramInt1 = instream.read(paramArrayOfByte, paramInt1, paramInt2);
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
        k = m;
        j = i;
        if (maxLineLen <= 0) {
          break;
        }
        k = m;
        j = i;
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
        m = k;
        i = j;
        if (k == -1)
        {
          i = 0;
          m = k;
        }
      }
      if (k != -1) {
        break label227;
      }
      i = n;
    } while (linebuffer.isEmpty());
    label227:
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
