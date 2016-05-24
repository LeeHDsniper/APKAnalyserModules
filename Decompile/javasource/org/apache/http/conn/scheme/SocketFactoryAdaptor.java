package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;

@Deprecated
class SocketFactoryAdaptor
  implements SocketFactory
{
  private final SchemeSocketFactory factory;
  
  SocketFactoryAdaptor(SchemeSocketFactory paramSchemeSocketFactory)
  {
    factory = paramSchemeSocketFactory;
  }
  
  public Socket connectSocket(Socket paramSocket, String paramString, int paramInt1, InetAddress paramInetAddress, int paramInt2, HttpParams paramHttpParams)
    throws IOException, UnknownHostException, ConnectTimeoutException
  {
    InetSocketAddress localInetSocketAddress = null;
    if ((paramInetAddress != null) || (paramInt2 > 0)) {
      if (paramInt2 <= 0) {
        break label60;
      }
    }
    for (;;)
    {
      localInetSocketAddress = new InetSocketAddress(paramInetAddress, paramInt2);
      paramString = new InetSocketAddress(InetAddress.getByName(paramString), paramInt1);
      return factory.connectSocket(paramSocket, paramString, localInetSocketAddress, paramHttpParams);
      label60:
      paramInt2 = 0;
    }
  }
  
  public Socket createSocket()
    throws IOException
  {
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    return factory.createSocket(localBasicHttpParams);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == null) {
      return false;
    }
    if (this == paramObject) {
      return true;
    }
    if ((paramObject instanceof SocketFactoryAdaptor)) {
      return factory.equals(factory);
    }
    return factory.equals(paramObject);
  }
  
  public SchemeSocketFactory getFactory()
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
