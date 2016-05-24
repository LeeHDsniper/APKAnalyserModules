package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpConnection;

@Deprecated
public class IdleConnectionHandler
{
  private final Map<HttpConnection, TimeValues> connectionToTimes = new HashMap();
  private final Log log = LogFactory.getLog(getClass());
  
  public IdleConnectionHandler() {}
  
  public void add(HttpConnection paramHttpConnection, long paramLong, TimeUnit paramTimeUnit)
  {
    long l = System.currentTimeMillis();
    if (log.isDebugEnabled()) {
      log.debug("Adding connection at: " + l);
    }
    connectionToTimes.put(paramHttpConnection, new TimeValues(l, paramLong, paramTimeUnit));
  }
  
  public void closeExpiredConnections()
  {
    long l = System.currentTimeMillis();
    if (log.isDebugEnabled()) {
      log.debug("Checking for expired connections, now: " + l);
    }
    Iterator localIterator = connectionToTimes.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (Map.Entry)localIterator.next();
      HttpConnection localHttpConnection = (HttpConnection)((Map.Entry)localObject).getKey();
      localObject = (TimeValues)((Map.Entry)localObject).getValue();
      if (timeExpires <= l)
      {
        if (log.isDebugEnabled()) {
          log.debug("Closing connection, expired @: " + timeExpires);
        }
        try
        {
          localHttpConnection.close();
        }
        catch (IOException localIOException)
        {
          log.debug("I/O error closing connection", localIOException);
        }
      }
    }
  }
  
  public void closeIdleConnections(long paramLong)
  {
    paramLong = System.currentTimeMillis() - paramLong;
    if (log.isDebugEnabled()) {
      log.debug("Checking for connections, idle timeout: " + paramLong);
    }
    Iterator localIterator = connectionToTimes.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      HttpConnection localHttpConnection = (HttpConnection)localEntry.getKey();
      long l = getValuetimeAdded;
      if (l <= paramLong)
      {
        if (log.isDebugEnabled()) {
          log.debug("Closing idle connection, connection time: " + l);
        }
        try
        {
          localHttpConnection.close();
        }
        catch (IOException localIOException)
        {
          log.debug("I/O error closing connection", localIOException);
        }
      }
    }
  }
  
  public boolean remove(HttpConnection paramHttpConnection)
  {
    paramHttpConnection = (TimeValues)connectionToTimes.remove(paramHttpConnection);
    if (paramHttpConnection == null) {
      log.warn("Removing a connection that never existed!");
    }
    while (System.currentTimeMillis() <= timeExpires) {
      return true;
    }
    return false;
  }
  
  public void removeAll()
  {
    connectionToTimes.clear();
  }
  
  private static class TimeValues
  {
    private final long timeAdded;
    private final long timeExpires;
    
    TimeValues(long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      timeAdded = paramLong1;
      if (paramLong2 > 0L)
      {
        timeExpires = (paramTimeUnit.toMillis(paramLong2) + paramLong1);
        return;
      }
      timeExpires = Long.MAX_VALUE;
    }
  }
}
