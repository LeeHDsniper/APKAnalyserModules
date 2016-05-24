package org.apache.http.impl;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class DefaultHttpServerConnection
  extends SocketHttpServerConnection
{
  public DefaultHttpServerConnection() {}
  
  public void bind(Socket paramSocket, HttpParams paramHttpParams)
    throws IOException
  {
    boolean bool2 = true;
    Args.notNull(paramSocket, "Socket");
    Args.notNull(paramHttpParams, "HTTP parameters");
    assertNotOpen();
    paramSocket.setTcpNoDelay(paramHttpParams.getBooleanParameter("http.tcp.nodelay", true));
    paramSocket.setSoTimeout(paramHttpParams.getIntParameter("http.socket.timeout", 0));
    paramSocket.setKeepAlive(paramHttpParams.getBooleanParameter("http.socket.keepalive", false));
    int i = paramHttpParams.getIntParameter("http.socket.linger", -1);
    if (i >= 0)
    {
      if (i > 0)
      {
        bool1 = true;
        paramSocket.setSoLinger(bool1, i);
      }
    }
    else if (i >= 0) {
      if (i <= 0) {
        break label120;
      }
    }
    label120:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      paramSocket.setSoLinger(bool1, i);
      super.bind(paramSocket, paramHttpParams);
      return;
      bool1 = false;
      break;
    }
  }
}
