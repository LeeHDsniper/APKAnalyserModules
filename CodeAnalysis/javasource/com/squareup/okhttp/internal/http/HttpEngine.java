package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Connection;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Headers.Builder;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Request.Builder;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.Response.Builder;
import com.squareup.okhttp.ResponseBody;
import com.squareup.okhttp.Route;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.InternalCache;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.Version;
import java.io.IOException;
import java.io.InputStream;
import java.net.CookieHandler;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.URL;
import java.security.cert.CertificateException;
import java.util.Date;
import java.util.Map;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLPeerUnverifiedException;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.GzipSource;
import okio.Okio;
import okio.Sink;
import okio.Source;

public final class HttpEngine
{
  private static final ResponseBody EMPTY_BODY = new ResponseBody()
  {
    public long contentLength()
    {
      return 0L;
    }
    
    public BufferedSource source()
    {
      return new Buffer();
    }
  };
  public final boolean bufferRequestBody;
  private BufferedSink bufferedRequestBody;
  private Response cacheResponse;
  private CacheStrategy cacheStrategy;
  final OkHttpClient client;
  private Connection connection;
  private Request networkRequest;
  private Response networkResponse;
  private final Response priorResponse;
  private Sink requestBodyOut;
  private BufferedSource responseBody;
  private InputStream responseBodyBytes;
  private Source responseTransferSource;
  private Route route;
  private RouteSelector routeSelector;
  long sentRequestMillis = -1L;
  private CacheRequest storeRequest;
  private boolean transparentGzip;
  private Transport transport;
  private final Request userRequest;
  private Response userResponse;
  
  public HttpEngine(OkHttpClient paramOkHttpClient, Request paramRequest, boolean paramBoolean, Connection paramConnection, RouteSelector paramRouteSelector, RetryableSink paramRetryableSink, Response paramResponse)
  {
    client = paramOkHttpClient;
    userRequest = paramRequest;
    bufferRequestBody = paramBoolean;
    connection = paramConnection;
    routeSelector = paramRouteSelector;
    requestBodyOut = paramRetryableSink;
    priorResponse = paramResponse;
    if (paramConnection != null)
    {
      Internal.instance.setOwner(paramConnection, this);
      route = paramConnection.getRoute();
      return;
    }
    route = null;
  }
  
  private static Headers combine(Headers paramHeaders1, Headers paramHeaders2)
    throws IOException
  {
    Headers.Builder localBuilder = new Headers.Builder();
    int i = 0;
    if (i < paramHeaders1.size())
    {
      String str1 = paramHeaders1.name(i);
      String str2 = paramHeaders1.value(i);
      if (("Warning".equalsIgnoreCase(str1)) && (str2.startsWith("1"))) {}
      for (;;)
      {
        i += 1;
        break;
        if ((!OkHeaders.isEndToEnd(str1)) || (paramHeaders2.get(str1) == null)) {
          localBuilder.add(str1, str2);
        }
      }
    }
    i = 0;
    if (i < paramHeaders2.size())
    {
      paramHeaders1 = paramHeaders2.name(i);
      if ("Content-Length".equalsIgnoreCase(paramHeaders1)) {}
      for (;;)
      {
        i += 1;
        break;
        if (OkHeaders.isEndToEnd(paramHeaders1)) {
          localBuilder.add(paramHeaders1, paramHeaders2.value(i));
        }
      }
    }
    return localBuilder.build();
  }
  
  private void connect(Request paramRequest)
    throws IOException
  {
    if (connection != null) {
      throw new IllegalStateException();
    }
    if (routeSelector == null) {
      routeSelector = RouteSelector.get(paramRequest, client);
    }
    connection = routeSelector.next(this);
    route = connection.getRoute();
  }
  
  public static String hostHeader(URL paramURL)
  {
    if (Util.getEffectivePort(paramURL) != Util.getDefaultPort(paramURL.getProtocol())) {
      return paramURL.getHost() + ":" + paramURL.getPort();
    }
    return paramURL.getHost();
  }
  
