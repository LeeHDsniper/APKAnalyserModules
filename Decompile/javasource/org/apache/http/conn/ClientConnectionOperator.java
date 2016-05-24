package org.apache.http.conn;

import java.io.IOException;
import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Deprecated
public abstract interface ClientConnectionOperator
{
  public abstract OperatedClientConnection createConnection();
  
  public abstract void openConnection(OperatedClientConnection paramOperatedClientConnection, HttpHost paramHttpHost, InetAddress paramInetAddress, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException;
  
  public abstract void updateSecureConnection(OperatedClientConnection paramOperatedClientConnection, HttpHost paramHttpHost, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException;
}
