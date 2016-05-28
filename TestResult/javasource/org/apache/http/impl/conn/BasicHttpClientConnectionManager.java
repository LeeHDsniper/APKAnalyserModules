package org.apache.http.impl.conn;

import java.io.Closeable;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Lookup;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
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
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@ThreadSafe
public class BasicHttpClientConnectionManager
  implements Closeable, HttpClientConnectionManager
{
  @GuardedBy("this")
  private ManagedHttpClientConnection conn;
  @GuardedBy("this")
  private ConnectionConfig connConfig;
  private final HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> connFactory;
  private final HttpClientConnectionOperator connectionOperator;
  @GuardedBy("this")
  private long expiry;
  @GuardedBy("this")
  private boolean leased;
  private final Log log = LogFactory.getLog(getClass());
  @GuardedBy("this")
  private HttpRoute route;
  @GuardedBy("this")
  private volatile boolean shutdown;
  @GuardedBy("this")
  private SocketConfig socketConfig;
  @GuardedBy("this")
  private Object state;
  @GuardedBy("this")
  private long updated;
  
  public BasicHttpClientConnectionManager()
  {
    this(getDefaultRegistry(), null, null, null);
  }
  
  public BasicHttpClientConnectionManager(Lookup<ConnectionSocketFactory> paramLookup)
  {
    this(paramLookup, null, null, null);
  }
  
  public BasicHttpClientConnectionManager(Lookup<ConnectionSocketFactory> paramLookup, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory)
  {
    this(paramLookup, paramHttpConnectionFactory, null, null);
  }
  
  public BasicHttpClientConnectionManager(Lookup<ConnectionSocketFactory> paramLookup, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory, SchemePortResolver paramSchemePortResolver, DnsResolver paramDnsResolver)
  {
    connectionOperator = new HttpClientConnectionOperator(paramLookup, paramSchemePortResolver, paramDnsResolver);
    if (paramHttpConnectionFactory != null) {}
    for (;;)
    {
      connFactory = paramHttpConnectionFactory;
      expiry = Long.MAX_VALUE;
      socketConfig = SocketConfig.DEFAULT;
      connConfig = ConnectionConfig.DEFAULT;
      return;
      paramHttpConnectionFactory = ManagedHttpClientConnectionFactory.INSTANCE;
    }
  }
  
  private void checkExpiry()
  {
    if ((conn != null) && (System.currentTimeMillis() >= expiry))
    {
      if (log.isDebugEnabled()) {
        log.debug("Connection expired @ " + new Date(expiry));
      }
      closeConnection();
    }
  }
  
  private void closeConnection()
  {
    if (conn != null) {
      log.debug("Closing connection");
    }
    try
    {
      conn.close();
      conn = null;
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        if (log.isDebugEnabled()) {
          log.debug("I/O exception closing connection", localIOException);
        }
      }
    }
  }
  
  private static Registry<ConnectionSocketFactory> getDefaultRegistry()
  {
    return RegistryBuilder.create().register("http", PlainConnectionSocketFactory.getSocketFactory()).register("https", SSLConnectionSocketFactory.getSocketFactory()).build();
  }
  
  private void shutdownConnection()
  {
    if (conn != null) {
      log.debug("Shutting down connection");
    }
    try
    {
      conn.shutdown();
      conn = null;
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        if (log.isDebugEnabled()) {
          log.debug("I/O exception shutting down connection", localIOException);
        }
      }
    }
  }
  
  public void close()
  {
    shutdown();
  }
  
  /* Error */
  public void closeExpiredConnections()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 196	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdown	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: getfield 198	org/apache/http/impl/conn/BasicHttpClientConnectionManager:leased	Z
    //   18: ifne -7 -> 11
    //   21: aload_0
    //   22: invokespecial 200	org/apache/http/impl/conn/BasicHttpClientConnectionManager:checkExpiry	()V
    //   25: goto -14 -> 11
    //   28: astore_2
    //   29: aload_0
    //   30: monitorexit
    //   31: aload_2
    //   32: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	33	0	this	BasicHttpClientConnectionManager
    //   6	2	1	bool	boolean
    //   28	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	28	finally
    //   14	25	28	finally
  }
  
  /* Error */
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_3
    //   3: ldc -52
    //   5: invokestatic 210	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   8: pop
    //   9: aload_0
    //   10: getfield 196	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdown	Z
    //   13: istore 6
    //   15: iload 6
    //   17: ifeq +6 -> 23
    //   20: aload_0
    //   21: monitorexit
    //   22: return
    //   23: aload_0
    //   24: getfield 198	org/apache/http/impl/conn/BasicHttpClientConnectionManager:leased	Z
    //   27: ifne -7 -> 20
    //   30: aload_3
    //   31: lload_1
    //   32: invokevirtual 216	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   35: lstore 4
    //   37: lload 4
    //   39: lstore_1
    //   40: lload 4
    //   42: lconst_0
    //   43: lcmp
    //   44: ifge +5 -> 49
    //   47: lconst_0
    //   48: lstore_1
    //   49: invokestatic 108	java/lang/System:currentTimeMillis	()J
    //   52: lstore 4
    //   54: aload_0
    //   55: getfield 218	org/apache/http/impl/conn/BasicHttpClientConnectionManager:updated	J
    //   58: lload 4
    //   60: lload_1
    //   61: lsub
    //   62: lcmp
    //   63: ifgt -43 -> 20
    //   66: aload_0
    //   67: invokespecial 142	org/apache/http/impl/conn/BasicHttpClientConnectionManager:closeConnection	()V
    //   70: goto -50 -> 20
    //   73: astore_3
    //   74: aload_0
    //   75: monitorexit
    //   76: aload_3
    //   77: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	78	0	this	BasicHttpClientConnectionManager
    //   0	78	1	paramLong	long
    //   0	78	3	paramTimeUnit	TimeUnit
    //   35	24	4	l	long
    //   13	3	6	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	15	73	finally
    //   23	37	73	finally
    //   49	70	73	finally
  }
  
  public void connect(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, int paramInt, HttpContext paramHttpContext)
    throws IOException
  {
    Args.notNull(paramHttpClientConnection, "Connection");
    Args.notNull(paramHttpRoute, "HTTP route");
    boolean bool;
    if (paramHttpClientConnection == conn)
    {
      bool = true;
      Asserts.check(bool, "Connection not obtained from this manager");
      if (paramHttpRoute.getProxyHost() == null) {
        break label76;
      }
    }
    label76:
    for (paramHttpClientConnection = paramHttpRoute.getProxyHost();; paramHttpClientConnection = paramHttpRoute.getTargetHost())
    {
      paramHttpRoute = paramHttpRoute.getLocalSocketAddress();
      connectionOperator.connect(conn, paramHttpClientConnection, paramHttpRoute, paramInt, socketConfig, paramHttpContext);
      return;
      bool = false;
      break;
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
  
  /* Error */
  HttpClientConnection getConnection(HttpRoute paramHttpRoute, Object paramObject)
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore 4
    //   3: aload_0
    //   4: monitorenter
    //   5: aload_0
    //   6: getfield 196	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdown	Z
    //   9: ifne +152 -> 161
    //   12: iconst_1
    //   13: istore_3
    //   14: iload_3
    //   15: ldc_w 258
    //   18: invokestatic 232	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   21: aload_0
    //   22: getfield 66	org/apache/http/impl/conn/BasicHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   25: invokeinterface 114 1 0
    //   30: ifeq +32 -> 62
    //   33: aload_0
    //   34: getfield 66	org/apache/http/impl/conn/BasicHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   37: new 116	java/lang/StringBuilder
    //   40: dup
    //   41: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   44: ldc_w 260
    //   47: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: aload_1
    //   51: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   54: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   57: invokeinterface 139 2 0
    //   62: aload_0
    //   63: getfield 198	org/apache/http/impl/conn/BasicHttpClientConnectionManager:leased	Z
    //   66: ifne +100 -> 166
    //   69: iload 4
    //   71: istore_3
    //   72: iload_3
    //   73: ldc_w 262
    //   76: invokestatic 232	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   79: aload_0
    //   80: getfield 264	org/apache/http/impl/conn/BasicHttpClientConnectionManager:route	Lorg/apache/http/conn/routing/HttpRoute;
    //   83: aload_1
    //   84: invokestatic 270	org/apache/http/util/LangUtils:equals	(Ljava/lang/Object;Ljava/lang/Object;)Z
    //   87: ifeq +14 -> 101
    //   90: aload_0
    //   91: getfield 272	org/apache/http/impl/conn/BasicHttpClientConnectionManager:state	Ljava/lang/Object;
    //   94: aload_2
    //   95: invokestatic 270	org/apache/http/util/LangUtils:equals	(Ljava/lang/Object;Ljava/lang/Object;)Z
    //   98: ifne +7 -> 105
    //   101: aload_0
    //   102: invokespecial 142	org/apache/http/impl/conn/BasicHttpClientConnectionManager:closeConnection	()V
    //   105: aload_0
    //   106: aload_1
    //   107: putfield 264	org/apache/http/impl/conn/BasicHttpClientConnectionManager:route	Lorg/apache/http/conn/routing/HttpRoute;
    //   110: aload_0
    //   111: aload_2
    //   112: putfield 272	org/apache/http/impl/conn/BasicHttpClientConnectionManager:state	Ljava/lang/Object;
    //   115: aload_0
    //   116: invokespecial 200	org/apache/http/impl/conn/BasicHttpClientConnectionManager:checkExpiry	()V
    //   119: aload_0
    //   120: getfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   123: ifnonnull +24 -> 147
    //   126: aload_0
    //   127: aload_0
    //   128: getfield 75	org/apache/http/impl/conn/BasicHttpClientConnectionManager:connFactory	Lorg/apache/http/conn/HttpConnectionFactory;
    //   131: aload_1
    //   132: aload_0
    //   133: getfield 92	org/apache/http/impl/conn/BasicHttpClientConnectionManager:connConfig	Lorg/apache/http/config/ConnectionConfig;
    //   136: invokeinterface 277 3 0
    //   141: checkcast 148	org/apache/http/conn/ManagedHttpClientConnection
    //   144: putfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   147: aload_0
    //   148: iconst_1
    //   149: putfield 198	org/apache/http/impl/conn/BasicHttpClientConnectionManager:leased	Z
    //   152: aload_0
    //   153: getfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   156: astore_1
    //   157: aload_0
    //   158: monitorexit
    //   159: aload_1
    //   160: areturn
    //   161: iconst_0
    //   162: istore_3
    //   163: goto -149 -> 14
    //   166: iconst_0
    //   167: istore_3
    //   168: goto -96 -> 72
    //   171: astore_1
    //   172: aload_0
    //   173: monitorexit
    //   174: aload_1
    //   175: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	176	0	this	BasicHttpClientConnectionManager
    //   0	176	1	paramHttpRoute	HttpRoute
    //   0	176	2	paramObject	Object
    //   13	155	3	bool1	boolean
    //   1	69	4	bool2	boolean
    // Exception table:
    //   from	to	target	type
    //   5	12	171	finally
    //   14	62	171	finally
    //   62	69	171	finally
    //   72	101	171	finally
    //   101	105	171	finally
    //   105	147	171	finally
    //   147	157	171	finally
  }
  
  public ConnectionConfig getConnectionConfig()
  {
    try
    {
      ConnectionConfig localConnectionConfig = connConfig;
      return localConnectionConfig;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  HttpRoute getRoute()
  {
    return route;
  }
  
  public SocketConfig getSocketConfig()
  {
    try
    {
      SocketConfig localSocketConfig = socketConfig;
      return localSocketConfig;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  Object getState()
  {
    return state;
  }
  
  /* Error */
  public void releaseConnection(HttpClientConnection paramHttpClientConnection, Object paramObject, long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 6
    //   3: aload_0
    //   4: monitorenter
    //   5: aload_1
    //   6: ldc -34
    //   8: invokestatic 210	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   11: pop
    //   12: aload_1
    //   13: aload_0
    //   14: getfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   17: if_acmpne +6 -> 23
    //   20: iconst_1
    //   21: istore 6
    //   23: iload 6
    //   25: ldc -30
    //   27: invokestatic 232	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   30: aload_0
    //   31: getfield 66	org/apache/http/impl/conn/BasicHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   34: invokeinterface 114 1 0
    //   39: ifeq +32 -> 71
    //   42: aload_0
    //   43: getfield 66	org/apache/http/impl/conn/BasicHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   46: new 116	java/lang/StringBuilder
    //   49: dup
    //   50: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   53: ldc_w 289
    //   56: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: aload_1
    //   60: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   63: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   66: invokeinterface 139 2 0
    //   71: aload_0
    //   72: getfield 196	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdown	Z
    //   75: ifeq +10 -> 85
    //   78: aload_0
    //   79: invokespecial 291	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdownConnection	()V
    //   82: aload_0
    //   83: monitorexit
    //   84: return
    //   85: aload_0
    //   86: invokestatic 108	java/lang/System:currentTimeMillis	()J
    //   89: putfield 218	org/apache/http/impl/conn/BasicHttpClientConnectionManager:updated	J
    //   92: aload_0
    //   93: getfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   96: invokeinterface 294 1 0
    //   101: ifne +38 -> 139
    //   104: aload_0
    //   105: aconst_null
    //   106: putfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   109: aload_0
    //   110: aconst_null
    //   111: putfield 264	org/apache/http/impl/conn/BasicHttpClientConnectionManager:route	Lorg/apache/http/conn/routing/HttpRoute;
    //   114: aload_0
    //   115: aconst_null
    //   116: putfield 102	org/apache/http/impl/conn/BasicHttpClientConnectionManager:conn	Lorg/apache/http/conn/ManagedHttpClientConnection;
    //   119: aload_0
    //   120: ldc2_w 76
    //   123: putfield 79	org/apache/http/impl/conn/BasicHttpClientConnectionManager:expiry	J
    //   126: aload_0
    //   127: iconst_0
    //   128: putfield 198	org/apache/http/impl/conn/BasicHttpClientConnectionManager:leased	Z
    //   131: goto -49 -> 82
    //   134: astore_1
    //   135: aload_0
    //   136: monitorexit
    //   137: aload_1
    //   138: athrow
    //   139: aload_0
    //   140: aload_2
    //   141: putfield 272	org/apache/http/impl/conn/BasicHttpClientConnectionManager:state	Ljava/lang/Object;
    //   144: aload_0
    //   145: getfield 66	org/apache/http/impl/conn/BasicHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   148: invokeinterface 114 1 0
    //   153: ifeq +70 -> 223
    //   156: lload_3
    //   157: lconst_0
    //   158: lcmp
    //   159: ifle +96 -> 255
    //   162: new 116	java/lang/StringBuilder
    //   165: dup
    //   166: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   169: ldc_w 296
    //   172: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: lload_3
    //   176: invokevirtual 299	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   179: ldc_w 301
    //   182: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   185: aload 5
    //   187: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   190: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   193: astore_1
    //   194: aload_0
    //   195: getfield 66	org/apache/http/impl/conn/BasicHttpClientConnectionManager:log	Lorg/apache/commons/logging/Log;
    //   198: new 116	java/lang/StringBuilder
    //   201: dup
    //   202: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   205: ldc_w 303
    //   208: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   211: aload_1
    //   212: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   215: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   218: invokeinterface 139 2 0
    //   223: lload_3
    //   224: lconst_0
    //   225: lcmp
    //   226: ifle +36 -> 262
    //   229: aload_0
    //   230: aload_0
    //   231: getfield 218	org/apache/http/impl/conn/BasicHttpClientConnectionManager:updated	J
    //   234: aload 5
    //   236: lload_3
    //   237: invokevirtual 216	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   240: ladd
    //   241: putfield 79	org/apache/http/impl/conn/BasicHttpClientConnectionManager:expiry	J
    //   244: goto -118 -> 126
    //   247: astore_1
    //   248: aload_0
    //   249: iconst_0
    //   250: putfield 198	org/apache/http/impl/conn/BasicHttpClientConnectionManager:leased	Z
    //   253: aload_1
    //   254: athrow
    //   255: ldc_w 305
    //   258: astore_1
    //   259: goto -65 -> 194
    //   262: aload_0
    //   263: ldc2_w 76
    //   266: putfield 79	org/apache/http/impl/conn/BasicHttpClientConnectionManager:expiry	J
    //   269: goto -143 -> 126
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	272	0	this	BasicHttpClientConnectionManager
    //   0	272	1	paramHttpClientConnection	HttpClientConnection
    //   0	272	2	paramObject	Object
    //   0	272	3	paramLong	long
    //   0	272	5	paramTimeUnit	TimeUnit
    //   1	23	6	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   5	12	134	finally
    //   12	20	134	finally
    //   23	71	134	finally
    //   71	82	134	finally
    //   126	131	134	finally
    //   248	255	134	finally
    //   85	126	247	finally
    //   139	156	247	finally
    //   162	194	247	finally
    //   194	223	247	finally
    //   229	244	247	finally
    //   262	269	247	finally
  }
  
  public final ConnectionRequest requestConnection(final HttpRoute paramHttpRoute, final Object paramObject)
  {
    Args.notNull(paramHttpRoute, "Route");
    new ConnectionRequest()
    {
      public boolean cancel()
      {
        return false;
      }
      
      public HttpClientConnection get(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
      {
        return getConnection(paramHttpRoute, paramObject);
      }
    };
  }
  
  public void routeComplete(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws IOException
  {}
  
  public void setConnectionConfig(ConnectionConfig paramConnectionConfig)
  {
    if (paramConnectionConfig != null) {}
    for (;;)
    {
      try
      {
        connConfig = paramConnectionConfig;
        return;
      }
      finally {}
      paramConnectionConfig = ConnectionConfig.DEFAULT;
    }
  }
  
  public void setSocketConfig(SocketConfig paramSocketConfig)
  {
    if (paramSocketConfig != null) {}
    for (;;)
    {
      try
      {
        socketConfig = paramSocketConfig;
        return;
      }
      finally {}
      paramSocketConfig = SocketConfig.DEFAULT;
    }
  }
  
  /* Error */
  public void shutdown()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 196	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdown	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: iconst_1
    //   16: putfield 196	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdown	Z
    //   19: aload_0
    //   20: invokespecial 291	org/apache/http/impl/conn/BasicHttpClientConnectionManager:shutdownConnection	()V
    //   23: goto -12 -> 11
    //   26: astore_2
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_2
    //   30: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	31	0	this	BasicHttpClientConnectionManager
    //   6	2	1	bool	boolean
    //   26	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	26	finally
    //   14	23	26	finally
  }
  
  public void upgrade(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws IOException
  {
    Args.notNull(paramHttpClientConnection, "Connection");
    Args.notNull(paramHttpRoute, "HTTP route");
    if (paramHttpClientConnection == conn) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Connection not obtained from this manager");
      connectionOperator.upgrade(conn, paramHttpRoute.getTargetHost(), paramHttpContext);
      return;
    }
  }
}
