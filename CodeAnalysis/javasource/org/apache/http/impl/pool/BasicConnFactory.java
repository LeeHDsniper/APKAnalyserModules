package org.apache.http.impl.pool;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import javax.net.SocketFactory;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpConnectionFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.SocketConfig;
import org.apache.http.impl.DefaultBHttpClientConnection;
import org.apache.http.impl.DefaultBHttpClientConnectionFactory;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.pool.ConnFactory;
import org.apache.http.util.Args;

@Immutable
public class BasicConnFactory
  implements ConnFactory<HttpHost, HttpClientConnection>
{
  private final HttpConnectionFactory<? extends HttpClientConnection> connFactory;
  private final int connectTimeout;
  private final SocketFactory plainfactory;
  private final SocketConfig sconfig;
  private final SSLSocketFactory sslfactory;
  
  public BasicConnFactory()
  {
    this(null, null, 0, SocketConfig.DEFAULT, ConnectionConfig.DEFAULT);
  }
  
  public BasicConnFactory(int paramInt, SocketConfig paramSocketConfig, ConnectionConfig paramConnectionConfig)
  {
    this(null, null, paramInt, paramSocketConfig, paramConnectionConfig);
  }
  
  public BasicConnFactory(SocketFactory paramSocketFactory, SSLSocketFactory paramSSLSocketFactory, int paramInt, SocketConfig paramSocketConfig, ConnectionConfig paramConnectionConfig)
  {
    plainfactory = paramSocketFactory;
    sslfactory = paramSSLSocketFactory;
    connectTimeout = paramInt;
    if (paramSocketConfig != null)
    {
      sconfig = paramSocketConfig;
      if (paramConnectionConfig == null) {
        break label57;
      }
    }
    for (;;)
    {
      connFactory = new DefaultBHttpClientConnectionFactory(paramConnectionConfig);
      return;
      paramSocketConfig = SocketConfig.DEFAULT;
      break;
      label57:
      paramConnectionConfig = ConnectionConfig.DEFAULT;
    }
  }
  
  @Deprecated
  public BasicConnFactory(SSLSocketFactory paramSSLSocketFactory, HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP params");
    plainfactory = null;
    sslfactory = paramSSLSocketFactory;
    connectTimeout = paramHttpParams.getIntParameter("http.connection.timeout", 0);
    sconfig = HttpParamConfig.getSocketConfig(paramHttpParams);
    connFactory = new DefaultBHttpClientConnectionFactory(HttpParamConfig.getConnectionConfig(paramHttpParams));
  }
  
  public BasicConnFactory(SocketConfig paramSocketConfig, ConnectionConfig paramConnectionConfig)
  {
    this(null, null, 0, paramSocketConfig, paramConnectionConfig);
  }
  
  @Deprecated
  public BasicConnFactory(HttpParams paramHttpParams)
  {
    this(null, paramHttpParams);
  }
  
  @Deprecated
  protected HttpClientConnection create(Socket paramSocket, HttpParams paramHttpParams)
    throws IOException
  {
    paramHttpParams = new DefaultBHttpClientConnection(paramHttpParams.getIntParameter("http.socket.buffer-size", 8192));
    paramHttpParams.bind(paramSocket);
    return paramHttpParams;
  }
  
  public HttpClientConnection create(HttpHost paramHttpHost)
    throws IOException
  {
    String str = paramHttpHost.getSchemeName();
    Object localObject = null;
    if ("http".equalsIgnoreCase(str))
    {
      if (plainfactory != null) {
        localObject = plainfactory.createSocket();
      }
    }
    else if ("https".equalsIgnoreCase(str)) {
      if (sslfactory == null) {
        break label110;
      }
    }
    label110:
    for (localObject = sslfactory;; localObject = SSLSocketFactory.getDefault())
    {
      localObject = ((SocketFactory)localObject).createSocket();
      if (localObject != null) {
        break label118;
      }
      throw new IOException(str + " scheme is not supported");
      localObject = new Socket();
      break;
    }
    label118:
    str = paramHttpHost.getHostName();
    int j = paramHttpHost.getPort();
    int i = j;
    if (j == -1)
    {
      if (paramHttpHost.getSchemeName().equalsIgnoreCase("http")) {
        i = 80;
      }
    }
    else
    {
      ((Socket)localObject).setSoTimeout(sconfig.getSoTimeout());
      ((Socket)localObject).connect(new InetSocketAddress(str, i), connectTimeout);
      ((Socket)localObject).setTcpNoDelay(sconfig.isTcpNoDelay());
      i = sconfig.getSoLinger();
      if (i >= 0) {
        if (i <= 0) {
          break label257;
        }
      }
    }
    label257:
    for (boolean bool = true;; bool = false)
    {
      ((Socket)localObject).setSoLinger(bool, i);
      return (HttpClientConnection)connFactory.createConnection((Socket)localObject);
      i = j;
      if (!paramHttpHost.getSchemeName().equalsIgnoreCase("https")) {
        break;
      }
      i = 443;
      break;
    }
  }
}
