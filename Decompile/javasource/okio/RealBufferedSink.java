package okio;

import java.io.IOException;
import java.io.OutputStream;

final class RealBufferedSink
  implements BufferedSink
{
  public final Buffer buffer;
  private boolean closed;
  public final Sink sink;
  
  public RealBufferedSink(Sink paramSink)
  {
    this(paramSink, new Buffer());
  }
  
  public RealBufferedSink(Sink paramSink, Buffer paramBuffer)
  {
    if (paramSink == null) {
      throw new IllegalArgumentException("sink == null");
    }
    buffer = paramBuffer;
    sink = paramSink;
  }
  
  public Buffer buffer()
  {
    return buffer;
  }
  
  public void close()
    throws IOException
  {
    if (closed) {}
    label57:
    do
    {
      return;
      localObject2 = null;
      Object localObject1 = localObject2;
      try
      {
        if (buffer.size > 0L)
        {
          sink.write(buffer, buffer.size);
          localObject1 = localObject2;
        }
      }
      catch (Throwable localThrowable1)
      {
        for (;;) {}
      }
      try
      {
        sink.close();
        localObject2 = localObject1;
      }
      catch (Throwable localThrowable2)
      {
        localObject2 = localThrowable1;
        if (localThrowable1 != null) {
          break label57;
        }
        localObject2 = localThrowable2;
        break label57;
      }
      closed = true;
    } while (localObject2 == null);
    Util.sneakyRethrow(localObject2);
  }
  
  public BufferedSink emitCompleteSegments()
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    long l = buffer.completeSegmentByteCount();
    if (l > 0L) {
      sink.write(buffer, l);
    }
    return this;
  }
  
  public void flush()
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    if (buffer.size > 0L) {
      sink.write(buffer, buffer.size);
    }
    sink.flush();
  }
  
  public OutputStream outputStream()
  {
    new OutputStream()
    {
      public void close()
        throws IOException
      {
        RealBufferedSink.this.close();
      }
      
      public void flush()
        throws IOException
      {
        if (!closed) {
          RealBufferedSink.this.flush();
        }
      }
      
      public String toString()
      {
        return RealBufferedSink.this + ".outputStream()";
      }
      
      public void write(int paramAnonymousInt)
        throws IOException
      {
        if (closed) {
          throw new IOException("closed");
        }
        buffer.writeByte((byte)paramAnonymousInt);
        emitCompleteSegments();
      }
      
      public void write(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
        throws IOException
      {
        if (closed) {
          throw new IOException("closed");
        }
        buffer.write(paramAnonymousArrayOfByte, paramAnonymousInt1, paramAnonymousInt2);
        emitCompleteSegments();
      }
    };
  }
  
  public Timeout timeout()
  {
    return sink.timeout();
  }
  
  public String toString()
  {
    return "buffer(" + sink + ")";
  }
  
  public BufferedSink write(ByteString paramByteString)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.write(paramByteString);
    return emitCompleteSegments();
  }
  
  public BufferedSink write(byte[] paramArrayOfByte)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.write(paramArrayOfByte);
    return emitCompleteSegments();
  }
  
  public BufferedSink write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.write(paramArrayOfByte, paramInt1, paramInt2);
    return emitCompleteSegments();
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.write(paramBuffer, paramLong);
    emitCompleteSegments();
  }
  
  public long writeAll(Source paramSource)
    throws IOException
  {
    if (paramSource == null) {
      throw new IllegalArgumentException("source == null");
    }
    long l1 = 0L;
    for (;;)
    {
      long l2 = paramSource.read(buffer, 2048L);
      if (l2 == -1L) {
        break;
      }
      l1 += l2;
      emitCompleteSegments();
    }
    return l1;
  }
  
  public BufferedSink writeByte(int paramInt)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.writeByte(paramInt);
    return emitCompleteSegments();
  }
  
  public BufferedSink writeInt(int paramInt)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.writeInt(paramInt);
    return emitCompleteSegments();
  }
  
  public BufferedSink writeShort(int paramInt)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.writeShort(paramInt);
    return emitCompleteSegments();
  }
  
  public BufferedSink writeUtf8(String paramString)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    buffer.writeUtf8(paramString);
    return emitCompleteSegments();
  }
}
