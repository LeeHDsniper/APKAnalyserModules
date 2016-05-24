package org.apache.http.conn;

import java.io.IOException;
import java.net.ConnectException;
import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;

@Immutable
public class HttpHostConnectException
  extends ConnectException
{
  private static final long serialVersionUID = -3194482710275220224L;
  private final HttpHost host;
  
  public HttpHostConnectException(IOException paramIOException, HttpHost paramHttpHost, InetAddress... paramVarArgs) {}
  
  @Deprecated
  public HttpHostConnectException(HttpHost paramHttpHost, ConnectException paramConnectException)
  {
    this(paramConnectException, paramHttpHost, null);
  }
  
  public HttpHost getHost()
  {
    return host;
  }
}
