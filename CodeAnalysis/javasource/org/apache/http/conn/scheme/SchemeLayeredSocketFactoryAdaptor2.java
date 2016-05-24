package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.params.HttpParams;

@Deprecated
class SchemeLayeredSocketFactoryAdaptor2
  implements SchemeLayeredSocketFactory
{
  private final LayeredSchemeSocketFactory factory;
  
  SchemeLayeredSocketFactoryAdaptor2(LayeredSchemeSocketFactory paramLayeredSchemeSocketFactory)
  {
    factory = paramLayeredSchemeSocketFactory;
  }
  
  public Socket connectSocket(Socket paramSocket, InetSocketAddress paramInetSocketAddress1, InetSocketAddress paramInetSocketAddress2, HttpParams paramHttpParams)
    throws IOException, UnknownHostException, ConnectTimeoutException
  {
    return factory.connectSocket(paramSocket, paramInetSocketAddress1, paramInetSocketAddress2, paramHttpParams);
  }
  
  public Socket createLayeredSocket(Socket paramSocket, String paramString, int paramInt, HttpParams paramHttpParams)
    throws IOException, UnknownHostException
  {
    return factory.createLayeredSocket(paramSocket, paramString, paramInt, true);
  }
  
  public Socket createSocket(HttpParams paramHttpParams)
    throws IOException
  {
    return factory.createSocket(paramHttpParams);
  }
  
  public boolean isSecure(Socket paramSocket)
    throws IllegalArgumentException
  {
    return factory.isSecure(paramSocket);
  }
}
