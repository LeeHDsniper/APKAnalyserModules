package org.apache.http.impl.conn.tsccm;

import java.io.IOException;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.impl.conn.IdleConnectionHandler;
import org.apache.http.util.Args;

@Deprecated
public abstract class AbstractConnPool
{
  protected IdleConnectionHandler idleConnHandler = new IdleConnectionHandler();
  protected volatile boolean isShutDown;
  protected Set<BasicPoolEntryRef> issuedConnections;
  @GuardedBy("poolLock")
  protected Set<BasicPoolEntry> leasedConnections = new HashSet();
  private final Log log = LogFactory.getLog(getClass());
  @GuardedBy("poolLock")
  protected int numConnections;
  protected final Lock poolLock = new ReentrantLock();
  protected ReferenceQueue<Object> refQueue;
  
  protected AbstractConnPool() {}
  
  protected void closeConnection(OperatedClientConnection paramOperatedClientConnection)
  {
    if (paramOperatedClientConnection != null) {}
    try
    {
      paramOperatedClientConnection.close();
      return;
    }
    catch (IOException paramOperatedClientConnection)
    {
      log.debug("I/O error closing connection", paramOperatedClientConnection);
    }
  }
  
  public void closeExpiredConnections()
  {
    poolLock.lock();
    try
    {
      idleConnHandler.closeExpiredConnections();
      return;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  public void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit)
  {
    Args.notNull(paramTimeUnit, "Time unit");
    poolLock.lock();
    try
    {
      idleConnHandler.closeIdleConnections(paramTimeUnit.toMillis(paramLong));
      return;
    }
    finally
    {
      poolLock.unlock();
    }
  }
  
  public abstract void deleteClosedConnections();
  
  public void enableConnectionGC()
    throws IllegalStateException
  {}
  
  public abstract void freeEntry(BasicPoolEntry paramBasicPoolEntry, boolean paramBoolean, long paramLong, TimeUnit paramTimeUnit);
  
  public final BasicPoolEntry getEntry(HttpRoute paramHttpRoute, Object paramObject, long paramLong, TimeUnit paramTimeUnit)
    throws ConnectionPoolTimeoutException, InterruptedException
  {
    return requestPoolEntry(paramHttpRoute, paramObject).getPoolEntry(paramLong, paramTimeUnit);
  }
  
  protected abstract void handleLostEntry(HttpRoute paramHttpRoute);
  
  public void handleReference(Reference<?> paramReference) {}
  
  public abstract PoolEntryRequest requestPoolEntry(HttpRoute paramHttpRoute, Object paramObject);
  
  public void shutdown()
  {
    poolLock.lock();
    try
    {
      boolean bool = isShutDown;
      if (bool) {
        return;
      }
      Iterator localIterator = leasedConnections.iterator();
      while (localIterator.hasNext())
      {
        BasicPoolEntry localBasicPoolEntry = (BasicPoolEntry)localIterator.next();
        localIterator.remove();
        closeConnection(localBasicPoolEntry.getConnection());
      }
      idleConnHandler.removeAll();
    }
    finally
    {
      poolLock.unlock();
    }
    isShutDown = true;
    poolLock.unlock();
  }
}
