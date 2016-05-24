package org.apache.http.impl.conn.tsccm;

import java.lang.ref.ReferenceQueue;
import java.util.concurrent.TimeUnit;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.impl.conn.AbstractPoolEntry;
import org.apache.http.util.Args;

@Deprecated
public class BasicPoolEntry
  extends AbstractPoolEntry
{
  private final long created;
  private long expiry;
  private long updated;
  private final long validUntil;
  
  public BasicPoolEntry(ClientConnectionOperator paramClientConnectionOperator, HttpRoute paramHttpRoute)
  {
    this(paramClientConnectionOperator, paramHttpRoute, -1L, TimeUnit.MILLISECONDS);
  }
  
  public BasicPoolEntry(ClientConnectionOperator paramClientConnectionOperator, HttpRoute paramHttpRoute, long paramLong, TimeUnit paramTimeUnit)
  {
    super(paramClientConnectionOperator, paramHttpRoute);
    Args.notNull(paramHttpRoute, "HTTP route");
    created = System.currentTimeMillis();
    if (paramLong > 0L) {}
    for (validUntil = (created + paramTimeUnit.toMillis(paramLong));; validUntil = Long.MAX_VALUE)
    {
      expiry = validUntil;
      return;
    }
  }
  
  public BasicPoolEntry(ClientConnectionOperator paramClientConnectionOperator, HttpRoute paramHttpRoute, ReferenceQueue<Object> paramReferenceQueue)
  {
    super(paramClientConnectionOperator, paramHttpRoute);
    Args.notNull(paramHttpRoute, "HTTP route");
    created = System.currentTimeMillis();
    validUntil = Long.MAX_VALUE;
    expiry = validUntil;
  }
  
  protected final OperatedClientConnection getConnection()
  {
    return connection;
  }
  
  public long getCreated()
  {
    return created;
  }
  
  public long getExpiry()
  {
    return expiry;
  }
  
  protected final HttpRoute getPlannedRoute()
  {
    return route;
  }
  
  public long getUpdated()
  {
    return updated;
  }
  
  public long getValidUntil()
  {
    return validUntil;
  }
  
  protected final BasicPoolEntryRef getWeakRef()
  {
    return null;
  }
  
  public boolean isExpired(long paramLong)
  {
    return paramLong >= expiry;
  }
  
  protected void shutdownEntry()
  {
    super.shutdownEntry();
  }
  
  public void updateExpiry(long paramLong, TimeUnit paramTimeUnit)
  {
    updated = System.currentTimeMillis();
    if (paramLong > 0L) {}
    for (paramLong = updated + paramTimeUnit.toMillis(paramLong);; paramLong = Long.MAX_VALUE)
    {
      expiry = Math.min(validUntil, paramLong);
      return;
    }
  }
}
