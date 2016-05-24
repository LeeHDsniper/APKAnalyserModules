package org.apache.http.conn;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.apache.http.HttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.protocol.HttpContext;

public abstract interface HttpClientConnectionManager
{
  public abstract void closeExpiredConnections();
  
  public abstract void closeIdleConnections(long paramLong, TimeUnit paramTimeUnit);
  
  public abstract void connect(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, int paramInt, HttpContext paramHttpContext)
    throws IOException;
  
  public abstract void releaseConnection(HttpClientConnection paramHttpClientConnection, Object paramObject, long paramLong, TimeUnit paramTimeUnit);
  
  public abstract ConnectionRequest requestConnection(HttpRoute paramHttpRoute, Object paramObject);
  
  public abstract void routeComplete(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws IOException;
  
  public abstract void shutdown();
  
  public abstract void upgrade(HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws IOException;
}