  private void initContentStream(Source paramSource)
    throws IOException
  {
    responseTransferSource = paramSource;
    if ((transparentGzip) && ("gzip".equalsIgnoreCase(userResponse.header("Content-Encoding"))))
    {
      userResponse = userResponse.newBuilder().removeHeader("Content-Encoding").removeHeader("Content-Length").build();
      responseBody = Okio.buffer(new GzipSource(paramSource));
      return;
    }
    responseBody = Okio.buffer(paramSource);
  }
  
  private boolean isRecoverable(IOException paramIOException)
  {
    if (((paramIOException instanceof SSLPeerUnverifiedException)) || (((paramIOException instanceof SSLHandshakeException)) && ((paramIOException.getCause() instanceof CertificateException)))) {}
    for (int i = 1;; i = 0)
    {
      boolean bool = paramIOException instanceof ProtocolException;
      if ((i != 0) || (bool)) {
        break;
      }
      return true;
    }
    return false;
  }
  
  private void maybeCache()
    throws IOException
  {
    InternalCache localInternalCache = Internal.instance.internalCache(client);
    if (localInternalCache == null) {}
    do
    {
      return;
      if (CacheStrategy.isCacheable(userResponse, networkRequest)) {
        break;
      }
    } while (!HttpMethod.invalidatesCache(networkRequest.method()));
    try
    {
      localInternalCache.remove(networkRequest);
      return;
    }
    catch (IOException localIOException)
    {
      return;
    }
    storeRequest = localIOException.put(stripBody(userResponse));
  }
  
  private Request networkRequest(Request paramRequest)
    throws IOException
  {
    Request.Builder localBuilder = paramRequest.newBuilder();
    if (paramRequest.header("Host") == null) {
      localBuilder.header("Host", hostHeader(paramRequest.url()));
    }
    if (((connection == null) || (connection.getProtocol() != Protocol.HTTP_1_0)) && (paramRequest.header("Connection") == null)) {
      localBuilder.header("Connection", "Keep-Alive");
    }
    if (paramRequest.header("Accept-Encoding") == null)
    {
      transparentGzip = true;
      localBuilder.header("Accept-Encoding", "gzip");
    }
    CookieHandler localCookieHandler = client.getCookieHandler();
    if (localCookieHandler != null)
    {
      Map localMap = OkHeaders.toMultimap(localBuilder.build().headers(), null);
      OkHeaders.addCookies(localBuilder, localCookieHandler.get(paramRequest.uri(), localMap));
    }
    if (paramRequest.header("User-Agent") == null) {
      localBuilder.header("User-Agent", Version.userAgent());
    }
    return localBuilder.build();
  }
  
  private static Response stripBody(Response paramResponse)
  {
    Response localResponse = paramResponse;
    if (paramResponse != null)
    {
      localResponse = paramResponse;
      if (paramResponse.body() != null) {
        localResponse = paramResponse.newBuilder().body(null).build();
      }
    }
    return localResponse;
  }
  
  private static boolean validate(Response paramResponse1, Response paramResponse2)
  {
    if (paramResponse2.code() == 304) {}
    do
    {
      return true;
      paramResponse1 = paramResponse1.headers().getDate("Last-Modified");
      if (paramResponse1 == null) {
        break;
      }
      paramResponse2 = paramResponse2.headers().getDate("Last-Modified");
    } while ((paramResponse2 != null) && (paramResponse2.getTime() < paramResponse1.getTime()));
    return false;
  }
  
