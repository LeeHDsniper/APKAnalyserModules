package okio;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class Okio
{
  private static final Logger logger = Logger.getLogger(Okio.class.getName());
  
  private Okio() {}
  
  public static Sink appendingSink(File paramFile)
    throws FileNotFoundException
  {
    if (paramFile == null) {
      throw new IllegalArgumentException("file == null");
    }
    return sink(new FileOutputStream(paramFile, true));
  }
  
  public static BufferedSink buffer(Sink paramSink)
  {
    if (paramSink == null) {
      throw new IllegalArgumentException("sink == null");
    }
    return new RealBufferedSink(paramSink);
  }
  
  public static BufferedSource buffer(Source paramSource)
  {
    if (paramSource == null) {
      throw new IllegalArgumentException("source == null");
    }
    return new RealBufferedSource(paramSource);
  }
  
  public static Sink sink(File paramFile)
    throws FileNotFoundException
  {
    if (paramFile == null) {
      throw new IllegalArgumentException("file == null");
    }
    return sink(new FileOutputStream(paramFile));
  }
  
  public static Sink sink(OutputStream paramOutputStream)
  {
    return sink(paramOutputStream, new Timeout());
  }
  
  private static Sink sink(final OutputStream paramOutputStream, Timeout paramTimeout)
  {
    if (paramOutputStream == null) {
      throw new IllegalArgumentException("out == null");
    }
    if (paramTimeout == null) {
      throw new IllegalArgumentException("timeout == null");
    }
    new Sink()
    {
      public void close()
        throws IOException
      {
        paramOutputStream.close();
      }
      
      public void flush()
        throws IOException
      {
        paramOutputStream.flush();
      }
      
      public Timeout timeout()
      {
        return val$timeout;
      }
      
      public String toString()
      {
        return "sink(" + paramOutputStream + ")";
      }
      
      public void write(Buffer paramAnonymousBuffer, long paramAnonymousLong)
        throws IOException
      {
        Util.checkOffsetAndCount(size, 0L, paramAnonymousLong);
        while (paramAnonymousLong > 0L)
        {
          val$timeout.throwIfReached();
          Segment localSegment = head;
          int i = (int)Math.min(paramAnonymousLong, limit - pos);
          paramOutputStream.write(data, pos, i);
          pos += i;
          long l = paramAnonymousLong - i;
          size -= i;
          paramAnonymousLong = l;
          if (pos == limit)
          {
            head = localSegment.pop();
            SegmentPool.INSTANCE.recycle(localSegment);
            paramAnonymousLong = l;
          }
        }
      }
    };
  }
  
  public static Sink sink(Socket paramSocket)
    throws IOException
  {
    if (paramSocket == null) {
      throw new IllegalArgumentException("socket == null");
    }
    AsyncTimeout localAsyncTimeout = timeout(paramSocket);
    return localAsyncTimeout.sink(sink(paramSocket.getOutputStream(), localAsyncTimeout));
  }
  
  public static Source source(File paramFile)
    throws FileNotFoundException
  {
    if (paramFile == null) {
      throw new IllegalArgumentException("file == null");
    }
    return source(new FileInputStream(paramFile));
  }
  
  public static Source source(InputStream paramInputStream)
  {
    return source(paramInputStream, new Timeout());
  }
  
  private static Source source(final InputStream paramInputStream, Timeout paramTimeout)
  {
    if (paramInputStream == null) {
      throw new IllegalArgumentException("in == null");
    }
    if (paramTimeout == null) {
      throw new IllegalArgumentException("timeout == null");
    }
    new Source()
    {
      public void close()
        throws IOException
      {
        paramInputStream.close();
      }
      
      public long read(Buffer paramAnonymousBuffer, long paramAnonymousLong)
        throws IOException
      {
        if (paramAnonymousLong < 0L) {
          throw new IllegalArgumentException("byteCount < 0: " + paramAnonymousLong);
        }
        val$timeout.throwIfReached();
        Segment localSegment = paramAnonymousBuffer.writableSegment(1);
        int i = (int)Math.min(paramAnonymousLong, 2048 - limit);
        i = paramInputStream.read(data, limit, i);
        if (i == -1) {
          return -1L;
        }
        limit += i;
        size += i;
        return i;
      }
      
      public Timeout timeout()
      {
        return val$timeout;
      }
      
      public String toString()
      {
        return "source(" + paramInputStream + ")";
      }
    };
  }
  
  public static Source source(Socket paramSocket)
    throws IOException
  {
    if (paramSocket == null) {
      throw new IllegalArgumentException("socket == null");
    }
    AsyncTimeout localAsyncTimeout = timeout(paramSocket);
    return localAsyncTimeout.source(source(paramSocket.getInputStream(), localAsyncTimeout));
  }
  
  private static AsyncTimeout timeout(Socket paramSocket)
  {
    new AsyncTimeout()
    {
      protected void timedOut()
      {
        try
        {
          val$socket.close();
          return;
        }
        catch (Exception localException)
        {
          Okio.logger.log(Level.WARNING, "Failed to close timed out socket " + val$socket, localException);
        }
      }
    };
  }
}
