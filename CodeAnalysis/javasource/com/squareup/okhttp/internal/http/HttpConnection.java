package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Connection;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Headers.Builder;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Response.Builder;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.net.ProtocolException;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.concurrent.TimeUnit;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;
import okio.Sink;
import okio.Source;
import okio.Timeout;

public final class HttpConnection
{
  private static final byte[] FINAL_CHUNK = { 48, 13, 10, 13, 10 };
  private static final byte[] HEX_DIGITS = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102 };
  private final Connection connection;
  private int onIdle = 0;
  private final ConnectionPool pool;
  private final BufferedSink sink;
  private final Socket socket;
  private final BufferedSource source;
  private int state = 0;
  
  public HttpConnection(ConnectionPool paramConnectionPool, Connection paramConnection, Socket paramSocket)
    throws IOException
  {
    pool = paramConnectionPool;
    connection = paramConnection;
    socket = paramSocket;
    source = Okio.buffer(Okio.source(paramSocket));
    sink = Okio.buffer(Okio.sink(paramSocket));
  }
  
  public long bufferSize()
  {
    return source.buffer().size();
  }
  
  public void closeIfOwnedBy(Object paramObject)
    throws IOException
  {
    Internal.instance.closeIfOwnedBy(connection, paramObject);
  }
  
  public void closeOnIdle()
    throws IOException
  {
    onIdle = 2;
    if (state == 0)
    {
      state = 6;
      connection.getSocket().close();
    }
  }
  
  public boolean discard(Source paramSource, int paramInt)
  {
    try
    {
      int i = socket.getSoTimeout();
      socket.setSoTimeout(paramInt);
      try
      {
        boolean bool = Util.skipAll(paramSource, paramInt);
        return bool;
      }
      finally
      {
        socket.setSoTimeout(i);
      }
      return false;
    }
    catch (IOException paramSource) {}
  }
  
  public void emptyResponseBody()
    throws IOException
  {
    newFixedLengthSource(null, 0L);
  }
  
  public void flush()
    throws IOException
  {
    sink.flush();
  }
  
  public boolean isClosed()
  {
    return state == 6;
  }
  
  public boolean isReadable()
  {
    try
    {
      int i = socket.getSoTimeout();
      try
      {
        socket.setSoTimeout(1);
        boolean bool = source.exhausted();
        return !bool;
      }
      finally
      {
        socket.setSoTimeout(i);
      }
      return false;
    }
    catch (SocketTimeoutException localSocketTimeoutException)
    {
      return true;
    }
    catch (IOException localIOException) {}
  }
  
  public Sink newChunkedSink()
  {
    if (state != 1) {
      throw new IllegalStateException("state: " + state);
    }
    state = 2;
    return new ChunkedSink(null);
  }
  
  public Source newChunkedSource(CacheRequest paramCacheRequest, HttpEngine paramHttpEngine)
    throws IOException
  {
    if (state != 4) {
      throw new IllegalStateException("state: " + state);
    }
    state = 5;
    return new ChunkedSource(paramCacheRequest, paramHttpEngine);
  }
  
  public Sink newFixedLengthSink(long paramLong)
  {
    if (state != 1) {
      throw new IllegalStateException("state: " + state);
    }
    state = 2;
    return new FixedLengthSink(paramLong, null);
  }
  
  public Source newFixedLengthSource(CacheRequest paramCacheRequest, long paramLong)
    throws IOException
  {
    if (state != 4) {
      throw new IllegalStateException("state: " + state);
    }
    state = 5;
    return new FixedLengthSource(paramCacheRequest, paramLong);
  }
  
  public Source newUnknownLengthSource(CacheRequest paramCacheRequest)
    throws IOException
  {
    if (state != 4) {
      throw new IllegalStateException("state: " + state);
    }
    state = 5;
    return new UnknownLengthSource(paramCacheRequest);
  }
  
  public void poolOnIdle()
  {
    onIdle = 1;
    if (state == 0)
    {
      onIdle = 0;
      Internal.instance.recycle(pool, connection);
    }
  }
  
  public void readHeaders(Headers.Builder paramBuilder)
    throws IOException
  {
    for (;;)
    {
      String str = source.readUtf8LineStrict();
      if (str.length() == 0) {
        break;
      }
      Internal.instance.addLine(paramBuilder, str);
    }
  }
  
  public Response.Builder readResponse()
    throws IOException
  {
    if ((state != 1) && (state != 3)) {
      throw new IllegalStateException("state: " + state);
    }
    StatusLine localStatusLine;
    Response.Builder localBuilder;
    do
    {
      localStatusLine = StatusLine.parse(source.readUtf8LineStrict());
      localBuilder = new Response.Builder().protocol(protocol).code(code).message(message);
      Headers.Builder localBuilder1 = new Headers.Builder();
      readHeaders(localBuilder1);
      localBuilder1.add(OkHeaders.SELECTED_PROTOCOL, protocol.toString());
      localBuilder.headers(localBuilder1.build());
    } while (code == 100);
    state = 4;
    return localBuilder;
  }
  
  public void setTimeouts(int paramInt1, int paramInt2)
  {
    if (paramInt1 != 0) {
      source.timeout().timeout(paramInt1, TimeUnit.MILLISECONDS);
    }
    if (paramInt2 != 0) {
      sink.timeout().timeout(paramInt2, TimeUnit.MILLISECONDS);
    }
  }
  
  public void writeRequest(Headers paramHeaders, String paramString)
    throws IOException
  {
    if (state != 0) {
      throw new IllegalStateException("state: " + state);
    }
    sink.writeUtf8(paramString).writeUtf8("\r\n");
    int i = 0;
    while (i < paramHeaders.size())
    {
      sink.writeUtf8(paramHeaders.name(i)).writeUtf8(": ").writeUtf8(paramHeaders.value(i)).writeUtf8("\r\n");
      i += 1;
    }
    sink.writeUtf8("\r\n");
    state = 1;
  }
  
  public void writeRequestBody(RetryableSink paramRetryableSink)
    throws IOException
  {
    if (state != 1) {
      throw new IllegalStateException("state: " + state);
    }
    state = 3;
    paramRetryableSink.writeToSocket(sink);
  }
  
  private class AbstractSource
  {
    protected final Sink cacheBody;
    private final CacheRequest cacheRequest;
    protected boolean closed;
    
    AbstractSource(CacheRequest paramCacheRequest)
      throws IOException
    {
      if (paramCacheRequest != null) {}
      for (this$1 = paramCacheRequest.body();; this$1 = null)
      {
        if (HttpConnection.this == null) {
          paramCacheRequest = null;
        }
        cacheBody = HttpConnection.this;
        cacheRequest = paramCacheRequest;
        return;
      }
    }
    
    protected final void cacheWrite(Buffer paramBuffer, long paramLong)
      throws IOException
    {
      if (cacheBody != null)
      {
        paramBuffer = paramBuffer.clone();
        paramBuffer.skip(paramBuffer.size() - paramLong);
        cacheBody.write(paramBuffer, paramLong);
      }
    }
    
    protected final void endOfInput(boolean paramBoolean)
      throws IOException
    {
      if (state != 5) {
        throw new IllegalStateException("state: " + state);
      }
      if (cacheRequest != null) {
        cacheBody.close();
      }
      HttpConnection.access$302(HttpConnection.this, 0);
      if ((paramBoolean) && (onIdle == 1))
      {
        HttpConnection.access$602(HttpConnection.this, 0);
        Internal.instance.recycle(pool, connection);
      }
      while (onIdle != 2) {
        return;
      }
      HttpConnection.access$302(HttpConnection.this, 6);
      connection.getSocket().close();
    }
    
    protected final void unexpectedEndOfInput()
    {
      if (cacheRequest != null) {
        cacheRequest.abort();
      }
      Util.closeQuietly(connection.getSocket());
      HttpConnection.access$302(HttpConnection.this, 6);
    }
  }
  
  private final class ChunkedSink
    implements Sink
  {
    private boolean closed;
    private final byte[] hex = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 10 };
    
    private ChunkedSink() {}
    
    private void writeHex(long paramLong)
      throws IOException
    {
      int i = 16;
      int j;
      long l;
      do
      {
        byte[] arrayOfByte = hex;
        j = i - 1;
        arrayOfByte[j] = HttpConnection.HEX_DIGITS[((int)(0xF & paramLong))];
        l = paramLong >>> 4;
        i = j;
        paramLong = l;
      } while (l != 0L);
      sink.write(hex, j, hex.length - j);
    }
    
    /* Error */
    public void close()
      throws IOException
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 55	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:closed	Z
      //   6: istore_1
      //   7: iload_1
      //   8: ifeq +6 -> 14
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: aload_0
      //   15: iconst_1
      //   16: putfield 55	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:closed	Z
      //   19: aload_0
      //   20: getfield 19	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:this$0	Lcom/squareup/okhttp/internal/http/HttpConnection;
      //   23: invokestatic 45	com/squareup/okhttp/internal/http/HttpConnection:access$200	(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;
      //   26: invokestatic 58	com/squareup/okhttp/internal/http/HttpConnection:access$400	()[B
      //   29: invokeinterface 61 2 0
      //   34: pop
      //   35: aload_0
      //   36: getfield 19	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:this$0	Lcom/squareup/okhttp/internal/http/HttpConnection;
      //   39: iconst_3
      //   40: invokestatic 65	com/squareup/okhttp/internal/http/HttpConnection:access$302	(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I
      //   43: pop
      //   44: goto -33 -> 11
      //   47: astore_2
      //   48: aload_0
      //   49: monitorexit
      //   50: aload_2
      //   51: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	52	0	this	ChunkedSink
      //   6	2	1	bool	boolean
      //   47	4	2	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   2	7	47	finally
      //   14	44	47	finally
    }
    
    /* Error */
    public void flush()
      throws IOException
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 55	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:closed	Z
      //   6: istore_1
      //   7: iload_1
      //   8: ifeq +6 -> 14
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: aload_0
      //   15: getfield 19	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:this$0	Lcom/squareup/okhttp/internal/http/HttpConnection;
      //   18: invokestatic 45	com/squareup/okhttp/internal/http/HttpConnection:access$200	(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;
      //   21: invokeinterface 68 1 0
      //   26: goto -15 -> 11
      //   29: astore_2
      //   30: aload_0
      //   31: monitorexit
      //   32: aload_2
      //   33: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	34	0	this	ChunkedSink
      //   6	2	1	bool	boolean
      //   29	4	2	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   2	7	29	finally
      //   14	26	29	finally
    }
    
    public Timeout timeout()
    {
      return sink.timeout();
    }
    
    public void write(Buffer paramBuffer, long paramLong)
      throws IOException
    {
      if (closed) {
        throw new IllegalStateException("closed");
      }
      if (paramLong == 0L) {
        return;
      }
      writeHex(paramLong);
      sink.write(paramBuffer, paramLong);
      sink.writeUtf8("\r\n");
    }
  }
  
  private class ChunkedSource
    extends HttpConnection.AbstractSource
    implements Source
  {
    private int bytesRemainingInChunk = -1;
    private boolean hasMoreChunks = true;
    private final HttpEngine httpEngine;
    
    ChunkedSource(CacheRequest paramCacheRequest, HttpEngine paramHttpEngine)
      throws IOException
    {
      super(paramCacheRequest);
      httpEngine = paramHttpEngine;
    }
    
    private void readChunkSize()
      throws IOException
    {
      if (bytesRemainingInChunk != -1) {
        source.readUtf8LineStrict();
      }
      String str = source.readUtf8LineStrict();
      int i = str.indexOf(";");
      Object localObject = str;
      if (i != -1) {
        localObject = str.substring(0, i);
      }
      try
      {
        bytesRemainingInChunk = Integer.parseInt(((String)localObject).trim(), 16);
        if (bytesRemainingInChunk == 0)
        {
          hasMoreChunks = false;
          localObject = new Headers.Builder();
          readHeaders((Headers.Builder)localObject);
          httpEngine.receiveHeaders(((Headers.Builder)localObject).build());
          endOfInput(true);
        }
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new ProtocolException("Expected a hex chunk size but was " + (String)localObject);
      }
    }
    
    public void close()
      throws IOException
    {
      if (closed) {
        return;
      }
      if ((hasMoreChunks) && (!discard(this, 100))) {
        unexpectedEndOfInput();
      }
      closed = true;
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
      if (!hasMoreChunks) {
        return -1L;
      }
      if ((bytesRemainingInChunk == 0) || (bytesRemainingInChunk == -1))
      {
        readChunkSize();
        if (!hasMoreChunks) {
          return -1L;
        }
      }
      paramLong = source.read(paramBuffer, Math.min(paramLong, bytesRemainingInChunk));
      if (paramLong == -1L)
      {
        unexpectedEndOfInput();
        throw new IOException("unexpected end of stream");
      }
      bytesRemainingInChunk = ((int)(bytesRemainingInChunk - paramLong));
      cacheWrite(paramBuffer, paramLong);
      return paramLong;
    }
    
    public Timeout timeout()
    {
      return source.timeout();
    }
  }
  
  private final class FixedLengthSink
    implements Sink
  {
    private long bytesRemaining;
    private boolean closed;
    
    private FixedLengthSink(long paramLong)
    {
      bytesRemaining = paramLong;
    }
    
    public void close()
      throws IOException
    {
      if (closed) {
        return;
      }
      closed = true;
      if (bytesRemaining > 0L) {
        throw new ProtocolException("unexpected end of stream");
      }
      HttpConnection.access$302(HttpConnection.this, 3);
    }
    
    public void flush()
      throws IOException
    {
      if (closed) {
        return;
      }
      sink.flush();
    }
    
    public Timeout timeout()
    {
      return sink.timeout();
    }
    
    public void write(Buffer paramBuffer, long paramLong)
      throws IOException
    {
      if (closed) {
        throw new IllegalStateException("closed");
      }
      Util.checkOffsetAndCount(paramBuffer.size(), 0L, paramLong);
      if (paramLong > bytesRemaining) {
        throw new ProtocolException("expected " + bytesRemaining + " bytes but received " + paramLong);
      }
      sink.write(paramBuffer, paramLong);
      bytesRemaining -= paramLong;
    }
  }
  
  private class FixedLengthSource
    extends HttpConnection.AbstractSource
    implements Source
  {
    private long bytesRemaining;
    
    public FixedLengthSource(CacheRequest paramCacheRequest, long paramLong)
      throws IOException
    {
      super(paramCacheRequest);
      bytesRemaining = paramLong;
      if (bytesRemaining == 0L) {
        endOfInput(true);
      }
    }
    
    public void close()
      throws IOException
    {
      if (closed) {
        return;
      }
      if ((bytesRemaining != 0L) && (!discard(this, 100))) {
        unexpectedEndOfInput();
      }
      closed = true;
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
      if (bytesRemaining == 0L) {
        paramLong = -1L;
      }
      long l;
      do
      {
        return paramLong;
        l = source.read(paramBuffer, Math.min(bytesRemaining, paramLong));
        if (l == -1L)
        {
          unexpectedEndOfInput();
          throw new ProtocolException("unexpected end of stream");
        }
        bytesRemaining -= l;
        cacheWrite(paramBuffer, l);
        paramLong = l;
      } while (bytesRemaining != 0L);
      endOfInput(true);
      return l;
    }
    
    public Timeout timeout()
    {
      return source.timeout();
    }
  }
  
  class UnknownLengthSource
    extends HttpConnection.AbstractSource
    implements Source
  {
    private boolean inputExhausted;
    
    UnknownLengthSource(CacheRequest paramCacheRequest)
      throws IOException
    {
      super(paramCacheRequest);
    }
    
    public void close()
      throws IOException
    {
      if (closed) {
        return;
      }
      if (!inputExhausted) {
        unexpectedEndOfInput();
      }
      closed = true;
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
      if (inputExhausted) {
        return -1L;
      }
      paramLong = source.read(paramBuffer, paramLong);
      if (paramLong == -1L)
      {
        inputExhausted = true;
        endOfInput(false);
        return -1L;
      }
      cacheWrite(paramBuffer, paramLong);
      return paramLong;
    }
    
    public Timeout timeout()
    {
      return source.timeout();
    }
  }
}
