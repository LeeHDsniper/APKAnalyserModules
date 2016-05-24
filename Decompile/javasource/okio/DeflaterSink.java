package okio;

import java.io.IOException;
import java.util.zip.Deflater;
import org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement;

public final class DeflaterSink
  implements Sink
{
  private boolean closed;
  private final Deflater deflater;
  private final BufferedSink sink;
  
  DeflaterSink(BufferedSink paramBufferedSink, Deflater paramDeflater)
  {
    if (paramBufferedSink == null) {
      throw new IllegalArgumentException("source == null");
    }
    if (paramDeflater == null) {
      throw new IllegalArgumentException("inflater == null");
    }
    sink = paramBufferedSink;
    deflater = paramDeflater;
  }
  
  public DeflaterSink(Sink paramSink, Deflater paramDeflater)
  {
    this(Okio.buffer(paramSink), paramDeflater);
  }
  
  @IgnoreJRERequirement
  private void deflate(boolean paramBoolean)
    throws IOException
  {
    Buffer localBuffer = sink.buffer();
    label119:
    do
    {
      Segment localSegment = localBuffer.writableSegment(1);
      if (paramBoolean) {}
      for (int i = deflater.deflate(data, limit, 2048 - limit, 2);; i = deflater.deflate(data, limit, 2048 - limit))
      {
        if (i <= 0) {
          break label119;
        }
        limit += i;
        size += i;
        sink.emitCompleteSegments();
        break;
      }
    } while (!deflater.needsInput());
  }
  
  public void close()
    throws IOException
  {
    if (closed) {}
    for (;;)
    {
      return;
      Object localObject2 = null;
      try
      {
        finishDeflate();
        try
        {
          deflater.end();
          localObject1 = localObject2;
        }
        catch (Throwable localThrowable2)
        {
          for (;;)
          {
            label34:
            localObject1 = localThrowable1;
            if (localThrowable1 == null) {
              localObject1 = localThrowable2;
            }
          }
        }
        try
        {
          sink.close();
          localObject2 = localObject1;
        }
        catch (Throwable localThrowable3)
        {
          Object localObject3 = localObject1;
          if (localObject1 != null) {
            break label34;
          }
          localObject3 = localThrowable3;
          break label34;
        }
        closed = true;
        if (localObject2 == null) {
          continue;
        }
        Util.sneakyRethrow(localObject2);
        return;
      }
      catch (Throwable localThrowable1)
      {
        for (;;) {}
      }
    }
  }
  
  void finishDeflate()
    throws IOException
  {
    deflater.finish();
    deflate(false);
  }
  
  public void flush()
    throws IOException
  {
    deflate(true);
    sink.flush();
  }
  
  public Timeout timeout()
  {
    return sink.timeout();
  }
  
  public String toString()
  {
    return "DeflaterSink(" + sink + ")";
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    Util.checkOffsetAndCount(size, 0L, paramLong);
    while (paramLong > 0L)
    {
      Segment localSegment = head;
      int i = (int)Math.min(paramLong, limit - pos);
      deflater.setInput(data, pos, i);
      deflate(false);
      size -= i;
      pos += i;
      if (pos == limit)
      {
        head = localSegment.pop();
        SegmentPool.INSTANCE.recycle(localSegment);
      }
      paramLong -= i;
    }
  }
}
