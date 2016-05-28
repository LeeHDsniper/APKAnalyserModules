package com.squareup.okhttp;

import com.squareup.okhttp.internal.Platform;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.HttpConnection;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.HttpTransport;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.SpdyTransport;
import com.squareup.okhttp.internal.http.Transport;
import com.squareup.okhttp.internal.spdy.SpdyConnection;
import com.squareup.okhttp.internal.spdy.SpdyConnection.Builder;
import java.io.IOException;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.Socket;
import java.net.URL;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

public final class Connection
{
  private boolean connected = false;
  private Handshake handshake;
  private HttpConnection httpConnection;
  private long idleStartTimeNs;
  private Object owner;
  private final ConnectionPool pool;
  private Protocol protocol = Protocol.HTTP_1_1;
  private int recycleCount;
  private final Route route;
  private Socket socket;
  private SpdyConnection spdyConnection;
  
  public Connection(ConnectionPool paramConnectionPool, Route paramRoute)
  {
    pool = paramConnectionPool;
    route = paramRoute;
  }
  
  private void makeTunnel(Request paramRequest, int paramInt1, int paramInt2)
    throws IOException
  {
    HttpConnection localHttpConnection = new HttpConnection(pool, this, socket);
    localHttpConnection.setTimeouts(paramInt1, paramInt2);
    Object localObject = paramRequest.url();
    String str = "CONNECT " + ((URL)localObject).getHost() + ":" + ((URL)localObject).getPort() + " HTTP/1.1";
    do
    {
      localHttpConnection.writeRequest(paramRequest.headers(), str);
      localHttpConnection.flush();
      paramRequest = localHttpConnection.readResponse().request(paramRequest).build();
      localHttpConnection.emptyResponseBody();
      switch (paramRequest.code())
      {
      default: 
        throw new IOException("Unexpected response code for CONNECT: " + paramRequest.code());
      case 200: 
        if (localHttpConnection.bufferSize() <= 0L) {
          break;
        }
        throw new IOException("TLS tunnel buffered too many bytes!");
      case 407: 
        localObject = OkHeaders.processAuthHeader(route.address.authenticator, paramRequest, route.proxy);
        paramRequest = (Request)localObject;
      }
    } while (localObject != null);
    throw new IOException("Failed to authenticate with proxy");
  }
  
  private Request tunnelRequest(Request paramRequest)
    throws IOException
  {
    if (!route.requiresTunnel()) {
      return null;
    }
    String str = paramRequest.url().getHost();
    int i = Util.getEffectivePort(paramRequest.url());
    if (i == Util.getDefaultPort("https")) {}
    for (Object localObject = str;; localObject = str + ":" + i)
    {
      localObject = new Request.Builder().url(new URL("https", str, i, "/")).header("Host", (String)localObject).header("Proxy-Connection", "Keep-Alive");
      str = paramRequest.header("User-Agent");
      if (str != null) {
        ((Request.Builder)localObject).header("User-Agent", str);
      }
      paramRequest = paramRequest.header("Proxy-Authorization");
      if (paramRequest != null) {
        ((Request.Builder)localObject).header("Proxy-Authorization", paramRequest);
      }
      return ((Request.Builder)localObject).build();
    }
  }
  
  private void upgradeToTls(Request paramRequest, int paramInt1, int paramInt2)
    throws IOException
  {
    Object localObject = Platform.get();
    if (paramRequest != null) {
      makeTunnel(paramRequest, paramInt1, paramInt2);
    }
    socket = route.address.sslSocketFactory.createSocket(socket, route.address.uriHost, route.address.uriPort, true);
    paramRequest = (SSLSocket)socket;
    route.connectionSpec.apply(paramRequest, route);
    paramRequest.startHandshake();
    if (!route.address.hostnameVerifier.verify(route.address.uriHost, paramRequest.getSession())) {
      throw new IOException("Hostname '" + route.address.uriHost + "' was not verified");
    }
    route.address.certificatePinner.check(route.address.uriHost, paramRequest.getSession().getPeerCertificates());
    handshake = Handshake.get(paramRequest.getSession());
    if (route.connectionSpec.supportsTlsExtensions())
    {
      localObject = ((Platform)localObject).getSelectedProtocol(paramRequest);
      if (localObject != null) {
        protocol = Protocol.get((String)localObject);
      }
    }
    if ((protocol == Protocol.SPDY_3) || (protocol == Protocol.HTTP_2))
    {
      paramRequest.setSoTimeout(0);
      spdyConnection = new SpdyConnection.Builder(route.address.getUriHost(), true, socket).protocol(protocol).build();
      spdyConnection.sendConnectionPreface();
      return;
    }
    httpConnection = new HttpConnection(pool, this, socket);
  }
  
