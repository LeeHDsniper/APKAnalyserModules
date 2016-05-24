package org.apache.http.impl.conn.tsccm;

import java.io.IOException;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Queue;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.params.ConnPerRoute;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.LangUtils;

@Deprecated
public class RouteSpecificPool
{
  protected final ConnPerRoute connPerRoute;
  protected final LinkedList<BasicPoolEntry> freeEntries;
  private final Log log = LogFactory.getLog(getClass());
  protected final int maxEntries;
  protected int numEntries;
  protected final HttpRoute route;
  protected final Queue<WaitingThread> waitingThreads;
  
  @Deprecated
  public RouteSpecificPool(HttpRoute paramHttpRoute, int paramInt)
  {
    route = paramHttpRoute;
    maxEntries = paramInt;
    connPerRoute = new ConnPerRoute()
    {
      public int getMaxForRoute(HttpRoute paramAnonymousHttpRoute)
      {
        return maxEntries;
      }
    };
    freeEntries = new LinkedList();
    waitingThreads = new LinkedList();
    numEntries = 0;
  }
  
  public RouteSpecificPool(HttpRoute paramHttpRoute, ConnPerRoute paramConnPerRoute)
  {
    route = paramHttpRoute;
    connPerRoute = paramConnPerRoute;
    maxEntries = paramConnPerRoute.getMaxForRoute(paramHttpRoute);
    freeEntries = new LinkedList();
    waitingThreads = new LinkedList();
    numEntries = 0;
  }
  
  public BasicPoolEntry allocEntry(Object paramObject)
  {
    Object localObject;
    if (!freeEntries.isEmpty())
    {
      localObject = freeEntries.listIterator(freeEntries.size());
      while (((ListIterator)localObject).hasPrevious())
      {
        BasicPoolEntry localBasicPoolEntry = (BasicPoolEntry)((ListIterator)localObject).previous();
        if ((localBasicPoolEntry.getState() == null) || (LangUtils.equals(paramObject, localBasicPoolEntry.getState())))
        {
          ((ListIterator)localObject).remove();
          return localBasicPoolEntry;
        }
      }
    }
    if ((getCapacity() == 0) && (!freeEntries.isEmpty()))
    {
      paramObject = (BasicPoolEntry)freeEntries.remove();
      paramObject.shutdownEntry();
      localObject = paramObject.getConnection();
      try
      {
        ((OperatedClientConnection)localObject).close();
        return paramObject;
      }
      catch (IOException localIOException)
      {
        log.debug("I/O error closing connection", localIOException);
        return paramObject;
      }
    }
    return null;
  }
  
  public void createdEntry(BasicPoolEntry paramBasicPoolEntry)
  {
    Args.check(route.equals(paramBasicPoolEntry.getPlannedRoute()), "Entry not planned for this pool");
    numEntries += 1;
  }
  
  public boolean deleteEntry(BasicPoolEntry paramBasicPoolEntry)
  {
    boolean bool = freeEntries.remove(paramBasicPoolEntry);
    if (bool) {
      numEntries -= 1;
    }
    return bool;
  }
  
  public void dropEntry()
  {
    if (numEntries > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "There is no entry that could be dropped");
      numEntries -= 1;
      return;
    }
  }
  
  public void freeEntry(BasicPoolEntry paramBasicPoolEntry)
  {
    if (numEntries < 1) {
      throw new IllegalStateException("No entry created for this pool. " + route);
    }
    if (numEntries <= freeEntries.size()) {
      throw new IllegalStateException("No entry allocated from this pool. " + route);
    }
    freeEntries.add(paramBasicPoolEntry);
  }
  
  public int getCapacity()
  {
    return connPerRoute.getMaxForRoute(route) - numEntries;
  }
  
  public final int getEntryCount()
  {
    return numEntries;
  }
  
  public final int getMaxEntries()
  {
    return maxEntries;
  }
  
  public final HttpRoute getRoute()
  {
    return route;
  }
  
  public boolean hasThread()
  {
    return !waitingThreads.isEmpty();
  }
  
  public boolean isUnused()
  {
    return (numEntries < 1) && (waitingThreads.isEmpty());
  }
  
  public WaitingThread nextThread()
  {
    return (WaitingThread)waitingThreads.peek();
  }
  
  public void queueThread(WaitingThread paramWaitingThread)
  {
    Args.notNull(paramWaitingThread, "Waiting thread");
    waitingThreads.add(paramWaitingThread);
  }
  
  public void removeThread(WaitingThread paramWaitingThread)
  {
    if (paramWaitingThread == null) {
      return;
    }
    waitingThreads.remove(paramWaitingThread);
  }
}
