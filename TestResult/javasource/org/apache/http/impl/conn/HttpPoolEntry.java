package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.pool.PoolEntry;

@Deprecated
class HttpPoolEntry
  extends PoolEntry<HttpRoute, OperatedClientConnection>
{
  private final Log log;
  private final RouteTracker tracker;
  
  public HttpPoolEntry(Log paramLog, String paramString, HttpRoute paramHttpRoute, OperatedClientConnection paramOperatedClientConnection, long paramLong, TimeUnit paramTimeUnit)
  {
    super(paramString, paramHttpRoute, paramOperatedClientConnection, paramLong, paramTimeUnit);
    log = paramLog;
    tracker = new RouteTracker(paramHttpRoute);
  }
  
  public void close()
  {
    OperatedClientConnection localOperatedClientConnection = (OperatedClientConnection)getConnection();
    try
    {
      localOperatedClientConnection.close();
      return;
    }
    catch (IOException localIOException)
    {
      log.debug("I/O error closing connection", localIOException);
    }
  }
  
  HttpRoute getEffectiveRoute()
  {
    return tracker.toRoute();
  }
  
  HttpRoute getPlannedRoute()
  {
    return (HttpRoute)getRoute();
  }
  
  RouteTracker getTracker()
  {
    return tracker;
  }
  
  public boolean isClosed()
  {
    return !((OperatedClientConnection)getConnection()).isOpen();
  }
  
  public boolean isExpired(long paramLong)
  {
    boolean bool = super.isExpired(paramLong);
    if ((bool) && (log.isDebugEnabled())) {
      log.debug("Connection " + this + " expired @ " + new Date(getExpiry()));
    }
    return bool;
  }
}
