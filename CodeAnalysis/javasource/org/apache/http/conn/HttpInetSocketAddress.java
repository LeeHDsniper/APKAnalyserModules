package org.apache.http.conn;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import org.apache.http.HttpHost;
import org.apache.http.util.Args;

@Deprecated
public class HttpInetSocketAddress
  extends InetSocketAddress
{
  private static final long serialVersionUID = -6650701828361907957L;
  private final HttpHost httphost;
  
  public HttpInetSocketAddress(HttpHost paramHttpHost, InetAddress paramInetAddress, int paramInt)
  {
    super(paramInetAddress, paramInt);
    Args.notNull(paramHttpHost, "HTTP host");
    httphost = paramHttpHost;
  }
  
  public HttpHost getHttpHost()
  {
    return httphost;
  }
  
  public String toString()
  {
    return httphost.getHostName() + ":" + getPort();
  }
}
