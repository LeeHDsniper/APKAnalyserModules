package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Connection;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Headers.Builder;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response.Builder;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.spdy.ErrorCode;
import com.squareup.okhttp.internal.spdy.Header;
import com.squareup.okhttp.internal.spdy.SpdyConnection;
import com.squareup.okhttp.internal.spdy.SpdyStream;
import java.io.IOException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import okio.Buffer;
import okio.ByteString;
import okio.Sink;
import okio.Source;
import okio.Timeout;

public final class SpdyTransport
  implements Transport
{
  private static final List<ByteString> HTTP_2_PROHIBITED_HEADERS = Util.immutableList(new ByteString[] { ByteString.encodeUtf8("connection"), ByteString.encodeUtf8("host"), ByteString.encodeUtf8("keep-alive"), ByteString.encodeUtf8("proxy-connection"), ByteString.encodeUtf8("te"), ByteString.encodeUtf8("transfer-encoding"), ByteString.encodeUtf8("encoding"), ByteString.encodeUtf8("upgrade") });
  private static final List<ByteString> SPDY_3_PROHIBITED_HEADERS = Util.immutableList(new ByteString[] { ByteString.encodeUtf8("connection"), ByteString.encodeUtf8("host"), ByteString.encodeUtf8("keep-alive"), ByteString.encodeUtf8("proxy-connection"), ByteString.encodeUtf8("transfer-encoding") });
  private final HttpEngine httpEngine;
  private final SpdyConnection spdyConnection;
  private SpdyStream stream;
  
  public SpdyTransport(HttpEngine paramHttpEngine, SpdyConnection paramSpdyConnection)
  {
    httpEngine = paramHttpEngine;
    spdyConnection = paramSpdyConnection;
  }
  
  private static boolean isProhibitedHeader(Protocol paramProtocol, ByteString paramByteString)
  {
    if (paramProtocol == Protocol.SPDY_3) {
      return SPDY_3_PROHIBITED_HEADERS.contains(paramByteString);
    }
    if (paramProtocol == Protocol.HTTP_2) {
      return HTTP_2_PROHIBITED_HEADERS.contains(paramByteString);
    }
    throw new AssertionError(paramProtocol);
  }
  
  private static String joinOnNull(String paramString1, String paramString2)
  {
    return paramString1 + '\000' + paramString2;
  }
  
  public static Response.Builder readNameValueBlock(List<Header> paramList, Protocol paramProtocol)
    throws IOException
  {
    Object localObject2 = null;
    Object localObject1 = "HTTP/1.1";
    Headers.Builder localBuilder = new Headers.Builder();
    localBuilder.set(OkHeaders.SELECTED_PROTOCOL, paramProtocol.toString());
    int i = 0;
    while (i < paramList.size())
    {
      ByteString localByteString = getname;
      String str2 = getvalue.utf8();
      int j = 0;
      if (j < str2.length())
      {
        int m = str2.indexOf(0, j);
        int k = m;
        if (m == -1) {
          k = str2.length();
        }
        String str1 = str2.substring(j, k);
        Object localObject3;
        Object localObject4;
        if (localByteString.equals(Header.RESPONSE_STATUS))
        {
          localObject3 = str1;
          localObject4 = localObject1;
        }
        for (;;)
        {
          j = k + 1;
          localObject2 = localObject3;
          localObject1 = localObject4;
          break;
          if (localByteString.equals(Header.VERSION))
          {
            localObject4 = str1;
            localObject3 = localObject2;
          }
          else
          {
            localObject3 = localObject2;
            localObject4 = localObject1;
            if (!isProhibitedHeader(paramProtocol, localByteString))
            {
              localBuilder.add(localByteString.utf8(), str1);
              localObject3 = localObject2;
              localObject4 = localObject1;
            }
          }
        }
      }
      i += 1;
    }
    if (localObject2 == null) {
      throw new ProtocolException("Expected ':status' header not present");
    }
    if (localObject1 == null) {
      throw new ProtocolException("Expected ':version' header not present");
    }
    paramList = StatusLine.parse((String)localObject1 + " " + localObject2);
    return new Response.Builder().protocol(paramProtocol).code(code).message(message).headers(localBuilder.build());
  }
  
  public static List<Header> writeNameValueBlock(Request paramRequest, Protocol paramProtocol, String paramString)
  {
    Headers localHeaders = paramRequest.headers();
    ArrayList localArrayList = new ArrayList(localHeaders.size() + 10);
    localArrayList.add(new Header(Header.TARGET_METHOD, paramRequest.method()));
    localArrayList.add(new Header(Header.TARGET_PATH, RequestLine.requestPath(paramRequest.url())));
    String str = HttpEngine.hostHeader(paramRequest.url());
    int i;
    if (Protocol.SPDY_3 == paramProtocol)
    {
      localArrayList.add(new Header(Header.VERSION, paramString));
      localArrayList.add(new Header(Header.TARGET_HOST, str));
      localArrayList.add(new Header(Header.TARGET_SCHEME, paramRequest.url().getProtocol()));
      paramRequest = new LinkedHashSet();
      i = 0;
      label160:
      if (i >= localHeaders.size()) {
        break label427;
      }
      paramString = ByteString.encodeUtf8(localHeaders.name(i).toLowerCase(Locale.US));
      str = localHeaders.value(i);
      if (!isProhibitedHeader(paramProtocol, paramString)) {
        break label246;
      }
    }
    label246:
    label425:
    for (;;)
    {
      i += 1;
      break label160;
      if (Protocol.HTTP_2 == paramProtocol)
      {
        localArrayList.add(new Header(Header.TARGET_AUTHORITY, str));
        break;
      }
      throw new AssertionError();
      if ((!paramString.equals(Header.TARGET_METHOD)) && (!paramString.equals(Header.TARGET_PATH)) && (!paramString.equals(Header.TARGET_SCHEME)) && (!paramString.equals(Header.TARGET_AUTHORITY)) && (!paramString.equals(Header.TARGET_HOST)) && (!paramString.equals(Header.VERSION))) {
        if (paramRequest.add(paramString))
        {
          localArrayList.add(new Header(paramString, str));
        }
        else
        {
          int j = 0;
          for (;;)
          {
            if (j >= localArrayList.size()) {
              break label425;
            }
            if (getname.equals(paramString))
            {
              localArrayList.set(j, new Header(paramString, joinOnNull(getvalue.utf8(), str)));
              break;
            }
            j += 1;
          }
        }
      }
    }
    label427:
    return localArrayList;
  }
  
  public boolean canReuseConnection()
  {
    return true;
  }
  
  public Sink createRequestBody(Request paramRequest, long paramLong)
    throws IOException
  {
    return stream.getSink();
  }
  
  public void disconnect(HttpEngine paramHttpEngine)
    throws IOException
  {
    stream.close(ErrorCode.CANCEL);
  }
  
  public void emptyTransferStream() {}
  
  public void flushRequest()
    throws IOException
  {
    stream.getSink().close();
  }
  
  public Source getTransferStream(CacheRequest paramCacheRequest)
    throws IOException
  {
    return new SpdySource(stream, paramCacheRequest);
  }
  
  public Response.Builder readResponseHeaders()
    throws IOException
  {
    return readNameValueBlock(stream.getResponseHeaders(), spdyConnection.getProtocol());
  }
  
  public void releaseConnectionOnIdle() {}
  
  public void writeRequestBody(RetryableSink paramRetryableSink)
    throws IOException
  {
    paramRetryableSink.writeToSocket(stream.getSink());
  }
  
  public void writeRequestHeaders(Request paramRequest)
    throws IOException
  {
    if (stream != null) {
      return;
    }
    httpEngine.writingRequestHeaders();
    boolean bool = httpEngine.permitsRequestBody();
    String str = RequestLine.version(httpEngine.getConnection().getProtocol());
    stream = spdyConnection.newStream(writeNameValueBlock(paramRequest, spdyConnection.getProtocol(), str), bool, true);
    stream.readTimeout().timeout(httpEngine.client.getReadTimeout(), TimeUnit.MILLISECONDS);
  }
  
  private static class SpdySource
    implements Source
  {
    private final Sink cacheBody;
    private final CacheRequest cacheRequest;
    private boolean closed;
    private boolean inputExhausted;
    private final Source source;
    private final SpdyStream stream;
    
    SpdySource(SpdyStream paramSpdyStream, CacheRequest paramCacheRequest)
      throws IOException
    {
      stream = paramSpdyStream;
      source = paramSpdyStream.getSource();
      if (paramCacheRequest != null) {}
      for (paramSpdyStream = paramCacheRequest.body();; paramSpdyStream = null)
      {
        if (paramSpdyStream == null) {
          paramCacheRequest = null;
        }
        cacheBody = paramSpdyStream;
        cacheRequest = paramCacheRequest;
        return;
      }
    }
    
    private boolean discardStream()
    {
      long l = stream.readTimeout().timeoutNanos();
      stream.readTimeout().timeout(100L, TimeUnit.MILLISECONDS);
      try
      {
        Util.skipAll(this, 100);
        stream.readTimeout().timeout(l, TimeUnit.NANOSECONDS);
        return true;
      }
      catch (IOException localIOException)
      {
        localIOException = localIOException;
        stream.readTimeout().timeout(l, TimeUnit.NANOSECONDS);
        return false;
      }
      finally
      {
        localObject = finally;
        stream.readTimeout().timeout(l, TimeUnit.NANOSECONDS);
        throw localObject;
      }
    }
    
    public void close()
      throws IOException
    {
      if (closed) {}
      do
      {
        do
        {
          return;
          if ((!inputExhausted) && (cacheBody != null)) {
            discardStream();
          }
          closed = true;
        } while (inputExhausted);
        stream.closeLater(ErrorCode.CANCEL);
      } while (cacheRequest == null);
      cacheRequest.abort();
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
        paramLong = -1L;
      }
      long l;
      do
      {
        return paramLong;
        l = source.read(paramBuffer, paramLong);
        if (l == -1L)
        {
          inputExhausted = true;
          if (cacheRequest != null) {
            cacheBody.close();
          }
          return -1L;
        }
        paramLong = l;
      } while (cacheBody == null);
      cacheBody.write(paramBuffer.clone(), l);
      return l;
    }
    
    public Timeout timeout()
    {
      return source.timeout();
    }
  }
}
