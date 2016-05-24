package okio;

import java.io.EOFException;
import java.io.IOException;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

public final class InflaterSource
  implements Source
{
  private int bufferBytesHeldByInflater;
  private boolean closed;
  private final Inflater inflater;
  private final BufferedSource source;
  
  InflaterSource(BufferedSource paramBufferedSource, Inflater paramInflater)
  {
    if (paramBufferedSource == null) {
      throw new IllegalArgumentException("source == null");
    }
    if (paramInflater == null) {
      throw new IllegalArgumentException("inflater == null");
    }
    source = paramBufferedSource;
    inflater = paramInflater;
  }
  
  public InflaterSource(Source paramSource, Inflater paramInflater)
  {
    this(Okio.buffer(paramSource), paramInflater);
  }
  
  private void releaseInflatedBytes()
    throws IOException
  {
    if (bufferBytesHeldByInflater == 0) {
      return;
    }
    int i = bufferBytesHeldByInflater - inflater.getRemaining();
    bufferBytesHeldByInflater -= i;
    source.skip(i);
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    inflater.end();
    closed = true;
    source.close();
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    if (closed) {
      throw new IllegalStateException("closed");
    }
    if (paramLong == 0L) {
      return 0L;
    }
    for (;;)
    {
      boolean bool = refill();
      try
      {
        Segment localSegment = paramBuffer.writableSegment(1);
        int i = inflater.inflate(data, limit, 2048 - limit);
        if (i > 0)
        {
          limit += i;
          size += i;
          return i;
        }
        if ((inflater.finished()) || (inflater.needsDictionary()))
        {
          releaseInflatedBytes();
          return -1L;
        }
        if (!bool) {
          continue;
        }
        throw new EOFException("source exhausted prematurely");
      }
      catch (DataFormatException paramBuffer)
      {
        throw new IOException(paramBuffer);
      }
    }
  }
  
  public boolean refill()
    throws IOException
  {
    if (!inflater.needsInput()) {
      return false;
    }
    releaseInflatedBytes();
    if (inflater.getRemaining() != 0) {
      throw new IllegalStateException("?");
    }
    if (source.exhausted()) {
      return true;
    }
    Segment localSegment = source.buffer().head;
    bufferBytesHeldByInflater = (limit - pos);
    inflater.setInput(data, pos, bufferBytesHeldByInflater);
    return false;
  }
  
  public Timeout timeout()
  {
    return source.timeout();
  }
}
