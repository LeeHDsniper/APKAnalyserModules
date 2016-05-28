package org.apache.http.conn.socket;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.protocol.HttpContext;

@Immutable
public class PlainConnectionSocketFactory
  implements ConnectionSocketFactory
{
  public static final PlainConnectionSocketFactory INSTANCE = new PlainConnectionSocketFactory();
  
  public PlainConnectionSocketFactory() {}
  
  public static PlainConnectionSocketFactory getSocketFactory()
  {
    return INSTANCE;
  }
  
  public Socket connectSocket(int paramInt, Socket paramSocket, HttpHost paramHttpHost, InetSocketAddress paramInetSocketAddress1, InetSocketAddress paramInetSocketAddress2, HttpContext paramHttpContext)
    throws IOException
  {
    if (paramSocket != null) {}
    for (;;)
    {
      if (paramInetSocketAddress2 != null) {
        paramSocket.bind(paramInetSocketAddress2);
      }
      try
      {
        paramSocket.connect(paramInetSocketAddress1, paramInt);
        return paramSocket;
      }
      catch (IOException paramHttpHost) {}
      paramSocket = createSocket(paramHttpContext);
    }
    try
    {
      paramSocket.close();
      throw paramHttpHost;
    }
    catch (IOException paramSocket)
    {
      for (;;) {}
    }
  }
  
  public Socket createSocket(HttpContext paramHttpContext)
    throws IOException
  {
    return new Socket();
  }
}
