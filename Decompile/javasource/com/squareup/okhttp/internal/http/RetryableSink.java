package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.net.ProtocolException;
import okio.Buffer;
import okio.Sink;
import okio.Timeout;

public final class RetryableSink
  implements Sink
{
  private boolean closed;
  private final Buffer content = new Buffer();
  private final int limit;
  
  public RetryableSink()
  {
    this(-1);
  }
  
  public RetryableSink(int paramInt)
  {
    limit = paramInt;
  }
  
  public void close()
    throws IOException
  {
    if (closed) {}
    do
    {
      return;
      closed = true;
    } while (content.size() >= limit);
    throw new ProtocolException("content-length promised " + limit + " bytes, but received " + content.size());
  }
  
  public long contentLength()
    throws IOException
  {
    return content.size();
  }
  
  public void flush()
    throws IOException
  {}
  
  public Timeout timeout()
  {
    return Timeout.NONE;
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    Util.checkOffsetAndCount(paramBuffer.size(), 0L, paramLong);
    if ((limit != -1) && (content.size() > limit - paramLong)) {
      throw new ProtocolException("exceeded content-length limit of " + limit + " bytes");
    }
    content.write(paramBuffer, paramLong);
  }
  
  public void writeToSocket(Sink paramSink)
    throws IOException
  {
    Buffer localBuffer = content.clone();
    paramSink.write(localBuffer, localBuffer.size());
  }
}
