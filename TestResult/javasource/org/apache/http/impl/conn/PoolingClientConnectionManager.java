package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.pool.ConnPoolControl;
import org.apache.http.pool.PoolStats;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class PoolingClientConnectionManager
  implements ClientConnectionManager, ConnPoolControl<HttpRoute>
{
  private final DnsResolver dnsResolver;
  private final Log log = LogFactory.getLog(getClass());
  private final ClientConnectionOperator operator;
  private final HttpConnPool pool;
  private final SchemeRegistry schemeRegistry;
  
  public PoolingClientConnectionManager()
  {
    this(SchemeRegistryFactory.createDefault());
  }
  
  public PoolingClientConnectionManager(SchemeRegistry paramSchemeRegistry)
  {
    this(paramSchemeRegistry, -1L, TimeUnit.MILLISECONDS);
  }
  
  public PoolingClientConnectionManager(SchemeRegistry paramSchemeRegistry, long paramLong, TimeUnit paramTimeUnit)
  {
    this(paramSchemeRegistry, paramLong, paramTimeUnit, new SystemDefaultDnsResolver());
  }
  
  public PoolingClientConnectionManager(SchemeRegistry paramSchemeRegistry, long paramLong, TimeUnit paramTimeUnit, DnsResolver paramDnsResolver)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    Args.notNull(paramDnsResolver, "DNS resolver");
    schemeRegistry = paramSchemeRegistry;
    dnsResolver = paramDnsResolver;
    operator = createConnectionOperator(paramSchemeRegistry);
    pool = new HttpConnPool(log, operator, 2, 20, paramLong, paramTimeUnit);
  }
  
  public PoolingClientConnectionManager(SchemeRegistry paramSchemeRegistry, DnsResolver paramDnsResolver)
  {
    this(paramSchemeRegistry, -1L, TimeUnit.MILLISECONDS, paramDnsResolver);
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
  
  private String format(HttpPoolEntry paramHttpPoolEntry)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[id: ").append(paramHttpPoolEntry.getId()).append("]");
    localStringBuilder.append("[route: ").append(paramHttpPoolEntry.getRoute()).append("]");
    paramHttpPoolEntry = paramHttpPoolEntry.getState();
    if (paramHttpPoolEntry != null) {
      localStringBuilder.append("[state: ").append(paramHttpPoolEntry).append("]");
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
  
  protected ClientConnectionOperator createConnectionOperator(SchemeRegistry paramSchemeRegistry)
  {
    return new DefaultClientConnectionOperator(paramSchemeRegistry, dnsResolver);
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
  
  public int getDefaultMaxPerRoute()
  {
    return pool.getDefaultMaxPerRoute();
  }
  
  public int getMaxPerRoute(HttpRoute paramHttpRoute)
  {
    return pool.getMaxPerRoute(paramHttpRoute);
  }
  
  public int getMaxTotal()
  {
    return pool.getMaxTotal();
  }
  
  public SchemeRegistry getSchemeRegistry()
  {
    return schemeRegistry;
  }
  
  public PoolStats getStats(HttpRoute paramHttpRoute)
  {
    return pool.getStats(paramHttpRoute);
  }
  
  public PoolStats getTotalStats()
  {
    return pool.getTotalStats();
  }
  
  ManagedClientConnection leaseConnection(Future<HttpPoolEntry> paramFuture, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ConnectionPoolTimeoutException
  {
    try
    {
      paramTimeUnit = (HttpPoolEntry)paramFuture.get(paramLong, paramTimeUnit);
      if ((paramTimeUnit == null) || (paramFuture.isCancelled())) {
        throw new InterruptedException();
      }
    }
    catch (ExecutionException paramTimeUnit)
    {
      Throwable localThrowable = paramTimeUnit.getCause();
      paramFuture = localThrowable;
      if (localThrowable == null) {
        paramFuture = paramTimeUnit;
      }
      log.error("Unexpected exception leasing connection from pool", paramFuture);
      throw new InterruptedException();
      if (paramTimeUnit.getConnection() != null) {}
      for (boolean bool = true;; bool = false)
      {
        Asserts.check(bool, "Pool entry with no connection");
        if (log.isDebugEnabled()) {
          log.debug("Connection leased: " + format(paramTimeUnit) + formatStats((HttpRoute)paramTimeUnit.getRoute()));
        }
        paramFuture = new ManagedClientConnectionImpl(this, operator, paramTimeUnit);
        return paramFuture;
      }
    }
    catch (TimeoutException paramFuture)
    {
      throw new ConnectionPoolTimeoutException("Timeout waiting for connection from pool");
    }
  }
  
  /* Error */
  public void releaseConnection(ManagedClientConnection paramManagedClientConnection, long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_1
    //   1: instanceof 275
    //   4: ldc_w 291
    //   7: invokestatic 292	org/apache/http/util/Args:check	(ZLjava/lang/String;)V
    //   10: aload_1
    //   11: checkcast 275	org/apache/http/impl/conn/ManagedClientConnectionImpl
    //   14: astore 6
    //   16: aload 6
    //   18: invokevirtual 296	org/apache/http/impl/conn/ManagedClientConnectionImpl:getManager	()Lorg/apache/http/conn/ClientConnectionManager;
    //   21: aload_0
    //   22: if_acmpne +33 -> 55
    //   25: iconst_1
    //   26: istore 5
    //   28: iload 5
    //   30: ldc_w 298
    //   33: invokestatic 267	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   36: aload 6
    //   38: monitorenter
    //   39: aload 6
    //   41: invokevirtual 302	org/apache/http/impl/conn/ManagedClientConnectionImpl:detach	()Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   44: astore 7
    //   46: aload 7
    //   48: ifnonnull +13 -> 61
    //   51: aload 6
    //   53: monitorexit
    //   54: return
    //   55: iconst_0
    //   56: istore 5
    //   58: goto -30 -> 28
    //   61: aload 6
    //   63: invokevirtual 305	org/apache/http/impl/conn/ManagedClientConnectionImpl:isOpen	()Z
    //   66: ifeq +20 -> 86
    //   69: aload 6
    //   71: invokevirtual 308	org/apache/http/impl/conn/ManagedClientConnectionImpl:isMarkedReusable	()Z
    //   74: istore 5
    //   76: iload 5
    //   78: ifne +8 -> 86
    //   81: aload 6
    //   83: invokevirtual 309	org/apache/http/impl/conn/ManagedClientConnectionImpl:shutdown	()V
    //   86: aload 6
    //   88: invokevirtual 308	org/apache/http/impl/conn/ManagedClientConnectionImpl:isMarkedReusable	()Z
    //   91: ifeq +111 -> 202
    //   94: aload 4
    //   96: ifnull +237 -> 333
    //   99: aload 4
    //   101: astore_1
    //   102: aload 7
    //   104: lload_2
    //   105: aload_1
    //   106: invokevirtual 312	org/apache/http/impl/conn/HttpPoolEntry:updateExpiry	(JLjava/util/concurrent/TimeUnit;)V
    //   109: aload_0
    //   110: getfield 66	org/apache/http/impl/conn/PoolingClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   113: invokeinterface 184 1 0
    //   118: ifeq +84 -> 202
    //   121: lload_2
    //   122: lconst_0
    //   123: lcmp
    //   124: ifle +216 -> 340
    //   127: new 98	java/lang/StringBuilder
    //   130: dup
    //   131: invokespecial 99	java/lang/StringBuilder:<init>	()V
    //   134: ldc_w 314
    //   137: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: lload_2
    //   141: invokevirtual 189	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   144: ldc -65
    //   146: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: aload 4
    //   151: invokevirtual 108	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   154: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   157: astore_1
    //   158: aload_0
    //   159: getfield 66	org/apache/http/impl/conn/PoolingClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   162: new 98	java/lang/StringBuilder
    //   165: dup
    //   166: invokespecial 99	java/lang/StringBuilder:<init>	()V
    //   169: ldc_w 316
    //   172: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: aload_0
    //   176: aload 7
    //   178: invokespecial 271	org/apache/http/impl/conn/PoolingClientConnectionManager:format	(Lorg/apache/http/impl/conn/HttpPoolEntry;)Ljava/lang/String;
    //   181: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   184: ldc_w 318
    //   187: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: aload_1
    //   191: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   197: invokeinterface 175 2 0
    //   202: aload_0
    //   203: getfield 93	org/apache/http/impl/conn/PoolingClientConnectionManager:pool	Lorg/apache/http/impl/conn/HttpConnPool;
    //   206: aload 7
    //   208: aload 6
    //   210: invokevirtual 308	org/apache/http/impl/conn/ManagedClientConnectionImpl:isMarkedReusable	()Z
    //   213: invokevirtual 322	org/apache/http/impl/conn/HttpConnPool:release	(Lorg/apache/http/pool/PoolEntry;Z)V
    //   216: aload_0
    //   217: getfield 66	org/apache/http/impl/conn/PoolingClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   220: invokeinterface 184 1 0
    //   225: ifeq +52 -> 277
    //   228: aload_0
    //   229: getfield 66	org/apache/http/impl/conn/PoolingClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   232: new 98	java/lang/StringBuilder
    //   235: dup
    //   236: invokespecial 99	java/lang/StringBuilder:<init>	()V
    //   239: ldc_w 324
    //   242: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   245: aload_0
    //   246: aload 7
    //   248: invokespecial 271	org/apache/http/impl/conn/PoolingClientConnectionManager:format	(Lorg/apache/http/impl/conn/HttpPoolEntry;)Ljava/lang/String;
    //   251: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   254: aload_0
    //   255: aload 7
    //   257: invokevirtual 128	org/apache/http/impl/conn/HttpPoolEntry:getRoute	()Ljava/lang/Object;
    //   260: checkcast 214	org/apache/http/conn/routing/HttpRoute
    //   263: invokespecial 273	org/apache/http/impl/conn/PoolingClientConnectionManager:formatStats	(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;
    //   266: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   269: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   272: invokeinterface 175 2 0
    //   277: aload 6
    //   279: monitorexit
    //   280: return
    //   281: astore_1
    //   282: aload 6
    //   284: monitorexit
    //   285: aload_1
    //   286: athrow
    //   287: astore_1
    //   288: aload_0
    //   289: getfield 66	org/apache/http/impl/conn/PoolingClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   292: invokeinterface 184 1 0
    //   297: ifeq -211 -> 86
    //   300: aload_0
    //   301: getfield 66	org/apache/http/impl/conn/PoolingClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   304: ldc_w 326
    //   307: aload_1
    //   308: invokeinterface 328 3 0
    //   313: goto -227 -> 86
    //   316: astore_1
    //   317: aload_0
    //   318: getfield 93	org/apache/http/impl/conn/PoolingClientConnectionManager:pool	Lorg/apache/http/impl/conn/HttpConnPool;
    //   321: aload 7
    //   323: aload 6
    //   325: invokevirtual 308	org/apache/http/impl/conn/ManagedClientConnectionImpl:isMarkedReusable	()Z
    //   328: invokevirtual 322	org/apache/http/impl/conn/HttpConnPool:release	(Lorg/apache/http/pool/PoolEntry;Z)V
    //   331: aload_1
    //   332: athrow
    //   333: getstatic 43	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   336: astore_1
    //   337: goto -235 -> 102
    //   340: ldc_w 330
    //   343: astore_1
    //   344: goto -186 -> 158
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	347	0	this	PoolingClientConnectionManager
    //   0	347	1	paramManagedClientConnection	ManagedClientConnection
    //   0	347	2	paramLong	long
    //   0	347	4	paramTimeUnit	TimeUnit
    //   26	51	5	bool	boolean
    //   14	310	6	localManagedClientConnectionImpl	ManagedClientConnectionImpl
    //   44	278	7	localHttpPoolEntry	HttpPoolEntry
    // Exception table:
    //   from	to	target	type
    //   39	46	281	finally
    //   51	54	281	finally
    //   202	277	281	finally
    //   277	280	281	finally
    //   282	285	281	finally
    //   317	333	281	finally
    //   81	86	287	java/io/IOException
    //   61	76	316	finally
    //   81	86	316	finally
    //   86	94	316	finally
    //   102	121	316	finally
    //   127	158	316	finally
    //   158	202	316	finally
    //   288	313	316	finally
    //   333	337	316	finally
  }
  
  public ClientConnectionRequest requestConnection(HttpRoute paramHttpRoute, Object paramObject)
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    if (log.isDebugEnabled()) {
      log.debug("Connection request: " + format(paramHttpRoute, paramObject) + formatStats(paramHttpRoute));
    }
    new ClientConnectionRequest()
    {
      public void abortRequest()
      {
        val$future.cancel(true);
      }
      
      public ManagedClientConnection getConnection(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
        throws InterruptedException, ConnectionPoolTimeoutException
      {
        return leaseConnection(val$future, paramAnonymousLong, paramAnonymousTimeUnit);
      }
    };
  }
  
  public void setDefaultMaxPerRoute(int paramInt)
  {
    pool.setDefaultMaxPerRoute(paramInt);
  }
  
  public void setMaxPerRoute(HttpRoute paramHttpRoute, int paramInt)
  {
    pool.setMaxPerRoute(paramHttpRoute, paramInt);
  }
  
  public void setMaxTotal(int paramInt)
  {
    pool.setMaxTotal(paramInt);
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
}