  boolean clearOwner()
  {
    synchronized (pool)
    {
      if (owner == null) {
        return false;
      }
      owner = null;
      return true;
    }
  }
  
  void closeIfOwnedBy(Object paramObject)
    throws IOException
  {
    if (isSpdy()) {
      throw new IllegalStateException();
    }
    synchronized (pool)
    {
      if (owner != paramObject) {
        return;
      }
      owner = null;
      socket.close();
      return;
    }
  }
  
  void connect(int paramInt1, int paramInt2, int paramInt3, Request paramRequest)
    throws IOException
  {
    if (connected) {
      throw new IllegalStateException("already connected");
    }
    if ((route.proxy.type() == Proxy.Type.DIRECT) || (route.proxy.type() == Proxy.Type.HTTP))
    {
      socket = route.address.socketFactory.createSocket();
      socket.setSoTimeout(paramInt2);
      Platform.get().connectSocket(socket, route.inetSocketAddress, paramInt1);
      if (route.address.sslSocketFactory == null) {
        break label141;
      }
      upgradeToTls(paramRequest, paramInt2, paramInt3);
    }
    for (;;)
    {
      connected = true;
      return;
      socket = new Socket(route.proxy);
      break;
      label141:
      httpConnection = new HttpConnection(pool, this, socket);
    }
  }
  
  void connectAndSetOwner(OkHttpClient paramOkHttpClient, Object paramObject, Request paramRequest)
    throws IOException
  {
    setOwner(paramObject);
    if (!isConnected())
    {
      paramObject = tunnelRequest(paramRequest);
      connect(paramOkHttpClient.getConnectTimeout(), paramOkHttpClient.getReadTimeout(), paramOkHttpClient.getWriteTimeout(), paramObject);
      if (isSpdy()) {
        paramOkHttpClient.getConnectionPool().share(this);
      }
      paramOkHttpClient.routeDatabase().connected(getRoute());
    }
    setTimeouts(paramOkHttpClient.getReadTimeout(), paramOkHttpClient.getWriteTimeout());
  }
  
  public Handshake getHandshake()
  {
    return handshake;
  }
  
  long getIdleStartTimeNs()
  {
    if (spdyConnection == null) {
      return idleStartTimeNs;
    }
    return spdyConnection.getIdleStartTimeNs();
  }
  
  public Protocol getProtocol()
  {
    return protocol;
  }
  
  public Route getRoute()
  {
    return route;
  }
  
  public Socket getSocket()
  {
    return socket;
  }
  
  void incrementRecycleCount()
  {
    recycleCount += 1;
  }
  
  boolean isAlive()
  {
    return (!socket.isClosed()) && (!socket.isInputShutdown()) && (!socket.isOutputShutdown());
  }
  
  boolean isConnected()
  {
    return connected;
  }
  
  boolean isExpired(long paramLong)
  {
    return getIdleStartTimeNs() < System.nanoTime() - paramLong;
  }
  
  boolean isIdle()
  {
    return (spdyConnection == null) || (spdyConnection.isIdle());
  }
  
  boolean isReadable()
  {
    if (httpConnection != null) {
      return httpConnection.isReadable();
    }
    return true;
  }
  
  boolean isSpdy()
  {
    return spdyConnection != null;
  }
  
  Transport newTransport(HttpEngine paramHttpEngine)
    throws IOException
  {
    if (spdyConnection != null) {
      return new SpdyTransport(paramHttpEngine, spdyConnection);
    }
    return new HttpTransport(paramHttpEngine, httpConnection);
  }
  
  int recycleCount()
  {
    return recycleCount;
  }
  
  void resetIdleStartTime()
  {
    if (spdyConnection != null) {
      throw new IllegalStateException("spdyConnection != null");
    }
    idleStartTimeNs = System.nanoTime();
  }
  
  void setOwner(Object paramObject)
  {
    if (isSpdy()) {
      return;
    }
    synchronized (pool)
    {
      if (owner != null) {
        throw new IllegalStateException("Connection already has an owner!");
      }
    }
    owner = paramObject;
  }
  
  void setProtocol(Protocol paramProtocol)
  {
    if (paramProtocol == null) {
      throw new IllegalArgumentException("protocol == null");
    }
    protocol = paramProtocol;
  }
  
  void setTimeouts(int paramInt1, int paramInt2)
    throws IOException
  {
    if (!connected) {
      throw new IllegalStateException("setTimeouts - not connected");
    }
    if (httpConnection != null)
    {
      socket.setSoTimeout(paramInt1);
      httpConnection.setTimeouts(paramInt1, paramInt2);
    }
  }
}
