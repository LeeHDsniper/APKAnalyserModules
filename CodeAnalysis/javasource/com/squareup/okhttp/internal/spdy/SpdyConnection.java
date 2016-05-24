package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.internal.NamedRunnable;
import com.squareup.okhttp.internal.Util;
import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;

public final class SpdyConnection
  implements Closeable
{
  private static final ExecutorService executor;
  long bytesLeftInWriteWindow;
  final boolean client;
  private final Set<Integer> currentPushRequests = new LinkedHashSet();
  final FrameWriter frameWriter;
  private final IncomingStreamHandler handler;
  private final String hostName;
  private long idleStartTimeNs = System.nanoTime();
  private int lastGoodStreamId;
  private int nextPingId;
  private int nextStreamId;
  final Settings okHttpSettings = new Settings();
  final Settings peerSettings = new Settings();
  private Map<Integer, Ping> pings;
  final Protocol protocol;
  private final ExecutorService pushExecutor;
  private final PushObserver pushObserver;
  final Reader readerRunnable;
  private boolean receivedInitialPeerSettings = false;
  private boolean shutdown;
  final Socket socket;
  private final Map<Integer, SpdyStream> streams = new HashMap();
  long unacknowledgedBytesRead = 0L;
  final Variant variant;
  
  static
  {
    if (!SpdyConnection.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      executor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60L, TimeUnit.SECONDS, new SynchronousQueue(), Util.threadFactory("OkHttp SpdyConnection", true));
      return;
    }
  }
  
  private SpdyConnection(Builder paramBuilder)
    throws IOException
  {
    protocol = protocol;
    pushObserver = pushObserver;
    client = client;
    handler = handler;
    int i;
    if (client)
    {
      i = 1;
      nextStreamId = i;
      if ((client) && (protocol == Protocol.HTTP_2)) {
        nextStreamId += 2;
      }
      i = j;
      if (client) {
        i = 1;
      }
      nextPingId = i;
      if (client) {
        okHttpSettings.set(7, 0, 16777216);
      }
      hostName = hostName;
      if (protocol != Protocol.HTTP_2) {
        break label359;
      }
      variant = new Http20Draft14();
      pushExecutor = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory(String.format("OkHttp %s Push Observer", new Object[] { hostName }), true));
      peerSettings.set(7, 0, 65535);
      peerSettings.set(5, 0, 16384);
    }
    for (;;)
    {
      bytesLeftInWriteWindow = peerSettings.getInitialWindowSize(65536);
      socket = socket;
      frameWriter = variant.newWriter(Okio.buffer(Okio.sink(socket)), client);
      readerRunnable = new Reader(null);
      new Thread(readerRunnable).start();
      return;
      i = 2;
      break;
      label359:
      if (protocol != Protocol.SPDY_3) {
        break label388;
      }
      variant = new Spdy3();
      pushExecutor = null;
    }
    label388:
    throw new AssertionError(protocol);
  }
  
  private void close(ErrorCode paramErrorCode1, ErrorCode paramErrorCode2)
    throws IOException
  {
    assert (!Thread.holdsLock(this));
    Object localObject = null;
    try
    {
      shutdown(paramErrorCode1);
      paramErrorCode1 = (ErrorCode)localObject;
    }
    catch (IOException paramErrorCode1)
    {
      SpdyStream[] arrayOfSpdyStream;
      for (;;) {}
    }
    arrayOfSpdyStream = null;
    Ping[] arrayOfPing = null;
    int j;
    int i;
    for (;;)
    {
      try
      {
        if (!streams.isEmpty())
        {
          arrayOfSpdyStream = (SpdyStream[])streams.values().toArray(new SpdyStream[streams.size()]);
          streams.clear();
          setIdle(false);
        }
        if (pings != null)
        {
          arrayOfPing = (Ping[])pings.values().toArray(new Ping[pings.size()]);
          pings = null;
        }
        localObject = paramErrorCode1;
        if (arrayOfSpdyStream == null) {
          break label216;
        }
        j = arrayOfSpdyStream.length;
        i = 0;
        localObject = paramErrorCode1;
        if (i >= j) {
          break label216;
        }
        localObject = arrayOfSpdyStream[i];
      }
      finally {}
      try
      {
        ((SpdyStream)localObject).close(paramErrorCode2);
        localObject = paramErrorCode1;
      }
      catch (IOException localIOException)
      {
        localObject = paramErrorCode1;
        if (paramErrorCode1 == null) {
          continue;
        }
        localObject = localIOException;
        continue;
      }
      i += 1;
      paramErrorCode1 = (ErrorCode)localObject;
    }
    label216:
    if (arrayOfPing != null)
    {
      j = arrayOfPing.length;
      i = 0;
      while (i < j)
      {
        arrayOfPing[i].cancel();
        i += 1;
      }
    }
    try
    {
      frameWriter.close();
      paramErrorCode1 = (ErrorCode)localObject;
      return;
    }
    catch (IOException paramErrorCode2)
    {
      try
      {
        for (;;)
        {
          socket.close();
          if (paramErrorCode1 == null) {
            break;
          }
          throw paramErrorCode1;
          paramErrorCode2 = paramErrorCode2;
          paramErrorCode1 = (ErrorCode)localObject;
          if (localObject == null) {
            paramErrorCode1 = paramErrorCode2;
          }
        }
      }
      catch (IOException paramErrorCode1)
      {
        for (;;) {}
      }
    }
  }
  
  private SpdyStream newStream(int paramInt, List<Header> paramList, boolean paramBoolean1, boolean paramBoolean2)
    throws IOException
  {
    boolean bool2 = true;
    boolean bool1;
    if (!paramBoolean1)
    {
      bool1 = true;
      if (paramBoolean2) {
        break label65;
      }
    }
    label65:
    for (paramBoolean2 = bool2;; paramBoolean2 = false)
    {
      synchronized (frameWriter)
      {
        try
        {
          if (!shutdown) {
            break label71;
          }
          throw new IOException("shutdown");
        }
        finally {}
      }
      bool1 = false;
      break;
    }
    label71:
    int i = nextStreamId;
    nextStreamId += 2;
    SpdyStream localSpdyStream = new SpdyStream(i, this, bool1, paramBoolean2, paramList);
    if (localSpdyStream.isOpen())
    {
      streams.put(Integer.valueOf(i), localSpdyStream);
      setIdle(false);
    }
    if (paramInt == 0) {
      frameWriter.synStream(bool1, paramBoolean2, i, paramInt, paramList);
    }
    for (;;)
    {
      if (!paramBoolean1) {
        frameWriter.flush();
      }
      return localSpdyStream;
      if (client) {
        throw new IllegalArgumentException("client streams shouldn't have associated stream IDs");
      }
      frameWriter.pushPromise(paramInt, i, paramList);
    }
  }
  
  private void pushDataLater(final int paramInt1, BufferedSource paramBufferedSource, final int paramInt2, final boolean paramBoolean)
    throws IOException
  {
    final Buffer localBuffer = new Buffer();
    paramBufferedSource.require(paramInt2);
    paramBufferedSource.read(localBuffer, paramInt2);
    if (localBuffer.size() != paramInt2) {
      throw new IOException(localBuffer.size() + " != " + paramInt2);
    }
    pushExecutor.submit(new NamedRunnable("OkHttp %s Push Data[%s]", new Object[] { hostName, Integer.valueOf(paramInt1) })
    {
      public void execute()
      {
        try
        {
          boolean bool = pushObserver.onData(paramInt1, localBuffer, paramInt2, paramBoolean);
          if (bool) {
            frameWriter.rstStream(paramInt1, ErrorCode.CANCEL);
          }
          if ((bool) || (paramBoolean)) {
            synchronized (SpdyConnection.this)
            {
              currentPushRequests.remove(Integer.valueOf(paramInt1));
              return;
            }
          }
          return;
        }
        catch (IOException localIOException) {}
      }
    });
  }
  
  private void pushHeadersLater(final int paramInt, final List<Header> paramList, final boolean paramBoolean)
  {
    pushExecutor.submit(new NamedRunnable("OkHttp %s Push Headers[%s]", new Object[] { hostName, Integer.valueOf(paramInt) })
    {
      public void execute()
      {
        boolean bool = pushObserver.onHeaders(paramInt, paramList, paramBoolean);
        if (bool) {}
        try
        {
          frameWriter.rstStream(paramInt, ErrorCode.CANCEL);
          if ((bool) || (paramBoolean)) {
            synchronized (SpdyConnection.this)
            {
              currentPushRequests.remove(Integer.valueOf(paramInt));
              return;
            }
          }
          return;
        }
        catch (IOException localIOException) {}
      }
    });
  }
  
  private void pushRequestLater(final int paramInt, final List<Header> paramList)
  {
    try
    {
      if (currentPushRequests.contains(Integer.valueOf(paramInt)))
      {
        writeSynResetLater(paramInt, ErrorCode.PROTOCOL_ERROR);
        return;
      }
      currentPushRequests.add(Integer.valueOf(paramInt));
      pushExecutor.submit(new NamedRunnable("OkHttp %s Push Request[%s]", new Object[] { hostName, Integer.valueOf(paramInt) })
      {
        public void execute()
        {
          if (pushObserver.onRequest(paramInt, paramList)) {
            try
            {
              frameWriter.rstStream(paramInt, ErrorCode.CANCEL);
              synchronized (SpdyConnection.this)
              {
                currentPushRequests.remove(Integer.valueOf(paramInt));
                return;
              }
              return;
            }
            catch (IOException localIOException) {}
          }
        }
      });
      return;
    }
    finally {}
  }
  
  private void pushResetLater(final int paramInt, final ErrorCode paramErrorCode)
  {
    pushExecutor.submit(new NamedRunnable("OkHttp %s Push Reset[%s]", new Object[] { hostName, Integer.valueOf(paramInt) })
    {
      public void execute()
      {
        pushObserver.onReset(paramInt, paramErrorCode);
        synchronized (SpdyConnection.this)
        {
          currentPushRequests.remove(Integer.valueOf(paramInt));
          return;
        }
      }
    });
  }
  
  private boolean pushedStream(int paramInt)
  {
    return (protocol == Protocol.HTTP_2) && (paramInt != 0) && ((paramInt & 0x1) == 0);
  }
  
  /* Error */
  private Ping removePing(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 387	com/squareup/okhttp/internal/spdy/SpdyConnection:pings	Ljava/util/Map;
    //   6: ifnull +24 -> 30
    //   9: aload_0
    //   10: getfield 387	com/squareup/okhttp/internal/spdy/SpdyConnection:pings	Ljava/util/Map;
    //   13: iload_1
    //   14: invokestatic 421	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   17: invokeinterface 526 2 0
    //   22: checkcast 389	com/squareup/okhttp/internal/spdy/Ping
    //   25: astore_2
    //   26: aload_0
    //   27: monitorexit
    //   28: aload_2
    //   29: areturn
    //   30: aconst_null
    //   31: astore_2
    //   32: goto -6 -> 26
    //   35: astore_2
    //   36: aload_0
    //   37: monitorexit
    //   38: aload_2
    //   39: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	40	0	this	SpdyConnection
    //   0	40	1	paramInt	int
    //   25	7	2	localPing	Ping
    //   35	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	26	35	finally
  }
  
  private void setIdle(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (;;)
    {
      try
      {
        l = System.nanoTime();
        idleStartTimeNs = l;
        return;
      }
      finally {}
      long l = Long.MAX_VALUE;
    }
  }
  
  private void writePing(boolean paramBoolean, int paramInt1, int paramInt2, Ping paramPing)
    throws IOException
  {
    FrameWriter localFrameWriter = frameWriter;
    if (paramPing != null) {}
    try
    {
      paramPing.send();
      frameWriter.ping(paramBoolean, paramInt1, paramInt2);
      return;
    }
    finally {}
  }
  
  private void writePingLater(final boolean paramBoolean, final int paramInt1, final int paramInt2, final Ping paramPing)
  {
    executor.submit(new NamedRunnable("OkHttp %s ping %08x%08x", new Object[] { hostName, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) })
    {
      public void execute()
      {
        try
        {
          SpdyConnection.this.writePing(paramBoolean, paramInt1, paramInt2, paramPing);
          return;
        }
        catch (IOException localIOException) {}
      }
    });
  }
  
  void addBytesToWriteWindow(long paramLong)
  {
    bytesLeftInWriteWindow += paramLong;
    if (paramLong > 0L) {
      notifyAll();
    }
  }
  
  public void close()
    throws IOException
  {
    close(ErrorCode.NO_ERROR, ErrorCode.CANCEL);
  }
  
  public void flush()
    throws IOException
  {
    frameWriter.flush();
  }
  
  public long getIdleStartTimeNs()
  {
    try
    {
      long l = idleStartTimeNs;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public Protocol getProtocol()
  {
    return protocol;
  }
  
  SpdyStream getStream(int paramInt)
  {
    try
    {
      SpdyStream localSpdyStream = (SpdyStream)streams.get(Integer.valueOf(paramInt));
      return localSpdyStream;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public boolean isIdle()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 130	com/squareup/okhttp/internal/spdy/SpdyConnection:idleStartTimeNs	J
    //   6: lstore_1
    //   7: lload_1
    //   8: ldc2_w 527
    //   11: lcmp
    //   12: ifeq +9 -> 21
    //   15: iconst_1
    //   16: istore_3
    //   17: aload_0
    //   18: monitorexit
    //   19: iload_3
    //   20: ireturn
    //   21: iconst_0
    //   22: istore_3
    //   23: goto -6 -> 17
    //   26: astore 4
    //   28: aload_0
    //   29: monitorexit
    //   30: aload 4
    //   32: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	33	0	this	SpdyConnection
    //   6	2	1	l	long
    //   16	7	3	bool	boolean
    //   26	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	26	finally
  }
  
  public SpdyStream newStream(List<Header> paramList, boolean paramBoolean1, boolean paramBoolean2)
    throws IOException
  {
    return newStream(0, paramList, paramBoolean1, paramBoolean2);
  }
  
  SpdyStream removeStream(int paramInt)
  {
    try
    {
      SpdyStream localSpdyStream = (SpdyStream)streams.remove(Integer.valueOf(paramInt));
      if ((localSpdyStream != null) && (streams.isEmpty())) {
        setIdle(true);
      }
      return localSpdyStream;
    }
    finally {}
  }
  
  public void sendConnectionPreface()
    throws IOException
  {
    frameWriter.connectionPreface();
    frameWriter.settings(okHttpSettings);
    int i = okHttpSettings.getInitialWindowSize(65536);
    if (i != 65536) {
      frameWriter.windowUpdate(0, i - 65536);
    }
  }
  
  public void shutdown(ErrorCode paramErrorCode)
    throws IOException
  {
    int i;
    synchronized (frameWriter) {}
  }
  
  public void writeData(int paramInt, boolean paramBoolean, Buffer paramBuffer, long paramLong)
    throws IOException
  {
    long l = paramLong;
    if (paramLong == 0L)
    {
      frameWriter.data(paramBoolean, paramInt, paramBuffer, 0);
      return;
    }
    for (;;)
    {
      try
      {
        int i = Math.min((int)Math.min(l, bytesLeftInWriteWindow), frameWriter.maxDataLength());
        bytesLeftInWriteWindow -= i;
        l -= i;
        FrameWriter localFrameWriter = frameWriter;
        if ((paramBoolean) && (l == 0L))
        {
          bool = true;
          localFrameWriter.data(bool, paramInt, paramBuffer, i);
          if (l <= 0L) {
            break;
          }
          try
          {
            if (bytesLeftInWriteWindow > 0L) {
              continue;
            }
            wait();
            continue;
            paramBuffer = finally;
          }
          catch (InterruptedException paramBuffer)
          {
            throw new InterruptedIOException();
          }
        }
        boolean bool = false;
      }
      finally {}
    }
  }
  
  void writeSynReset(int paramInt, ErrorCode paramErrorCode)
    throws IOException
  {
    frameWriter.rstStream(paramInt, paramErrorCode);
  }
  
  void writeSynResetLater(final int paramInt, final ErrorCode paramErrorCode)
  {
    executor.submit(new NamedRunnable("OkHttp %s stream %d", new Object[] { hostName, Integer.valueOf(paramInt) })
    {
      public void execute()
      {
        try
        {
          writeSynReset(paramInt, paramErrorCode);
          return;
        }
        catch (IOException localIOException) {}
      }
    });
  }
  
  void writeWindowUpdateLater(final int paramInt, final long paramLong)
  {
    executor.submit(new NamedRunnable("OkHttp Window Update %s stream %d", new Object[] { hostName, Integer.valueOf(paramInt) })
    {
      public void execute()
      {
        try
        {
          frameWriter.windowUpdate(paramInt, paramLong);
          return;
        }
        catch (IOException localIOException) {}
      }
    });
  }
  
  public static class Builder
  {
    private boolean client;
    private IncomingStreamHandler handler = IncomingStreamHandler.REFUSE_INCOMING_STREAMS;
    private String hostName;
    private Protocol protocol = Protocol.SPDY_3;
    private PushObserver pushObserver = PushObserver.CANCEL;
    private Socket socket;
    
    public Builder(String paramString, boolean paramBoolean, Socket paramSocket)
      throws IOException
    {
      hostName = paramString;
      client = paramBoolean;
      socket = paramSocket;
    }
    
    public SpdyConnection build()
      throws IOException
    {
      return new SpdyConnection(this, null);
    }
    
    public Builder protocol(Protocol paramProtocol)
    {
      protocol = paramProtocol;
      return this;
    }
  }
  
  class Reader
    extends NamedRunnable
    implements FrameReader.Handler
  {
    FrameReader frameReader;
    
    private Reader()
    {
      super(new Object[] { hostName });
    }
    
    private void ackSettingsLater(final Settings paramSettings)
    {
      SpdyConnection.executor.submit(new NamedRunnable("OkHttp %s ACK Settings", new Object[] { hostName })
      {
        public void execute()
        {
          try
          {
            frameWriter.ackSettings(paramSettings);
            return;
          }
          catch (IOException localIOException) {}
        }
      });
    }
    
    public void ackSettings() {}
    
    public void data(boolean paramBoolean, int paramInt1, BufferedSource paramBufferedSource, int paramInt2)
      throws IOException
    {
      if (SpdyConnection.this.pushedStream(paramInt1)) {
        SpdyConnection.this.pushDataLater(paramInt1, paramBufferedSource, paramInt2, paramBoolean);
      }
      SpdyStream localSpdyStream;
      do
      {
        return;
        localSpdyStream = getStream(paramInt1);
        if (localSpdyStream == null)
        {
          writeSynResetLater(paramInt1, ErrorCode.INVALID_STREAM);
          paramBufferedSource.skip(paramInt2);
          return;
        }
        localSpdyStream.receiveData(paramBufferedSource, paramInt2);
      } while (!paramBoolean);
      localSpdyStream.receiveFin();
    }
    
    /* Error */
    protected void execute()
    {
      // Byte code:
      //   0: getstatic 101	com/squareup/okhttp/internal/spdy/ErrorCode:INTERNAL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
      //   3: astore_3
      //   4: getstatic 101	com/squareup/okhttp/internal/spdy/ErrorCode:INTERNAL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
      //   7: astore 4
      //   9: aload_3
      //   10: astore_2
      //   11: aload_3
      //   12: astore_1
      //   13: aload_0
      //   14: aload_0
      //   15: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   18: getfield 105	com/squareup/okhttp/internal/spdy/SpdyConnection:variant	Lcom/squareup/okhttp/internal/spdy/Variant;
      //   21: aload_0
      //   22: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   25: getfield 109	com/squareup/okhttp/internal/spdy/SpdyConnection:socket	Ljava/net/Socket;
      //   28: invokestatic 115	okio/Okio:source	(Ljava/net/Socket;)Lokio/Source;
      //   31: invokestatic 119	okio/Okio:buffer	(Lokio/Source;)Lokio/BufferedSource;
      //   34: aload_0
      //   35: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   38: getfield 123	com/squareup/okhttp/internal/spdy/SpdyConnection:client	Z
      //   41: invokeinterface 129 3 0
      //   46: putfield 131	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
      //   49: aload_3
      //   50: astore_2
      //   51: aload_3
      //   52: astore_1
      //   53: aload_0
      //   54: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   57: getfield 123	com/squareup/okhttp/internal/spdy/SpdyConnection:client	Z
      //   60: ifne +16 -> 76
      //   63: aload_3
      //   64: astore_2
      //   65: aload_3
      //   66: astore_1
      //   67: aload_0
      //   68: getfield 131	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
      //   71: invokeinterface 136 1 0
      //   76: aload_3
      //   77: astore_2
      //   78: aload_3
      //   79: astore_1
      //   80: aload_0
      //   81: getfield 131	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
      //   84: aload_0
      //   85: invokeinterface 140 2 0
      //   90: ifne -14 -> 76
      //   93: aload_3
      //   94: astore_2
      //   95: aload_3
      //   96: astore_1
      //   97: getstatic 143	com/squareup/okhttp/internal/spdy/ErrorCode:NO_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
      //   100: astore_3
      //   101: aload_3
      //   102: astore_2
      //   103: aload_3
      //   104: astore_1
      //   105: getstatic 146	com/squareup/okhttp/internal/spdy/ErrorCode:CANCEL	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
      //   108: astore 5
      //   110: aload_0
      //   111: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   114: aload_3
      //   115: aload 5
      //   117: invokestatic 150	com/squareup/okhttp/internal/spdy/SpdyConnection:access$1000	(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Lcom/squareup/okhttp/internal/spdy/ErrorCode;Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V
      //   120: aload_0
      //   121: getfield 131	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
      //   124: invokestatic 156	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
      //   127: return
      //   128: astore_1
      //   129: aload_2
      //   130: astore_1
      //   131: getstatic 159	com/squareup/okhttp/internal/spdy/ErrorCode:PROTOCOL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
      //   134: astore_2
      //   135: aload_2
      //   136: astore_1
      //   137: getstatic 159	com/squareup/okhttp/internal/spdy/ErrorCode:PROTOCOL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
      //   140: astore_3
      //   141: aload_0
      //   142: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   145: aload_2
      //   146: aload_3
      //   147: invokestatic 150	com/squareup/okhttp/internal/spdy/SpdyConnection:access$1000	(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Lcom/squareup/okhttp/internal/spdy/ErrorCode;Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V
      //   150: aload_0
      //   151: getfield 131	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
      //   154: invokestatic 156	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
      //   157: return
      //   158: astore_2
      //   159: aload_0
      //   160: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
      //   163: aload_1
      //   164: aload 4
      //   166: invokestatic 150	com/squareup/okhttp/internal/spdy/SpdyConnection:access$1000	(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Lcom/squareup/okhttp/internal/spdy/ErrorCode;Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V
      //   169: aload_0
      //   170: getfield 131	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
      //   173: invokestatic 156	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
      //   176: aload_2
      //   177: athrow
      //   178: astore_1
      //   179: goto -10 -> 169
      //   182: astore_1
      //   183: goto -33 -> 150
      //   186: astore_1
      //   187: goto -67 -> 120
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	190	0	this	Reader
      //   12	93	1	localErrorCode1	ErrorCode
      //   128	1	1	localIOException1	IOException
      //   130	34	1	localErrorCode2	ErrorCode
      //   178	1	1	localIOException2	IOException
      //   182	1	1	localIOException3	IOException
      //   186	1	1	localIOException4	IOException
      //   10	136	2	localErrorCode3	ErrorCode
      //   158	19	2	localObject	Object
      //   3	144	3	localErrorCode4	ErrorCode
      //   7	158	4	localErrorCode5	ErrorCode
      //   108	8	5	localErrorCode6	ErrorCode
      // Exception table:
      //   from	to	target	type
      //   13	49	128	java/io/IOException
      //   53	63	128	java/io/IOException
      //   67	76	128	java/io/IOException
      //   80	93	128	java/io/IOException
      //   97	101	128	java/io/IOException
      //   105	110	128	java/io/IOException
      //   13	49	158	finally
      //   53	63	158	finally
      //   67	76	158	finally
      //   80	93	158	finally
      //   97	101	158	finally
      //   105	110	158	finally
      //   131	135	158	finally
      //   137	141	158	finally
      //   159	169	178	java/io/IOException
      //   141	150	182	java/io/IOException
      //   110	120	186	java/io/IOException
    }
    
    public void goAway(int paramInt, ErrorCode arg2, ByteString paramByteString)
    {
      if (paramByteString.size() > 0) {}
      synchronized (SpdyConnection.this)
      {
        paramByteString = (SpdyStream[])streams.values().toArray(new SpdyStream[streams.size()]);
        SpdyConnection.access$1402(SpdyConnection.this, true);
        int j = paramByteString.length;
        int i = 0;
        if (i < j)
        {
          ??? = paramByteString[i];
          if ((???.getId() > paramInt) && (???.isLocallyInitiated()))
          {
            ???.receiveRstStream(ErrorCode.REFUSED_STREAM);
            removeStream(???.getId());
          }
          i += 1;
        }
      }
    }
    
    public void headers(boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, final List<Header> paramList, HeadersMode paramHeadersMode)
    {
      if (SpdyConnection.this.pushedStream(paramInt1)) {
        SpdyConnection.this.pushHeadersLater(paramInt1, paramList, paramBoolean2);
      }
      SpdyStream localSpdyStream;
      do
      {
        return;
        synchronized (SpdyConnection.this)
        {
          if (shutdown) {
            return;
          }
        }
        localSpdyStream = getStream(paramInt1);
        if (localSpdyStream == null)
        {
          if (paramHeadersMode.failIfStreamAbsent())
          {
            writeSynResetLater(paramInt1, ErrorCode.INVALID_STREAM);
            return;
          }
          if (paramInt1 <= lastGoodStreamId) {
            return;
          }
          if (paramInt1 % 2 == nextStreamId % 2) {
            return;
          }
          paramList = new SpdyStream(paramInt1, SpdyConnection.this, paramBoolean1, paramBoolean2, paramList);
          SpdyConnection.access$1502(SpdyConnection.this, paramInt1);
          streams.put(Integer.valueOf(paramInt1), paramList);
          SpdyConnection.executor.submit(new NamedRunnable("OkHttp %s stream %d", new Object[] { hostName, Integer.valueOf(paramInt1) })
          {
            public void execute()
            {
              try
              {
                handler.receive(paramList);
                return;
              }
              catch (IOException localIOException)
              {
                throw new RuntimeException(localIOException);
              }
            }
          });
          return;
        }
        if (paramHeadersMode.failIfStreamPresent())
        {
          localSpdyStream.closeLater(ErrorCode.PROTOCOL_ERROR);
          removeStream(paramInt1);
          return;
        }
        localSpdyStream.receiveHeaders(paramList, paramHeadersMode);
      } while (!paramBoolean2);
      localSpdyStream.receiveFin();
    }
    
    public void ping(boolean paramBoolean, int paramInt1, int paramInt2)
    {
      if (paramBoolean)
      {
        Ping localPing = SpdyConnection.this.removePing(paramInt1);
        if (localPing != null) {
          localPing.receive();
        }
        return;
      }
      SpdyConnection.this.writePingLater(true, paramInt1, paramInt2, null);
    }
    
    public void priority(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean) {}
    
    public void pushPromise(int paramInt1, int paramInt2, List<Header> paramList)
    {
      SpdyConnection.this.pushRequestLater(paramInt2, paramList);
    }
    
    public void rstStream(int paramInt, ErrorCode paramErrorCode)
    {
      if (SpdyConnection.this.pushedStream(paramInt)) {
        SpdyConnection.this.pushResetLater(paramInt, paramErrorCode);
      }
      SpdyStream localSpdyStream;
      do
      {
        return;
        localSpdyStream = removeStream(paramInt);
      } while (localSpdyStream == null);
      localSpdyStream.receiveRstStream(paramErrorCode);
    }
    
    public void settings(boolean paramBoolean, Settings paramSettings)
    {
      long l2 = 0L;
      ??? = null;
      for (;;)
      {
        int i;
        long l1;
        synchronized (SpdyConnection.this)
        {
          i = peerSettings.getInitialWindowSize(65536);
          if (paramBoolean) {
            peerSettings.clear();
          }
          peerSettings.merge(paramSettings);
          if (getProtocol() == Protocol.HTTP_2) {
            ackSettingsLater(paramSettings);
          }
          int j = peerSettings.getInitialWindowSize(65536);
          l1 = l2;
          paramSettings = ???;
          if (j != -1)
          {
            l1 = l2;
            paramSettings = ???;
            if (j != i)
            {
              l2 = j - i;
              if (!receivedInitialPeerSettings)
              {
                addBytesToWriteWindow(l2);
                SpdyConnection.access$2102(SpdyConnection.this, true);
              }
              l1 = l2;
              paramSettings = ???;
              if (!streams.isEmpty())
              {
                paramSettings = (SpdyStream[])streams.values().toArray(new SpdyStream[streams.size()]);
                l1 = l2;
              }
            }
          }
          if ((paramSettings == null) || (l1 == 0L)) {
            break;
          }
          j = paramSettings.length;
          i = 0;
          if (i >= j) {
            break;
          }
        }
        synchronized (paramSettings[i])
        {
          ???.addBytesToWriteWindow(l1);
          i += 1;
          continue;
          paramSettings = finally;
          throw paramSettings;
        }
      }
    }
    
    public void windowUpdate(int paramInt, long paramLong)
    {
      if (paramInt == 0) {
        synchronized (SpdyConnection.this)
        {
          SpdyConnection localSpdyConnection = SpdyConnection.this;
          bytesLeftInWriteWindow += paramLong;
          notifyAll();
          return;
        }
      }
      ??? = getStream(paramInt);
      if (??? != null) {
        try
        {
          ((SpdyStream)???).addBytesToWriteWindow(paramLong);
          return;
        }
        finally {}
      }
    }
  }
}
