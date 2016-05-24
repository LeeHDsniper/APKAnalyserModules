package org.apache.http.impl.conn.tsccm;

import java.util.concurrent.TimeUnit;
import org.apache.http.conn.ConnectionPoolTimeoutException;

@Deprecated
public abstract interface PoolEntryRequest
{
  public abstract void abortRequest();
  
  public abstract BasicPoolEntry getPoolEntry(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ConnectionPoolTimeoutException;
}
