package org.apache.http.impl.io;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import org.apache.http.Consts;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.ByteArrayBuffer;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@NotThreadSafe
public abstract class AbstractSessionOutputBuffer
  implements BufferInfo, SessionOutputBuffer
{
  private static final byte[] CRLF = { 13, 10 };
  private boolean ascii;
  private ByteBuffer bbuf;
  private ByteArrayBuffer buffer;
  private Charset charset;
  private CharsetEncoder encoder;
  private HttpTransportMetricsImpl metrics;
  private int minChunkLimit;
  private CodingErrorAction onMalformedCharAction;
  private CodingErrorAction onUnmappableCharAction;
  private OutputStream outstream;
  
  public AbstractSessionOutputBuffer() {}
  
  protected AbstractSessionOutputBuffer(OutputStream paramOutputStream, int paramInt1, Charset paramCharset, int paramInt2, CodingErrorAction paramCodingErrorAction1, CodingErrorAction paramCodingErrorAction2)
  {
    Args.notNull(paramOutputStream, "Input stream");
    Args.notNegative(paramInt1, "Buffer size");
    outstream = paramOutputStream;
    buffer = new ByteArrayBuffer(paramInt1);
    if (paramCharset != null)
    {
      charset = paramCharset;
      ascii = charset.equals(Consts.ASCII);
      encoder = null;
      if (paramInt2 < 0) {
        break label112;
      }
      label68:
      minChunkLimit = paramInt2;
      metrics = createTransportMetrics();
      if (paramCodingErrorAction1 == null) {
        break label120;
      }
      label87:
      onMalformedCharAction = paramCodingErrorAction1;
      if (paramCodingErrorAction2 == null) {
        break label128;
      }
    }
    for (;;)
    {
      onUnmappableCharAction = paramCodingErrorAction2;
      return;
      paramCharset = Consts.ASCII;
      break;
      label112:
      paramInt2 = 512;
      break label68;
      label120:
      paramCodingErrorAction1 = CodingErrorAction.REPORT;
      break label87;
      label128:
      paramCodingErrorAction2 = CodingErrorAction.REPORT;
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
  
  private void writeEncoded(CharBuffer paramCharBuffer)
    throws IOException
  {
    if (!paramCharBuffer.hasRemaining()) {
      return;
    }
    if (encoder == null)
    {
      encoder = charset.newEncoder();
      encoder.onMalformedInput(onMalformedCharAction);
      encoder.onUnmappableCharacter(onUnmappableCharAction);
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
  
  public int capacity()
  {
    return buffer.capacity();
  }
  
  protected HttpTransportMetricsImpl createTransportMetrics()
  {
    return new HttpTransportMetricsImpl();
  }
  
  public void flush()
    throws IOException
  {
    flushBuffer();
    outstream.flush();
  }
  
  protected void flushBuffer()
    throws IOException
  {
    int i = buffer.length();
    if (i > 0)
    {
      outstream.write(buffer.buffer(), 0, i);
      buffer.clear();
      metrics.incrementBytesTransferred(i);
    }
  }
  
  public HttpTransportMetrics getMetrics()
  {
    return metrics;
  }
  
  protected void init(OutputStream paramOutputStream, int paramInt, HttpParams paramHttpParams)
  {
    Args.notNull(paramOutputStream, "Input stream");
    Args.notNegative(paramInt, "Buffer size");
    Args.notNull(paramHttpParams, "HTTP parameters");
    outstream = paramOutputStream;
    buffer = new ByteArrayBuffer(paramInt);
    paramOutputStream = (String)paramHttpParams.getParameter("http.protocol.element-charset");
    if (paramOutputStream != null)
    {
      paramOutputStream = Charset.forName(paramOutputStream);
      charset = paramOutputStream;
      ascii = charset.equals(Consts.ASCII);
      encoder = null;
      minChunkLimit = paramHttpParams.getIntParameter("http.connection.min-chunk-limit", 512);
      metrics = createTransportMetrics();
      paramOutputStream = (CodingErrorAction)paramHttpParams.getParameter("http.malformed.input.action");
      if (paramOutputStream == null) {
        break label156;
      }
      label122:
      onMalformedCharAction = paramOutputStream;
      paramOutputStream = (CodingErrorAction)paramHttpParams.getParameter("http.unmappable.input.action");
      if (paramOutputStream == null) {
        break label163;
      }
    }
    for (;;)
    {
      onUnmappableCharAction = paramOutputStream;
      return;
      paramOutputStream = Consts.ASCII;
      break;
      label156:
      paramOutputStream = CodingErrorAction.REPORT;
      break label122;
      label163:
      paramOutputStream = CodingErrorAction.REPORT;
    }
  }
  
  public int length()
  {
    return buffer.length();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (buffer.isFull()) {
      flushBuffer();
    }
    buffer.append(paramInt);
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
    if ((paramInt2 > minChunkLimit) || (paramInt2 > buffer.capacity()))
    {
      flushBuffer();
      outstream.write(paramArrayOfByte, paramInt1, paramInt2);
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
      if (ascii)
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
    if (ascii)
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
