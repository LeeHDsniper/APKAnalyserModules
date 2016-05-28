package org.apache.http.impl.pool;

import java.util.concurrent.atomic.AtomicLong;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.SocketConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.pool.AbstractConnPool;
import org.apache.http.pool.ConnFactory;

@ThreadSafe
public class BasicConnPool
  extends AbstractConnPool<HttpHost, HttpClientConnection, BasicPoolEntry>
{
  private static final AtomicLong COUNTER = new AtomicLong();
  
  public BasicConnPool()
  {
    super(new BasicConnFactory(SocketConfig.DEFAULT, ConnectionConfig.DEFAULT), 2, 20);
  }
  
  public BasicConnPool(SocketConfig paramSocketConfig, ConnectionConfig paramConnectionConfig)
  {
    super(new BasicConnFactory(paramSocketConfig, paramConnectionConfig), 2, 20);
  }
  
  @Deprecated
  public BasicConnPool(HttpParams paramHttpParams)
  {
    super(new BasicConnFactory(paramHttpParams), 2, 20);
  }
  
  public BasicConnPool(ConnFactory<HttpHost, HttpClientConnection> paramConnFactory)
  {
    super(paramConnFactory, 2, 20);
  }
  
  protected BasicPoolEntry createEntry(HttpHost paramHttpHost, HttpClientConnection paramHttpClientConnection)
  {
    return new BasicPoolEntry(Long.toString(COUNTER.getAndIncrement()), paramHttpHost, paramHttpClientConnection);
  }
}