  public Connection close()
  {
    if (bufferedRequestBody != null) {
      Util.closeQuietly(bufferedRequestBody);
    }
    while (responseBody == null)
    {
      if (connection != null) {
        Util.closeQuietly(connection.getSocket());
      }
      connection = null;
      return null;
      if (requestBodyOut != null) {
        Util.closeQuietly(requestBodyOut);
      }
    }
    Util.closeQuietly(responseBody);
    Util.closeQuietly(responseBodyBytes);
    if ((transport != null) && (connection != null) && (!transport.canReuseConnection()))
    {
      Util.closeQuietly(connection.getSocket());
      connection = null;
      return null;
    }
    if ((connection != null) && (!Internal.instance.clearOwner(connection))) {
      connection = null;
    }
    Connection localConnection = connection;
    connection = null;
    return localConnection;
  }
  
  public void disconnect()
  {
    if (transport != null) {}
    try
    {
      transport.disconnect(this);
      return;
    }
    catch (IOException localIOException) {}
  }
  
  public Request followUpRequest()
    throws IOException
  {
    if (userResponse == null) {
      throw new IllegalStateException();
    }
    Object localObject;
    if (getRoute() != null)
    {
      localObject = getRoute().getProxy();
      switch (userResponse.code())
      {
      }
    }
    do
    {
      do
      {
        do
        {
          return null;
          localObject = client.getProxy();
          break;
          if (((Proxy)localObject).type() != Proxy.Type.HTTP) {
            throw new ProtocolException("Received HTTP_PROXY_AUTH (407) code while not using proxy");
          }
          return OkHeaders.processAuthHeader(client.getAuthenticator(), userResponse, (Proxy)localObject);
        } while (((!userRequest.method().equals("GET")) && (!userRequest.method().equals("HEAD"))) || (!client.getFollowRedirects()));
        localObject = userResponse.header("Location");
      } while (localObject == null);
      localObject = new URL(userRequest.url(), (String)localObject);
    } while (((!((URL)localObject).getProtocol().equals("https")) && (!((URL)localObject).getProtocol().equals("http"))) || ((!((URL)localObject).getProtocol().equals(userRequest.url().getProtocol())) && (!client.getFollowSslRedirects())));
    Request.Builder localBuilder = userRequest.newBuilder();
    if (HttpMethod.permitsRequestBody(userRequest.method()))
    {
      localBuilder.method("GET", null);
      localBuilder.removeHeader("Transfer-Encoding");
      localBuilder.removeHeader("Content-Length");
      localBuilder.removeHeader("Content-Type");
    }
    if (!sameConnection((URL)localObject)) {
      localBuilder.removeHeader("Authorization");
    }
    return localBuilder.url((URL)localObject).build();
  }
  
  public BufferedSink getBufferedRequestBody()
  {
    Object localObject = bufferedRequestBody;
    if (localObject != null) {
      return localObject;
    }
    localObject = getRequestBody();
    if (localObject != null)
    {
      localObject = Okio.buffer((Sink)localObject);
      bufferedRequestBody = ((BufferedSink)localObject);
    }
    for (;;)
    {
      return localObject;
      localObject = null;
    }
  }
  
  public Connection getConnection()
  {
    return connection;
  }
  
  public Request getRequest()
  {
    return userRequest;
  }
  
  public Sink getRequestBody()
  {
    if (cacheStrategy == null) {
      throw new IllegalStateException();
    }
    return requestBodyOut;
  }
  
  public Response getResponse()
  {
    if (userResponse == null) {
      throw new IllegalStateException();
    }
    return userResponse;
  }
  
  public BufferedSource getResponseBody()
  {
    if (userResponse == null) {
      throw new IllegalStateException();
    }
    return responseBody;
  }
  
  public InputStream getResponseBodyBytes()
  {
    InputStream localInputStream = responseBodyBytes;
    if (localInputStream != null) {
      return localInputStream;
    }
    localInputStream = Okio.buffer(getResponseBody()).inputStream();
    responseBodyBytes = localInputStream;
    return localInputStream;
  }
  
  public Route getRoute()
  {
    return route;
  }
  
  public boolean hasResponse()
  {
    return userResponse != null;
  }
  
