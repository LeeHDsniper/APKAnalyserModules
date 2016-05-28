package org.apache.http.impl;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class DefaultHttpClientConnection
  extends SocketHttpClientConnection
{
  public DefaultHttpClientConnection() {}
  
  public void bind(Socket paramSocket, HttpParams paramHttpParams)
    throws IOException
  {
    boolean bool = true;
    Args.notNull(paramSocket, "Socket");
    Args.notNull(paramHttpParams, "HTTP parameters");
    assertNotOpen();
    paramSocket.setTcpNoDelay(paramHttpParams.getBooleanParameter("http.tcp.nodelay", true));
    paramSocket.setSoTimeout(paramHttpParams.getIntParameter("http.socket.timeout", 0));
    paramSocket.setKeepAlive(paramHttpParams.getBooleanParameter("http.socket.keepalive", false));
    int i = paramHttpParams.getIntParameter("http.socket.linger", -1);
    if (i >= 0) {
      if (i <= 0) {
        break label92;
      }
    }
    for (;;)
    {
      paramSocket.setSoLinger(bool, i);
      super.bind(paramSocket, paramHttpParams);
      return;
      label92:
      bool = false;
    }
  }
}
