package org.apache.http.conn;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@Immutable
public final class MultihomePlainSocketFactory
  implements SocketFactory
{
  private static final MultihomePlainSocketFactory DEFAULT_FACTORY = new MultihomePlainSocketFactory();
  
  private MultihomePlainSocketFactory() {}
  
  public static MultihomePlainSocketFactory getSocketFactory()
  {
    return DEFAULT_FACTORY;
  }
  
  public Socket connectSocket(Socket paramSocket, String paramString, int paramInt1, InetAddress paramInetAddress, int paramInt2, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramString, "Target host");
    Args.notNull(paramHttpParams, "HTTP parameters");
    Socket localSocket = paramSocket;
    paramSocket = localSocket;
    if (localSocket == null) {
      paramSocket = createSocket();
    }
    if ((paramInetAddress != null) || (paramInt2 > 0))
    {
      if (paramInt2 > 0) {
        paramSocket.bind(new InetSocketAddress(paramInetAddress, paramInt2));
      }
    }
    else
    {
      paramInt2 = HttpConnectionParams.getConnectionTimeout(paramHttpParams);
      paramInetAddress = InetAddress.getAllByName(paramString);
      paramString = new ArrayList(paramInetAddress.length);
      paramString.addAll(Arrays.asList(paramInetAddress));
      Collections.shuffle(paramString);
      paramInetAddress = null;
      paramHttpParams = paramString.iterator();
      paramString = paramSocket;
      paramSocket = paramInetAddress;
    }
    for (;;)
    {
      if (paramHttpParams.hasNext()) {
        paramInetAddress = (InetAddress)paramHttpParams.next();
      }
      try
      {
        paramString.connect(new InetSocketAddress(paramInetAddress, paramInt1), paramInt2);
        if (paramSocket == null) {
          return paramString;
        }
        throw paramSocket;
      }
      catch (SocketTimeoutException paramSocket)
      {
        throw new ConnectTimeoutException("Connect to " + paramInetAddress + " timed out");
      }
      catch (IOException paramSocket)
      {
        paramString = new Socket();
      }
      paramInt2 = 0;
      break;
    }
    return paramString;
  }
  
  public Socket createSocket()
  {
    return new Socket();
  }
  
  public final boolean isSecure(Socket paramSocket)
    throws IllegalArgumentException
  {
    Args.notNull(paramSocket, "Socket");
    if (!paramSocket.isClosed()) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Socket is closed");
      return false;
    }
  }
}
