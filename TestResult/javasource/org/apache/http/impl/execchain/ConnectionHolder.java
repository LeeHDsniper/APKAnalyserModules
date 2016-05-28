package org.apache.http.impl.execchain;

import java.io.Closeable;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.http.HttpClientConnection;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.concurrent.Cancellable;
import org.apache.http.conn.ConnectionReleaseTrigger;
import org.apache.http.conn.HttpClientConnectionManager;

@ThreadSafe
class ConnectionHolder
  implements Closeable, Cancellable, ConnectionReleaseTrigger
{
  private final Log log;
  private final HttpClientConnection managedConn;
  private final HttpClientConnectionManager manager;
  private volatile boolean released;
  private volatile boolean reusable;
  private volatile Object state;
  private volatile TimeUnit tunit;
  private volatile long validDuration;
  
  public ConnectionHolder(Log paramLog, HttpClientConnectionManager paramHttpClientConnectionManager, HttpClientConnection paramHttpClientConnection)
  {
    log = paramLog;
    manager = paramHttpClientConnectionManager;
    managedConn = paramHttpClientConnection;
  }
  
  public void abortConnection()
  {
    synchronized (managedConn)
    {
      if (released) {
        return;
      }
      released = true;
      try
      {
        managedConn.shutdown();
        log.debug("Connection discarded");
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          if (log.isDebugEnabled()) {
            log.debug(localIOException.getMessage(), localIOException);
          }
          manager.releaseConnection(managedConn, null, 0L, TimeUnit.MILLISECONDS);
        }
      }
      finally
      {
        manager.releaseConnection(managedConn, null, 0L, TimeUnit.MILLISECONDS);
      }
      return;
    }
  }
  
  public boolean cancel()
  {
    boolean bool = released;
    log.debug("Cancelling request execution");
    abortConnection();
    return !bool;
  }
  
  public void close()
    throws IOException
  {
    abortConnection();
  }
  
  public boolean isReleased()
  {
    return released;
  }
  
  public boolean isReusable()
  {
    return reusable;
  }
  
  public void markNonReusable()
  {
    reusable = false;
  }
  
  public void markReusable()
  {
    reusable = true;
  }
  
  public void releaseConnection()
  {
    for (;;)
    {
      synchronized (managedConn)
      {
        if (released) {
          return;
        }
        released = true;
        if (reusable)
        {
          manager.releaseConnection(managedConn, state, validDuration, tunit);
          return;
        }
      }
      try
      {
        managedConn.close();
        log.debug("Connection discarded");
        manager.releaseConnection(managedConn, null, 0L, TimeUnit.MILLISECONDS);
      }
      catch (IOException localIOException)
      {
        if (log.isDebugEnabled()) {
          log.debug(localIOException.getMessage(), localIOException);
        }
        manager.releaseConnection(managedConn, null, 0L, TimeUnit.MILLISECONDS);
      }
      finally
      {
        manager.releaseConnection(managedConn, null, 0L, TimeUnit.MILLISECONDS);
      }
    }
  }
  
  public void setState(Object paramObject)
  {
    state = paramObject;
  }
  
  public void setValidFor(long paramLong, TimeUnit paramTimeUnit)
  {
    synchronized (managedConn)
    {
      validDuration = paramLong;
      tunit = paramTimeUnit;
      return;
    }
  }
}
