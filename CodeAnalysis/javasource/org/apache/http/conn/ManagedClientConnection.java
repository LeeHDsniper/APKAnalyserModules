package org.apache.http.conn;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLSession;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpHost;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Deprecated
public abstract interface ManagedClientConnection
  extends HttpClientConnection, ConnectionReleaseTrigger, HttpRoutedConnection, ManagedHttpClientConnection
{
  public abstract HttpRoute getRoute();
  
  public abstract SSLSession getSSLSession();
  
  public abstract Object getState();
  
  public abstract boolean isMarkedReusable();
  
  public abstract boolean isSecure();
  
  public abstract void layerProtocol(HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException;
  
  public abstract void markReusable();
  
  public abstract void open(HttpRoute paramHttpRoute, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException;
  
  public abstract void setIdleDuration(long paramLong, TimeUnit paramTimeUnit);
  
  public abstract void setState(Object paramObject);
  
  public abstract void tunnelProxy(HttpHost paramHttpHost, boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException;
  
  public abstract void tunnelTarget(boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException;
  
  public abstract void unmarkReusable();
}
