package org.apache.http.impl.conn.tsccm;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.params.ConnPerRouteBean;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.conn.DefaultClientConnectionOperator;
import org.apache.http.impl.conn.SchemeRegistryFactory;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class ThreadSafeClientConnManager
  implements ClientConnectionManager
{
  protected final ClientConnectionOperator connOperator;
  protected final ConnPerRouteBean connPerRoute;
  protected final AbstractConnPool connectionPool;
  private final Log log;
  protected final ConnPoolByRoute pool;
  protected final SchemeRegistry schemeRegistry;
  
  public ThreadSafeClientConnManager()
  {
    this(SchemeRegistryFactory.createDefault());
  }
  
  public ThreadSafeClientConnManager(SchemeRegistry paramSchemeRegistry)
  {
    this(paramSchemeRegistry, -1L, TimeUnit.MILLISECONDS);
  }
  
  public ThreadSafeClientConnManager(SchemeRegistry paramSchemeRegistry, long paramLong, TimeUnit paramTimeUnit)
  {
    this(paramSchemeRegistry, paramLong, paramTimeUnit, new ConnPerRouteBean());
  }
  
  public ThreadSafeClientConnManager(SchemeRegistry paramSchemeRegistry, long paramLong, TimeUnit paramTimeUnit, ConnPerRouteBean paramConnPerRouteBean)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    log = LogFactory.getLog(getClass());
    schemeRegistry = paramSchemeRegistry;
    connPerRoute = paramConnPerRouteBean;
    connOperator = createConnectionOperator(paramSchemeRegistry);
    pool = createConnectionPool(paramLong, paramTimeUnit);
    connectionPool = pool;
  }
  
  @Deprecated
  public ThreadSafeClientConnManager(HttpParams paramHttpParams, SchemeRegistry paramSchemeRegistry)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    log = LogFactory.getLog(getClass());
    schemeRegistry = paramSchemeRegistry;
    connPerRoute = new ConnPerRouteBean();
    connOperator = createConnectionOperator(paramSchemeRegistry);
    pool = ((ConnPoolByRoute)createConnectionPool(paramHttpParams));
    connectionPool = pool;
  }
  
  public void closeExpiredConnections()
  {
    log.debug("Closing expired connections");
    pool.closeExpiredConnections();
  }
  
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    if (log.isDebugEnabled()) {
      log.debug("Closing connections idle longer than " + paramLong + " " + paramTimeUnit);
    }
    pool.closeIdleConnections(paramLong, paramTimeUnit);
  }
  
  protected ClientConnectionOperator createConnectionOperator(SchemeRegistry paramSchemeRegistry)
  {
    return new DefaultClientConnectionOperator(paramSchemeRegistry);
  }
  
  @Deprecated
  protected AbstractConnPool createConnectionPool(HttpParams paramHttpParams)
  {
    return new ConnPoolByRoute(connOperator, paramHttpParams);
  }
  
  protected ConnPoolByRoute createConnectionPool(long paramLong, TimeUnit paramTimeUnit)
  {
    return new ConnPoolByRoute(connOperator, connPerRoute, 20, paramLong, paramTimeUnit);
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
  
  public int getConnectionsInPool()
  {
    return pool.getConnectionsInPool();
  }
  
  public int getConnectionsInPool(HttpRoute paramHttpRoute)
  {
    return pool.getConnectionsInPool(paramHttpRoute);
  }
  
  public int getDefaultMaxPerRoute()
  {
    return connPerRoute.getDefaultMaxPerRoute();
  }
  
  public int getMaxForRoute(HttpRoute paramHttpRoute)
  {
    return connPerRoute.getMaxForRoute(paramHttpRoute);
  }
  
  public int getMaxTotal()
  {
    return pool.getMaxTotalConnections();
  }
  
  public SchemeRegistry getSchemeRegistry()
  {
    return schemeRegistry;
  }
  
  public void releaseConnection(ManagedClientConnection paramManagedClientConnection, long paramLong, TimeUnit paramTimeUnit)
  {
    Args.check(paramManagedClientConnection instanceof BasicPooledConnAdapter, "Connection class mismatch, connection not obtained from this manager");
    paramManagedClientConnection = (BasicPooledConnAdapter)paramManagedClientConnection;
    boolean bool;
    if (paramManagedClientConnection.getPoolEntry() != null)
    {
      if (paramManagedClientConnection.getManager() != this) {
        break label58;
      }
      bool = true;
      Asserts.check(bool, "Connection not obtained from this manager");
    }
    BasicPoolEntry localBasicPoolEntry;
    for (;;)
    {
      try
      {
        localBasicPoolEntry = (BasicPoolEntry)paramManagedClientConnection.getPoolEntry();
        if (localBasicPoolEntry == null)
        {
          return;
          label58:
          bool = false;
          break;
        }
      }
      finally {}
      try
      {
        if ((paramManagedClientConnection.isOpen()) && (!paramManagedClientConnection.isMarkedReusable())) {
          paramManagedClientConnection.shutdown();
        }
        bool = paramManagedClientConnection.isMarkedReusable();
        if (log.isDebugEnabled())
        {
          if (!bool) {
            break label144;
          }
          log.debug("Released connection is reusable.");
        }
        paramManagedClientConnection.detach();
        pool.freeEntry(localBasicPoolEntry, bool, paramLong, paramTimeUnit);
      }
      catch (IOException localIOException)
      {
        label144:
        if (!log.isDebugEnabled()) {
          break label185;
        }
        log.debug("Exception shutting down released connection.", localIOException);
        bool = paramManagedClientConnection.isMarkedReusable();
        if (!log.isDebugEnabled()) {
          break label219;
        }
        if (!bool) {
          break label240;
        }
        log.debug("Released connection is reusable.");
        for (;;)
        {
          paramManagedClientConnection.detach();
          pool.freeEntry(localBasicPoolEntry, bool, paramLong, paramTimeUnit);
          break;
          log.debug("Released connection is not reusable.");
        }
      }
      finally
      {
        bool = paramManagedClientConnection.isMarkedReusable();
        if (!log.isDebugEnabled()) {
          break label290;
        }
        if (!bool) {
          break label311;
        }
        log.debug("Released connection is reusable.");
      }
      return;
      log.debug("Released connection is not reusable.");
    }
    for (;;)
    {
      label185:
      label219:
      label240:
      label290:
      paramManagedClientConnection.detach();
      pool.freeEntry(localBasicPoolEntry, bool, paramLong, paramTimeUnit);
      throw localObject;
      label311:
      log.debug("Released connection is not reusable.");
    }
  }
  
  public ClientConnectionRequest requestConnection(final HttpRoute paramHttpRoute, Object paramObject)
  {
    new ClientConnectionRequest()
    {
      public void abortRequest()
      {
        val$poolRequest.abortRequest();
      }
      
      public ManagedClientConnection getConnection(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
        throws InterruptedException, ConnectionPoolTimeoutException
      {
        Args.notNull(paramHttpRoute, "Route");
        if (log.isDebugEnabled()) {
          log.debug("Get connection: " + paramHttpRoute + ", timeout = " + paramAnonymousLong);
        }
        paramAnonymousTimeUnit = val$poolRequest.getPoolEntry(paramAnonymousLong, paramAnonymousTimeUnit);
        return new BasicPooledConnAdapter(ThreadSafeClientConnManager.this, paramAnonymousTimeUnit);
      }
    };
  }
  
  public void setDefaultMaxPerRoute(int paramInt)
  {
    connPerRoute.setDefaultMaxPerRoute(paramInt);
  }
  
  public void setMaxForRoute(HttpRoute paramHttpRoute, int paramInt)
  {
    connPerRoute.setMaxForRoute(paramHttpRoute, paramInt);
  }
  
  public void setMaxTotal(int paramInt)
  {
    pool.setMaxTotalConnections(paramInt);
  }
  
  public void shutdown()
  {
    log.debug("Shutting down");
    pool.shutdown();
  }
}
