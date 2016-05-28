package com.squareup.okhttp;

import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.InternalCache;
import com.squareup.okhttp.internal.Network;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.AuthenticatorAdapter;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.Transport;
import com.squareup.okhttp.internal.tls.OkHostnameVerifier;
import java.io.IOException;
import java.net.CookieHandler;
import java.net.Proxy;
import java.net.ProxySelector;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

public class OkHttpClient
  implements Cloneable
{
  private static final List<ConnectionSpec> DEFAULT_CONNECTION_SPECS;
  private static final List<Protocol> DEFAULT_PROTOCOLS = Util.immutableList(new Protocol[] { Protocol.HTTP_2, Protocol.SPDY_3, Protocol.HTTP_1_1 });
  private static SSLSocketFactory defaultSslSocketFactory;
  private Authenticator authenticator;
  private Cache cache;
  private CertificatePinner certificatePinner;
  private int connectTimeout;
  private ConnectionPool connectionPool;
  private List<ConnectionSpec> connectionSpecs;
  private CookieHandler cookieHandler;
  private Dispatcher dispatcher;
  private boolean followRedirects = true;
  private boolean followSslRedirects = true;
  private HostnameVerifier hostnameVerifier;
  private InternalCache internalCache;
  private Network network;
  private List<Protocol> protocols;
  private Proxy proxy;
  private ProxySelector proxySelector;
  private int readTimeout;
  private final RouteDatabase routeDatabase;
  private SocketFactory socketFactory;
  private SSLSocketFactory sslSocketFactory;
  private int writeTimeout;
  
  static
  {
    DEFAULT_CONNECTION_SPECS = Util.immutableList(new ConnectionSpec[] { ConnectionSpec.MODERN_TLS, ConnectionSpec.COMPATIBLE_TLS, ConnectionSpec.CLEARTEXT });
    Internal.instance = new Internal()
    {
      public void addLine(Headers.Builder paramAnonymousBuilder, String paramAnonymousString)
      {
        paramAnonymousBuilder.addLine(paramAnonymousString);
      }
      
      public boolean clearOwner(Connection paramAnonymousConnection)
      {
        return paramAnonymousConnection.clearOwner();
      }
      
      public void closeIfOwnedBy(Connection paramAnonymousConnection, Object paramAnonymousObject)
        throws IOException
      {
        paramAnonymousConnection.closeIfOwnedBy(paramAnonymousObject);
      }
      
      public void connectAndSetOwner(OkHttpClient paramAnonymousOkHttpClient, Connection paramAnonymousConnection, HttpEngine paramAnonymousHttpEngine, Request paramAnonymousRequest)
        throws IOException
      {
        paramAnonymousConnection.connectAndSetOwner(paramAnonymousOkHttpClient, paramAnonymousHttpEngine, paramAnonymousRequest);
      }
      
      public InternalCache internalCache(OkHttpClient paramAnonymousOkHttpClient)
      {
        return paramAnonymousOkHttpClient.internalCache();
      }
      
      public boolean isReadable(Connection paramAnonymousConnection)
      {
        return paramAnonymousConnection.isReadable();
      }
      
      public Network network(OkHttpClient paramAnonymousOkHttpClient)
      {
        return network;
      }
      
      public Transport newTransport(Connection paramAnonymousConnection, HttpEngine paramAnonymousHttpEngine)
        throws IOException
      {
        return paramAnonymousConnection.newTransport(paramAnonymousHttpEngine);
      }
      
      public void recycle(ConnectionPool paramAnonymousConnectionPool, Connection paramAnonymousConnection)
      {
        paramAnonymousConnectionPool.recycle(paramAnonymousConnection);
      }
      
      public int recycleCount(Connection paramAnonymousConnection)
      {
        return paramAnonymousConnection.recycleCount();
      }
      
      public RouteDatabase routeDatabase(OkHttpClient paramAnonymousOkHttpClient)
      {
        return paramAnonymousOkHttpClient.routeDatabase();
      }
      
      public void setOwner(Connection paramAnonymousConnection, HttpEngine paramAnonymousHttpEngine)
      {
        paramAnonymousConnection.setOwner(paramAnonymousHttpEngine);
      }
      
      public void setProtocol(Connection paramAnonymousConnection, Protocol paramAnonymousProtocol)
      {
        paramAnonymousConnection.setProtocol(paramAnonymousProtocol);
      }
    };
  }
  
  public OkHttpClient()
  {
    routeDatabase = new RouteDatabase();
    dispatcher = new Dispatcher();
  }
  
  private OkHttpClient(OkHttpClient paramOkHttpClient)
  {
    routeDatabase = routeDatabase;
    dispatcher = dispatcher;
    proxy = proxy;
    protocols = protocols;
    connectionSpecs = connectionSpecs;
    proxySelector = proxySelector;
    cookieHandler = cookieHandler;
    cache = cache;
    if (cache != null) {}
    for (InternalCache localInternalCache = cache.internalCache;; localInternalCache = internalCache)
    {
      internalCache = localInternalCache;
      socketFactory = socketFactory;
      sslSocketFactory = sslSocketFactory;
      hostnameVerifier = hostnameVerifier;
      certificatePinner = certificatePinner;
      authenticator = authenticator;
      connectionPool = connectionPool;
      network = network;
      followSslRedirects = followSslRedirects;
      followRedirects = followRedirects;
      connectTimeout = connectTimeout;
      readTimeout = readTimeout;
      writeTimeout = writeTimeout;
      return;
    }
  }
  
  /* Error */
  private SSLSocketFactory getDefaultSSLSocketFactory()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: getstatic 158	com/squareup/okhttp/OkHttpClient:defaultSslSocketFactory	Ljavax/net/ssl/SSLSocketFactory;
    //   5: astore_1
    //   6: aload_1
    //   7: ifnonnull +23 -> 30
    //   10: ldc -96
    //   12: invokestatic 166	javax/net/ssl/SSLContext:getInstance	(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    //   15: astore_1
    //   16: aload_1
    //   17: aconst_null
    //   18: aconst_null
    //   19: aconst_null
    //   20: invokevirtual 170	javax/net/ssl/SSLContext:init	([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    //   23: aload_1
    //   24: invokevirtual 173	javax/net/ssl/SSLContext:getSocketFactory	()Ljavax/net/ssl/SSLSocketFactory;
    //   27: putstatic 158	com/squareup/okhttp/OkHttpClient:defaultSslSocketFactory	Ljavax/net/ssl/SSLSocketFactory;
    //   30: getstatic 158	com/squareup/okhttp/OkHttpClient:defaultSslSocketFactory	Ljavax/net/ssl/SSLSocketFactory;
    //   33: astore_1
    //   34: aload_0
    //   35: monitorexit
    //   36: aload_1
    //   37: areturn
    //   38: astore_1
    //   39: new 175	java/lang/AssertionError
    //   42: dup
    //   43: invokespecial 176	java/lang/AssertionError:<init>	()V
    //   46: athrow
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	OkHttpClient
    //   5	32	1	localObject1	Object
    //   38	1	1	localGeneralSecurityException	java.security.GeneralSecurityException
    //   47	4	1	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   10	30	38	java/security/GeneralSecurityException
    //   2	6	47	finally
    //   10	30	47	finally
    //   30	34	47	finally
    //   39	47	47	finally
  }
  
  public final OkHttpClient clone()
  {
    try
    {
      OkHttpClient localOkHttpClient = (OkHttpClient)super.clone();
      return localOkHttpClient;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      throw new AssertionError();
    }
  }
  
  final OkHttpClient copyWithDefaults()
  {
    OkHttpClient localOkHttpClient = new OkHttpClient(this);
    if (proxySelector == null) {
      proxySelector = ProxySelector.getDefault();
    }
    if (cookieHandler == null) {
      cookieHandler = CookieHandler.getDefault();
    }
    if (socketFactory == null) {
      socketFactory = SocketFactory.getDefault();
    }
    if (sslSocketFactory == null) {
      sslSocketFactory = getDefaultSSLSocketFactory();
    }
    if (hostnameVerifier == null) {
      hostnameVerifier = OkHostnameVerifier.INSTANCE;
    }
    if (certificatePinner == null) {
      certificatePinner = CertificatePinner.DEFAULT;
    }
    if (authenticator == null) {
      authenticator = AuthenticatorAdapter.INSTANCE;
    }
    if (connectionPool == null) {
      connectionPool = ConnectionPool.getDefault();
    }
    if (protocols == null) {
      protocols = DEFAULT_PROTOCOLS;
    }
    if (connectionSpecs == null) {
      connectionSpecs = DEFAULT_CONNECTION_SPECS;
    }
    if (network == null) {
      network = Network.DEFAULT;
    }
    return localOkHttpClient;
  }
  
  public final Authenticator getAuthenticator()
  {
    return authenticator;
  }
  
  public final CertificatePinner getCertificatePinner()
  {
    return certificatePinner;
  }
  
  public final int getConnectTimeout()
  {
    return connectTimeout;
  }
  
  public final ConnectionPool getConnectionPool()
  {
    return connectionPool;
  }
  
  public final List<ConnectionSpec> getConnectionSpecs()
  {
    return connectionSpecs;
  }
  
  public final CookieHandler getCookieHandler()
  {
    return cookieHandler;
  }
  
  public final Dispatcher getDispatcher()
  {
    return dispatcher;
  }
  
  public final boolean getFollowRedirects()
  {
    return followRedirects;
  }
  
  public final boolean getFollowSslRedirects()
  {
    return followSslRedirects;
  }
  
  public final HostnameVerifier getHostnameVerifier()
  {
    return hostnameVerifier;
  }
  
  public final List<Protocol> getProtocols()
  {
    return protocols;
  }
  
  public final Proxy getProxy()
  {
    return proxy;
  }
  
  public final ProxySelector getProxySelector()
  {
    return proxySelector;
  }
  
  public final int getReadTimeout()
  {
    return readTimeout;
  }
  
  public final SocketFactory getSocketFactory()
  {
    return socketFactory;
  }
  
  public final SSLSocketFactory getSslSocketFactory()
  {
    return sslSocketFactory;
  }
  
  public final int getWriteTimeout()
  {
    return writeTimeout;
  }
  
  final InternalCache internalCache()
  {
    return internalCache;
  }
  
  public Call newCall(Request paramRequest)
  {
    return new Call(this, paramRequest);
  }
  
  final RouteDatabase routeDatabase()
  {
    return routeDatabase;
  }
  
  public final OkHttpClient setCache(Cache paramCache)
  {
    cache = paramCache;
    internalCache = null;
    return this;
  }
  
  public final void setConnectTimeout(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("timeout < 0");
    }
    if (paramTimeUnit == null) {
      throw new IllegalArgumentException("unit == null");
    }
    paramLong = paramTimeUnit.toMillis(paramLong);
    if (paramLong > 2147483647L) {
      throw new IllegalArgumentException("Timeout too large.");
    }
    connectTimeout = ((int)paramLong);
  }
  
  public final void setFollowRedirects(boolean paramBoolean)
  {
    followRedirects = paramBoolean;
  }
  
  public final OkHttpClient setHostnameVerifier(HostnameVerifier paramHostnameVerifier)
  {
    hostnameVerifier = paramHostnameVerifier;
    return this;
  }
  
  public final OkHttpClient setProtocols(List<Protocol> paramList)
  {
    paramList = Util.immutableList(paramList);
    if (!paramList.contains(Protocol.HTTP_1_1)) {
      throw new IllegalArgumentException("protocols doesn't contain http/1.1: " + paramList);
    }
    if (paramList.contains(Protocol.HTTP_1_0)) {
      throw new IllegalArgumentException("protocols must not contain http/1.0: " + paramList);
    }
    if (paramList.contains(null)) {
      throw new IllegalArgumentException("protocols must not contain null");
    }
    protocols = Util.immutableList(paramList);
    return this;
  }
  
  public final OkHttpClient setProxy(Proxy paramProxy)
  {
    proxy = paramProxy;
    return this;
  }
  
  public final void setReadTimeout(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("timeout < 0");
    }
    if (paramTimeUnit == null) {
      throw new IllegalArgumentException("unit == null");
    }
    paramLong = paramTimeUnit.toMillis(paramLong);
    if (paramLong > 2147483647L) {
      throw new IllegalArgumentException("Timeout too large.");
    }
    readTimeout = ((int)paramLong);
  }
  
  public final OkHttpClient setSslSocketFactory(SSLSocketFactory paramSSLSocketFactory)
  {
    sslSocketFactory = paramSSLSocketFactory;
    return this;
  }
  
  public final void setWriteTimeout(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("timeout < 0");
    }
    if (paramTimeUnit == null) {
      throw new IllegalArgumentException("unit == null");
    }
    paramLong = paramTimeUnit.toMillis(paramLong);
    if (paramLong > 2147483647L) {
      throw new IllegalArgumentException("Timeout too large.");
    }
    writeTimeout = ((int)paramLong);
  }
}
