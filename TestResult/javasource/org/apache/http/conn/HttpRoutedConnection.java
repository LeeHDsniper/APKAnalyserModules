package org.apache.http.conn;

import javax.net.ssl.SSLSession;
import org.apache.http.HttpInetConnection;
import org.apache.http.conn.routing.HttpRoute;

@Deprecated
public abstract interface HttpRoutedConnection
  extends HttpInetConnection
{
  public abstract HttpRoute getRoute();
  
  public abstract SSLSession getSSLSession();
  
  public abstract boolean isSecure();
}
