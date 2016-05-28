package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class BasicClientConnectionManager
  implements ClientConnectionManager
{
  private static final AtomicLong COUNTER = new AtomicLong();
  public static final String MISUSE_MESSAGE = "Invalid use of BasicClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.";
  @GuardedBy("this")
  private ManagedClientConnectionImpl conn;
  private final ClientConnectionOperator connOperator;
  private final Log log = LogFactory.getLog(getClass());
  @GuardedBy("this")
  private HttpPoolEntry poolEntry;
  private final SchemeRegistry schemeRegistry;
  @GuardedBy("this")
  private volatile boolean shutdown;
  
  public BasicClientConnectionManager()
  {
    this(SchemeRegistryFactory.createDefault());
  }
  
  public BasicClientConnectionManager(SchemeRegistry paramSchemeRegistry)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    schemeRegistry = paramSchemeRegistry;
    connOperator = createConnectionOperator(paramSchemeRegistry);
  }
  
  private void assertNotShutdown()
  {
    if (!shutdown) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Connection manager has been shut down");
      return;
    }
  }
  
  private void shutdownConnection(HttpClientConnection paramHttpClientConnection)
  {
    try
    {
      paramHttpClientConnection.shutdown();
      return;
    }
    catch (IOException paramHttpClientConnection)
    {
      while (!log.isDebugEnabled()) {}
      log.debug("I/O exception shutting down connection", paramHttpClientConnection);
    }
  }
  
  public void closeExpiredConnections()
  {
    try
    {
      assertNotShutdown();
      long l = System.currentTimeMillis();
      if ((poolEntry != null) && (poolEntry.isExpired(l)))
      {
        poolEntry.close();
        poolEntry.getTracker().reset();
      }
      return;
    }
    finally {}
  }
  
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    Args.notNull(paramTimeUnit, "Time unit");
    try
    {
      assertNotShutdown();
      long l = paramTimeUnit.toMillis(paramLong);
      paramLong = l;
      if (l < 0L) {
        paramLong = 0L;
      }
      l = System.currentTimeMillis();
      if ((poolEntry != null) && (poolEntry.getUpdated() <= l - paramLong))
      {
        poolEntry.close();
        poolEntry.getTracker().reset();
      }
      return;
    }
    finally {}
  }
  
  protected ClientConnectionOperator createConnectionOperator(SchemeRegistry paramSchemeRegistry)
  {
    return new DefaultClientConnectionOperator(paramSchemeRegistry);
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
  
  ManagedClientConnection getConnection(HttpRoute paramHttpRoute, Object paramObject)
  {
    Args.notNull(paramHttpRoute, "Route");
    for (;;)
    {
      try
      {
        assertNotShutdown();
        if (log.isDebugEnabled()) {
          log.debug("Get connection for route " + paramHttpRoute);
        }
        if (conn == null)
        {
          bool = true;
          Asserts.check(bool, "Invalid use of BasicClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.");
          if ((poolEntry != null) && (!poolEntry.getPlannedRoute().equals(paramHttpRoute)))
          {
            poolEntry.close();
            poolEntry = null;
          }
          if (poolEntry == null)
          {
            paramObject = Long.toString(COUNTER.getAndIncrement());
            OperatedClientConnection localOperatedClientConnection = connOperator.createConnection();
            poolEntry = new HttpPoolEntry(log, paramObject, paramHttpRoute, localOperatedClientConnection, 0L, TimeUnit.MILLISECONDS);
          }
          long l = System.currentTimeMillis();
          if (poolEntry.isExpired(l))
          {
            poolEntry.close();
            poolEntry.getTracker().reset();
          }
          conn = new ManagedClientConnectionImpl(this, connOperator, poolEntry);
          paramHttpRoute = conn;
          return paramHttpRoute;
        }
      }
      finally {}
      boolean bool = false;
    }
  }
  
  public SchemeRegistry getSchemeRegistry()
  {
    return schemeRegistry;
  }
  
  /* Error */
  public void releaseConnection(ManagedClientConnection paramManagedClientConnection, long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_1
    //   1: instanceof 220
    //   4: ldc -28
    //   6: invokestatic 229	org/apache/http/util/Args:check	(ZLjava/lang/String;)V
    //   9: aload_1
    //   10: checkcast 220	org/apache/http/impl/conn/ManagedClientConnectionImpl
    //   13: astore 6
    //   15: aload 6
    //   17: monitorenter
    //   18: aload_0
    //   19: getfield 63	org/apache/http/impl/conn/BasicClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   22: invokeinterface 104 1 0
    //   27: ifeq +31 -> 58
    //   30: aload_0
    //   31: getfield 63	org/apache/http/impl/conn/BasicClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   34: new 168	java/lang/StringBuilder
    //   37: dup
    //   38: invokespecial 169	java/lang/StringBuilder:<init>	()V
    //   41: ldc -25
    //   43: invokevirtual 175	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: aload_1
    //   47: invokevirtual 178	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   50: invokevirtual 182	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   53: invokeinterface 185 2 0
    //   58: aload 6
    //   60: invokevirtual 235	org/apache/http/impl/conn/ManagedClientConnectionImpl:getPoolEntry	()Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   63: ifnonnull +7 -> 70
    //   66: aload 6
    //   68: monitorexit
    //   69: return
    //   70: aload 6
    //   72: invokevirtual 239	org/apache/http/impl/conn/ManagedClientConnectionImpl:getManager	()Lorg/apache/http/conn/ClientConnectionManager;
    //   75: aload_0
    //   76: if_acmpne +40 -> 116
    //   79: iconst_1
    //   80: istore 5
    //   82: iload 5
    //   84: ldc -15
    //   86: invokestatic 90	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   89: aload_0
    //   90: monitorenter
    //   91: aload_0
    //   92: getfield 82	org/apache/http/impl/conn/BasicClientConnectionManager:shutdown	Z
    //   95: ifeq +27 -> 122
    //   98: aload_0
    //   99: aload 6
    //   101: invokespecial 243	org/apache/http/impl/conn/BasicClientConnectionManager:shutdownConnection	(Lorg/apache/http/HttpClientConnection;)V
    //   104: aload_0
    //   105: monitorexit
    //   106: aload 6
    //   108: monitorexit
    //   109: return
    //   110: astore_1
    //   111: aload 6
    //   113: monitorexit
    //   114: aload_1
    //   115: athrow
    //   116: iconst_0
    //   117: istore 5
    //   119: goto -37 -> 82
    //   122: aload 6
    //   124: invokevirtual 246	org/apache/http/impl/conn/ManagedClientConnectionImpl:isOpen	()Z
    //   127: ifeq +17 -> 144
    //   130: aload 6
    //   132: invokevirtual 249	org/apache/http/impl/conn/ManagedClientConnectionImpl:isMarkedReusable	()Z
    //   135: ifne +9 -> 144
    //   138: aload_0
    //   139: aload 6
    //   141: invokespecial 243	org/apache/http/impl/conn/BasicClientConnectionManager:shutdownConnection	(Lorg/apache/http/HttpClientConnection;)V
    //   144: aload 6
    //   146: invokevirtual 249	org/apache/http/impl/conn/ManagedClientConnectionImpl:isMarkedReusable	()Z
    //   149: ifeq +102 -> 251
    //   152: aload_0
    //   153: getfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   156: astore 7
    //   158: aload 4
    //   160: ifnull +123 -> 283
    //   163: aload 4
    //   165: astore_1
    //   166: aload 7
    //   168: lload_2
    //   169: aload_1
    //   170: invokevirtual 252	org/apache/http/impl/conn/HttpPoolEntry:updateExpiry	(JLjava/util/concurrent/TimeUnit;)V
    //   173: aload_0
    //   174: getfield 63	org/apache/http/impl/conn/BasicClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   177: invokeinterface 104 1 0
    //   182: ifeq +69 -> 251
    //   185: lload_2
    //   186: lconst_0
    //   187: lcmp
    //   188: ifle +102 -> 290
    //   191: new 168	java/lang/StringBuilder
    //   194: dup
    //   195: invokespecial 169	java/lang/StringBuilder:<init>	()V
    //   198: ldc -2
    //   200: invokevirtual 175	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   203: lload_2
    //   204: invokevirtual 257	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   207: ldc_w 259
    //   210: invokevirtual 175	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   213: aload 4
    //   215: invokevirtual 178	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   218: invokevirtual 182	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   221: astore_1
    //   222: aload_0
    //   223: getfield 63	org/apache/http/impl/conn/BasicClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   226: new 168	java/lang/StringBuilder
    //   229: dup
    //   230: invokespecial 169	java/lang/StringBuilder:<init>	()V
    //   233: ldc_w 261
    //   236: invokevirtual 175	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   239: aload_1
    //   240: invokevirtual 175	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   243: invokevirtual 182	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   246: invokeinterface 185 2 0
    //   251: aload 6
    //   253: invokevirtual 264	org/apache/http/impl/conn/ManagedClientConnectionImpl:detach	()Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   256: pop
    //   257: aload_0
    //   258: aconst_null
    //   259: putfield 187	org/apache/http/impl/conn/BasicClientConnectionManager:conn	Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    //   262: aload_0
    //   263: getfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   266: invokevirtual 267	org/apache/http/impl/conn/HttpPoolEntry:isClosed	()Z
    //   269: ifeq +8 -> 277
    //   272: aload_0
    //   273: aconst_null
    //   274: putfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   277: aload_0
    //   278: monitorexit
    //   279: aload 6
    //   281: monitorexit
    //   282: return
    //   283: getstatic 215	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   286: astore_1
    //   287: goto -121 -> 166
    //   290: ldc_w 269
    //   293: astore_1
    //   294: goto -72 -> 222
    //   297: astore_1
    //   298: aload 6
    //   300: invokevirtual 264	org/apache/http/impl/conn/ManagedClientConnectionImpl:detach	()Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   303: pop
    //   304: aload_0
    //   305: aconst_null
    //   306: putfield 187	org/apache/http/impl/conn/BasicClientConnectionManager:conn	Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    //   309: aload_0
    //   310: getfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   313: invokevirtual 267	org/apache/http/impl/conn/HttpPoolEntry:isClosed	()Z
    //   316: ifeq +8 -> 324
    //   319: aload_0
    //   320: aconst_null
    //   321: putfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   324: aload_1
    //   325: athrow
    //   326: astore_1
    //   327: aload_0
    //   328: monitorexit
    //   329: aload_1
    //   330: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	331	0	this	BasicClientConnectionManager
    //   0	331	1	paramManagedClientConnection	ManagedClientConnection
    //   0	331	2	paramLong	long
    //   0	331	4	paramTimeUnit	TimeUnit
    //   80	38	5	bool	boolean
    //   13	286	6	localManagedClientConnectionImpl	ManagedClientConnectionImpl
    //   156	11	7	localHttpPoolEntry	HttpPoolEntry
    // Exception table:
    //   from	to	target	type
    //   18	58	110	finally
    //   58	69	110	finally
    //   70	79	110	finally
    //   82	91	110	finally
    //   106	109	110	finally
    //   111	114	110	finally
    //   279	282	110	finally
    //   329	331	110	finally
    //   122	144	297	finally
    //   144	158	297	finally
    //   166	185	297	finally
    //   191	222	297	finally
    //   222	251	297	finally
    //   283	287	297	finally
    //   91	106	326	finally
    //   251	277	326	finally
    //   277	279	326	finally
    //   298	324	326	finally
    //   324	326	326	finally
    //   327	329	326	finally
  }
  
  public final ClientConnectionRequest requestConnection(final HttpRoute paramHttpRoute, final Object paramObject)
  {
    new ClientConnectionRequest()
    {
      public void abortRequest() {}
      
      public ManagedClientConnection getConnection(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
      {
        return getConnection(paramHttpRoute, paramObject);
      }
    };
  }
  
  /* Error */
  public void shutdown()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iconst_1
    //   4: putfield 82	org/apache/http/impl/conn/BasicClientConnectionManager:shutdown	Z
    //   7: aload_0
    //   8: getfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   11: ifnull +10 -> 21
    //   14: aload_0
    //   15: getfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   18: invokevirtual 130	org/apache/http/impl/conn/HttpPoolEntry:close	()V
    //   21: aload_0
    //   22: aconst_null
    //   23: putfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   26: aload_0
    //   27: aconst_null
    //   28: putfield 187	org/apache/http/impl/conn/BasicClientConnectionManager:conn	Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    //   31: aload_0
    //   32: monitorexit
    //   33: return
    //   34: astore_1
    //   35: aload_0
    //   36: aconst_null
    //   37: putfield 121	org/apache/http/impl/conn/BasicClientConnectionManager:poolEntry	Lorg/apache/http/impl/conn/HttpPoolEntry;
    //   40: aload_0
    //   41: aconst_null
    //   42: putfield 187	org/apache/http/impl/conn/BasicClientConnectionManager:conn	Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    //   45: aload_1
    //   46: athrow
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	BasicClientConnectionManager
    //   34	12	1	localObject1	Object
    //   47	4	1	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   7	21	34	finally
    //   2	7	47	finally
    //   21	33	47	finally
    //   35	47	47	finally
    //   48	50	47	finally
  }
}
