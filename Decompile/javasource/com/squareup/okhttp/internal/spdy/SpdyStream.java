package com.squareup.okhttp.internal.spdy;

import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.ArrayList;
import java.util.List;
import okio.AsyncTimeout;
import okio.Buffer;
import okio.BufferedSource;
import okio.Sink;
import okio.Source;
import okio.Timeout;

public final class SpdyStream
{
  long bytesLeftInWriteWindow;
  private final SpdyConnection connection;
  private ErrorCode errorCode = null;
  private final int id;
  private final SpdyTimeout readTimeout = new SpdyTimeout();
  private long readTimeoutMillis = 0L;
  private final List<Header> requestHeaders;
  private List<Header> responseHeaders;
  final SpdyDataSink sink;
  private final SpdyDataSource source;
  long unacknowledgedBytesRead = 0L;
  private final SpdyTimeout writeTimeout = new SpdyTimeout();
  
  static
  {
    if (!SpdyStream.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  SpdyStream(int paramInt, SpdyConnection paramSpdyConnection, boolean paramBoolean1, boolean paramBoolean2, List<Header> paramList)
  {
    if (paramSpdyConnection == null) {
      throw new NullPointerException("connection == null");
    }
    if (paramList == null) {
      throw new NullPointerException("requestHeaders == null");
    }
    id = paramInt;
    connection = paramSpdyConnection;
    bytesLeftInWriteWindow = peerSettings.getInitialWindowSize(65536);
    source = new SpdyDataSource(okHttpSettings.getInitialWindowSize(65536), null);
    sink = new SpdyDataSink();
    SpdyDataSource.access$102(source, paramBoolean2);
    SpdyDataSink.access$202(sink, paramBoolean1);
    requestHeaders = paramList;
  }
  
  private void cancelStreamIfNecessary()
    throws IOException
  {
    assert (!Thread.holdsLock(this));
    for (;;)
    {
      try
      {
        boolean bool;
        if ((!source.finished) && (source.closed))
        {
          if (sink.finished) {
            break label112;
          }
          if (sink.closed)
          {
            break label112;
            bool = isOpen();
            if (i == 0) {
              break label95;
            }
            close(ErrorCode.CANCEL);
            return;
          }
        }
        i = 0;
        continue;
        if (bool) {
          continue;
        }
      }
      finally {}
      label95:
      connection.removeStream(id);
      return;
      label112:
      int i = 1;
    }
  }
  
  private void checkOutNotClosed()
    throws IOException
  {
    if (sink.closed) {
      throw new IOException("stream closed");
    }
    if (sink.finished) {
      throw new IOException("stream finished");
    }
    if (errorCode != null) {
      throw new IOException("stream was reset: " + errorCode);
    }
  }
  
  private boolean closeInternal(ErrorCode paramErrorCode)
  {
    assert (!Thread.holdsLock(this));
    try
    {
      if (errorCode != null) {
        return false;
      }
      if ((source.finished) && (sink.finished)) {
        return false;
      }
    }
    finally {}
    errorCode = paramErrorCode;
    notifyAll();
    connection.removeStream(id);
    return true;
  }
  
  private void waitForIo()
    throws InterruptedIOException
  {
    try
    {
      wait();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new InterruptedIOException();
    }
  }
  
  void addBytesToWriteWindow(long paramLong)
  {
    bytesLeftInWriteWindow += paramLong;
    if (paramLong > 0L) {
      notifyAll();
    }
  }
  
  public void close(ErrorCode paramErrorCode)
    throws IOException
  {
    if (!closeInternal(paramErrorCode)) {
      return;
    }
    connection.writeSynReset(id, paramErrorCode);
  }
  
  public void closeLater(ErrorCode paramErrorCode)
  {
    if (!closeInternal(paramErrorCode)) {
      return;
    }
    connection.writeSynResetLater(id, paramErrorCode);
  }
  
  public int getId()
  {
    return id;
  }
  
  public List<Header> getResponseHeaders()
    throws IOException
  {
    try
    {
      readTimeout.enter();
    }
    finally
    {
      try
      {
        while ((responseHeaders == null) && (errorCode == null)) {
          waitForIo();
        }
      }
      finally
      {
        readTimeout.exitAndThrowIfTimedOut();
      }
    }
    readTimeout.exitAndThrowIfTimedOut();
    if (responseHeaders != null)
    {
      List localList = responseHeaders;
      return localList;
    }
    throw new IOException("stream was reset: " + errorCode);
  }
  
  public Sink getSink()
  {
    try
    {
      if ((responseHeaders == null) && (!isLocallyInitiated())) {
        throw new IllegalStateException("reply before requesting the sink");
      }
    }
    finally {}
    return sink;
  }
  
  public Source getSource()
  {
    return source;
  }
  
  public boolean isLocallyInitiated()
  {
    if ((id & 0x1) == 1) {}
    for (int i = 1; connection.client == i; i = 0) {
      return true;
    }
    return false;
  }
  
  /* Error */
  public boolean isOpen()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 66	com/squareup/okhttp/internal/spdy/SpdyStream:errorCode	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   8: astore_2
    //   9: aload_2
    //   10: ifnull +7 -> 17
    //   13: aload_0
    //   14: monitorexit
    //   15: iload_1
    //   16: ireturn
    //   17: aload_0
    //   18: getfield 102	com/squareup/okhttp/internal/spdy/SpdyStream:source	Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;
    //   21: invokestatic 156	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:access$100	(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;)Z
    //   24: ifne +13 -> 37
    //   27: aload_0
    //   28: getfield 102	com/squareup/okhttp/internal/spdy/SpdyStream:source	Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;
    //   31: invokestatic 159	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:access$300	(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;)Z
    //   34: ifeq +32 -> 66
    //   37: aload_0
    //   38: getfield 105	com/squareup/okhttp/internal/spdy/SpdyStream:sink	Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;
    //   41: invokestatic 163	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink:access$200	(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;)Z
    //   44: ifne +13 -> 57
    //   47: aload_0
    //   48: getfield 105	com/squareup/okhttp/internal/spdy/SpdyStream:sink	Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;
    //   51: invokestatic 166	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink:access$400	(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;)Z
    //   54: ifeq +12 -> 66
    //   57: aload_0
    //   58: getfield 235	com/squareup/okhttp/internal/spdy/SpdyStream:responseHeaders	Ljava/util/List;
    //   61: astore_2
    //   62: aload_2
    //   63: ifnonnull -50 -> 13
    //   66: iconst_1
    //   67: istore_1
    //   68: goto -55 -> 13
    //   71: astore_2
    //   72: aload_0
    //   73: monitorexit
    //   74: aload_2
    //   75: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	76	0	this	SpdyStream
    //   1	67	1	bool	boolean
    //   8	55	2	localObject1	Object
    //   71	4	2	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   4	9	71	finally
    //   17	37	71	finally
    //   37	57	71	finally
    //   57	62	71	finally
  }
  
  public Timeout readTimeout()
  {
    return readTimeout;
  }
  
  void receiveData(BufferedSource paramBufferedSource, int paramInt)
    throws IOException
  {
    assert (!Thread.holdsLock(this));
    source.receive(paramBufferedSource, paramInt);
  }
  
  void receiveFin()
  {
    assert (!Thread.holdsLock(this));
    try
    {
      SpdyDataSource.access$102(source, true);
      boolean bool = isOpen();
      notifyAll();
      if (!bool) {
        connection.removeStream(id);
      }
      return;
    }
    finally {}
  }
  
  void receiveHeaders(List<Header> paramList, HeadersMode paramHeadersMode)
  {
    assert (!Thread.holdsLock(this));
    Object localObject = null;
    boolean bool = true;
    label97:
    do
    {
      for (;;)
      {
        try
        {
          if (responseHeaders == null)
          {
            if (paramHeadersMode.failIfHeadersAbsent())
            {
              paramList = ErrorCode.PROTOCOL_ERROR;
              if (paramList == null) {
                break;
              }
              closeLater(paramList);
              return;
            }
            responseHeaders = paramList;
            bool = isOpen();
            notifyAll();
            paramList = localObject;
            continue;
          }
          if (!paramHeadersMode.failIfHeadersPresent()) {
            break label97;
          }
        }
        finally {}
        paramList = ErrorCode.STREAM_IN_USE;
        continue;
        paramHeadersMode = new ArrayList();
        paramHeadersMode.addAll(responseHeaders);
        paramHeadersMode.addAll(paramList);
        responseHeaders = paramHeadersMode;
        paramList = localObject;
      }
    } while (bool);
    connection.removeStream(id);
  }
  
  void receiveRstStream(ErrorCode paramErrorCode)
  {
    try
    {
      if (errorCode == null)
      {
        errorCode = paramErrorCode;
        notifyAll();
      }
      return;
    }
    finally
    {
      paramErrorCode = finally;
      throw paramErrorCode;
    }
  }
  
  final class SpdyDataSink
    implements Sink
  {
    private boolean closed;
    private boolean finished;
    
    static
    {
      if (!SpdyStream.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    SpdyDataSink() {}
    
    public void close()
      throws IOException
    {
      assert (!Thread.holdsLock(SpdyStream.this));
      synchronized (SpdyStream.this)
      {
        if (closed) {
          return;
        }
        if (!sink.finished) {
          connection.writeData(id, true, null, 0L);
        }
      }
      synchronized (SpdyStream.this)
      {
        closed = true;
        connection.flush();
        SpdyStream.this.cancelStreamIfNecessary();
        return;
        localObject1 = finally;
        throw localObject1;
      }
    }
    
    public void flush()
      throws IOException
    {
      assert (!Thread.holdsLock(SpdyStream.this));
      synchronized (SpdyStream.this)
      {
        SpdyStream.this.checkOutNotClosed();
        connection.flush();
        return;
      }
    }
    
    public Timeout timeout()
    {
      return writeTimeout;
    }
    
    public void write(Buffer paramBuffer, long paramLong)
      throws IOException
    {
      long l = paramLong;
      if (!$assertionsDisabled)
      {
        l = paramLong;
        if (Thread.holdsLock(SpdyStream.this)) {
          throw new AssertionError();
        }
      }
      SpdyStream localSpdyStream1;
      try
      {
        writeTimeout.exitAndThrowIfTimedOut();
        SpdyStream.this.checkOutNotClosed();
        paramLong = Math.min(bytesLeftInWriteWindow, l);
        SpdyStream localSpdyStream2 = SpdyStream.this;
        bytesLeftInWriteWindow -= paramLong;
        l -= paramLong;
        connection.writeData(id, false, paramBuffer, paramLong);
        if (l > 0L)
        {
          localSpdyStream1 = SpdyStream.this;
          writeTimeout.enter();
        }
      }
      finally
      {
        try
        {
          for (;;)
          {
            if ((bytesLeftInWriteWindow <= 0L) && (!finished) && (!closed) && (errorCode == null)) {
              SpdyStream.this.waitForIo();
            }
          }
        }
        finally
        {
          writeTimeout.exitAndThrowIfTimedOut();
        }
      }
    }
  }
  
  private final class SpdyDataSource
    implements Source
  {
    private boolean closed;
    private boolean finished;
    private final long maxByteCount;
    private final Buffer readBuffer = new Buffer();
    private final Buffer receiveBuffer = new Buffer();
    
    static
    {
      if (!SpdyStream.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    private SpdyDataSource(long paramLong)
    {
      maxByteCount = paramLong;
    }
    
    private void checkNotClosed()
      throws IOException
    {
      if (closed) {
        throw new IOException("stream closed");
      }
      if (errorCode != null) {
        throw new IOException("stream was reset: " + errorCode);
      }
    }
    
    private void waitUntilReadable()
      throws IOException
    {
      readTimeout.enter();
      try
      {
        if (readBuffer.size() == 0L) {
          if ((!finished) && (!closed) && (errorCode == null)) {
            SpdyStream.this.waitForIo();
          }
        }
        return;
      }
      finally
      {
        readTimeout.exitAndThrowIfTimedOut();
      }
    }
    
    public void close()
      throws IOException
    {
      synchronized (SpdyStream.this)
      {
        closed = true;
        readBuffer.clear();
        notifyAll();
        SpdyStream.this.cancelStreamIfNecessary();
        return;
      }
    }
    
    public long read(Buffer arg1, long paramLong)
      throws IOException
    {
      if (paramLong < 0L) {
        throw new IllegalArgumentException("byteCount < 0: " + paramLong);
      }
      synchronized (SpdyStream.this)
      {
        waitUntilReadable();
        checkNotClosed();
        if (readBuffer.size() == 0L) {
          return -1L;
        }
        paramLong = readBuffer.read(???, Math.min(paramLong, readBuffer.size()));
        ??? = SpdyStream.this;
        unacknowledgedBytesRead += paramLong;
        if (unacknowledgedBytesRead >= connection.okHttpSettings.getInitialWindowSize(65536) / 2)
        {
          connection.writeWindowUpdateLater(id, unacknowledgedBytesRead);
          unacknowledgedBytesRead = 0L;
        }
        synchronized (connection)
        {
          ??? = connection;
          unacknowledgedBytesRead += paramLong;
          if (connection.unacknowledgedBytesRead >= connection.okHttpSettings.getInitialWindowSize(65536) / 2)
          {
            connection.writeWindowUpdateLater(0, connection.unacknowledgedBytesRead);
            connection.unacknowledgedBytesRead = 0L;
          }
          return paramLong;
        }
      }
    }
    
    void receive(BufferedSource paramBufferedSource, long paramLong)
      throws IOException
    {
      long l = paramLong;
      if (!$assertionsDisabled)
      {
        l = paramLong;
        if (Thread.holdsLock(SpdyStream.this)) {
          throw new AssertionError();
        }
      }
      for (;;)
      {
        l -= paramLong;
        synchronized (SpdyStream.this)
        {
          if (readBuffer.size() == 0L)
          {
            i = 1;
            readBuffer.writeAll(receiveBuffer);
            if (i != 0) {
              notifyAll();
            }
            if (l > 0L) {}
            boolean bool;
            synchronized (SpdyStream.this)
            {
              bool = finished;
              if (readBuffer.size() + l > maxByteCount)
              {
                i = 1;
                if (i != 0)
                {
                  paramBufferedSource.skip(l);
                  closeLater(ErrorCode.FLOW_CONTROL_ERROR);
                }
              }
              else
              {
                i = 0;
              }
            }
            if (bool)
            {
              paramBufferedSource.skip(l);
              return;
            }
            paramLong = paramBufferedSource.read(receiveBuffer, l);
            if (paramLong != -1L) {
              continue;
            }
            throw new EOFException();
          }
          int i = 0;
        }
      }
    }
    
    public Timeout timeout()
    {
      return readTimeout;
    }
  }
  
  class SpdyTimeout
    extends AsyncTimeout
  {
    SpdyTimeout() {}
    
    public void exitAndThrowIfTimedOut()
      throws InterruptedIOException
    {
      if (exit()) {
        throw new InterruptedIOException("timeout");
      }
    }
    
    protected void timedOut()
    {
      closeLater(ErrorCode.CANCEL);
    }
  }
}
