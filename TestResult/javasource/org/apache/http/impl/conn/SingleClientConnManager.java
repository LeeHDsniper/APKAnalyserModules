package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class SingleClientConnManager
  implements ClientConnectionManager
{
  public static final String MISUSE_MESSAGE = "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.";
  protected final boolean alwaysShutDown;
  protected final ClientConnectionOperator connOperator;
  @GuardedBy("this")
  protected volatile long connectionExpiresTime;
  protected volatile boolean isShutDown;
  @GuardedBy("this")
  protected volatile long lastReleaseTime;
  private final Log log = LogFactory.getLog(getClass());
  @GuardedBy("this")
  protected volatile ConnAdapter managedConn;
  protected final SchemeRegistry schemeRegistry;
  @GuardedBy("this")
  protected volatile PoolEntry uniquePoolEntry;
  
  public SingleClientConnManager()
  {
    this(SchemeRegistryFactory.createDefault());
  }
  
  public SingleClientConnManager(SchemeRegistry paramSchemeRegistry)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    schemeRegistry = paramSchemeRegistry;
    connOperator = createConnectionOperator(paramSchemeRegistry);
    uniquePoolEntry = new PoolEntry();
    managedConn = null;
    lastReleaseTime = -1L;
    alwaysShutDown = false;
    isShutDown = false;
  }
  
  @Deprecated
  public SingleClientConnManager(HttpParams paramHttpParams, SchemeRegistry paramSchemeRegistry)
  {
    this(paramSchemeRegistry);
  }
  
  protected final void assertStillUp()
    throws IllegalStateException
  {
    if (!isShutDown) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Manager is shut down");
      return;
    }
  }
  
  public void closeExpiredConnections()
  {
    long l = connectionExpiresTime;
    if (System.currentTimeMillis() >= l) {
      closeIdleConnections(0L, TimeUnit.MILLISECONDS);
    }
  }
  
  /* Error */
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 133	org/apache/http/impl/conn/SingleClientConnManager:assertStillUp	()V
    //   4: aload_3
    //   5: ldc -121
    //   7: invokestatic 73	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   10: pop
    //   11: aload_0
    //   12: monitorenter
    //   13: aload_0
    //   14: getfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   17: ifnonnull +52 -> 69
    //   20: aload_0
    //   21: getfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   24: getfield 139	org/apache/http/impl/conn/SingleClientConnManager$PoolEntry:connection	Lorg/apache/http/conn/OperatedClientConnection;
    //   27: invokeinterface 145 1 0
    //   32: ifeq +37 -> 69
    //   35: invokestatic 119	java/lang/System:currentTimeMillis	()J
    //   38: lstore 4
    //   40: aload_3
    //   41: lload_1
    //   42: invokevirtual 149	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   45: lstore_1
    //   46: aload_0
    //   47: getfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   50: lstore 6
    //   52: lload 6
    //   54: lload 4
    //   56: lload_1
    //   57: lsub
    //   58: lcmp
    //   59: ifgt +10 -> 69
    //   62: aload_0
    //   63: getfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   66: invokevirtual 152	org/apache/http/impl/conn/SingleClientConnManager$PoolEntry:close	()V
    //   69: aload_0
    //   70: monitorexit
    //   71: return
    //   72: astore_3
    //   73: aload_0
    //   74: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   77: ldc -102
    //   79: aload_3
    //   80: invokeinterface 160 3 0
    //   85: goto -16 -> 69
    //   88: astore_3
    //   89: aload_0
    //   90: monitorexit
    //   91: aload_3
    //   92: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	93	0	this	SingleClientConnManager
    //   0	93	1	paramLong	long
    //   0	93	3	paramTimeUnit	TimeUnit
    //   38	17	4	l1	long
    //   50	3	6	l2	long
    // Exception table:
    //   from	to	target	type
    //   62	69	72	java/io/IOException
    //   13	52	88	finally
    //   62	69	88	finally
    //   69	71	88	finally
    //   73	85	88	finally
    //   89	91	88	finally
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
  
  public ManagedClientConnection getConnection(HttpRoute paramHttpRoute, Object paramObject)
  {
    Args.notNull(paramHttpRoute, "Route");
    assertStillUp();
    if (log.isDebugEnabled()) {
      log.debug("Get connection for route " + paramHttpRoute);
    }
    for (;;)
    {
      try
      {
        if (managedConn == null)
        {
          bool = true;
          Asserts.check(bool, "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.");
          i = 0;
          j = 0;
          closeExpiredConnections();
          if (!uniquePoolEntry.connection.isOpen()) {
            break label213;
          }
          paramObject = uniquePoolEntry.tracker;
          if (paramObject != null)
          {
            bool = paramObject.toRoute().equals(paramHttpRoute);
            if (bool) {
              break label207;
            }
          }
          j = 1;
          if (j != 0) {
            i = 1;
          }
          try
          {
            uniquePoolEntry.shutdown();
            if (i != 0) {
              uniquePoolEntry = new PoolEntry();
            }
            managedConn = new ConnAdapter(uniquePoolEntry, paramHttpRoute);
            paramHttpRoute = managedConn;
            return paramHttpRoute;
          }
          catch (IOException paramObject)
          {
            log.debug("Problem shutting down connection.", paramObject);
            continue;
          }
        }
        boolean bool = false;
      }
      finally {}
      continue;
      label207:
      int j = 0;
      continue;
      label213:
      int i = 1;
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
    //   1: instanceof 10
    //   4: ldc -30
    //   6: invokestatic 227	org/apache/http/util/Args:check	(ZLjava/lang/String;)V
    //   9: aload_0
    //   10: invokevirtual 133	org/apache/http/impl/conn/SingleClientConnManager:assertStillUp	()V
    //   13: aload_0
    //   14: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   17: invokeinterface 178 1 0
    //   22: ifeq +31 -> 53
    //   25: aload_0
    //   26: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   29: new 180	java/lang/StringBuilder
    //   32: dup
    //   33: invokespecial 181	java/lang/StringBuilder:<init>	()V
    //   36: ldc -27
    //   38: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: aload_1
    //   42: invokevirtual 190	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   45: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   48: invokeinterface 197 2 0
    //   53: aload_1
    //   54: checkcast 10	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter
    //   57: astore_1
    //   58: aload_1
    //   59: monitorenter
    //   60: aload_1
    //   61: getfield 233	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:poolEntry	Lorg/apache/http/impl/conn/AbstractPoolEntry;
    //   64: ifnonnull +6 -> 70
    //   67: aload_1
    //   68: monitorexit
    //   69: return
    //   70: aload_1
    //   71: invokevirtual 237	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:getManager	()Lorg/apache/http/conn/ClientConnectionManager;
    //   74: aload_0
    //   75: if_acmpne +112 -> 187
    //   78: iconst_1
    //   79: istore 5
    //   81: iload 5
    //   83: ldc -17
    //   85: invokestatic 109	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   88: aload_1
    //   89: invokevirtual 240	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:isOpen	()Z
    //   92: ifeq +44 -> 136
    //   95: aload_0
    //   96: getfield 94	org/apache/http/impl/conn/SingleClientConnManager:alwaysShutDown	Z
    //   99: ifne +10 -> 109
    //   102: aload_1
    //   103: invokevirtual 243	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:isMarkedReusable	()Z
    //   106: ifne +30 -> 136
    //   109: aload_0
    //   110: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   113: invokeinterface 178 1 0
    //   118: ifeq +14 -> 132
    //   121: aload_0
    //   122: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   125: ldc -11
    //   127: invokeinterface 197 2 0
    //   132: aload_1
    //   133: invokevirtual 246	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:shutdown	()V
    //   136: aload_1
    //   137: invokevirtual 249	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:detach	()V
    //   140: aload_0
    //   141: monitorenter
    //   142: aload_0
    //   143: aconst_null
    //   144: putfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   147: aload_0
    //   148: invokestatic 119	java/lang/System:currentTimeMillis	()J
    //   151: putfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   154: lload_2
    //   155: lconst_0
    //   156: lcmp
    //   157: ifle +36 -> 193
    //   160: aload_0
    //   161: aload 4
    //   163: lload_2
    //   164: invokevirtual 149	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   167: aload_0
    //   168: getfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   171: ladd
    //   172: putfield 113	org/apache/http/impl/conn/SingleClientConnManager:connectionExpiresTime	J
    //   175: aload_0
    //   176: monitorexit
    //   177: aload_1
    //   178: monitorexit
    //   179: return
    //   180: astore 4
    //   182: aload_1
    //   183: monitorexit
    //   184: aload 4
    //   186: athrow
    //   187: iconst_0
    //   188: istore 5
    //   190: goto -109 -> 81
    //   193: aload_0
    //   194: ldc2_w 250
    //   197: putfield 113	org/apache/http/impl/conn/SingleClientConnManager:connectionExpiresTime	J
    //   200: goto -25 -> 175
    //   203: astore 4
    //   205: aload_0
    //   206: monitorexit
    //   207: aload 4
    //   209: athrow
    //   210: astore 6
    //   212: aload_0
    //   213: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   216: invokeinterface 178 1 0
    //   221: ifeq +16 -> 237
    //   224: aload_0
    //   225: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   228: ldc -3
    //   230: aload 6
    //   232: invokeinterface 160 3 0
    //   237: aload_1
    //   238: invokevirtual 249	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:detach	()V
    //   241: aload_0
    //   242: monitorenter
    //   243: aload_0
    //   244: aconst_null
    //   245: putfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   248: aload_0
    //   249: invokestatic 119	java/lang/System:currentTimeMillis	()J
    //   252: putfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   255: lload_2
    //   256: lconst_0
    //   257: lcmp
    //   258: ifle +30 -> 288
    //   261: aload_0
    //   262: aload 4
    //   264: lload_2
    //   265: invokevirtual 149	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   268: aload_0
    //   269: getfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   272: ladd
    //   273: putfield 113	org/apache/http/impl/conn/SingleClientConnManager:connectionExpiresTime	J
    //   276: aload_0
    //   277: monitorexit
    //   278: goto -101 -> 177
    //   281: astore 4
    //   283: aload_0
    //   284: monitorexit
    //   285: aload 4
    //   287: athrow
    //   288: aload_0
    //   289: ldc2_w 250
    //   292: putfield 113	org/apache/http/impl/conn/SingleClientConnManager:connectionExpiresTime	J
    //   295: goto -19 -> 276
    //   298: astore 6
    //   300: aload_1
    //   301: invokevirtual 249	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:detach	()V
    //   304: aload_0
    //   305: monitorenter
    //   306: aload_0
    //   307: aconst_null
    //   308: putfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   311: aload_0
    //   312: invokestatic 119	java/lang/System:currentTimeMillis	()J
    //   315: putfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   318: lload_2
    //   319: lconst_0
    //   320: lcmp
    //   321: ifle +23 -> 344
    //   324: aload_0
    //   325: aload 4
    //   327: lload_2
    //   328: invokevirtual 149	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   331: aload_0
    //   332: getfield 92	org/apache/http/impl/conn/SingleClientConnManager:lastReleaseTime	J
    //   335: ladd
    //   336: putfield 113	org/apache/http/impl/conn/SingleClientConnManager:connectionExpiresTime	J
    //   339: aload_0
    //   340: monitorexit
    //   341: aload 6
    //   343: athrow
    //   344: aload_0
    //   345: ldc2_w 250
    //   348: putfield 113	org/apache/http/impl/conn/SingleClientConnManager:connectionExpiresTime	J
    //   351: goto -12 -> 339
    //   354: astore 4
    //   356: aload_0
    //   357: monitorexit
    //   358: aload 4
    //   360: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	361	0	this	SingleClientConnManager
    //   0	361	1	paramManagedClientConnection	ManagedClientConnection
    //   0	361	2	paramLong	long
    //   0	361	4	paramTimeUnit	TimeUnit
    //   79	110	5	bool	boolean
    //   210	21	6	localIOException	IOException
    //   298	44	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   60	69	180	finally
    //   70	78	180	finally
    //   81	88	180	finally
    //   136	142	180	finally
    //   177	179	180	finally
    //   182	184	180	finally
    //   207	210	180	finally
    //   237	243	180	finally
    //   285	288	180	finally
    //   300	306	180	finally
    //   341	344	180	finally
    //   358	361	180	finally
    //   142	154	203	finally
    //   160	175	203	finally
    //   175	177	203	finally
    //   193	200	203	finally
    //   205	207	203	finally
    //   88	109	210	java/io/IOException
    //   109	132	210	java/io/IOException
    //   132	136	210	java/io/IOException
    //   243	255	281	finally
    //   261	276	281	finally
    //   276	278	281	finally
    //   283	285	281	finally
    //   288	295	281	finally
    //   88	109	298	finally
    //   109	132	298	finally
    //   132	136	298	finally
    //   212	237	298	finally
    //   306	318	354	finally
    //   324	339	354	finally
    //   339	341	354	finally
    //   344	351	354	finally
    //   356	358	354	finally
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
  protected void revokeConnection()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   4: astore_1
    //   5: aload_1
    //   6: ifnonnull +4 -> 10
    //   9: return
    //   10: aload_1
    //   11: invokevirtual 249	org/apache/http/impl/conn/SingleClientConnManager$ConnAdapter:detach	()V
    //   14: aload_0
    //   15: monitorenter
    //   16: aload_0
    //   17: getfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   20: invokevirtual 216	org/apache/http/impl/conn/SingleClientConnManager$PoolEntry:shutdown	()V
    //   23: aload_0
    //   24: monitorexit
    //   25: return
    //   26: astore_1
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_1
    //   30: athrow
    //   31: astore_1
    //   32: aload_0
    //   33: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   36: ldc_w 261
    //   39: aload_1
    //   40: invokeinterface 160 3 0
    //   45: goto -22 -> 23
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	48	0	this	SingleClientConnManager
    //   4	7	1	localConnAdapter	ConnAdapter
    //   26	4	1	localObject	Object
    //   31	9	1	localIOException	IOException
    // Exception table:
    //   from	to	target	type
    //   16	23	26	finally
    //   23	25	26	finally
    //   27	29	26	finally
    //   32	45	26	finally
    //   16	23	31	java/io/IOException
  }
  
  /* Error */
  public void shutdown()
  {
    // Byte code:
    //   0: aload_0
    //   1: iconst_1
    //   2: putfield 96	org/apache/http/impl/conn/SingleClientConnManager:isShutDown	Z
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   11: ifnull +10 -> 21
    //   14: aload_0
    //   15: getfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   18: invokevirtual 216	org/apache/http/impl/conn/SingleClientConnManager$PoolEntry:shutdown	()V
    //   21: aload_0
    //   22: aconst_null
    //   23: putfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   26: aload_0
    //   27: aconst_null
    //   28: putfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   31: aload_0
    //   32: monitorexit
    //   33: return
    //   34: astore_1
    //   35: aload_0
    //   36: getfield 65	org/apache/http/impl/conn/SingleClientConnManager:log	Lorg/apache/commons/logging/Log;
    //   39: ldc_w 263
    //   42: aload_1
    //   43: invokeinterface 160 3 0
    //   48: aload_0
    //   49: aconst_null
    //   50: putfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   53: aload_0
    //   54: aconst_null
    //   55: putfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   58: goto -27 -> 31
    //   61: astore_1
    //   62: aload_0
    //   63: monitorexit
    //   64: aload_1
    //   65: athrow
    //   66: astore_1
    //   67: aload_0
    //   68: aconst_null
    //   69: putfield 86	org/apache/http/impl/conn/SingleClientConnManager:uniquePoolEntry	Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    //   72: aload_0
    //   73: aconst_null
    //   74: putfield 88	org/apache/http/impl/conn/SingleClientConnManager:managedConn	Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    //   77: aload_1
    //   78: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	79	0	this	SingleClientConnManager
    //   34	9	1	localIOException	IOException
    //   61	4	1	localObject1	Object
    //   66	12	1	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   7	21	34	java/io/IOException
    //   21	31	61	finally
    //   31	33	61	finally
    //   48	58	61	finally
    //   62	64	61	finally
    //   67	79	61	finally
    //   7	21	66	finally
    //   35	48	66	finally
  }
  
  protected class ConnAdapter
    extends AbstractPooledConnAdapter
  {
    protected ConnAdapter(SingleClientConnManager.PoolEntry paramPoolEntry, HttpRoute paramHttpRoute)
    {
      super(paramPoolEntry);
      markReusable();
      route = paramHttpRoute;
    }
  }
  
  protected class PoolEntry
    extends AbstractPoolEntry
  {
    protected PoolEntry()
    {
      super(null);
    }
    
    protected void close()
      throws IOException
    {
      shutdownEntry();
      if (connection.isOpen()) {
        connection.close();
      }
    }
    
    protected void shutdown()
      throws IOException
    {
      shutdownEntry();
      if (connection.isOpen()) {
        connection.shutdown();
      }
    }
  }
}
