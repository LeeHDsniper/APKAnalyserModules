package org.apache.http.impl.conn.tsccm;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.params.ConnPerRoute;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
public class ConnPoolByRoute
  extends AbstractConnPool
{
  protected final ConnPerRoute connPerRoute;
  private final long connTTL;
  private final TimeUnit connTTLTimeUnit;
  protected final Queue<BasicPoolEntry> freeConnections;
  protected final Set<BasicPoolEntry> leasedConnections;
  private final Log log = LogFactory.getLog(getClass());
  protected volatile int maxTotalConnections;
  protected volatile int numConnections;
  protected final ClientConnectionOperator operator;
  private final Lock poolLock;
  protected final Map<HttpRoute, RouteSpecificPool> routeToPool;
  protected volatile boolean shutdown;
  protected final Queue<WaitingThread> waitingThreads;
  
  public ConnPoolByRoute(ClientConnectionOperator paramClientConnectionOperator, ConnPerRoute paramConnPerRoute, int paramInt)
  {
    this(paramClientConnectionOperator, paramConnPerRoute, paramInt, -1L, TimeUnit.MILLISECONDS);
  }
  
  public ConnPoolByRoute(ClientConnectionOperator paramClientConnectionOperator, ConnPerRoute paramConnPerRoute, int paramInt, long paramLong, TimeUnit paramTimeUnit)
  {
    Args.notNull(paramClientConnectionOperator, "Connection operator");
    Args.notNull(paramConnPerRoute, "Connections per route");
    poolLock = poolLock;
    leasedConnections = leasedConnections;
    operator = paramClientConnectionOperator;
    connPerRoute = paramConnPerRoute;
    maxTotalConnections = paramInt;
    freeConnections = createFreeConnQueue();
    waitingThreads = createWaitingThreadQueue();
    routeToPool = createRouteToPoolMap();
    connTTL = paramLong;
    connTTLTimeUnit = paramTimeUnit;
  }
  
  @Deprecated
  public ConnPoolByRoute(ClientConnectionOperator paramClientConnectionOperator, HttpParams paramHttpParams)
  {
    this(paramClientConnectionOperator, ConnManagerParams.getMaxConnectionsPerRoute(paramHttpParams), ConnManagerParams.getMaxTotalConnections(paramHttpParams));
  }
  
  private void closeConnection(BasicPoolEntry paramBasicPoolEntry)
  {
    paramBasicPoolEntry = paramBasicPoolEntry.getConnection();
    if (paramBasicPoolEntry != null) {}
    try
    {
      paramBasicPoolEntry.close();
      return;
    }
    catch (IOException paramBasicPoolEntry)
    {
      log.debug("I/O error closing connection", paramBasicPoolEntry);
    }
  }
  
  public void closeExpiredConnections()
  {
    log.debug("Closing expired connections");
    long l = System.currentTimeMillis();
    poolLock.lock();
    try
    {
      Iterator localIterator = freeConnections.iterator();
      while (localIterator.hasNext())
      {
        BasicPoolEntry localBasicPoolEntry = (BasicPoolEntry)localIterator.next();
        if (localBasicPoolEntry.isExpired(l))
        {
          if (log.isDebugEnabled()) {
            log.debug("Closing connection expired @ " + new Date(localBasicPoolEntry.getExpiry()));
          }
          localIterator.remove();
          deleteEntry(localBasicPoolEntry);
        }
      }
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    long l = 0L;
    Args.notNull(paramTimeUnit, "Time unit");
    if (paramLong > 0L) {
      l = paramLong;
    }
    if (log.isDebugEnabled()) {
      log.debug("Closing connections idle longer than " + l + " " + paramTimeUnit);
    }
    paramLong = System.currentTimeMillis();
    l = paramTimeUnit.toMillis(l);
    poolLock.lock();
    try
    {
      paramTimeUnit = freeConnections.iterator();
      while (paramTimeUnit.hasNext())
      {
        BasicPoolEntry localBasicPoolEntry = (BasicPoolEntry)paramTimeUnit.next();
        if (localBasicPoolEntry.getUpdated() <= paramLong - l)
        {
          if (log.isDebugEnabled()) {
            log.debug("Closing connection last used @ " + new Date(localBasicPoolEntry.getUpdated()));
          }
          paramTimeUnit.remove();
          deleteEntry(localBasicPoolEntry);
        }
      }
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  protected BasicPoolEntry createEntry(RouteSpecificPool paramRouteSpecificPool, ClientConnectionOperator paramClientConnectionOperator)
  {
    if (log.isDebugEnabled()) {
      log.debug("Creating new connection [" + paramRouteSpecificPool.getRoute() + "]");
    }
    paramClientConnectionOperator = new BasicPoolEntry(paramClientConnectionOperator, paramRouteSpecificPool.getRoute(), connTTL, connTTLTimeUnit);
    poolLock.lock();
    try
    {
      paramRouteSpecificPool.createdEntry(paramClientConnectionOperator);
      numConnections += 1;
      leasedConnections.add(paramClientConnectionOperator);
      return paramClientConnectionOperator;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  protected Queue<BasicPoolEntry> createFreeConnQueue()
  {
    return new LinkedList();
  }
  
  protected Map<HttpRoute, RouteSpecificPool> createRouteToPoolMap()
  {
    return new HashMap();
  }
  
  protected Queue<WaitingThread> createWaitingThreadQueue()
  {
    return new LinkedList();
  }
  
  public void deleteClosedConnections()
  {
    poolLock.lock();
    try
    {
      Iterator localIterator = freeConnections.iterator();
      while (localIterator.hasNext())
      {
        BasicPoolEntry localBasicPoolEntry = (BasicPoolEntry)localIterator.next();
        if (!localBasicPoolEntry.getConnection().isOpen())
        {
          localIterator.remove();
          deleteEntry(localBasicPoolEntry);
        }
      }
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  protected void deleteEntry(BasicPoolEntry paramBasicPoolEntry)
  {
    HttpRoute localHttpRoute = paramBasicPoolEntry.getPlannedRoute();
    if (log.isDebugEnabled()) {
      log.debug("Deleting connection [" + localHttpRoute + "][" + paramBasicPoolEntry.getState() + "]");
    }
    poolLock.lock();
    try
    {
      closeConnection(paramBasicPoolEntry);
      RouteSpecificPool localRouteSpecificPool = getRoutePool(localHttpRoute, true);
      localRouteSpecificPool.deleteEntry(paramBasicPoolEntry);
      numConnections -= 1;
      if (localRouteSpecificPool.isUnused()) {
        routeToPool.remove(localHttpRoute);
      }
      return;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  /* Error */
  protected void deleteLeastUsedEntry()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   4: invokeinterface 164 1 0
    //   9: aload_0
    //   10: getfield 93	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:freeConnections	Ljava/util/Queue;
    //   13: invokeinterface 310 1 0
    //   18: checkcast 130	org/apache/http/impl/conn/tsccm/BasicPoolEntry
    //   21: astore_1
    //   22: aload_1
    //   23: ifnull +18 -> 41
    //   26: aload_0
    //   27: aload_1
    //   28: invokevirtual 217	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:deleteEntry	(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;)V
    //   31: aload_0
    //   32: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   35: invokeinterface 220 1 0
    //   40: return
    //   41: aload_0
    //   42: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   45: invokeinterface 187 1 0
    //   50: ifeq -19 -> 31
    //   53: aload_0
    //   54: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   57: ldc_w 312
    //   60: invokeinterface 153 2 0
    //   65: goto -34 -> 31
    //   68: astore_1
    //   69: aload_0
    //   70: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   73: invokeinterface 220 1 0
    //   78: aload_1
    //   79: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	80	0	this	ConnPoolByRoute
    //   21	7	1	localBasicPoolEntry	BasicPoolEntry
    //   68	11	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   9	22	68	finally
    //   26	31	68	finally
    //   41	65	68	finally
  }
  
  /* Error */
  public void freeEntry(BasicPoolEntry paramBasicPoolEntry, boolean paramBoolean, long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 283	org/apache/http/impl/conn/tsccm/BasicPoolEntry:getPlannedRoute	()Lorg/apache/http/conn/routing/HttpRoute;
    //   4: astore 7
    //   6: aload_0
    //   7: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   10: invokeinterface 187 1 0
    //   15: ifeq +51 -> 66
    //   18: aload_0
    //   19: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   22: new 189	java/lang/StringBuilder
    //   25: dup
    //   26: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   29: ldc_w 316
    //   32: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: aload 7
    //   37: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   40: ldc_w 287
    //   43: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: aload_1
    //   47: invokevirtual 290	org/apache/http/impl/conn/tsccm/BasicPoolEntry:getState	()Ljava/lang/Object;
    //   50: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   53: ldc -4
    //   55: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   58: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   61: invokeinterface 153 2 0
    //   66: aload_0
    //   67: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   70: invokeinterface 164 1 0
    //   75: aload_0
    //   76: getfield 318	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:shutdown	Z
    //   79: ifeq +18 -> 97
    //   82: aload_0
    //   83: aload_1
    //   84: invokespecial 292	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:closeConnection	(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;)V
    //   87: aload_0
    //   88: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   91: invokeinterface 220 1 0
    //   96: return
    //   97: aload_0
    //   98: getfield 81	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:leasedConnections	Ljava/util/Set;
    //   101: aload_1
    //   102: invokeinterface 320 2 0
    //   107: pop
    //   108: aload_0
    //   109: aload 7
    //   111: iconst_1
    //   112: invokevirtual 296	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:getRoutePool	(Lorg/apache/http/conn/routing/HttpRoute;Z)Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;
    //   115: astore 8
    //   117: iload_2
    //   118: ifeq +163 -> 281
    //   121: aload 8
    //   123: invokevirtual 324	org/apache/http/impl/conn/tsccm/RouteSpecificPool:getCapacity	()I
    //   126: iflt +155 -> 281
    //   129: aload_0
    //   130: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   133: invokeinterface 187 1 0
    //   138: ifeq +95 -> 233
    //   141: lload_3
    //   142: lconst_0
    //   143: lcmp
    //   144: ifle +129 -> 273
    //   147: new 189	java/lang/StringBuilder
    //   150: dup
    //   151: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   154: ldc_w 326
    //   157: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: lload_3
    //   161: invokevirtual 229	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   164: ldc -25
    //   166: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   169: aload 5
    //   171: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   174: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   177: astore 6
    //   179: aload_0
    //   180: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   183: new 189	java/lang/StringBuilder
    //   186: dup
    //   187: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   190: ldc_w 328
    //   193: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: aload 7
    //   198: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   201: ldc_w 287
    //   204: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: aload_1
    //   208: invokevirtual 290	org/apache/http/impl/conn/tsccm/BasicPoolEntry:getState	()Ljava/lang/Object;
    //   211: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   214: ldc_w 330
    //   217: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   220: aload 6
    //   222: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   225: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   228: invokeinterface 153 2 0
    //   233: aload 8
    //   235: aload_1
    //   236: invokevirtual 332	org/apache/http/impl/conn/tsccm/RouteSpecificPool:freeEntry	(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;)V
    //   239: aload_1
    //   240: lload_3
    //   241: aload 5
    //   243: invokevirtual 335	org/apache/http/impl/conn/tsccm/BasicPoolEntry:updateExpiry	(JLjava/util/concurrent/TimeUnit;)V
    //   246: aload_0
    //   247: getfield 93	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:freeConnections	Ljava/util/Queue;
    //   250: aload_1
    //   251: invokeinterface 336 2 0
    //   256: pop
    //   257: aload_0
    //   258: aload 8
    //   260: invokevirtual 340	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:notifyWaitingThread	(Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;)V
    //   263: aload_0
    //   264: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   267: invokeinterface 220 1 0
    //   272: return
    //   273: ldc_w 342
    //   276: astore 6
    //   278: goto -99 -> 179
    //   281: aload_0
    //   282: aload_1
    //   283: invokespecial 292	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:closeConnection	(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;)V
    //   286: aload 8
    //   288: invokevirtual 345	org/apache/http/impl/conn/tsccm/RouteSpecificPool:dropEntry	()V
    //   291: aload_0
    //   292: aload_0
    //   293: getfield 260	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:numConnections	I
    //   296: iconst_1
    //   297: isub
    //   298: putfield 260	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:numConnections	I
    //   301: goto -44 -> 257
    //   304: astore_1
    //   305: aload_0
    //   306: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   309: invokeinterface 220 1 0
    //   314: aload_1
    //   315: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	316	0	this	ConnPoolByRoute
    //   0	316	1	paramBasicPoolEntry	BasicPoolEntry
    //   0	316	2	paramBoolean	boolean
    //   0	316	3	paramLong	long
    //   0	316	5	paramTimeUnit	TimeUnit
    //   177	100	6	str	String
    //   4	193	7	localHttpRoute	HttpRoute
    //   115	172	8	localRouteSpecificPool	RouteSpecificPool
    // Exception table:
    //   from	to	target	type
    //   75	87	304	finally
    //   97	117	304	finally
    //   121	141	304	finally
    //   147	179	304	finally
    //   179	233	304	finally
    //   233	257	304	finally
    //   257	263	304	finally
    //   281	301	304	finally
  }
  
  public int getConnectionsInPool()
  {
    poolLock.lock();
    try
    {
      int i = numConnections;
      return i;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  public int getConnectionsInPool(HttpRoute paramHttpRoute)
  {
    int i = 0;
    poolLock.lock();
    try
    {
      paramHttpRoute = getRoutePool(paramHttpRoute, false);
      if (paramHttpRoute != null) {
        i = paramHttpRoute.getEntryCount();
      }
      return i;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  /* Error */
  protected BasicPoolEntry getEntryBlocking(HttpRoute paramHttpRoute, Object paramObject, long paramLong, TimeUnit paramTimeUnit, WaitingThreadAborter paramWaitingThreadAborter)
    throws ConnectionPoolTimeoutException, InterruptedException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 10
    //   3: lload_3
    //   4: lconst_0
    //   5: lcmp
    //   6: ifle +22 -> 28
    //   9: new 198	java/util/Date
    //   12: dup
    //   13: invokestatic 159	java/lang/System:currentTimeMillis	()J
    //   16: aload 5
    //   18: lload_3
    //   19: invokevirtual 235	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   22: ladd
    //   23: invokespecial 204	java/util/Date:<init>	(J)V
    //   26: astore 10
    //   28: aconst_null
    //   29: astore 5
    //   31: aload_0
    //   32: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   35: invokeinterface 164 1 0
    //   40: aload_0
    //   41: aload_1
    //   42: iconst_1
    //   43: invokevirtual 296	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:getRoutePool	(Lorg/apache/http/conn/routing/HttpRoute;Z)Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;
    //   46: astore 12
    //   48: aconst_null
    //   49: astore 11
    //   51: aload 5
    //   53: astore 9
    //   55: aload 5
    //   57: ifnonnull +138 -> 195
    //   60: aload_0
    //   61: getfield 318	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:shutdown	Z
    //   64: ifne +143 -> 207
    //   67: iconst_1
    //   68: istore 8
    //   70: iload 8
    //   72: ldc_w 358
    //   75: invokestatic 364	org/apache/http/util/Asserts:check	(ZLjava/lang/String;)V
    //   78: aload_0
    //   79: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   82: invokeinterface 187 1 0
    //   87: ifeq +94 -> 181
    //   90: aload_0
    //   91: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   94: new 189	java/lang/StringBuilder
    //   97: dup
    //   98: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   101: ldc_w 366
    //   104: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: aload_1
    //   108: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   111: ldc_w 368
    //   114: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: aload_0
    //   118: getfield 93	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:freeConnections	Ljava/util/Queue;
    //   121: invokeinterface 371 1 0
    //   126: invokevirtual 374	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   129: ldc_w 376
    //   132: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: aload_0
    //   136: getfield 81	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:leasedConnections	Ljava/util/Set;
    //   139: invokeinterface 377 1 0
    //   144: invokevirtual 374	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   147: ldc_w 379
    //   150: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   153: aload_0
    //   154: getfield 260	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:numConnections	I
    //   157: invokevirtual 374	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   160: ldc_w 381
    //   163: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: aload_0
    //   167: getfield 87	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:maxTotalConnections	I
    //   170: invokevirtual 374	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   173: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   176: invokeinterface 153 2 0
    //   181: aload_0
    //   182: aload 12
    //   184: aload_2
    //   185: invokevirtual 385	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:getFreeEntry	(Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;Ljava/lang/Object;)Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    //   188: astore 9
    //   190: aload 9
    //   192: ifnull +21 -> 213
    //   195: aload_0
    //   196: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   199: invokeinterface 220 1 0
    //   204: aload 9
    //   206: areturn
    //   207: iconst_0
    //   208: istore 8
    //   210: goto -140 -> 70
    //   213: aload 12
    //   215: invokevirtual 324	org/apache/http/impl/conn/tsccm/RouteSpecificPool:getCapacity	()I
    //   218: ifle +392 -> 610
    //   221: iconst_1
    //   222: istore 7
    //   224: aload_0
    //   225: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   228: invokeinterface 187 1 0
    //   233: ifeq +75 -> 308
    //   236: aload_0
    //   237: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   240: new 189	java/lang/StringBuilder
    //   243: dup
    //   244: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   247: ldc_w 387
    //   250: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   253: aload 12
    //   255: invokevirtual 324	org/apache/http/impl/conn/tsccm/RouteSpecificPool:getCapacity	()I
    //   258: invokevirtual 374	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   261: ldc_w 381
    //   264: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   267: aload 12
    //   269: invokevirtual 390	org/apache/http/impl/conn/tsccm/RouteSpecificPool:getMaxEntries	()I
    //   272: invokevirtual 374	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   275: ldc_w 392
    //   278: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   281: aload_1
    //   282: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   285: ldc_w 287
    //   288: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   291: aload_2
    //   292: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   295: ldc -4
    //   297: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   300: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   303: invokeinterface 153 2 0
    //   308: iload 7
    //   310: ifeq +29 -> 339
    //   313: aload_0
    //   314: getfield 260	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:numConnections	I
    //   317: aload_0
    //   318: getfield 87	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:maxTotalConnections	I
    //   321: if_icmpge +18 -> 339
    //   324: aload_0
    //   325: aload 12
    //   327: aload_0
    //   328: getfield 83	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:operator	Lorg/apache/http/conn/ClientConnectionOperator;
    //   331: invokevirtual 394	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:createEntry	(Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;Lorg/apache/http/conn/ClientConnectionOperator;)Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    //   334: astore 5
    //   336: goto -285 -> 51
    //   339: iload 7
    //   341: ifeq +42 -> 383
    //   344: aload_0
    //   345: getfield 93	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:freeConnections	Ljava/util/Queue;
    //   348: invokeinterface 397 1 0
    //   353: ifne +30 -> 383
    //   356: aload_0
    //   357: invokevirtual 399	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:deleteLeastUsedEntry	()V
    //   360: aload_0
    //   361: aload_1
    //   362: iconst_1
    //   363: invokevirtual 296	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:getRoutePool	(Lorg/apache/http/conn/routing/HttpRoute;Z)Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;
    //   366: astore 12
    //   368: aload_0
    //   369: aload 12
    //   371: aload_0
    //   372: getfield 83	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:operator	Lorg/apache/http/conn/ClientConnectionOperator;
    //   375: invokevirtual 394	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:createEntry	(Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;Lorg/apache/http/conn/ClientConnectionOperator;)Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    //   378: astore 5
    //   380: goto -329 -> 51
    //   383: aload_0
    //   384: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   387: invokeinterface 187 1 0
    //   392: ifeq +47 -> 439
    //   395: aload_0
    //   396: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   399: new 189	java/lang/StringBuilder
    //   402: dup
    //   403: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   406: ldc_w 401
    //   409: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   412: aload_1
    //   413: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   416: ldc_w 287
    //   419: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   422: aload_2
    //   423: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   426: ldc -4
    //   428: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   431: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   434: invokeinterface 153 2 0
    //   439: aload 11
    //   441: astore 13
    //   443: aload 11
    //   445: ifnonnull +27 -> 472
    //   448: aload_0
    //   449: aload_0
    //   450: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   453: invokeinterface 405 1 0
    //   458: aload 12
    //   460: invokevirtual 409	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:newWaitingThread	(Ljava/util/concurrent/locks/Condition;Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;)Lorg/apache/http/impl/conn/tsccm/WaitingThread;
    //   463: astore 13
    //   465: aload 6
    //   467: aload 13
    //   469: invokevirtual 415	org/apache/http/impl/conn/tsccm/WaitingThreadAborter:setWaitingThread	(Lorg/apache/http/impl/conn/tsccm/WaitingThread;)V
    //   472: aload 12
    //   474: aload 13
    //   476: invokevirtual 418	org/apache/http/impl/conn/tsccm/RouteSpecificPool:queueThread	(Lorg/apache/http/impl/conn/tsccm/WaitingThread;)V
    //   479: aload_0
    //   480: getfield 98	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:waitingThreads	Ljava/util/Queue;
    //   483: aload 13
    //   485: invokeinterface 336 2 0
    //   490: pop
    //   491: aload 13
    //   493: aload 10
    //   495: invokevirtual 424	org/apache/http/impl/conn/tsccm/WaitingThread:await	(Ljava/util/Date;)Z
    //   498: istore 8
    //   500: aload 12
    //   502: aload 13
    //   504: invokevirtual 427	org/apache/http/impl/conn/tsccm/RouteSpecificPool:removeThread	(Lorg/apache/http/impl/conn/tsccm/WaitingThread;)V
    //   507: aload_0
    //   508: getfield 98	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:waitingThreads	Ljava/util/Queue;
    //   511: aload 13
    //   513: invokeinterface 428 2 0
    //   518: pop
    //   519: aload 9
    //   521: astore 5
    //   523: aload 13
    //   525: astore 11
    //   527: iload 8
    //   529: ifne -478 -> 51
    //   532: aload 9
    //   534: astore 5
    //   536: aload 13
    //   538: astore 11
    //   540: aload 10
    //   542: ifnull -491 -> 51
    //   545: aload 9
    //   547: astore 5
    //   549: aload 13
    //   551: astore 11
    //   553: aload 10
    //   555: invokevirtual 431	java/util/Date:getTime	()J
    //   558: invokestatic 159	java/lang/System:currentTimeMillis	()J
    //   561: lcmp
    //   562: ifgt -511 -> 51
    //   565: new 354	org/apache/http/conn/ConnectionPoolTimeoutException
    //   568: dup
    //   569: ldc_w 433
    //   572: invokespecial 436	org/apache/http/conn/ConnectionPoolTimeoutException:<init>	(Ljava/lang/String;)V
    //   575: athrow
    //   576: astore_1
    //   577: aload_0
    //   578: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   581: invokeinterface 220 1 0
    //   586: aload_1
    //   587: athrow
    //   588: astore_1
    //   589: aload 12
    //   591: aload 13
    //   593: invokevirtual 427	org/apache/http/impl/conn/tsccm/RouteSpecificPool:removeThread	(Lorg/apache/http/impl/conn/tsccm/WaitingThread;)V
    //   596: aload_0
    //   597: getfield 98	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:waitingThreads	Ljava/util/Queue;
    //   600: aload 13
    //   602: invokeinterface 428 2 0
    //   607: pop
    //   608: aload_1
    //   609: athrow
    //   610: iconst_0
    //   611: istore 7
    //   613: goto -389 -> 224
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	616	0	this	ConnPoolByRoute
    //   0	616	1	paramHttpRoute	HttpRoute
    //   0	616	2	paramObject	Object
    //   0	616	3	paramLong	long
    //   0	616	5	paramTimeUnit	TimeUnit
    //   0	616	6	paramWaitingThreadAborter	WaitingThreadAborter
    //   222	390	7	i	int
    //   68	460	8	bool	boolean
    //   53	493	9	localObject1	Object
    //   1	553	10	localDate	Date
    //   49	503	11	localObject2	Object
    //   46	544	12	localRouteSpecificPool	RouteSpecificPool
    //   441	160	13	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   40	48	576	finally
    //   60	67	576	finally
    //   70	181	576	finally
    //   181	190	576	finally
    //   213	221	576	finally
    //   224	308	576	finally
    //   313	336	576	finally
    //   344	380	576	finally
    //   383	439	576	finally
    //   448	472	576	finally
    //   500	519	576	finally
    //   553	576	576	finally
    //   589	610	576	finally
    //   472	500	588	finally
  }
  
  protected BasicPoolEntry getFreeEntry(RouteSpecificPool paramRouteSpecificPool, Object paramObject)
  {
    Object localObject = null;
    poolLock.lock();
    int i = 0;
    while (i == 0)
    {
      BasicPoolEntry localBasicPoolEntry;
      try
      {
        localBasicPoolEntry = paramRouteSpecificPool.allocEntry(paramObject);
        if (localBasicPoolEntry == null) {
          break label231;
        }
        if (log.isDebugEnabled()) {
          log.debug("Getting free connection [" + paramRouteSpecificPool.getRoute() + "][" + paramObject + "]");
        }
        freeConnections.remove(localBasicPoolEntry);
        if (localBasicPoolEntry.isExpired(System.currentTimeMillis()))
        {
          if (log.isDebugEnabled()) {
            log.debug("Closing expired free connection [" + paramRouteSpecificPool.getRoute() + "][" + paramObject + "]");
          }
          closeConnection(localBasicPoolEntry);
          paramRouteSpecificPool.dropEntry();
          numConnections -= 1;
          localObject = localBasicPoolEntry;
          continue;
        }
      }
      finally
      {
        poolLock.unlock();
      }
      leasedConnections.add(localBasicPoolEntry);
      i = 1;
      localObject = localBasicPoolEntry;
      continue;
      label231:
      int j = 1;
      i = j;
      localObject = localBasicPoolEntry;
      if (log.isDebugEnabled())
      {
        log.debug("No free connections [" + paramRouteSpecificPool.getRoute() + "][" + paramObject + "]");
        i = j;
        localObject = localBasicPoolEntry;
      }
    }
    poolLock.unlock();
    return localObject;
  }
  
  protected Lock getLock()
  {
    return poolLock;
  }
  
  public int getMaxTotalConnections()
  {
    return maxTotalConnections;
  }
  
  protected RouteSpecificPool getRoutePool(HttpRoute paramHttpRoute, boolean paramBoolean)
  {
    poolLock.lock();
    try
    {
      RouteSpecificPool localRouteSpecificPool2 = (RouteSpecificPool)routeToPool.get(paramHttpRoute);
      RouteSpecificPool localRouteSpecificPool1 = localRouteSpecificPool2;
      if (localRouteSpecificPool2 == null)
      {
        localRouteSpecificPool1 = localRouteSpecificPool2;
        if (paramBoolean)
        {
          localRouteSpecificPool1 = newRouteSpecificPool(paramHttpRoute);
          routeToPool.put(paramHttpRoute, localRouteSpecificPool1);
        }
      }
      return localRouteSpecificPool1;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  protected void handleLostEntry(HttpRoute paramHttpRoute)
  {
    poolLock.lock();
    try
    {
      RouteSpecificPool localRouteSpecificPool = getRoutePool(paramHttpRoute, true);
      localRouteSpecificPool.dropEntry();
      if (localRouteSpecificPool.isUnused()) {
        routeToPool.remove(paramHttpRoute);
      }
      numConnections -= 1;
      notifyWaitingThread(localRouteSpecificPool);
      return;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  protected RouteSpecificPool newRouteSpecificPool(HttpRoute paramHttpRoute)
  {
    return new RouteSpecificPool(paramHttpRoute, connPerRoute);
  }
  
  protected WaitingThread newWaitingThread(Condition paramCondition, RouteSpecificPool paramRouteSpecificPool)
  {
    return new WaitingThread(paramCondition, paramRouteSpecificPool);
  }
  
  /* Error */
  protected void notifyWaitingThread(RouteSpecificPool paramRouteSpecificPool)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_0
    //   3: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   6: invokeinterface 164 1 0
    //   11: aload_1
    //   12: ifnull +82 -> 94
    //   15: aload_1
    //   16: invokevirtual 471	org/apache/http/impl/conn/tsccm/RouteSpecificPool:hasThread	()Z
    //   19: ifeq +75 -> 94
    //   22: aload_0
    //   23: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   26: invokeinterface 187 1 0
    //   31: ifeq +40 -> 71
    //   34: aload_0
    //   35: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   38: new 189	java/lang/StringBuilder
    //   41: dup
    //   42: invokespecial 190	java/lang/StringBuilder:<init>	()V
    //   45: ldc_w 473
    //   48: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   51: aload_1
    //   52: invokevirtual 250	org/apache/http/impl/conn/tsccm/RouteSpecificPool:getRoute	()Lorg/apache/http/conn/routing/HttpRoute;
    //   55: invokevirtual 207	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   58: ldc -4
    //   60: invokevirtual 196	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   66: invokeinterface 153 2 0
    //   71: aload_1
    //   72: invokevirtual 477	org/apache/http/impl/conn/tsccm/RouteSpecificPool:nextThread	()Lorg/apache/http/impl/conn/tsccm/WaitingThread;
    //   75: astore_1
    //   76: aload_1
    //   77: ifnull +7 -> 84
    //   80: aload_1
    //   81: invokevirtual 480	org/apache/http/impl/conn/tsccm/WaitingThread:wakeup	()V
    //   84: aload_0
    //   85: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   88: invokeinterface 220 1 0
    //   93: return
    //   94: aload_0
    //   95: getfield 98	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:waitingThreads	Ljava/util/Queue;
    //   98: invokeinterface 397 1 0
    //   103: ifne +43 -> 146
    //   106: aload_0
    //   107: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   110: invokeinterface 187 1 0
    //   115: ifeq +15 -> 130
    //   118: aload_0
    //   119: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   122: ldc_w 482
    //   125: invokeinterface 153 2 0
    //   130: aload_0
    //   131: getfield 98	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:waitingThreads	Ljava/util/Queue;
    //   134: invokeinterface 310 1 0
    //   139: checkcast 420	org/apache/http/impl/conn/tsccm/WaitingThread
    //   142: astore_1
    //   143: goto -67 -> 76
    //   146: aload_2
    //   147: astore_1
    //   148: aload_0
    //   149: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   152: invokeinterface 187 1 0
    //   157: ifeq -81 -> 76
    //   160: aload_0
    //   161: getfield 65	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:log	Lorg/apache/commons/logging/Log;
    //   164: ldc_w 484
    //   167: invokeinterface 153 2 0
    //   172: aload_2
    //   173: astore_1
    //   174: goto -98 -> 76
    //   177: astore_1
    //   178: aload_0
    //   179: getfield 78	org/apache/http/impl/conn/tsccm/ConnPoolByRoute:poolLock	Ljava/util/concurrent/locks/Lock;
    //   182: invokeinterface 220 1 0
    //   187: aload_1
    //   188: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	189	0	this	ConnPoolByRoute
    //   0	189	1	paramRouteSpecificPool	RouteSpecificPool
    //   1	172	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   15	71	177	finally
    //   71	76	177	finally
    //   80	84	177	finally
    //   94	130	177	finally
    //   130	143	177	finally
    //   148	172	177	finally
  }
  
  public PoolEntryRequest requestPoolEntry(final HttpRoute paramHttpRoute, final Object paramObject)
  {
    new PoolEntryRequest()
    {
      public void abortRequest()
      {
        poolLock.lock();
        try
        {
          val$aborter.abort();
          return;
        }
        finally
        {
          poolLock.unlock();
        }
      }
      
      public BasicPoolEntry getPoolEntry(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
        throws InterruptedException, ConnectionPoolTimeoutException
      {
        return getEntryBlocking(paramHttpRoute, paramObject, paramAnonymousLong, paramAnonymousTimeUnit, val$aborter);
      }
    };
  }
  
  public void setMaxTotalConnections(int paramInt)
  {
    poolLock.lock();
    try
    {
      maxTotalConnections = paramInt;
      return;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  public void shutdown()
  {
    poolLock.lock();
    Object localObject2;
    try
    {
      boolean bool = shutdown;
      if (bool) {
        return;
      }
      shutdown = true;
      Iterator localIterator1 = leasedConnections.iterator();
      while (localIterator1.hasNext())
      {
        localObject2 = (BasicPoolEntry)localIterator1.next();
        localIterator1.remove();
        closeConnection((BasicPoolEntry)localObject2);
      }
      localIterator2 = freeConnections.iterator();
    }
    finally
    {
      poolLock.unlock();
    }
    while (localIterator2.hasNext())
    {
      localObject2 = (BasicPoolEntry)localIterator2.next();
      localIterator2.remove();
      if (log.isDebugEnabled()) {
        log.debug("Closing connection [" + ((BasicPoolEntry)localObject2).getPlannedRoute() + "][" + ((BasicPoolEntry)localObject2).getState() + "]");
      }
      closeConnection((BasicPoolEntry)localObject2);
    }
    Iterator localIterator2 = waitingThreads.iterator();
    while (localIterator2.hasNext())
    {
      localObject2 = (WaitingThread)localIterator2.next();
      localIterator2.remove();
      ((WaitingThread)localObject2).wakeup();
    }
    routeToPool.clear();
    poolLock.unlock();
  }
}