  public boolean hasResponseBody()
  {
    if (userRequest.method().equals("HEAD")) {}
    do
    {
      return false;
      int i = userResponse.code();
      if (((i < 100) || (i >= 200)) && (i != 204) && (i != 304)) {
        return true;
      }
    } while ((OkHeaders.contentLength(networkResponse) == -1L) && (!"chunked".equalsIgnoreCase(networkResponse.header("Transfer-Encoding"))));
    return true;
  }
  
  boolean permitsRequestBody()
  {
    return HttpMethod.permitsRequestBody(userRequest.method());
  }
  
  public void readResponse()
    throws IOException
  {
    if (userResponse != null) {}
    do
    {
      return;
      if ((networkRequest == null) && (cacheResponse == null)) {
        throw new IllegalStateException("call sendRequest() first!");
      }
    } while (networkRequest == null);
    if ((bufferedRequestBody != null) && (bufferedRequestBody.buffer().size() > 0L)) {
      bufferedRequestBody.flush();
    }
    if (sentRequestMillis == -1L)
    {
      if ((OkHeaders.contentLength(networkRequest) == -1L) && ((requestBodyOut instanceof RetryableSink)))
      {
        long l = ((RetryableSink)requestBodyOut).contentLength();
        networkRequest = networkRequest.newBuilder().header("Content-Length", Long.toString(l)).build();
      }
      transport.writeRequestHeaders(networkRequest);
    }
    if (requestBodyOut != null)
    {
      if (bufferedRequestBody == null) {
        break label463;
      }
      bufferedRequestBody.close();
    }
    for (;;)
    {
      if ((requestBodyOut instanceof RetryableSink)) {
        transport.writeRequestBody((RetryableSink)requestBodyOut);
      }
      transport.flushRequest();
      networkResponse = transport.readResponseHeaders().request(networkRequest).handshake(connection.getHandshake()).header(OkHeaders.SENT_MILLIS, Long.toString(sentRequestMillis)).header(OkHeaders.RECEIVED_MILLIS, Long.toString(System.currentTimeMillis())).build();
      Internal.instance.setProtocol(connection, networkResponse.protocol());
      receiveHeaders(networkResponse.headers());
      if (cacheResponse == null) {
        break label485;
      }
      if (!validate(cacheResponse, networkResponse)) {
        break label475;
      }
      userResponse = cacheResponse.newBuilder().request(userRequest).priorResponse(stripBody(priorResponse)).headers(combine(cacheResponse.headers(), networkResponse.headers())).cacheResponse(stripBody(cacheResponse)).networkResponse(stripBody(networkResponse)).build();
      transport.emptyTransferStream();
      releaseConnection();
      InternalCache localInternalCache = Internal.instance.internalCache(client);
      localInternalCache.trackConditionalCacheHit();
      localInternalCache.update(cacheResponse, stripBody(userResponse));
      if (cacheResponse.body() == null) {
        break;
      }
      initContentStream(cacheResponse.body().source());
      return;
      label463:
      requestBodyOut.close();
    }
    label475:
    Util.closeQuietly(cacheResponse.body());
    label485:
    userResponse = networkResponse.newBuilder().request(userRequest).priorResponse(stripBody(priorResponse)).cacheResponse(stripBody(cacheResponse)).networkResponse(stripBody(networkResponse)).build();
    if (!hasResponseBody())
    {
      responseTransferSource = transport.getTransferStream(storeRequest);
      responseBody = Okio.buffer(responseTransferSource);
      return;
    }
    maybeCache();
    initContentStream(transport.getTransferStream(storeRequest));
  }
  
  public void receiveHeaders(Headers paramHeaders)
    throws IOException
  {
    CookieHandler localCookieHandler = client.getCookieHandler();
    if (localCookieHandler != null) {
      localCookieHandler.put(userRequest.uri(), OkHeaders.toMultimap(paramHeaders, null));
    }
  }
  
  public HttpEngine recover(IOException paramIOException)
  {
    return recover(paramIOException, requestBodyOut);
  }
  
