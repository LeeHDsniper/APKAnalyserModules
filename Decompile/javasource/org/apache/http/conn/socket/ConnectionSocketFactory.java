package org.apache.http.conn.socket;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import org.apache.http.HttpHost;
import org.apache.http.protocol.HttpContext;

public abstract interface ConnectionSocketFactory
{
  public abstract Socket connectSocket(int paramInt, Socket paramSocket, HttpHost paramHttpHost, InetSocketAddress paramInetSocketAddress1, InetSocketAddress paramInetSocketAddress2, HttpContext paramHttpContext)
    throws IOException;
  
  public abstract Socket createSocket(HttpContext paramHttpContext)
    throws IOException;
}
