package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.params.HttpParams;

@Deprecated
class SchemeSocketFactoryAdaptor
  implements SchemeSocketFactory
{
  private final SocketFactory factory;
  
  SchemeSocketFactoryAdaptor(SocketFactory paramSocketFactory)
  {
    factory = paramSocketFactory;
  }
  
  public Socket connectSocket(Socket paramSocket, InetSocketAddress paramInetSocketAddress1, InetSocketAddress paramInetSocketAddress2, HttpParams paramHttpParams)
    throws IOException, UnknownHostException, ConnectTimeoutException
  {
    String str = paramInetSocketAddress1.getHostName();
    int j = paramInetSocketAddress1.getPort();
    paramInetSocketAddress1 = null;
    int i = 0;
    if (paramInetSocketAddress2 != null)
    {
      paramInetSocketAddress1 = paramInetSocketAddress2.getAddress();
      i = paramInetSocketAddress2.getPort();
    }
    return factory.connectSocket(paramSocket, str, j, paramInetSocketAddress1, i, paramHttpParams);
  }
  
  public Socket createSocket(HttpParams paramHttpParams)
    throws IOException
  {
    return factory.createSocket();
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == null) {
      return false;
    }
    if (this == paramObject) {
      return true;
    }
    if ((paramObject instanceof SchemeSocketFactoryAdaptor)) {
      return factory.equals(factory);
    }
    return factory.equals(paramObject);
  }
  
  public SocketFactory getFactory()
  {
    return factory;
  }
  
  public int hashCode()
  {
    return factory.hashCode();
  }
  
  public boolean isSecure(Socket paramSocket)
    throws IllegalArgumentException
  {
    return factory.isSecure(paramSocket);
  }
}
