package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.http.HttpClientConnection;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.pool.PoolEntry;

@ThreadSafe
class CPoolEntry
  extends PoolEntry<HttpRoute, ManagedHttpClientConnection>
{
  private final Log log;
  private volatile boolean routeComplete;
  
  public CPoolEntry(Log paramLog, String paramString, HttpRoute paramHttpRoute, ManagedHttpClientConnection paramManagedHttpClientConnection, long paramLong, TimeUnit paramTimeUnit)
  {
    super(paramString, paramHttpRoute, paramManagedHttpClientConnection, paramLong, paramTimeUnit);
    log = paramLog;
  }
  
  public void close()
  {
    try
    {
      closeConnection();
      return;
    }
    catch (IOException localIOException)
    {
      log.debug("I/O error closing connection", localIOException);
    }
  }
  
  public void closeConnection()
    throws IOException
  {
    ((HttpClientConnection)getConnection()).close();
  }
  
  public boolean isClosed()
  {
    return !((HttpClientConnection)getConnection()).isOpen();
  }
  
  public boolean isExpired(long paramLong)
  {
    boolean bool = super.isExpired(paramLong);
    if ((bool) && (log.isDebugEnabled())) {
      log.debug("Connection " + this + " expired @ " + new Date(getExpiry()));
    }
    return bool;
  }
  
  public boolean isRouteComplete()
  {
    return routeComplete;
  }
  
  public void markRouteComplete()
  {
    routeComplete = true;
  }
  
  public void shutdownConnection()
    throws IOException
  {
    ((HttpClientConnection)getConnection()).shutdown();
  }
}