  public HttpEngine recover(IOException paramIOException, Sink paramSink)
  {
    if ((routeSelector != null) && (connection != null)) {
      routeSelector.connectFailed(connection, paramIOException);
    }
    if ((paramSink == null) || ((paramSink instanceof RetryableSink))) {}
    for (int i = 1; ((routeSelector == null) && (connection == null)) || ((routeSelector != null) && (!routeSelector.hasNext())) || (!isRecoverable(paramIOException)) || (i == 0); i = 0) {
      return null;
    }
    paramIOException = close();
    return new HttpEngine(client, userRequest, bufferRequestBody, paramIOException, routeSelector, (RetryableSink)paramSink, priorResponse);
  }
  
  public void releaseConnection()
    throws IOException
  {
    if ((transport != null) && (connection != null)) {
      transport.releaseConnectionOnIdle();
    }
    connection = null;
  }
  
  public boolean sameConnection(URL paramURL)
  {
    URL localURL = userRequest.url();
    return (localURL.getHost().equals(paramURL.getHost())) && (Util.getEffectivePort(localURL) == Util.getEffectivePort(paramURL)) && (localURL.getProtocol().equals(paramURL.getProtocol()));
  }
  
  public void sendRequest()
    throws IOException
  {
    if (cacheStrategy != null) {}
    for (;;)
    {
      return;
      if (transport != null) {
        throw new IllegalStateException();
      }
      Request localRequest = networkRequest(userRequest);
      InternalCache localInternalCache = Internal.instance.internalCache(client);
      if (localInternalCache != null) {}
      long l;
      for (Response localResponse = localInternalCache.get(localRequest);; localResponse = null)
      {
        cacheStrategy = new CacheStrategy.Factory(System.currentTimeMillis(), localRequest, localResponse).get();
        networkRequest = cacheStrategy.networkRequest;
        cacheResponse = cacheStrategy.cacheResponse;
        if (localInternalCache != null) {
          localInternalCache.trackResponse(cacheStrategy);
        }
        if ((localResponse != null) && (cacheResponse == null)) {
          Util.closeQuietly(localResponse.body());
        }
        if (networkRequest == null) {
          break label297;
        }
        if (connection == null) {
          connect(networkRequest);
        }
        transport = Internal.instance.newTransport(connection, this);
        if ((!permitsRequestBody()) || (requestBodyOut != null)) {
          break;
        }
        l = OkHeaders.contentLength(localRequest);
        if (!bufferRequestBody) {
          break label269;
        }
        if (l <= 2147483647L) {
          break label224;
        }
        throw new IllegalStateException("Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for requests larger than 2 GiB.");
      }
      label224:
      if (l != -1L)
      {
        transport.writeRequestHeaders(localRequest);
        requestBodyOut = new RetryableSink((int)l);
        return;
      }
      requestBodyOut = new RetryableSink();
      return;
      label269:
      transport.writeRequestHeaders(localRequest);
      requestBodyOut = transport.createRequestBody(localRequest, l);
      return;
      label297:
      if (connection != null)
      {
        Internal.instance.recycle(client.getConnectionPool(), connection);
        connection = null;
      }
      if (cacheResponse != null) {}
      for (userResponse = cacheResponse.newBuilder().request(userRequest).priorResponse(stripBody(priorResponse)).cacheResponse(stripBody(cacheResponse)).build(); userResponse.body() != null; userResponse = new Response.Builder().request(userRequest).priorResponse(stripBody(priorResponse)).protocol(Protocol.HTTP_1_1).code(504).message("Unsatisfiable Request (only-if-cached)").body(EMPTY_BODY).build())
      {
        initContentStream(userResponse.body().source());
        return;
      }
    }
  }
  
  public void writingRequestHeaders()
  {
    if (sentRequestMillis != -1L) {
      throw new IllegalStateException();
    }
    sentRequestMillis = System.currentTimeMillis();
  }
}
