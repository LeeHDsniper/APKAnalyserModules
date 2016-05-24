package org.apache.http.impl.conn;

import java.io.Closeable;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Lookup;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.ConnectionRequest;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.HttpConnectionFactory;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.pool.ConnFactory;
import org.apache.http.pool.ConnPoolControl;
import org.apache.http.pool.PoolStats;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@ThreadSafe
public class PoolingHttpClientConnectionManager
  implements Closeable, HttpClientConnectionManager, ConnPoolControl<HttpRoute>
{
  private final ConfigData configData = new ConfigData();
  private final HttpClientConnectionOperator connectionOperator;
  private final Log log = LogFactory.getLog(getClass());
  private final CPool pool;
  
  public PoolingHttpClientConnectionManager()
  {
    this(getDefaultRegistry());
  }
  
  public PoolingHttpClientConnectionManager(long paramLong, TimeUnit paramTimeUnit)
  {
    this(getDefaultRegistry(), null, null, null, paramLong, paramTimeUnit);
  }
  
  public PoolingHttpClientConnectionManager(Registry<ConnectionSocketFactory> paramRegistry)
  {
    this(paramRegistry, null, null);
  }
  
  public PoolingHttpClientConnectionManager(Registry<ConnectionSocketFactory> paramRegistry, DnsResolver paramDnsResolver)
  {
    this(paramRegistry, null, paramDnsResolver);
  }
  
  public PoolingHttpClientConnectionManager(Registry<ConnectionSocketFactory> paramRegistry, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory)
  {
    this(paramRegistry, paramHttpConnectionFactory, null);
  }
  
  public PoolingHttpClientConnectionManager(Registry<ConnectionSocketFactory> paramRegistry, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory, DnsResolver paramDnsResolver)
  {
    this(paramRegistry, paramHttpConnectionFactory, null, paramDnsResolver, -1L, TimeUnit.MILLISECONDS);
  }
  
  public PoolingHttpClientConnectionManager(Registry<ConnectionSocketFactory> paramRegistry, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory, SchemePortResolver paramSchemePortResolver, DnsResolver paramDnsResolver, long paramLong, TimeUnit paramTimeUnit)
  {
    pool = new CPool(new InternalConnectionFactory(configData, paramHttpConnectionFactory), 2, 20, paramLong, paramTimeUnit);
    connectionOperator = new HttpClientConnectionOperator(paramRegistry, paramSchemePortResolver, paramDnsResolver);
  }
  
  public PoolingHttpClientConnectionManager(HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory)
  {
    this(getDefaultRegistry(), paramHttpConnectionFactory, null);
  }
  
  PoolingHttpClientConnectionManager(CPool paramCPool, Lookup<ConnectionSocketFactory> paramLookup, SchemePortResolver paramSchemePortResolver, DnsResolver paramDnsResolver)
  {
    pool = paramCPool;
    connectionOperator = new HttpClientConnectionOperator(paramLookup, paramSchemePortResolver, paramDnsResolver);
  }
  
  private String format(HttpRoute paramHttpRoute, Object paramObject)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[route: ").append(paramHttpRoute).append("]");
    if (paramObject != null) {
      localStringBuilder.append("[state: ").append(paramObject).append("]");
    }
    return localStringBuilder.toString();
  }
  
  private String format(CPoolEntry paramCPoolEntry)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[id: ").append(paramCPoolEntry.getId()).append("]");
    localStringBuilder.append("[route: ").append(paramCPoolEntry.getRoute()).append("]");
    paramCPoolEntry = paramCPoolEntry.getState();
    if (paramCPoolEntry != null) {
      localStringBuilder.append("[state: ").append(paramCPoolEntry).append("]");
    }
    return localStringBuilder.toString();
  }
  
  private String formatStats(HttpRoute paramHttpRoute)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    PoolStats localPoolStats = pool.getTotalStats();
    paramHttpRoute = pool.getStats(paramHttpRoute);
    localStringBuilder.append("[total kept alive: ").append(localPoolStats.getAvailable()).append("; ");
    localStringBuilder.append("route allocated: ").append(paramHttpRoute.getLeased() + paramHttpRoute.getAvailable());
    localStringBuilder.append(" of ").append(paramHttpRoute.getMax()).append("; ");
    localStringBuilder.append("total allocated: ").append(localPoolStats.getLeased() + localPoolStats.getAvailable());
    localStringBuilder.append(" of ").append(localPoolStats.getMax()).append("]");
    return localStringBuilder.toString();
  }
  
  private static Registry<ConnectionSocketFactory> getDefaultRegistry()
  {
    return RegistryBuilder.create().register("http", PlainConnectionSocketFactory.getSocketFactory()).register("https", SSLConnectionSocketFactory.getSocketFactory()).build();
  }
  
  public void close()
  {
    shutdown();
  }
  
  public void closeExpiredConnections()
  {
    log.debug("Closing expired connections");
    pool.closeExpired();
  }
  
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    if (log.isDebugEnabled()) {
      log.debug("Closing connections idle longer than " + paramLong + " " + paramTimeUnit);
    }
    pool.closeIdle(paramLong, paramTimeUnit);
  }
  
  public void connect(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, int paramInt, HttpContext paramHttpContext)
    throws IOException
  {
    Args.notNull(paramHttpClientConnection, "Managed Connection");
    Args.notNull(paramHttpRoute, "HTTP route");
    for (;;)
    {
      try
      {
        ManagedHttpClientConnection localManagedHttpClientConnection = (ManagedHttpClientConnection)CPoolProxy.getPoolEntry(paramHttpClientConnection).getConnection();
        if (paramHttpRoute.getProxyHost() != null)
        {
          localHttpHost = paramHttpRoute.getProxyHost();
          InetSocketAddress localInetSocketAddress = paramHttpRoute.getLocalSocketAddress();
          paramHttpRoute = configData.getSocketConfig(localHttpHost);
          paramHttpClientConnection = paramHttpRoute;
          if (paramHttpRoute == null) {
            paramHttpClientConnection = configData.getDefaultSocketConfig();
          }
          paramHttpRoute = paramHttpClientConnection;
          if (paramHttpClientConnection == null) {
            paramHttpRoute = SocketConfig.DEFAULT;
          }
          connectionOperator.connect(localManagedHttpClientConnection, localHttpHost, localInetSocketAddress, paramInt, paramHttpRoute, paramHttpContext);
          return;
        }
      }
      finally {}
      HttpHost localHttpHost = paramHttpRoute.getTargetHost();
    }
  }
  
  protected void finalize()
    throws Throwable
  {
    try
    {
      shutdown();
      return;
    }
    finally
    {
      super.finalize();
    }
  }
  
  public ConnectionConfig getConnectionConfig(HttpHost paramHttpHost)
  {
    return configData.getConnectionConfig(paramHttpHost);
  }
  
  public ConnectionConfig getDefaultConnectionConfig()
  {
    return configData.getDefaultConnectionConfig();
  }
  
  public int getDefaultMaxPerRoute()
  {
    return pool.getDefaultMaxPerRoute();
  }
  
  public SocketConfig getDefaultSocketConfig()
  {
    return configData.getDefaultSocketConfig();
  }
  
  public int getMaxPerRoute(HttpRoute paramHttpRoute)
  {
    return pool.getMaxPerRoute(paramHttpRoute);
  }
  
  public int getMaxTotal()
  {
    return pool.getMaxTotal();
  }
  
  public SocketConfig getSocketConfig(HttpHost paramHttpHost)
  {
    return configData.getSocketConfig(paramHttpHost);
  }
  
  public PoolStats getStats(HttpRoute paramHttpRoute)
  {
    return pool.getStats(paramHttpRoute);
  }
  
  public PoolStats getTotalStats()
  {
    return pool.getTotalStats();
  }
  
  protected HttpClientConnection leaseConnection(Future<CPoolEntry> paramFuture, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, ConnectionPoolTimeoutException
  {
    try
    {
      paramTimeUnit = (CPoolEntry)paramFuture.get(paramLong, paramTimeUnit);
      if ((paramTimeUnit == null) || (paramFuture.isCancelled())) {
        throw new InterruptedException();
      }
    }
    catch (TimeoutException paramFuture)
    {
      throw new ConnectionPoolTimeoutException("Timeout waiting for connection from pool");
    }
    if (paramTimeUnit.getConnection() != null) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Pool entry with no connection");
      if (log.isDebugEnabled()) {
        log.debug("Connection leased: " + format(paramTimeUnit) + formatStats((HttpRoute)paramTimeUnit.getRoute()));
      }
      paramFuture = CPoolProxy.newProxy(paramTimeUnit);
      return paramFuture;
    }
  }
  
  /* Error */
  public void releaseConnection(HttpClientConnection paramHttpClientConnection, Object paramObject, long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc_w 364
    //   4: invokestatic 243	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   7: pop
    //   8: aload_1
    //   9: monitorenter
    //   10: aload_1
    //   11: invokestatic 367	org/apache/http/impl/conn/CPoolProxy:detach	(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;
    //   14: astore 7
    //   16: aload 7
    //   18: ifnonnull +6 -> 24
    //   21: aload_1
    //   22: monitorexit
    //   23: return
    //   24: aload 7
    //   26: invokevirtual 254	org/apache/http/impl/conn/CPoolEntry:getConnection	()Ljava/lang/Object;
    //   29: checkcast 256	org/apache/http/conn/ManagedHttpClientConnection
    //   32: astore 8
    //   34: aload 8
    //   36: invokeinterface 370 1 0
    //   41: ifeq +116 -> 157
    //   44: aload 7
    //   46: aload_2
    //   47: invokevirtual 373	org/apache/http/impl/conn/CPoolEntry:setState	(Ljava/lang/Object;)V
    //   50: aload 5
    //   52: ifnull +208 -> 260
    //   55: aload 7
    //   57: lload_3
    //   58: aload 5
    //   60: invokevirtual 376	org/apache/http/impl/conn/CPoolEntry:updateExpiry	(JLjava/util/concurrent/TimeUnit;)V
    //   63: aload_0
    //   64: getfield 74	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   67: invokeinterface 221 1 0
    //   72: ifeq +85 -> 157
    //   75: lload_3
    //   76: lconst_0
    //   77: lcmp
    //   78: ifle +190 -> 268
    //   81: new 103	java/lang/StringBuilder
    //   84: dup
    //   85: invokespecial 104	java/lang/StringBuilder:<init>	()V
    //   88: ldc_w 378
    //   91: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   94: lload_3
    //   95: l2d
    //   96: ldc2_w 379
    //   99: ddiv
    //   100: invokevirtual 383	java/lang/StringBuilder:append	(D)Ljava/lang/StringBuilder;
    //   103: ldc_w 385
    //   106: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   109: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   112: astore_2
    //   113: aload_0
    //   114: getfield 74	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   117: new 103	java/lang/StringBuilder
    //   120: dup
    //   121: invokespecial 104	java/lang/StringBuilder:<init>	()V
    //   124: ldc_w 387
    //   127: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   130: aload_0
    //   131: aload 7
    //   133: invokespecial 353	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:format	(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;
    //   136: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   139: ldc_w 389
    //   142: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   145: aload_2
    //   146: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   152: invokeinterface 213 2 0
    //   157: aload_0
    //   158: getfield 87	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:pool	Lorg/apache/http/impl/conn/CPool;
    //   161: astore_2
    //   162: aload 8
    //   164: invokeinterface 370 1 0
    //   169: ifeq +106 -> 275
    //   172: aload 7
    //   174: invokevirtual 392	org/apache/http/impl/conn/CPoolEntry:isRouteComplete	()Z
    //   177: ifeq +98 -> 275
    //   180: iconst_1
    //   181: istore 6
    //   183: aload_2
    //   184: aload 7
    //   186: iload 6
    //   188: invokevirtual 396	org/apache/http/impl/conn/CPool:release	(Lorg/apache/http/pool/PoolEntry;Z)V
    //   191: aload_0
    //   192: getfield 74	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   195: invokeinterface 221 1 0
    //   200: ifeq +52 -> 252
    //   203: aload_0
    //   204: getfield 74	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   207: new 103	java/lang/StringBuilder
    //   210: dup
    //   211: invokespecial 104	java/lang/StringBuilder:<init>	()V
    //   214: ldc_w 398
    //   217: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   220: aload_0
    //   221: aload 7
    //   223: invokespecial 353	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:format	(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;
    //   226: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   229: aload_0
    //   230: aload 7
    //   232: invokevirtual 133	org/apache/http/impl/conn/CPoolEntry:getRoute	()Ljava/lang/Object;
    //   235: checkcast 258	org/apache/http/conn/routing/HttpRoute
    //   238: invokespecial 355	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:formatStats	(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;
    //   241: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   244: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   247: invokeinterface 213 2 0
    //   252: aload_1
    //   253: monitorexit
    //   254: return
    //   255: astore_2
    //   256: aload_1
    //   257: monitorexit
    //   258: aload_2
    //   259: athrow
    //   260: getstatic 59	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   263: astore 5
    //   265: goto -210 -> 55
    //   268: ldc_w 400
    //   271: astore_2
    //   272: goto -159 -> 113
    //   275: iconst_0
    //   276: istore 6
    //   278: goto -95 -> 183
    //   281: astore_2
    //   282: aload_0
    //   283: getfield 87	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:pool	Lorg/apache/http/impl/conn/CPool;
    //   286: astore 5
    //   288: aload 8
    //   290: invokeinterface 370 1 0
    //   295: ifeq +86 -> 381
    //   298: aload 7
    //   300: invokevirtual 392	org/apache/http/impl/conn/CPoolEntry:isRouteComplete	()Z
    //   303: ifeq +78 -> 381
    //   306: iconst_1
    //   307: istore 6
    //   309: aload 5
    //   311: aload 7
    //   313: iload 6
    //   315: invokevirtual 396	org/apache/http/impl/conn/CPool:release	(Lorg/apache/http/pool/PoolEntry;Z)V
    //   318: aload_0
    //   319: getfield 74	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   322: invokeinterface 221 1 0
    //   327: ifeq +52 -> 379
    //   330: aload_0
    //   331: getfield 74	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   334: new 103	java/lang/StringBuilder
    //   337: dup
    //   338: invokespecial 104	java/lang/StringBuilder:<init>	()V
    //   341: ldc_w 398
    //   344: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   347: aload_0
    //   348: aload 7
    //   350: invokespecial 353	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:format	(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;
    //   353: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   356: aload_0
    //   357: aload 7
    //   359: invokevirtual 133	org/apache/http/impl/conn/CPoolEntry:getRoute	()Ljava/lang/Object;
    //   362: checkcast 258	org/apache/http/conn/routing/HttpRoute
    //   365: invokespecial 355	org/apache/http/impl/conn/PoolingHttpClientConnectionManager:formatStats	(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;
    //   368: invokevirtual 110	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   371: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   374: invokeinterface 213 2 0
    //   379: aload_2
    //   380: athrow
    //   381: iconst_0
    //   382: istore 6
    //   384: goto -75 -> 309
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	387	0	this	PoolingHttpClientConnectionManager
    //   0	387	1	paramHttpClientConnection	HttpClientConnection
    //   0	387	2	paramObject	Object
    //   0	387	3	paramLong	long
    //   0	387	5	paramTimeUnit	TimeUnit
    //   181	202	6	bool	boolean
    //   14	344	7	localCPoolEntry	CPoolEntry
    //   32	257	8	localManagedHttpClientConnection	ManagedHttpClientConnection
    // Exception table:
    //   from	to	target	type
    //   10	16	255	finally
    //   21	23	255	finally
    //   24	34	255	finally
    //   157	180	255	finally
    //   183	252	255	finally
    //   252	254	255	finally
    //   256	258	255	finally
    //   282	306	255	finally
    //   309	379	255	finally
    //   379	381	255	finally
    //   34	50	281	finally
    //   55	75	281	finally
    //   81	113	281	finally
    //   113	157	281	finally
    //   260	265	281	finally
  }
  
  public ConnectionRequest requestConnection(HttpRoute paramHttpRoute, Object paramObject)
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    if (log.isDebugEnabled()) {
      log.debug("Connection request: " + format(paramHttpRoute, paramObject) + formatStats(paramHttpRoute));
    }
    new ConnectionRequest()
    {
      public boolean cancel()
      {
        return val$future.cancel(true);
      }
      
      public HttpClientConnection get(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
        throws InterruptedException, ExecutionException, ConnectionPoolTimeoutException
      {
        return leaseConnection(val$future, paramAnonymousLong, paramAnonymousTimeUnit);
      }
    };
  }
  
  public void routeComplete(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws IOException
  {
    Args.notNull(paramHttpClientConnection, "Managed Connection");
    Args.notNull(paramHttpRoute, "HTTP route");
    try
    {
      CPoolProxy.getPoolEntry(paramHttpClientConnection).markRouteComplete();
      return;
    }
    finally {}
  }
  
  public void setConnectionConfig(HttpHost paramHttpHost, ConnectionConfig paramConnectionConfig)
  {
    configData.setConnectionConfig(paramHttpHost, paramConnectionConfig);
  }
  
  public void setDefaultConnectionConfig(ConnectionConfig paramConnectionConfig)
  {
    configData.setDefaultConnectionConfig(paramConnectionConfig);
  }
  
  public void setDefaultMaxPerRoute(int paramInt)
  {
    pool.setDefaultMaxPerRoute(paramInt);
  }
  
  public void setDefaultSocketConfig(SocketConfig paramSocketConfig)
  {
    configData.setDefaultSocketConfig(paramSocketConfig);
  }
  
  public void setMaxPerRoute(HttpRoute paramHttpRoute, int paramInt)
  {
    pool.setMaxPerRoute(paramHttpRoute, paramInt);
  }
  
  public void setMaxTotal(int paramInt)
  {
    pool.setMaxTotal(paramInt);
  }
  
  public void setSocketConfig(HttpHost paramHttpHost, SocketConfig paramSocketConfig)
  {
    configData.setSocketConfig(paramHttpHost, paramSocketConfig);
  }
  
  public void shutdown()
  {
    log.debug("Connection manager is shutting down");
    try
    {
      pool.shutdown();
      log.debug("Connection manager shut down");
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        log.debug("I/O exception shutting down connection manager", localIOException);
      }
    }
  }
  
  public void upgrade(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws IOException
  {
    Args.notNull(paramHttpClientConnection, "Managed Connection");
    Args.notNull(paramHttpRoute, "HTTP route");
    try
    {
      ManagedHttpClientConnection localManagedHttpClientConnection = (ManagedHttpClientConnection)CPoolProxy.getPoolEntry(paramHttpClientConnection).getConnection();
      connectionOperator.upgrade(localManagedHttpClientConnection, paramHttpRoute.getTargetHost(), paramHttpContext);
      return;
    }
    finally {}
  }
  
  static class ConfigData
  {
    private final Map<HttpHost, ConnectionConfig> connectionConfigMap = new ConcurrentHashMap();
    private volatile ConnectionConfig defaultConnectionConfig;
    private volatile SocketConfig defaultSocketConfig;
    private final Map<HttpHost, SocketConfig> socketConfigMap = new ConcurrentHashMap();
    
    ConfigData() {}
    
    public ConnectionConfig getConnectionConfig(HttpHost paramHttpHost)
    {
      return (ConnectionConfig)connectionConfigMap.get(paramHttpHost);
    }
    
    public ConnectionConfig getDefaultConnectionConfig()
    {
      return defaultConnectionConfig;
    }
    
    public SocketConfig getDefaultSocketConfig()
    {
      return defaultSocketConfig;
    }
    
    public SocketConfig getSocketConfig(HttpHost paramHttpHost)
    {
      return (SocketConfig)socketConfigMap.get(paramHttpHost);
    }
    
    public void setConnectionConfig(HttpHost paramHttpHost, ConnectionConfig paramConnectionConfig)
    {
      connectionConfigMap.put(paramHttpHost, paramConnectionConfig);
    }
    
    public void setDefaultConnectionConfig(ConnectionConfig paramConnectionConfig)
    {
      defaultConnectionConfig = paramConnectionConfig;
    }
    
    public void setDefaultSocketConfig(SocketConfig paramSocketConfig)
    {
      defaultSocketConfig = paramSocketConfig;
    }
    
    public void setSocketConfig(HttpHost paramHttpHost, SocketConfig paramSocketConfig)
    {
      socketConfigMap.put(paramHttpHost, paramSocketConfig);
    }
  }
  
  static class InternalConnectionFactory
    implements ConnFactory<HttpRoute, ManagedHttpClientConnection>
  {
    private final PoolingHttpClientConnectionManager.ConfigData configData;
    private final HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> connFactory;
    
    InternalConnectionFactory(PoolingHttpClientConnectionManager.ConfigData paramConfigData, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory)
    {
      if (paramConfigData != null)
      {
        configData = paramConfigData;
        if (paramHttpConnectionFactory == null) {
          break label34;
        }
      }
      for (;;)
      {
        connFactory = paramHttpConnectionFactory;
        return;
        paramConfigData = new PoolingHttpClientConnectionManager.ConfigData();
        break;
        label34:
        paramHttpConnectionFactory = ManagedHttpClientConnectionFactory.INSTANCE;
      }
    }
    
    public ManagedHttpClientConnection create(HttpRoute paramHttpRoute)
      throws IOException
    {
      Object localObject2 = null;
      if (paramHttpRoute.getProxyHost() != null) {
        localObject2 = configData.getConnectionConfig(paramHttpRoute.getProxyHost());
      }
      Object localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = configData.getConnectionConfig(paramHttpRoute.getTargetHost());
      }
      localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = configData.getDefaultConnectionConfig();
      }
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = ConnectionConfig.DEFAULT;
      }
      return (ManagedHttpClientConnection)connFactory.create(paramHttpRoute, (ConnectionConfig)localObject1);
    }
  }
}
