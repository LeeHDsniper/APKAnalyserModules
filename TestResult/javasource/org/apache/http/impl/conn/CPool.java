package org.apache.http.impl.conn;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.pool.AbstractConnPool;
import org.apache.http.pool.ConnFactory;

@ThreadSafe
class CPool
  extends AbstractConnPool<HttpRoute, ManagedHttpClientConnection, CPoolEntry>
{
  private static final AtomicLong COUNTER = new AtomicLong();
  private final Log log = LogFactory.getLog(CPool.class);
  private final long timeToLive;
  private final TimeUnit tunit;
  
  public CPool(ConnFactory<HttpRoute, ManagedHttpClientConnection> paramConnFactory, int paramInt1, int paramInt2, long paramLong, TimeUnit paramTimeUnit)
  {
    super(paramConnFactory, paramInt1, paramInt2);
    timeToLive = paramLong;
    tunit = paramTimeUnit;
  }
  
  protected CPoolEntry createEntry(HttpRoute paramHttpRoute, ManagedHttpClientConnection paramManagedHttpClientConnection)
  {
    String str = Long.toString(COUNTER.getAndIncrement());
    return new CPoolEntry(log, str, paramHttpRoute, paramManagedHttpClientConnection, timeToLive, tunit);
  }
}
